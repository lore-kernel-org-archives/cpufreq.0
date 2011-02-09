From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/8] libcpupower/cpufreq-info: Add basic functions to detect AMD CPB information
Date: Wed,  9 Feb 2011 14:56:32 +0100
Message-ID: <c1f6704f575e250306095c94486c122af646401d.1297259254.git.trenn@suse.de>
References: <cover.1297259254.git.trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <cover.1297259254.git.trenn@suse.de>
In-Reply-To: <cover.1297259254.git.trenn@suse.de>
References: <cover.1297259254.git.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net
Cc: lenb@kernel.org, andreas.herrmann3@amd.com, Andreas Herrmann <herrmann.der.user@googlemail.com>, Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

From: Andreas Herrmann <herrmann.der.user@googlemail.com>

To gather boost state information on AMD we need to access CPU
northbridge PCI functions.

Thus this change introduces a dependency on libpci (part of pciutils and
usually installed on Linux systems).

Detect whether CPB is enabled/disabled and number of boosted states.

Signed-off-by: Andreas Herrmann <herrmann.der.user@googlemail.com>
Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
CC: Andreas Herrmann <herrmann.der.user@googlemail.com>
---
 Makefile             |    8 ++--
 lib/cpufreq.c        |    8 ++--
 lib/cpufreq.h        |    2 +-
 lib/msr.c            |   11 ------
 lib/msr.h            |    2 -
 lib/pci.c            |   89 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/pci.h            |    1 +
 utils/cpufreq-info.c |    5 ++-
 8 files changed, 102 insertions(+), 24 deletions(-)
 create mode 100644 lib/pci.c
 create mode 100644 lib/pci.h

diff --git a/Makefile b/Makefile
index 2cd9e83..0386f53 100644
--- a/Makefile
+++ b/Makefile
@@ -113,9 +113,9 @@ CPPFLAGS += -DVERSION=\"$(VERSION)\" -DPACKAGE=\"$(PACKAGE)\" \
 
 UTIL_SRC = 	utils/cpufreq-info.c utils/cpufreq-set.c utils/cpufreq-aperf.c utils/cpuidle-info.c
 UTIL_BINS = 	utils/cpufreq-info utils/cpufreq-set utils/cpufreq-aperf utils/cpuidle-info
-LIB_HEADERS = 	lib/cpufreq.h lib/cpuidle.h lib/sysfs.h lib/msr.h lib/cpuid.h
-LIB_SRC = 	lib/cpufreq.c lib/cpuidle.c lib/sysfs.c lib/msr.c
-LIB_OBJS = 	lib/cpufreq.o lib/cpuidle.o lib/sysfs.o lib/msr.o
+LIB_HEADERS = 	lib/cpufreq.h lib/cpuidle.h lib/sysfs.h lib/msr.h lib/cpuid.h lib/pci.h
+LIB_SRC = 	lib/cpufreq.c lib/cpuidle.c lib/sysfs.c lib/msr.c lib/pci.c
+LIB_OBJS = 	lib/cpufreq.o lib/cpuidle.o lib/sysfs.o lib/msr.o lib/pci.o
 
 CFLAGS +=	-pipe
 
@@ -163,7 +163,7 @@ lib/%.o: $(LIB_SRC) $(LIB_HEADERS) build/ccdv
 	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -fPIC -o $@ -c lib/$*.c
 
 libcpupower.so.$(LIB_MAJ): $(LIB_OBJS)
-	$(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
+	$(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ -l pci \
 		-Wl,-soname,libcpupower.so.$(LIB_MIN) $(LIB_OBJS)
 	@ln -sf $@ libcpupower.so
 	@ln -sf $@ libcpupower.so.$(LIB_MIN)
diff --git a/lib/cpufreq.c b/lib/cpufreq.c
index 0b5fe9f..731d61f 100644
--- a/lib/cpufreq.c
+++ b/lib/cpufreq.c
@@ -14,6 +14,7 @@
 #include "sysfs.h"
 #include "cpuid.h"
 #include "msr.h"
+#include "pci.h"
 
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
index 3b59fb5..285290f 100644
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
diff --git a/lib/pci.c b/lib/pci.c
new file mode 100644
index 0000000..8887aa5
--- /dev/null
+++ b/lib/pci.c
@@ -0,0 +1,89 @@
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
+/*
+ * pci_acc_init
+ *
+ * PCI access helper function depending on libpci
+ *
+ * **pacc : if a valid pci_dev is returned
+ *         *pacc must be passed to pci_acc_cleanup to free it
+ *
+ * vendor_id : the pci vendor id matching the pci device to access
+ * dev_ids :   device ids matching the pci device to access
+ *
+ * Returns :
+ * struct pci_dev which can be used with pci_{read,write}_* functions
+ *                to access the PCI config space of matching pci devices
+ */
+static struct pci_dev *pci_acc_init(struct pci_access **pacc, int vendor_id,
+			     int *dev_ids)
+{
+	struct pci_filter filter_nb_link = { -1, -1, -1, -1, vendor_id, 0};
+	struct pci_dev *device;
+	unsigned int i;
+
+	*pacc = pci_alloc();
+	if (*pacc == NULL)
+		return NULL;
+
+	pci_init(*pacc);
+	pci_scan_bus(*pacc);
+
+	for (i = 0; dev_ids[i] != 0; i++) {
+		filter_nb_link.device = dev_ids[i];
+		for (device=(*pacc)->devices; device; device = device->next) {
+			if (pci_filter_match(&filter_nb_link, device))
+				return device;
+		}
+	}
+	pci_cleanup(*pacc);
+	return NULL;
+}
+
+static void pci_acc_cleanup(struct pci_access *pacc)
+{
+       pci_cleanup(pacc);
+}
+
+int amd_pci_get_num_boost_states(int *active, int *states)
+{
+	struct pci_access *pci_acc;
+	int vendor_id = 0x1022;
+	int boost_dev_ids[2] = {0x1204, 0};
+	struct pci_dev *device;
+	uint8_t val = 0;
+
+	*active = *states = 0;
+
+	device = pci_acc_init(&pci_acc, vendor_id, boost_dev_ids);
+
+	if (device == NULL)
+		return -ENODEV;
+
+	val = pci_read_byte(device, 0x15c);
+	if (val & 3)
+		*active = 1;
+	else
+		*active = 0;
+	*states = (val >> 2) & 1;
+
+	pci_acc_cleanup(pci_acc);
+	return 0;
+}
diff --git a/lib/pci.h b/lib/pci.h
new file mode 100644
index 0000000..d29df49
--- /dev/null
+++ b/lib/pci.h
@@ -0,0 +1 @@
+extern int amd_pci_get_num_boost_states(int *active, int *states);
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
1.7.3.4

