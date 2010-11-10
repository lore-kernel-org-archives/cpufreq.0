From: Andreas Herrmann <herrmann.der.user@googlemail.com>
Subject: [PATCH] cpupowerutils: Add basic functions to detect AMD CPB
 information
Date: Wed, 10 Nov 2010 15:56:27 +0100
Message-ID: <20101110145627.GA3391@alberich.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:mime-version:content-type:content-disposition:user-agent;
        bh=dmS3Pr1goo3Spa1zJDLgZ+mbTxCAJx+ZiGN3MOWj3O4=;
        b=DFaH8SoRLLAolEMxz1ppVB9XTX7UBoZkfm8ko0GoS/t7/3m8ZBjWkCaWDbtzVTf9b9
         0CB2Yn5mzQ3nwqm81izipdcNej70Zp9za9nubx5MG5cLuuJcNbzXvN7X+ew07XtP3DZr
         DOSEquhEqvvOtQ5J1CB7FoW2+3ZPHH53Scm+0=
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org


To gather boost state information on AMD we need to access CPU
northbridge PCI functions.

Thus this change introduces a dependency on libpci (part of pciutils and
usually installed on Linux systems).

Detect whether CPB is enabled/disabled and number of boosted states.

Signed-off-by: Andreas Herrmann <herrmann.der.user@googlemail.com>
---
 Makefile             |    4 +-
 lib/amdpci.c         |   68 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/amdpci.h         |    1 +
 lib/cpufreq.c        |    8 +++---
 lib/cpufreq.h        |    2 +-
 lib/msr.c            |   11 --------
 lib/msr.h            |    2 -
 utils/cpufreq-info.c |    5 ++-
 8 files changed, 79 insertions(+), 22 deletions(-)
 create mode 100644 lib/amdpci.c
 create mode 100644 lib/amdpci.h

I am about to add also the frequency information for boosted Pstates.
But first I wanted to know whether its acceptable to add a dependency to
libpci for PCI config space accesses. The capability to access PCI
config space is useful also for other interesting stuff in the
future.

The patch is against cpupowerutils branch.

Output looks like:

  # ./utils/cpufreq-info -bAnalyzing Boost Capabilities on CPU 0:
  Supported: yes
  Active: yes
  Boost States: 1

Comments welcome.

Andreas

diff --git a/Makefile b/Makefile
index 2cd9e83..6461954 100644
--- a/Makefile
+++ b/Makefile
@@ -115,7 +115,7 @@ UTIL_SRC = 	utils/cpufreq-info.c utils/cpufreq-set.c utils/cpufreq-aperf.c utils
 UTIL_BINS = 	utils/cpufreq-info utils/cpufreq-set utils/cpufreq-aperf utils/cpuidle-info
 LIB_HEADERS = 	lib/cpufreq.h lib/cpuidle.h lib/sysfs.h lib/msr.h lib/cpuid.h
 LIB_SRC = 	lib/cpufreq.c lib/cpuidle.c lib/sysfs.c lib/msr.c
-LIB_OBJS = 	lib/cpufreq.o lib/cpuidle.o lib/sysfs.o lib/msr.o
+LIB_OBJS = 	lib/cpufreq.o lib/cpuidle.o lib/sysfs.o lib/msr.o lib/amdpci.o
 
 CFLAGS +=	-pipe
 
@@ -163,7 +163,7 @@ lib/%.o: $(LIB_SRC) $(LIB_HEADERS) build/ccdv
 	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -fPIC -o $@ -c lib/$*.c
 
 libcpupower.so.$(LIB_MAJ): $(LIB_OBJS)
-	$(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
+	$(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ -l pci \
 		-Wl,-soname,libcpupower.so.$(LIB_MIN) $(LIB_OBJS)
 	@ln -sf $@ libcpupower.so
 	@ln -sf $@ libcpupower.so.$(LIB_MIN)
diff --git a/lib/amdpci.c b/lib/amdpci.c
new file mode 100644
index 0000000..1463db3
--- /dev/null
+++ b/lib/amdpci.c
@@ -0,0 +1,68 @@
+/*
+ *  (C) 2010  Andreas Herrmann <herrmann.der.user@googlemail.com>
+ *
+ *  Licensed under the terms of the GNU GPL License version 2.
+ */
+
+
+#include <stdio.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdint.h>
+#include <inttypes.h>
+
+#include <pci/pci.h>
+
+#include "cpufreq.h"
+#include "sysfs.h"
+
+static struct pci_access *pacc;
+
+static struct pci_dev *amd_pci_nb_init(int *dev_ids)
+{
+	struct pci_filter filter_nb_link = { -1, -1, -1, -1, 0x1022, 0};
+	struct pci_dev *device;
+	unsigned int i;
+
+	pacc = pci_alloc();
+	pci_init(pacc);
+	pci_scan_bus(pacc);
+
+	for (i = 0; dev_ids[i] != 0; i++) {
+		filter_nb_link.device = dev_ids[i];
+		for (device=pacc->devices; device; device = device->next) {
+			if (pci_filter_match(&filter_nb_link, device))
+				return device;
+		}
+	}
+
+	return NULL;
+}
+
+static void amd_pci_nb_fini(void)
+{
+	pci_cleanup(pacc);
+}
+
+int amd_pci_get_num_boost_states(int *active, int *states)
+{
+	uint8_t val;
+	int dev_ids[2] = {0x1204, 0};
+	struct pci_dev *device;
+
+	device = amd_pci_nb_init(dev_ids);
+
+	val = 0;
+	if (device) {
+		val = pci_read_byte(device, 0x15c);
+		if (val & 3)
+			*active = 1;
+		else
+			*active = 0;
+		*states = (val >> 2) & 1;
+	}
+	amd_pci_nb_fini();
+
+	return 0;
+}
diff --git a/lib/amdpci.h b/lib/amdpci.h
new file mode 100644
index 0000000..d29df49
--- /dev/null
+++ b/lib/amdpci.h
@@ -0,0 +1 @@
+extern int amd_pci_get_num_boost_states(int *active, int *states);
diff --git a/lib/cpufreq.c b/lib/cpufreq.c
index 0b5fe9f..6d8b26c 100644
--- a/lib/cpufreq.c
+++ b/lib/cpufreq.c
@@ -14,6 +14,7 @@
 #include "sysfs.h"
 #include "cpuid.h"
 #include "msr.h"
+#include "amdpci.h"
 
 int cpufreq_cpu_exists(unsigned int cpu)
 {
@@ -191,12 +192,12 @@ unsigned long cpufreq_get_transitions(unsigned int cpu) {
 	return (ret);
 }
 
-int cpufreq_has_boost_support(unsigned int cpu, int *support, int *active)
+int cpufreq_has_boost_support(unsigned int cpu, int *support, int *active, int * states)
 {
 	struct cpupower_cpu_info cpu_info;
 	int ret;
 
-	*support = *active = 0;
+	*support = *active = *states = 0;
 
 	ret = get_cpu_info(0, &cpu_info);
 	if (ret)
@@ -218,10 +219,9 @@ int cpufreq_has_boost_support(unsigned int cpu, int *support, int *active)
 			*support = 1;
 		else
 			return 0;
-		ret = msr_amd_boost_is_active(cpu);
+		amd_pci_get_num_boost_states(active, states);
 		if (ret <= 0)
 			return ret;
-		*active = ret;
 	}
 	return 0;
 }
diff --git a/lib/cpufreq.h b/lib/cpufreq.h
index 506b6fc..378c063 100644
--- a/lib/cpufreq.h
+++ b/lib/cpufreq.h
@@ -213,7 +213,7 @@ extern int cpufreq_set_frequency(unsigned int cpu, unsigned long target_frequenc
  * Check whether Intel's "Turbo Boost Technology" or AMD's
  * "Dynamic Speed Boost Technology" is supported and if, whether it's activated
  */
-extern int cpufreq_has_boost_support(unsigned int cpu, int *support, int *active);
+extern int cpufreq_has_boost_support(unsigned int cpu, int *support, int *active, int *states);
 
 
 #ifdef __cplusplus
diff --git a/lib/msr.c b/lib/msr.c
index 9921ff1..85bdfd5 100644
--- a/lib/msr.c
+++ b/lib/msr.c
@@ -127,17 +127,6 @@ int msr_amd_get_fidvid(unsigned int cpu, uint32_t *fid, uint32_t *vid)
 	return 0;
 }
 
-int msr_amd_boost_is_active(unsigned int cpu)
-{
-	uint64_t k7_hwcr;
-	int ret;
-
-	ret = read_msr(cpu, MSR_K7_HWCR, &k7_hwcr);
-	if (ret)
-		return ret;
-	return !((k7_hwcr >> 25) & 0x1);
-}
-
 /* Intel X86 MSRs **********************************/
 int msr_intel_get_perf_status(unsigned int cpu, uint64_t perf_status)
 {
diff --git a/lib/msr.h b/lib/msr.h
index 6b743ce..ac44a6a 100644
--- a/lib/msr.h
+++ b/lib/msr.h
@@ -6,5 +6,3 @@ extern int msr_intel_get_perf_status(unsigned int cpu, uint64_t perf_status);
 
 extern int msr_intel_has_boost_support(unsigned int cpu);
 extern int msr_intel_boost_is_active(unsigned int cpu);
-
-extern int msr_amd_boost_is_active(unsigned int cpu);
diff --git a/utils/cpufreq-info.c b/utils/cpufreq-info.c
index 4d479f3..bb8e425 100644
--- a/utils/cpufreq-info.c
+++ b/utils/cpufreq-info.c
@@ -290,9 +290,9 @@ static void debug_output(unsigned int cpu, unsigned int all) {
 /* --boost / -b */
 
 static int get_boost_mode(unsigned int cpu) {
-	int support, active, ret;
+	int support, active, states, ret;
 
-	ret = cpufreq_has_boost_support(cpu, &support, &active);
+	ret = cpufreq_has_boost_support(cpu, &support, &active, &states);
 	if (ret) {
 		printf(gettext ("Error while evaluating Boost Capabilities"
 				" on CPU %d -- are you root?\n"), cpu);
@@ -302,6 +302,7 @@ static int get_boost_mode(unsigned int cpu) {
 	printf(gettext ("Analyzing Boost Capabilities on CPU %d:\n"), cpu);
 	printf("Supported: %s\n", support ? "yes" : "no");
 	printf("Active: %s\n", active ? "yes" : "no");
+	printf("Boost States: %d\n", states);
 
 	return 0;
 }
-- 
1.7.3.1

