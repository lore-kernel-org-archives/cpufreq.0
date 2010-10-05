From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/5] cpupowerutils: Move read_msr from cpufreq-aperf.c into own /lib/msr.c file
Date: Tue,  5 Oct 2010 14:23:10 +0200
Message-ID: <1286281394-14699-2-git-send-email-trenn@suse.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1286281394-14699-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trenn@suse.de, cpufreq@vger.kernel.org, linux@dominikbrodowski.net

Reading msrs is a function that will get re-used quite often for other stuff
soon.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 Makefile              |    6 ++--
 lib/msr.c             |   88 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/msr.h             |    4 ++
 utils/cpufreq-aperf.c |   42 ++---------------------
 4 files changed, 99 insertions(+), 41 deletions(-)
 create mode 100644 lib/msr.c
 create mode 100644 lib/msr.h

diff --git a/Makefile b/Makefile
index b767d97..b04f85c 100644
--- a/Makefile
+++ b/Makefile
@@ -113,9 +113,9 @@ CPPFLAGS += -DVERSION=\"$(VERSION)\" -DPACKAGE=\"$(PACKAGE)\" \
 
 UTIL_SRC = 	utils/cpufreq-info.c utils/cpufreq-set.c utils/cpufreq-aperf.c utils/cpuidle-info.c utils/cpuid.h
 UTIL_BINS = 	utils/cpufreq-info utils/cpufreq-set utils/cpufreq-aperf utils/cpuidle-info
-LIB_HEADERS = 	lib/cpufreq.h lib/cpuidle.h lib/sysfs.h
-LIB_SRC = 	lib/cpufreq.c lib/cpuidle.c lib/sysfs.c
-LIB_OBJS = 	lib/cpufreq.o lib/cpuidle.o lib/sysfs.o
+LIB_HEADERS = 	lib/cpufreq.h lib/cpuidle.h lib/sysfs.h lib/msr.h
+LIB_SRC = 	lib/cpufreq.c lib/cpuidle.c lib/sysfs.c lib/msr.c
+LIB_OBJS = 	lib/cpufreq.o lib/cpuidle.o lib/sysfs.o lib/msr.o
 
 CFLAGS +=	-pipe
 
diff --git a/lib/msr.c b/lib/msr.c
new file mode 100644
index 0000000..f532e1a
--- /dev/null
+++ b/lib/msr.c
@@ -0,0 +1,88 @@
+#include <stdio.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <stdint.h>
+
+#include <sys/stat.h>
+#include <sys/types.h>
+
+
+#define MSR_IA32_APERF		0x000000E8
+#define MSR_IA32_MPERF		0x000000E7
+
+#define MSR_FIDVID_STATUS	0xc0010042
+
+#define MSR_IA32_PERF_STATUS	0x198
+
+
+/*
+ * read_msr
+ *
+ * Will return 0 on success and -1 on failure.
+ * Possible errno values could be:
+ * EFAULT -If the read/write did not fully complete
+ * EIO    -If the CPU does not support MSRs
+ * ENXIO  -If the CPU does not exist
+ */
+
+static int read_msr(int cpu, unsigned int idx, uint64_t *val)
+{
+	int fd;
+	char msr_file_name[64];
+
+	sprintf(msr_file_name, "/dev/cpu/%d/msr", cpu);
+	fd = open(msr_file_name, O_RDONLY);
+	if (fd < 0)
+		return -1;
+	if (lseek(fd, idx, SEEK_CUR) == -1)
+		goto err;
+	if (read(fd, val, sizeof val) != sizeof *val)
+		goto err;
+	close(fd);
+	return 0;
+ err:
+	close(fd);
+	return -1;
+}
+
+/*
+ * write_msr
+ *
+ * Will return 0 on success and -1 on failure.
+ * Possible errno values could be:
+ * EFAULT -If the read/write did not fully complete
+ * EIO    -If the CPU does not support MSRs
+ * ENXIO  -If the CPU does not exist
+ */
+
+static int write_msr(int cpu, unsigned int idx, uint64_t val)
+{
+	int fd;
+	char msr_file_name[64];
+
+	sprintf(msr_file_name, "/dev/cpu/%d/msr", cpu);
+	fd = open(msr_file_name, O_WRONLY);
+	if (fd < 0)
+		return -1;
+	if (lseek(fd, idx, SEEK_CUR) == -1)
+		goto err;
+	if (write(fd, &val, sizeof val) != sizeof val)
+		goto err;
+	close(fd);
+	return 0;
+ err:
+	close(fd);
+	return -1;
+}
+
+int msr_get_aperf(unsigned int cpu, uint64_t *aperf)
+{
+	return read_msr(cpu, MSR_IA32_APERF, aperf);
+
+}
+
+int msr_get_mperf(unsigned int cpu, uint64_t *mperf)
+{
+	return read_msr(cpu, MSR_IA32_MPERF, mperf);
+
+}
diff --git a/lib/msr.h b/lib/msr.h
new file mode 100644
index 0000000..347c50f
--- /dev/null
+++ b/lib/msr.h
@@ -0,0 +1,4 @@
+extern int msr_get_mperf(unsigned int cpu, uint64_t *mperf);
+extern int msr_get_aperf(unsigned int cpu, uint64_t *aperf);
+
+extern int msr_amd_get_fidvid(unsigned int cpu, uint32_t *fid, uint32_t *vid);
diff --git a/utils/cpufreq-aperf.c b/utils/cpufreq-aperf.c
index 77ce114..c9461ae 100644
--- a/utils/cpufreq-aperf.c
+++ b/utils/cpufreq-aperf.c
@@ -46,18 +46,14 @@
 #include <unistd.h>
 #include <getopt.h>
 #include <sys/time.h>
-#include <sys/types.h>
-#include <stdint.h>
 #include <errno.h>
-#include <fcntl.h>
 #include <string.h>
+#include <stdint.h>
 
 #include "cpufreq.h"
+#include "msr.h"
 #include "cpuid.h"
 
-#define MSR_IA32_APERF 0x000000E8
-#define MSR_IA32_MPERF 0x000000E7
-
 struct avg_perf_cpu_info
 {
 	unsigned long max_freq;
@@ -80,36 +76,6 @@ static int cpu_has_effective_freq()
 }
 
 /*
- * read_msr
- *
- * Will return 0 on success and -1 on failure.
- * Possible errno values could be:
- * EFAULT -If the read/write did not fully complete
- * EIO    -If the CPU does not support MSRs
- * ENXIO  -If the CPU does not exist
- */
-
-static int read_msr(int cpu, unsigned int idx, unsigned long long *val)
-{
-	int fd;
-	char msr_file_name[64];
-
-	sprintf(msr_file_name, "/dev/cpu/%d/msr", cpu);
-	fd = open(msr_file_name, O_RDONLY);
-	if (fd < 0)
-		return -1;
-	if (lseek(fd, idx, SEEK_CUR) == -1)
-		goto err;
-	if (read(fd, val, sizeof val) != sizeof *val)
-		goto err;
-	close(fd);
-	return 0;
- err:
-	close(fd);
-	return -1;
-}
-
-/*
  * get_aperf_mperf()
  *
  * Returns the current aperf/mperf MSR values of cpu
@@ -118,11 +84,11 @@ static int get_aperf_mperf(unsigned int cpu, uint64_t *aperf, uint64_t *mperf)
 {
 	int retval;
 
-	retval = read_msr(cpu, MSR_IA32_APERF, (unsigned long long*)aperf);
+	retval = msr_get_aperf(cpu, aperf);
 	if (retval < 0)
 		return retval;
 
-	retval = read_msr(cpu, MSR_IA32_MPERF, (unsigned long long*)mperf);
+	retval = msr_get_mperf(cpu, mperf);
 	if (retval < 0)
 		return retval;
 	return 0;
-- 
1.6.4.2

