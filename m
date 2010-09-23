From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/4] cpufrequtils: Prepare for non-cpufreq related power features by renaming files
Date: Thu, 23 Sep 2010 17:30:07 +0200
Message-ID: <1285255810-11252-2-git-send-email-trenn@suse.de>
References: <1285255810-11252-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1285255810-11252-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux@dominikbrodowski.net
Cc: trenn@suse.de

aperf.c -> cpufreq-aperf.c
info.c  -> cpufreq-info.c
set.c   -> cpufreq-set.c

Creating UTIL_BINS variable in the Makefile seem to have the effect that all
util binaries are rebuild, even if only one got modified.
This still was the nicest way I found, could get cleaned up by someone who
is more familiar with Makefiles than I am.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux@dominikbrodowski.net
CC: cpufreq@vger.kernel.org
---
 Makefile              |   17 +-
 utils/aperf.c         |  431 ---------------------------------
 utils/cpufreq-aperf.c |  431 +++++++++++++++++++++++++++++++++
 utils/cpufreq-info.c  |  629 +++++++++++++++++++++++++++++++++++++++++++++++++
 utils/cpufreq-set.c   |  375 +++++++++++++++++++++++++++++
 utils/info.c          |  629 -------------------------------------------------
 utils/set.c           |  375 -----------------------------
 7 files changed, 1443 insertions(+), 1444 deletions(-)
 delete mode 100644 utils/aperf.c
 create mode 100644 utils/cpufreq-aperf.c
 create mode 100644 utils/cpufreq-info.c
 create mode 100644 utils/cpufreq-set.c
 delete mode 100644 utils/info.c
 delete mode 100644 utils/set.c

diff --git a/Makefile b/Makefile
index e23c644..aa4b9ff 100644
--- a/Makefile
+++ b/Makefile
@@ -111,7 +111,8 @@ WARNINGS += -Wshadow
 CPPFLAGS += -DVERSION=\"$(VERSION)\" -DPACKAGE=\"$(PACKAGE)\" \
 		-DPACKAGE_BUGREPORT=\"$(PACKAGE_BUGREPORT)\" -D_GNU_SOURCE
 
-UTIL_SRC = 	utils/info.c utils/set.c utils/aperf.c utils/cpuid.h
+UTIL_SRC = 	utils/cpufreq-info.c utils/cpufreq-set.c utils/cpufreq-aperf.c utils/cpuid.h
+UTIL_BINS = 	utils/cpufreq-info utils/cpufreq-set utils/cpufreq-aperf
 LIB_HEADERS = 	lib/cpufreq.h lib/sysfs.h
 LIB_SRC = 	lib/cpufreq.c lib/sysfs.c
 LIB_OBJS = 	lib/cpufreq.o lib/sysfs.o
@@ -171,12 +172,12 @@ libcpufreq.so.$(LIB_MAJ): $(LIB_OBJS)
 
 libcpufreq: libcpufreq.so.$(LIB_MAJ)
 
-cpufreq-%: libcpufreq.so.$(LIB_MAJ) $(UTIL_SRC)
-	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -I. -I./lib/ -c -o utils/$@.o utils/$*.c
-	$(QUIET) $(CC) $(CFLAGS) $(LDFLAGS) -L. -o $@ utils/$@.o -lcpufreq
+$(UTIL_BINS): libcpufreq.so.$(LIB_MAJ) $(UTIL_SRC)
+	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -I. -I./lib/ -c $@.c -o $@.o
+	$(QUIET) $(CC) $(CFLAGS) $(LDFLAGS) -L. -o $@ $@.o -lcpufreq
 	$(QUIET) $(STRIPCMD) $@
 
-utils: cpufreq-info cpufreq-set cpufreq-aperf
+utils: $(UTIL_BINS)
 
 po/$(PACKAGE).pot: $(UTIL_SRC)
 	@xgettext --default-domain=$(PACKAGE) --add-comments \
@@ -203,7 +204,7 @@ compile-bench: libcpufreq
 clean:
 	-find . \( -not -type d \) -and \( -name '*~' -o -name '*.[oas]' \) -type f -print \
 	 | xargs rm -f
-	-rm -f cpufreq-info cpufreq-set cpufreq-aperf
+	-rm -f $(UTIL_BINS)
 	-rm -f libcpufreq.so*
 	-rm -f build/ccdv
 	-rm -rf po/*.gmo po/*.pot
@@ -218,9 +219,7 @@ install-lib:
 
 install-tools:
 	$(INSTALL) -d $(DESTDIR)${bindir}
-	$(INSTALL_PROGRAM) cpufreq-set $(DESTDIR)${bindir}/cpufreq-set
-	$(INSTALL_PROGRAM) cpufreq-info $(DESTDIR)${bindir}/cpufreq-info
-	$(INSTALL_PROGRAM) cpufreq-aperf $(DESTDIR)${bindir}/cpufreq-aperf
+	$(INSTALL_PROGRAM) $(UTIL_BINS) $(DESTDIR)${bindir}
 
 install-man:
 	$(INSTALL_DATA) -D man/cpufreq-set.1 $(DESTDIR)${mandir}/man1/cpufreq-set.1
diff --git a/utils/aperf.c b/utils/aperf.c
deleted file mode 100644
index 1c64501..0000000
--- a/utils/aperf.c
+++ /dev/null
@@ -1,431 +0,0 @@
-/*
- *  Copyright (C) 2009  Thomas Renninger <trenn@suse.de>, Novell Inc.
- *
- *  Inspired by these projects:
- *    cpuid (by Todd Allen)
- *    msr-tools (by H. Peter Anvin <hpa@zytor.com>)
- *
- *  Licensed under the terms of the GNU GPL License version 2.
- *
- *
- *  What does this program do:
- *
- *  On latest processors exist two MSR registers refered to as:
- *    - MPERF increasing with maxium (P0) frequency in C0
- *    - APERF increasing with current/actual frequency in C0
- *
- *  From this information the average frequency over a time period can be
- *  calculated and this is what this tool does.
- *
- *  A nice falloff feature beside the average frequency is the time
- *  a processor core remained in C0 (working state) or any CX (sleep state)
- *  processor sleep state during the measured time period. This information
- *  can be determined from the fact that MPERF only increases in C0 state.
- *
- *  Note: There were kernels which reset MPERF/APERF registers to 0.
- *        This got reverted by git commit
- *                  18b2646fe3babeb40b34a0c1751e0bf5adfdc64c
- *        which was commited to 2.6.30-rcX mainline kernels
- *        For kernels where the kernel rests MPERF/APERF registers to 0,
- *        this tool will not work. It cannot be detected whether this happened.
- *
- * Possible ToDos/Enhancments:
- *
- *  - Refresh the screen when mulitple cpus are poked and display results
- *    on one screen
- *    -This would introduce a lot more complexity, not sure whether it's
- *       wanted/needed. I'd vote to better not do that.
- *  - Manpage
- *  - Translations
- *  - ...
- */
-
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <getopt.h>
-#include <sys/time.h>
-#include <sys/types.h>
-#include <stdint.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <string.h>
-
-#include "cpufreq.h"
-#include "cpuid.h"
-
-#define MSR_IA32_APERF 0x000000E8
-#define MSR_IA32_MPERF 0x000000E7
-
-struct avg_perf_cpu_info
-{
-	unsigned long max_freq;
-	uint64_t saved_aperf;
-	uint64_t saved_mperf;
-	uint32_t is_valid:1;
-};
-
-static int cpu_has_effective_freq()
-{
-#if defined(__i386__) || defined(__x86_64__)
-	/* largest base level */
-	if (cpuid_eax(0) < 6)
-		return 0;
-
-	return cpuid_ecx(6) & 0x1;
-#else
-	return 0;
-#endif
-}
-
-/*
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
- * get_aperf_mperf()
- *
- * Returns the current aperf/mperf MSR values of cpu
- */
-static int get_aperf_mperf(unsigned int cpu, uint64_t *aperf, uint64_t *mperf)
-{
-	int retval;
-
-	retval = read_msr(cpu, MSR_IA32_APERF, (unsigned long long*)aperf);
-	if (retval < 0)
-		return retval;
-
-	retval = read_msr(cpu, MSR_IA32_MPERF, (unsigned long long*)mperf);
-	if (retval < 0)
-		return retval;
-	return 0;
-}
-
-/*
- * get_average_perf()
- *
- * Returns the average performance (also considers boosted frequencies)
- * 
- * Input:
- *   aperf_diff: Difference of the aperf register over a time period
- *   mperf_diff: Difference of the mperf register over the same time period
- *   max_freq:   Maximum frequency (P0)
- *
- * Returns:
- *   Average performance over the time period
- */
-static unsigned long get_average_perf(unsigned long max_freq,
-				      uint64_t aperf_diff,
-				      uint64_t mperf_diff)
-{
-	unsigned int perf_percent = 0;
-	if (((unsigned long)(-1) / 100) < aperf_diff) {
-		int shift_count = 7;
-		aperf_diff >>= shift_count;
-		mperf_diff >>= shift_count;
-	}
-	perf_percent = (aperf_diff * 100) / mperf_diff;
-	return (max_freq * perf_percent) / 100;
-}
-
-/*
- * get_C_state_time()
- *
- * Calculates the time the processor was in C0 and Cx processor sleep states
- *
- * As mperf does only tick in C0 at maximum frequency, this is a nice "falloff"
- * functionality and more accurate than powertop or other kernel timer based
- * C-state measurings (and can be used to verify whether they are correct.
- *
- * Input:
- *   time_diff:  The time passed for which the mperf_diff was calulcated on
- *   mperf_diff: The value the mperf register increased during time_diff
- *   max_freq:   Maximum frequency of the processor (P0) in kHz
- *
- * Output:
- *   C0_time:    The time the processor was in C0
- *   CX_time:    The time the processor was in CX
- *   percent:    Percentage the processor stayed in C0
- */
-static int get_C_state_time(struct timeval time_diff, uint64_t mperf_diff,
-		     unsigned long max_freq,
-		     struct timeval *C0_time, struct timeval *CX_time,
-		     unsigned int *percent)
-{
-	unsigned long long overall_msecs, expected_ticks, c0_time, cx_time;
-
-	overall_msecs = (time_diff.tv_sec * 1000 * 1000  + time_diff.tv_usec)
-		/ 1000;
-
-	expected_ticks = max_freq * overall_msecs;
-	*percent = (mperf_diff * 100) / expected_ticks;
-
-	cx_time = (expected_ticks - mperf_diff) / max_freq;
-	c0_time = mperf_diff / max_freq;
-
-	CX_time->tv_sec  = cx_time / 1000;
-	CX_time->tv_usec = cx_time % 1000;
-	C0_time->tv_sec  = c0_time / 1000;
-	C0_time->tv_usec = c0_time % 1000;
-	return 0;
-}
-
-static int get_measure_start_info(unsigned int cpu,
-				  struct avg_perf_cpu_info *cpu_info)
-{
-	unsigned long min, max;
-	uint64_t aperf, mperf;
-	int ret;
-
-	cpu_info->is_valid = 0;
-
-	if (cpufreq_get_hardware_limits(cpu, &min, &max))
-		return -EINVAL;
-
-	cpu_info->max_freq = max;
-	
-	ret = get_aperf_mperf(cpu, &aperf, &mperf);
-	if (ret < 0)
-		return -EINVAL;
-
-	cpu_info->saved_aperf = aperf;
-	cpu_info->saved_mperf = mperf;
-	cpu_info->is_valid = 1;
-
-	return 0;
-}
-
-static void print_cpu_stats(unsigned long average, struct timeval c0_time,
-			    struct timeval cx_time, unsigned int c0_percent)
-{
-	printf("%.7lu\t\t\t", average);
-	printf("%.2lu sec %.3lu ms\t", c0_time.tv_sec, c0_time.tv_usec);
-	printf("%.2lu sec %.3lu ms\t", cx_time.tv_sec, cx_time.tv_usec);
-	printf("%.2u", c0_percent);
-}
-
-static int do_measuring_on_cpu(int sleep_time, int once, int cpu)
-{
-	int ret;
-	unsigned long average;
-	unsigned int c0_percent;
-	struct timeval start_time, current_time, diff_time, C0_time, CX_time;
-	uint64_t current_aperf, current_mperf, mperf_diff, aperf_diff;
-	struct avg_perf_cpu_info cpu_info;
-
-	ret = get_measure_start_info(cpu, &cpu_info);
-	if (ret)
-		return ret;
-
-	while(1) {
-		gettimeofday(&start_time, NULL);
-		sleep(sleep_time);
-		/* ToDo: just add a second on the timeval struct? */
-		gettimeofday(&current_time, NULL);
-		timersub(&current_time, &start_time, &diff_time);
-		memcpy(&start_time, &current_time,
-		       sizeof(struct timeval));
-
-		if (!cpu_info.is_valid)
-			continue;
-
-		printf("%.3u\t", cpu);
-
-		ret = get_aperf_mperf(cpu, &current_aperf, &current_mperf);
-		if (ret < 0) {
-			printf("[offline]\n");
-			continue;
-		}
-
-		mperf_diff = current_mperf - cpu_info.saved_mperf;
-		aperf_diff = current_aperf - cpu_info.saved_aperf;
-
-		get_C_state_time(diff_time, mperf_diff,
-				 cpu_info.max_freq,
-				 &C0_time, &CX_time,
-				 &c0_percent);
-		average = get_average_perf(cpu_info.max_freq,
-					   aperf_diff, mperf_diff);
-		cpu_info.saved_mperf = current_mperf;
-		cpu_info.saved_aperf = current_aperf;
-		print_cpu_stats(average, C0_time, CX_time, c0_percent);
-
-		if (once) {
-			printf("\n");
-			break;
-		} else {
-			printf("\r");
-			fflush(stdout);
-		}
-	}
-	return 0;
-}
-
-static int do_measure_all_cpus(int sleep_time, int once)
-{
-	int ret;
-	unsigned long average;
-	unsigned int c0_percent, cpus, cpu;
-	struct timeval start_time, current_time, diff_time, C0_time, CX_time;
-	uint64_t current_aperf, current_mperf, mperf_diff, aperf_diff;
-	struct avg_perf_cpu_info *cpu_list;
-
-	cpus = sysconf(_SC_NPROCESSORS_CONF);
-
-	cpu_list = (struct avg_perf_cpu_info*)
-		malloc(cpus * sizeof (struct avg_perf_cpu_info));
-
-	for (cpu = 0; cpu < cpus; cpu++) {
-		ret = get_measure_start_info(cpu, &cpu_list[cpu]);
-		if   (ret)
-		continue;
-	}
-
-	while(1) {
-		gettimeofday(&start_time, NULL);
-		sleep(sleep_time);
-		/* ToDo: Just add a second on the timeval struct?
-		         Would save one gettimeofday, but would not
-			 be that accurate anymore
-		*/
-		gettimeofday(&current_time, NULL);
-		timersub(&current_time, &start_time, &diff_time);
-		memcpy(&start_time, &current_time,
-		       sizeof(struct timeval));
-
-		for (cpu = 0; cpu < cpus; cpu++) {
-
-			printf("%.3u\t", cpu);
-
-			ret = get_aperf_mperf(cpu, &current_aperf,
-					      &current_mperf);
-
-			if ((ret < 0) || !cpu_list[cpu].is_valid) {
-				printf("[offline]\n");
-				continue;
-			}
-
-			mperf_diff = current_mperf - cpu_list[cpu].saved_mperf;
-			aperf_diff = current_aperf - cpu_list[cpu].saved_aperf;
-
-			get_C_state_time(diff_time, mperf_diff,
-					 cpu_list[cpu].max_freq,
-					 &C0_time, &CX_time,
-					 &c0_percent);
-			average = get_average_perf(cpu_list[cpu].max_freq,
-						   aperf_diff, mperf_diff);
-			cpu_list[cpu].saved_mperf = current_mperf;
-			cpu_list[cpu].saved_aperf = current_aperf;
-			print_cpu_stats(average, C0_time, CX_time, c0_percent);
-			printf("\n");
-		}
-		if (once)
-			break;
-		printf("\n");
-	}
-	return 0;
-}
-
-
-/******* Options parsing, main ********/
-
-static struct option long_options[] = {
-  { "help",		0, 0, 'h' },
-  { "intervall",	1, 0, 'i' },
-  { "cpu",		1, 0, 'c' },
-  { "once",		0, 0, 'o' },
-  { 0, 0, 0, 0 }
-};
-
-static void usage(void) {
-	printf("cpufreq-aperf [OPTIONS]\n\n"
-	       "-c [ --cpu ] CPU               "
-	       "The CPU core to measure - default all cores\n"
-	       "-i [ --intervall ] seconds     "
-	       "Refresh rate - default 1 second\n"
-	       "-o [ --once ]                  "
-	       "Exit after one intervall\n"
-	       "-h [ --help ]                  "
-	       "This help text\n"
-	       "The msr driver must be loaded for this command to work\n");
-}
-
-int main(int argc, char *argv[])
-{
-	int c, ret, cpu = -1;
-	int sleep_time = 1, once = 0;
-	const char *msr_path = "/dev/cpu/0/msr";
-
-	while ( (c = getopt_long(argc,argv,"c:ohi:",long_options,
-				 NULL)) != -1 ) {
-		switch ( c ) {
-		case 'o':
-			once = 1;
-			break;
-		case 'c':
-			cpu = atoi(optarg);
-			break;
-		case 'h':
-			usage();
-			exit(0);
-		case 'i':
-			sleep_time = atoi(optarg);
-			break;
-		}
-	}
-
-	if (getuid() != 0) {
-		fprintf(stderr, "You must be root\n");
-		return EXIT_FAILURE;
-	}
-
-	if (!cpu_has_effective_freq()) {
-		fprintf(stderr, "CPU doesn't support APERF/MPERF\n");
-		return EXIT_FAILURE;
-	}
-
-	ret = access(msr_path, R_OK);
-	if (ret < 0) {
-		fprintf(stderr, "Error reading %s, load/enable msr.ko\n", msr_path);
-		goto out;
-	}
-
-	printf("CPU\tAverage freq(KHz)\tTime in C0\tTime in"
-	       " Cx\tC0 percentage\n");
-
-	if (cpu == -1)
-		ret = do_measure_all_cpus(sleep_time, once);
-	else
-		ret = do_measuring_on_cpu(sleep_time, once, cpu);
-
-out:
-	return ret;
-}
-/******* Options parsing, main ********/
diff --git a/utils/cpufreq-aperf.c b/utils/cpufreq-aperf.c
new file mode 100644
index 0000000..1c64501
--- /dev/null
+++ b/utils/cpufreq-aperf.c
@@ -0,0 +1,431 @@
+/*
+ *  Copyright (C) 2009  Thomas Renninger <trenn@suse.de>, Novell Inc.
+ *
+ *  Inspired by these projects:
+ *    cpuid (by Todd Allen)
+ *    msr-tools (by H. Peter Anvin <hpa@zytor.com>)
+ *
+ *  Licensed under the terms of the GNU GPL License version 2.
+ *
+ *
+ *  What does this program do:
+ *
+ *  On latest processors exist two MSR registers refered to as:
+ *    - MPERF increasing with maxium (P0) frequency in C0
+ *    - APERF increasing with current/actual frequency in C0
+ *
+ *  From this information the average frequency over a time period can be
+ *  calculated and this is what this tool does.
+ *
+ *  A nice falloff feature beside the average frequency is the time
+ *  a processor core remained in C0 (working state) or any CX (sleep state)
+ *  processor sleep state during the measured time period. This information
+ *  can be determined from the fact that MPERF only increases in C0 state.
+ *
+ *  Note: There were kernels which reset MPERF/APERF registers to 0.
+ *        This got reverted by git commit
+ *                  18b2646fe3babeb40b34a0c1751e0bf5adfdc64c
+ *        which was commited to 2.6.30-rcX mainline kernels
+ *        For kernels where the kernel rests MPERF/APERF registers to 0,
+ *        this tool will not work. It cannot be detected whether this happened.
+ *
+ * Possible ToDos/Enhancments:
+ *
+ *  - Refresh the screen when mulitple cpus are poked and display results
+ *    on one screen
+ *    -This would introduce a lot more complexity, not sure whether it's
+ *       wanted/needed. I'd vote to better not do that.
+ *  - Manpage
+ *  - Translations
+ *  - ...
+ */
+
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <getopt.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <stdint.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <string.h>
+
+#include "cpufreq.h"
+#include "cpuid.h"
+
+#define MSR_IA32_APERF 0x000000E8
+#define MSR_IA32_MPERF 0x000000E7
+
+struct avg_perf_cpu_info
+{
+	unsigned long max_freq;
+	uint64_t saved_aperf;
+	uint64_t saved_mperf;
+	uint32_t is_valid:1;
+};
+
+static int cpu_has_effective_freq()
+{
+#if defined(__i386__) || defined(__x86_64__)
+	/* largest base level */
+	if (cpuid_eax(0) < 6)
+		return 0;
+
+	return cpuid_ecx(6) & 0x1;
+#else
+	return 0;
+#endif
+}
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
+static int read_msr(int cpu, unsigned int idx, unsigned long long *val)
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
+ * get_aperf_mperf()
+ *
+ * Returns the current aperf/mperf MSR values of cpu
+ */
+static int get_aperf_mperf(unsigned int cpu, uint64_t *aperf, uint64_t *mperf)
+{
+	int retval;
+
+	retval = read_msr(cpu, MSR_IA32_APERF, (unsigned long long*)aperf);
+	if (retval < 0)
+		return retval;
+
+	retval = read_msr(cpu, MSR_IA32_MPERF, (unsigned long long*)mperf);
+	if (retval < 0)
+		return retval;
+	return 0;
+}
+
+/*
+ * get_average_perf()
+ *
+ * Returns the average performance (also considers boosted frequencies)
+ * 
+ * Input:
+ *   aperf_diff: Difference of the aperf register over a time period
+ *   mperf_diff: Difference of the mperf register over the same time period
+ *   max_freq:   Maximum frequency (P0)
+ *
+ * Returns:
+ *   Average performance over the time period
+ */
+static unsigned long get_average_perf(unsigned long max_freq,
+				      uint64_t aperf_diff,
+				      uint64_t mperf_diff)
+{
+	unsigned int perf_percent = 0;
+	if (((unsigned long)(-1) / 100) < aperf_diff) {
+		int shift_count = 7;
+		aperf_diff >>= shift_count;
+		mperf_diff >>= shift_count;
+	}
+	perf_percent = (aperf_diff * 100) / mperf_diff;
+	return (max_freq * perf_percent) / 100;
+}
+
+/*
+ * get_C_state_time()
+ *
+ * Calculates the time the processor was in C0 and Cx processor sleep states
+ *
+ * As mperf does only tick in C0 at maximum frequency, this is a nice "falloff"
+ * functionality and more accurate than powertop or other kernel timer based
+ * C-state measurings (and can be used to verify whether they are correct.
+ *
+ * Input:
+ *   time_diff:  The time passed for which the mperf_diff was calulcated on
+ *   mperf_diff: The value the mperf register increased during time_diff
+ *   max_freq:   Maximum frequency of the processor (P0) in kHz
+ *
+ * Output:
+ *   C0_time:    The time the processor was in C0
+ *   CX_time:    The time the processor was in CX
+ *   percent:    Percentage the processor stayed in C0
+ */
+static int get_C_state_time(struct timeval time_diff, uint64_t mperf_diff,
+		     unsigned long max_freq,
+		     struct timeval *C0_time, struct timeval *CX_time,
+		     unsigned int *percent)
+{
+	unsigned long long overall_msecs, expected_ticks, c0_time, cx_time;
+
+	overall_msecs = (time_diff.tv_sec * 1000 * 1000  + time_diff.tv_usec)
+		/ 1000;
+
+	expected_ticks = max_freq * overall_msecs;
+	*percent = (mperf_diff * 100) / expected_ticks;
+
+	cx_time = (expected_ticks - mperf_diff) / max_freq;
+	c0_time = mperf_diff / max_freq;
+
+	CX_time->tv_sec  = cx_time / 1000;
+	CX_time->tv_usec = cx_time % 1000;
+	C0_time->tv_sec  = c0_time / 1000;
+	C0_time->tv_usec = c0_time % 1000;
+	return 0;
+}
+
+static int get_measure_start_info(unsigned int cpu,
+				  struct avg_perf_cpu_info *cpu_info)
+{
+	unsigned long min, max;
+	uint64_t aperf, mperf;
+	int ret;
+
+	cpu_info->is_valid = 0;
+
+	if (cpufreq_get_hardware_limits(cpu, &min, &max))
+		return -EINVAL;
+
+	cpu_info->max_freq = max;
+	
+	ret = get_aperf_mperf(cpu, &aperf, &mperf);
+	if (ret < 0)
+		return -EINVAL;
+
+	cpu_info->saved_aperf = aperf;
+	cpu_info->saved_mperf = mperf;
+	cpu_info->is_valid = 1;
+
+	return 0;
+}
+
+static void print_cpu_stats(unsigned long average, struct timeval c0_time,
+			    struct timeval cx_time, unsigned int c0_percent)
+{
+	printf("%.7lu\t\t\t", average);
+	printf("%.2lu sec %.3lu ms\t", c0_time.tv_sec, c0_time.tv_usec);
+	printf("%.2lu sec %.3lu ms\t", cx_time.tv_sec, cx_time.tv_usec);
+	printf("%.2u", c0_percent);
+}
+
+static int do_measuring_on_cpu(int sleep_time, int once, int cpu)
+{
+	int ret;
+	unsigned long average;
+	unsigned int c0_percent;
+	struct timeval start_time, current_time, diff_time, C0_time, CX_time;
+	uint64_t current_aperf, current_mperf, mperf_diff, aperf_diff;
+	struct avg_perf_cpu_info cpu_info;
+
+	ret = get_measure_start_info(cpu, &cpu_info);
+	if (ret)
+		return ret;
+
+	while(1) {
+		gettimeofday(&start_time, NULL);
+		sleep(sleep_time);
+		/* ToDo: just add a second on the timeval struct? */
+		gettimeofday(&current_time, NULL);
+		timersub(&current_time, &start_time, &diff_time);
+		memcpy(&start_time, &current_time,
+		       sizeof(struct timeval));
+
+		if (!cpu_info.is_valid)
+			continue;
+
+		printf("%.3u\t", cpu);
+
+		ret = get_aperf_mperf(cpu, &current_aperf, &current_mperf);
+		if (ret < 0) {
+			printf("[offline]\n");
+			continue;
+		}
+
+		mperf_diff = current_mperf - cpu_info.saved_mperf;
+		aperf_diff = current_aperf - cpu_info.saved_aperf;
+
+		get_C_state_time(diff_time, mperf_diff,
+				 cpu_info.max_freq,
+				 &C0_time, &CX_time,
+				 &c0_percent);
+		average = get_average_perf(cpu_info.max_freq,
+					   aperf_diff, mperf_diff);
+		cpu_info.saved_mperf = current_mperf;
+		cpu_info.saved_aperf = current_aperf;
+		print_cpu_stats(average, C0_time, CX_time, c0_percent);
+
+		if (once) {
+			printf("\n");
+			break;
+		} else {
+			printf("\r");
+			fflush(stdout);
+		}
+	}
+	return 0;
+}
+
+static int do_measure_all_cpus(int sleep_time, int once)
+{
+	int ret;
+	unsigned long average;
+	unsigned int c0_percent, cpus, cpu;
+	struct timeval start_time, current_time, diff_time, C0_time, CX_time;
+	uint64_t current_aperf, current_mperf, mperf_diff, aperf_diff;
+	struct avg_perf_cpu_info *cpu_list;
+
+	cpus = sysconf(_SC_NPROCESSORS_CONF);
+
+	cpu_list = (struct avg_perf_cpu_info*)
+		malloc(cpus * sizeof (struct avg_perf_cpu_info));
+
+	for (cpu = 0; cpu < cpus; cpu++) {
+		ret = get_measure_start_info(cpu, &cpu_list[cpu]);
+		if   (ret)
+		continue;
+	}
+
+	while(1) {
+		gettimeofday(&start_time, NULL);
+		sleep(sleep_time);
+		/* ToDo: Just add a second on the timeval struct?
+		         Would save one gettimeofday, but would not
+			 be that accurate anymore
+		*/
+		gettimeofday(&current_time, NULL);
+		timersub(&current_time, &start_time, &diff_time);
+		memcpy(&start_time, &current_time,
+		       sizeof(struct timeval));
+
+		for (cpu = 0; cpu < cpus; cpu++) {
+
+			printf("%.3u\t", cpu);
+
+			ret = get_aperf_mperf(cpu, &current_aperf,
+					      &current_mperf);
+
+			if ((ret < 0) || !cpu_list[cpu].is_valid) {
+				printf("[offline]\n");
+				continue;
+			}
+
+			mperf_diff = current_mperf - cpu_list[cpu].saved_mperf;
+			aperf_diff = current_aperf - cpu_list[cpu].saved_aperf;
+
+			get_C_state_time(diff_time, mperf_diff,
+					 cpu_list[cpu].max_freq,
+					 &C0_time, &CX_time,
+					 &c0_percent);
+			average = get_average_perf(cpu_list[cpu].max_freq,
+						   aperf_diff, mperf_diff);
+			cpu_list[cpu].saved_mperf = current_mperf;
+			cpu_list[cpu].saved_aperf = current_aperf;
+			print_cpu_stats(average, C0_time, CX_time, c0_percent);
+			printf("\n");
+		}
+		if (once)
+			break;
+		printf("\n");
+	}
+	return 0;
+}
+
+
+/******* Options parsing, main ********/
+
+static struct option long_options[] = {
+  { "help",		0, 0, 'h' },
+  { "intervall",	1, 0, 'i' },
+  { "cpu",		1, 0, 'c' },
+  { "once",		0, 0, 'o' },
+  { 0, 0, 0, 0 }
+};
+
+static void usage(void) {
+	printf("cpufreq-aperf [OPTIONS]\n\n"
+	       "-c [ --cpu ] CPU               "
+	       "The CPU core to measure - default all cores\n"
+	       "-i [ --intervall ] seconds     "
+	       "Refresh rate - default 1 second\n"
+	       "-o [ --once ]                  "
+	       "Exit after one intervall\n"
+	       "-h [ --help ]                  "
+	       "This help text\n"
+	       "The msr driver must be loaded for this command to work\n");
+}
+
+int main(int argc, char *argv[])
+{
+	int c, ret, cpu = -1;
+	int sleep_time = 1, once = 0;
+	const char *msr_path = "/dev/cpu/0/msr";
+
+	while ( (c = getopt_long(argc,argv,"c:ohi:",long_options,
+				 NULL)) != -1 ) {
+		switch ( c ) {
+		case 'o':
+			once = 1;
+			break;
+		case 'c':
+			cpu = atoi(optarg);
+			break;
+		case 'h':
+			usage();
+			exit(0);
+		case 'i':
+			sleep_time = atoi(optarg);
+			break;
+		}
+	}
+
+	if (getuid() != 0) {
+		fprintf(stderr, "You must be root\n");
+		return EXIT_FAILURE;
+	}
+
+	if (!cpu_has_effective_freq()) {
+		fprintf(stderr, "CPU doesn't support APERF/MPERF\n");
+		return EXIT_FAILURE;
+	}
+
+	ret = access(msr_path, R_OK);
+	if (ret < 0) {
+		fprintf(stderr, "Error reading %s, load/enable msr.ko\n", msr_path);
+		goto out;
+	}
+
+	printf("CPU\tAverage freq(KHz)\tTime in C0\tTime in"
+	       " Cx\tC0 percentage\n");
+
+	if (cpu == -1)
+		ret = do_measure_all_cpus(sleep_time, once);
+	else
+		ret = do_measuring_on_cpu(sleep_time, once, cpu);
+
+out:
+	return ret;
+}
+/******* Options parsing, main ********/
diff --git a/utils/cpufreq-info.c b/utils/cpufreq-info.c
new file mode 100644
index 0000000..38d906a
--- /dev/null
+++ b/utils/cpufreq-info.c
@@ -0,0 +1,629 @@
+/*
+ *  (C) 2004-2009  Dominik Brodowski <linux@dominikbrodowski.de>
+ *
+ *  Licensed under the terms of the GNU GPL License version 2.
+ */
+
+
+#include <unistd.h>
+#include <stdio.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+#include <libintl.h>
+#include <locale.h>
+
+#include <getopt.h>
+
+#include "cpufreq.h"
+
+
+#define _(String) gettext (String)
+#define gettext_noop(String) String
+#define N_(String) gettext_noop (String)
+
+#define LINE_LEN 10
+
+static unsigned int count_cpus(void)
+{
+	FILE *fp;
+	char value[LINE_LEN];
+	unsigned int ret = 0;
+	unsigned int cpunr = 0;
+
+	fp = fopen("/proc/stat", "r");
+	if(!fp) {
+		printf(gettext("Couldn't count the number of CPUs (%s: %s), assuming 1\n"), "/proc/stat", strerror(errno));
+		return 1;
+	}
+
+	while (!feof(fp)) {
+		if (!fgets(value, LINE_LEN, fp))
+			continue;
+		value[LINE_LEN - 1] = '\0';
+		if (strlen(value) < (LINE_LEN - 2))
+			continue;
+		if (strstr(value, "cpu "))
+			continue;
+		if (sscanf(value, "cpu%d ", &cpunr) != 1)
+			continue;
+		if (cpunr > ret)
+			ret = cpunr;
+	}
+	fclose(fp);
+
+	/* cpu count starts from 0, on error return 1 (UP) */
+	return (ret+1);
+}
+
+
+static void proc_cpufreq_output(void)
+{
+	unsigned int cpu, nr_cpus;
+	struct cpufreq_policy *policy;
+	unsigned int min_pctg = 0;
+	unsigned int max_pctg = 0;
+	unsigned long min, max;
+
+	printf(gettext("          minimum CPU frequency  -  maximum CPU frequency  -  governor\n"));
+
+	nr_cpus = count_cpus();
+	for (cpu=0; cpu < nr_cpus; cpu++) {
+		policy = cpufreq_get_policy(cpu);
+		if (!policy)
+			continue;
+
+		if (cpufreq_get_hardware_limits(cpu, &min, &max)) {
+			max = 0;
+		} else {
+			min_pctg = (policy->min * 100) / max;
+			max_pctg = (policy->max * 100) / max;
+		}
+		printf("CPU%3d    %9lu kHz (%3d %%)  -  %9lu kHz (%3d %%)  -  %s\n",
+		       cpu , policy->min, max ? min_pctg : 0, policy->max, max ? max_pctg : 0, policy->governor);
+
+		cpufreq_put_policy(policy);
+	}
+}
+
+static void print_speed(unsigned long speed)
+{
+	unsigned long tmp;
+
+	if (speed > 1000000) {
+		tmp = speed % 10000;
+		if (tmp >= 5000)
+			speed += 10000;
+		printf ("%u.%02u GHz", ((unsigned int) speed/1000000),
+			((unsigned int) (speed%1000000)/10000));
+	} else if (speed > 100000) {
+		tmp = speed % 1000;
+		if (tmp >= 500)
+			speed += 1000;
+		printf ("%u MHz", ((unsigned int) speed / 1000));
+	} else if (speed > 1000) {
+		tmp = speed % 100;
+		if (tmp >= 50)
+			speed += 100;
+		printf ("%u.%01u MHz", ((unsigned int) speed/1000),
+			((unsigned int) (speed%1000)/100));
+	} else
+		printf ("%lu kHz", speed);
+
+	return;
+}
+
+static void print_duration(unsigned long duration)
+{
+	unsigned long tmp;
+
+	if (duration > 1000000) {
+		tmp = duration % 10000;
+		if (tmp >= 5000)
+			duration += 10000;
+		printf ("%u.%02u ms", ((unsigned int) duration/1000000),
+			((unsigned int) (duration%1000000)/10000));
+	} else if (duration > 100000) {
+		tmp = duration % 1000;
+		if (tmp >= 500)
+			duration += 1000;
+		printf ("%u us", ((unsigned int) duration / 1000));
+	} else if (duration > 1000) {
+		tmp = duration % 100;
+		if (tmp >= 50)
+			duration += 100;
+		printf ("%u.%01u us", ((unsigned int) duration/1000),
+			((unsigned int) (duration%1000)/100));
+	} else
+		printf ("%lu ns", duration);
+
+	return;
+}
+
+static void debug_output_one(unsigned int cpu)
+{
+	char *driver;
+	struct cpufreq_affected_cpus *cpus;
+	struct cpufreq_available_frequencies *freqs;
+	unsigned long min, max, freq_kernel, freq_hardware;
+	unsigned long total_trans, latency;
+	unsigned long long total_time;
+	struct cpufreq_policy *policy;
+	struct cpufreq_available_governors * governors;
+	struct cpufreq_stats *stats;
+
+	if (cpufreq_cpu_exists(cpu)) {
+		printf(gettext ("couldn't analyze CPU %d as it doesn't seem to be present\n"), cpu);
+		return;
+	}
+
+	printf(gettext ("analyzing CPU %d:\n"), cpu);
+
+	freq_kernel = cpufreq_get_freq_kernel(cpu);
+	freq_hardware = cpufreq_get_freq_hardware(cpu);
+
+	driver = cpufreq_get_driver(cpu);
+	if (!driver) {
+		printf(gettext ("  no or unknown cpufreq driver is active on this CPU\n"));
+	} else {
+		printf(gettext ("  driver: %s\n"), driver);
+		cpufreq_put_driver(driver);
+	}
+
+	cpus = cpufreq_get_related_cpus(cpu);
+	if (cpus) {
+		printf(gettext ("  CPUs which run at the same hardware frequency: "));
+		while (cpus->next) {
+			printf("%d ", cpus->cpu);
+			cpus = cpus->next;
+		}
+		printf("%d\n", cpus->cpu);
+		cpufreq_put_related_cpus(cpus);
+	}
+
+	cpus = cpufreq_get_affected_cpus(cpu);
+	if (cpus) {
+		printf(gettext ("  CPUs which need to have their frequency coordinated by software: "));
+		while (cpus->next) {
+			printf("%d ", cpus->cpu);
+			cpus = cpus->next;
+		}
+		printf("%d\n", cpus->cpu);
+		cpufreq_put_affected_cpus(cpus);
+	}
+
+	latency = cpufreq_get_transition_latency(cpu);
+	if (latency) {
+		printf(gettext ("  maximum transition latency: "));
+		print_duration(latency);
+		printf(".\n");
+	}
+
+	if (!(cpufreq_get_hardware_limits(cpu, &min, &max))) {
+		printf(gettext ("  hardware limits: "));
+		print_speed(min);
+		printf(" - ");
+		print_speed(max);
+		printf("\n");
+	}
+
+	freqs = cpufreq_get_available_frequencies(cpu);
+	if (freqs) {
+		printf(gettext ("  available frequency steps: "));
+		while (freqs->next) {
+			print_speed(freqs->frequency);
+			printf(", ");
+			freqs = freqs->next;
+		}
+		print_speed(freqs->frequency);
+		printf("\n");
+		cpufreq_put_available_frequencies(freqs);
+	}
+
+	governors = cpufreq_get_available_governors(cpu);
+	if (governors) {
+		printf(gettext ("  available cpufreq governors: "));
+		while (governors->next) {
+			printf("%s, ", governors->governor);
+			governors = governors->next;
+		}
+		printf("%s\n", governors->governor);
+		cpufreq_put_available_governors(governors);
+	}
+
+	policy = cpufreq_get_policy(cpu);
+	if (policy) {
+		printf(gettext ("  current policy: frequency should be within "));
+		print_speed(policy->min);
+		printf(gettext (" and "));
+		print_speed(policy->max);
+
+		printf(".\n                  ");
+		printf(gettext ("The governor \"%s\" may"
+		       " decide which speed to use\n                  within this range.\n"),
+		       policy->governor);
+		cpufreq_put_policy(policy);
+	}
+
+	if (freq_kernel || freq_hardware) {
+		printf(gettext ("  current CPU frequency is "));
+		if (freq_hardware) {
+			print_speed(freq_hardware);
+			printf(gettext (" (asserted by call to hardware)"));
+		}
+		else
+			print_speed(freq_kernel);
+		printf(".\n");
+	}
+	stats = cpufreq_get_stats(cpu, &total_time);
+	if (stats) {
+		printf(gettext ("  cpufreq stats: "));
+		while (stats) {
+			print_speed(stats->frequency);
+			printf(":%.2f%%", (100.0 * stats->time_in_state) / total_time);
+			stats = stats->next;
+			if (stats)
+				printf(", ");
+		}
+		cpufreq_put_stats(stats);
+		total_trans = cpufreq_get_transitions(cpu);
+		if (total_trans)
+			printf("  (%lu)\n", total_trans);
+		else
+			printf("\n");
+	}
+}
+
+static void debug_output(unsigned int cpu, unsigned int all) {
+	if (all) {
+		unsigned int nr_cpus = count_cpus();
+		for (cpu=0; cpu < nr_cpus; cpu++) {
+			if (cpufreq_cpu_exists(cpu))
+				continue;
+			debug_output_one(cpu);
+		}
+	} else
+		debug_output_one(cpu);
+}
+
+
+/* --freq / -f */
+
+static int get_freq_kernel(unsigned int cpu, unsigned int human) {
+	unsigned long freq = cpufreq_get_freq_kernel(cpu);
+	if (!freq)
+		return -EINVAL;
+	if (human) {
+		print_speed(freq);
+		printf("\n");
+	} else
+		printf("%lu\n", freq);
+	return 0;
+}
+
+
+/* --hwfreq / -w */
+
+static int get_freq_hardware(unsigned int cpu, unsigned int human) {
+	unsigned long freq = cpufreq_get_freq_hardware(cpu);
+	if (!freq)
+		return -EINVAL;
+	if (human) {
+		print_speed(freq);
+		printf("\n");
+	} else
+		printf("%lu\n", freq);
+	return 0;
+}
+
+/* --hwlimits / -l */
+
+static int get_hardware_limits(unsigned int cpu) {
+	unsigned long min, max;
+	if (cpufreq_get_hardware_limits(cpu, &min, &max))
+		return -EINVAL;
+	printf("%lu %lu\n", min, max);
+	return 0;
+}
+
+/* --driver / -d */
+
+static int get_driver(unsigned int cpu) {
+	char *driver = cpufreq_get_driver(cpu);
+	if (!driver)
+		return -EINVAL;
+	printf("%s\n", driver);
+	cpufreq_put_driver(driver);
+	return 0;
+}
+
+/* --policy / -p */
+
+static int get_policy(unsigned int cpu) {
+	struct cpufreq_policy *policy = cpufreq_get_policy(cpu);
+	if (!policy)
+		return -EINVAL;
+	printf("%lu %lu %s\n", policy->min, policy->max, policy->governor);
+	cpufreq_put_policy(policy);
+	return 0;
+}
+
+/* --governors / -g */
+
+static int get_available_governors(unsigned int cpu) {
+	struct cpufreq_available_governors *governors = cpufreq_get_available_governors(cpu);
+	if (!governors)
+		return -EINVAL;
+
+	while (governors->next) {
+		printf("%s ", governors->governor);
+		governors = governors->next;
+	}
+	printf("%s\n", governors->governor);
+	cpufreq_put_available_governors(governors);
+	return 0;
+}
+
+
+/* --affected-cpus  / -a */
+
+static int get_affected_cpus(unsigned int cpu) {
+	struct cpufreq_affected_cpus *cpus = cpufreq_get_affected_cpus(cpu);
+	if (!cpus)
+		return -EINVAL;
+
+	while (cpus->next) {
+		printf("%d ", cpus->cpu);
+		cpus = cpus->next;
+	}
+	printf("%d\n", cpus->cpu);
+	cpufreq_put_affected_cpus(cpus);
+	return 0;
+}
+
+/* --related-cpus  / -r */
+
+static int get_related_cpus(unsigned int cpu) {
+	struct cpufreq_affected_cpus *cpus = cpufreq_get_related_cpus(cpu);
+	if (!cpus)
+		return -EINVAL;
+
+	while (cpus->next) {
+		printf("%d ", cpus->cpu);
+		cpus = cpus->next;
+	}
+	printf("%d\n", cpus->cpu);
+	cpufreq_put_related_cpus(cpus);
+	return 0;
+}
+
+/* --stats / -s */
+
+static int get_freq_stats(unsigned int cpu, unsigned int human) {
+	unsigned long total_trans = cpufreq_get_transitions(cpu);
+	unsigned long long total_time;
+	struct cpufreq_stats *stats = cpufreq_get_stats(cpu, &total_time);
+	while (stats) {
+		if (human) {
+			print_speed(stats->frequency);
+			printf(":%.2f%%", (100.0 * stats->time_in_state) / total_time);
+		}
+		else
+			printf("%lu:%llu", stats->frequency, stats->time_in_state);
+		stats = stats->next;
+		if (stats)
+			printf(", ");
+	}
+	cpufreq_put_stats(stats);
+	if (total_trans)
+		printf("  (%lu)\n", total_trans);
+	return 0;
+}
+
+/* --latency / -y */
+
+static int get_latency(unsigned int cpu, unsigned int human) {
+	unsigned long latency = cpufreq_get_transition_latency(cpu);
+	if (!latency)
+		return -EINVAL;
+
+	if (human) {
+		print_duration(latency);
+		printf("\n");
+	} else
+		printf("%lu\n", latency);
+	return 0;
+}
+
+static void print_header(void) {
+	printf(PACKAGE " " VERSION ": cpufreq-info (C) Dominik Brodowski 2004-2009\n");
+	printf(gettext ("Report errors and bugs to %s, please.\n"), PACKAGE_BUGREPORT);
+}
+
+static void print_help(void) {
+	printf(gettext ("Usage: cpufreq-info [options]\n"));
+	printf(gettext ("Options:\n"));
+	printf(gettext ("  -c CPU, --cpu CPU    CPU number which information shall be determined about\n"));
+	printf(gettext ("  -e, --debug          Prints out debug information\n"));
+	printf(gettext ("  -f, --freq           Get frequency the CPU currently runs at, according\n"
+	       "                       to the cpufreq core *\n"));
+	printf(gettext ("  -w, --hwfreq         Get frequency the CPU currently runs at, by reading\n"
+	       "                       it from hardware (only available to root) *\n"));
+	printf(gettext ("  -l, --hwlimits       Determine the minimum and maximum CPU frequency allowed *\n"));
+	printf(gettext ("  -d, --driver         Determines the used cpufreq kernel driver *\n"));
+	printf(gettext ("  -p, --policy         Gets the currently used cpufreq policy *\n"));
+	printf(gettext ("  -g, --governors      Determines available cpufreq governors *\n"));
+	printf(gettext ("  -r, --related-cpus   Determines which CPUs run at the same hardware frequency *\n"));
+	printf(gettext ("  -a, --affected-cpus  Determines which CPUs need to have their frequency\n"
+			"                       coordinated by software *\n"));
+	printf(gettext ("  -s, --stats          Shows cpufreq statistics if available\n"));
+	printf(gettext ("  -y, --latency        Determines the maximum latency on CPU frequency changes *\n"));
+	printf(gettext ("  -o, --proc           Prints out information like provided by the /proc/cpufreq\n"
+	       "                       interface in 2.4. and early 2.6. kernels\n"));
+	printf(gettext ("  -m, --human          human-readable output for the -f, -w, -s and -y parameters\n"));
+	printf(gettext ("  -h, --help           Prints out this screen\n"));
+
+	printf("\n");
+	printf(gettext ("If no argument or only the -c, --cpu parameter is given, debug output about\n"
+	       "cpufreq is printed which is useful e.g. for reporting bugs.\n"));
+	printf(gettext ("For the arguments marked with *, omitting the -c or --cpu argument is\n"
+	"equivalent to setting it to zero\n"));
+}
+
+static struct option info_opts[] = {
+	{ .name="cpu",		.has_arg=required_argument,	.flag=NULL,	.val='c'},
+	{ .name="debug",	.has_arg=no_argument,		.flag=NULL,	.val='e'},
+	{ .name="freq",		.has_arg=no_argument,		.flag=NULL,	.val='f'},
+	{ .name="hwfreq",	.has_arg=no_argument,		.flag=NULL,	.val='w'},
+	{ .name="hwlimits",	.has_arg=no_argument,		.flag=NULL,	.val='l'},
+	{ .name="driver",	.has_arg=no_argument,		.flag=NULL,	.val='d'},
+	{ .name="policy",	.has_arg=no_argument,		.flag=NULL,	.val='p'},
+	{ .name="governors",	.has_arg=no_argument,		.flag=NULL,	.val='g'},
+	{ .name="related-cpus", .has_arg=no_argument,		.flag=NULL,	.val='r'},
+	{ .name="affected-cpus",.has_arg=no_argument,		.flag=NULL,	.val='a'},
+	{ .name="stats",	.has_arg=no_argument,		.flag=NULL,	.val='s'},
+	{ .name="latency",	.has_arg=no_argument,		.flag=NULL,	.val='y'},
+	{ .name="proc",		.has_arg=no_argument,		.flag=NULL,	.val='o'},
+	{ .name="human",	.has_arg=no_argument,		.flag=NULL,	.val='m'},
+	{ .name="help",		.has_arg=no_argument,		.flag=NULL,	.val='h'},
+};
+
+int main(int argc, char **argv) {
+	extern char *optarg;
+	extern int optind, opterr, optopt;
+	int ret = 0, cont = 1;
+	unsigned int cpu = 0;
+	unsigned int cpu_defined = 0;
+	unsigned int human = 0;
+	int output_param = 0;
+
+	setlocale(LC_ALL, "");
+	textdomain (PACKAGE);
+
+	do {
+		ret = getopt_long(argc, argv, "c:hoefwldpgrasmy", info_opts, NULL);
+		switch (ret) {
+		case '?':
+			output_param = '?';
+			cont = 0;
+			break;
+		case 'h':
+			output_param = 'h';
+			cont = 0;
+			break;
+		case -1:
+			cont = 0;
+			break;
+		case 'o':
+		case 'a':
+		case 'r':
+		case 'g':
+		case 'p':
+		case 'd':
+		case 'l':
+		case 'w':
+		case 'f':
+		case 'e':
+		case 's':
+		case 'y':
+			if (output_param) {
+				output_param = -1;
+				cont = 0;
+				break;
+			}
+			output_param = ret;
+			break;
+		case 'c':
+			if (cpu_defined) {
+				output_param = -1;
+				cont = 0;
+				break;
+			}
+			if ((sscanf(optarg, "%d ", &cpu)) != 1) {
+				output_param = '?';
+				cont = 0;
+			}
+			cpu_defined = 1;
+			break;
+		case 'm':
+			if (human) {
+				output_param = -1;
+				cont = 0;
+				break;
+			}
+			human = 1;
+			break;
+		}
+	} while(cont);
+
+	switch (output_param) {
+	case 'o':
+		if (cpu_defined) {
+			print_header();
+			printf(gettext ("The argument passed to this tool can't be combined with passing a --cpu argument\n"));
+			return -EINVAL;
+		}
+		break;
+	case 0:
+		output_param = 'e';
+	}
+
+	ret = 0;
+
+	switch (output_param) {
+	case -1:
+		print_header();
+		printf(gettext ("You can't specify more than one --cpu parameter and/or\n"
+		       "more than one output-specific argument\n"));
+		return -EINVAL;
+		break;
+	case '?':
+		print_header();
+		printf(gettext ("invalid or unknown argument\n"));
+		print_help();
+		ret = -EINVAL;
+		break;
+	case 'h':
+		print_header();
+		print_help();
+		break;
+	case 'o':
+		proc_cpufreq_output();
+		break;
+	case 'e':
+		print_header();
+		debug_output(cpu, !(cpu_defined));
+		break;
+	case 'a':
+		ret = get_affected_cpus(cpu);
+		break;
+	case 'r':
+		ret = get_related_cpus(cpu);
+		break;
+	case 'g':
+		ret = get_available_governors(cpu);
+		break;
+	case 'p':
+		ret = get_policy(cpu);
+		break;
+	case 'd':
+		ret = get_driver(cpu);
+		break;
+	case 'l':
+		ret = get_hardware_limits(cpu);
+		break;
+	case 'w':
+		ret = get_freq_hardware(cpu, human);
+		break;
+	case 'f':
+		ret = get_freq_kernel(cpu, human);
+		break;
+	case 's':
+		ret = get_freq_stats(cpu, human);
+		break;
+	case 'y':
+		ret = get_latency(cpu, human);
+		break;
+	}
+	return (ret);
+}
diff --git a/utils/cpufreq-set.c b/utils/cpufreq-set.c
new file mode 100644
index 0000000..2ece47e
--- /dev/null
+++ b/utils/cpufreq-set.c
@@ -0,0 +1,375 @@
+/*
+ *  (C) 2004-2009  Dominik Brodowski <linux@dominikbrodowski.de>
+ *
+ *  Licensed under the terms of the GNU GPL License version 2.
+ */
+
+
+#include <unistd.h>
+#include <stdio.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <limits.h>
+#include <string.h>
+#include <ctype.h>
+#include <libintl.h>
+#include <locale.h>
+
+#include <getopt.h>
+
+#include "cpufreq.h"
+
+#define _(String) gettext(String)
+#define gettext_noop(String) String
+#define N_(String) gettext_noop(String)
+
+#define NORM_FREQ_LEN 32
+
+static void print_header(void)
+{
+        printf(PACKAGE " " VERSION ": cpufreq-set (C) Dominik Brodowski 2004-2009\n");
+	printf(gettext("Report errors and bugs to %s, please.\n"), PACKAGE_BUGREPORT);
+}
+
+static void print_help(void)
+{
+	printf(gettext("Usage: cpufreq-set [options]\n"));
+	printf(gettext("Options:\n"));
+	printf(gettext("  -c CPU, --cpu CPU        number of CPU where cpufreq settings shall be modified\n"));
+	printf(gettext("  -d FREQ, --min FREQ      new minimum CPU frequency the governor may select\n"));
+	printf(gettext("  -u FREQ, --max FREQ      new maximum CPU frequency the governor may select\n"));
+	printf(gettext("  -g GOV, --governor GOV   new cpufreq governor\n"));
+	printf(gettext("  -f FREQ, --freq FREQ     specific frequency to be set. Requires userspace\n"
+	       "                           governor to be available and loaded\n"));
+	printf(gettext("  -r, --related            Switches all hardware-related CPUs\n"));
+	printf(gettext("  -h, --help               Prints out this screen\n"));
+	printf("\n");
+	printf(gettext("Notes:\n"
+	       "1. Omitting the -c or --cpu argument is equivalent to setting it to zero\n"
+	       "2. The -f FREQ, --freq FREQ parameter cannot be combined with any other parameter\n"
+	       "   except the -c CPU, --cpu CPU parameter\n"
+	       "3. FREQuencies can be passed in Hz, kHz (default), MHz, GHz, or THz\n"
+	       "   by postfixing the value with the wanted unit name, without any space\n"
+	       "   (FREQuency in kHz =^ Hz * 0.001 =^ MHz * 1000 =^ GHz * 1000000).\n"));
+
+}
+
+static struct option set_opts[] = {
+	{ .name="cpu",		.has_arg=required_argument,	.flag=NULL,	.val='c'},
+	{ .name="min",		.has_arg=required_argument,	.flag=NULL,	.val='d'},
+	{ .name="max",		.has_arg=required_argument,	.flag=NULL,	.val='u'},
+	{ .name="governor",	.has_arg=required_argument,	.flag=NULL,	.val='g'},
+	{ .name="freq",		.has_arg=required_argument,	.flag=NULL,	.val='f'},
+	{ .name="help",		.has_arg=no_argument,		.flag=NULL,	.val='h'},
+	{ .name="related",	.has_arg=no_argument,		.flag=NULL,	.val='r'},
+};
+
+static void print_error(void)
+{
+	printf(gettext("Error setting new values. Common errors:\n"
+			"- Do you have proper administration rights? (super-user?)\n"
+			"- Is the governor you requested available and modprobed?\n"
+			"- Trying to set an invalid policy?\n"
+			"- Trying to set a specific frequency, but userspace governor is not available,\n"
+			"   for example because of hardware which cannot be set to a specific frequency\n"
+			"   or because the userspace governor isn't loaded?\n"));
+};
+
+struct freq_units {
+	char*		str_unit;
+	int		power_of_ten;
+};
+
+const struct freq_units def_units[] = {
+	{"hz", -3},
+	{"khz", 0}, /* default */
+	{"mhz", 3},
+	{"ghz", 6},
+	{"thz", 9},
+	{NULL, 0}
+};
+
+static void print_unknown_arg(void)
+{
+	print_header();
+	printf(gettext("invalid or unknown argument\n"));
+	print_help();
+}
+
+static unsigned long string_to_frequency(const char *str)
+{
+	char normalized[NORM_FREQ_LEN];
+	const struct freq_units *unit;
+	const char *scan;
+	char *end;
+	unsigned long freq;
+	int power = 0, match_count = 0, i, cp, pad;
+
+	while (*str == '0')
+		str++;
+
+	for (scan = str; isdigit(*scan) || *scan == '.'; scan++) {
+		if (*scan == '.' && match_count == 0)
+			match_count = 1;
+		else if (*scan == '.' && match_count == 1)
+			return 0;
+	}
+
+	if (*scan) {
+		match_count = 0;
+		for (unit = def_units; unit->str_unit; unit++) {
+			for (i = 0;
+			     scan[i] && tolower(scan[i]) == unit->str_unit[i];
+			     ++i)
+				continue;
+			if (scan[i])
+				continue;
+			match_count++;
+			power = unit->power_of_ten;
+		}
+		if (match_count != 1)
+			return 0;
+	}
+
+	/* count the number of digits to be copied */
+	for (cp = 0; isdigit(str[cp]); cp++)
+		continue;
+
+	if (str[cp] == '.') {
+		while (power > -1 && isdigit(str[cp+1]))
+			cp++, power--;
+	}
+	if (power >= -1)	/* not enough => pad */
+		pad = power + 1;
+	else			/* to much => strip */
+		pad = 0, cp += power + 1;
+	/* check bounds */
+	if (cp <= 0 || cp + pad > NORM_FREQ_LEN - 1)
+		return 0;
+
+	/* copy digits */
+	for (i = 0; i < cp; i++, str++) {
+		if (*str == '.')
+			str++;
+		normalized[i] = *str;
+	}
+	/* and pad */
+	for (; i < cp + pad; i++)
+		normalized[i] = '0';
+
+	/* round up, down ? */
+	match_count = (normalized[i-1] >= '5');
+	/* and drop the decimal part */
+	normalized[i-1] = 0; /* cp > 0 && pad >= 0 ==> i > 0 */
+
+	/* final conversion (and applying rounding) */
+	errno = 0;
+	freq = strtoul(normalized, &end, 10);
+	if (errno)
+		return 0;
+	else {
+		if (match_count && freq != ULONG_MAX)
+			freq++;
+		return freq;
+	}
+}
+
+static int do_new_policy(unsigned int cpu, struct cpufreq_policy *new_pol)
+{
+	struct cpufreq_policy *cur_pol = cpufreq_get_policy(cpu);
+	int ret;
+
+	if (!cur_pol) {
+		printf(gettext("wrong, unknown or unhandled CPU?\n"));
+		return -EINVAL;
+	}
+
+	if (!new_pol->min)
+		new_pol->min = cur_pol->min;
+
+	if (!new_pol->max)
+		new_pol->max = cur_pol->max;
+
+	if (!new_pol->governor)
+		new_pol->governor = cur_pol->governor;
+
+	ret = cpufreq_set_policy(cpu, new_pol);
+
+	cpufreq_put_policy(cur_pol);
+
+	return ret;
+}
+
+	
+static int do_one_cpu(unsigned int cpu, struct cpufreq_policy *new_pol,
+		unsigned long freq, unsigned int pc)
+{
+	switch (pc) {
+	case 0:
+		return cpufreq_set_frequency(cpu, freq);
+
+	case 1:
+		/* if only one value of a policy is to be changed, we can
+		 * use a "fast path".
+		 */
+		if (new_pol->min)
+			return cpufreq_modify_policy_min(cpu, new_pol->min);
+		else if (new_pol->max)
+			return cpufreq_modify_policy_max(cpu, new_pol->max);
+		else if (new_pol->governor)
+			return cpufreq_modify_policy_governor(cpu, new_pol->governor);
+
+	default:
+		/* slow path */
+		return do_new_policy(cpu, new_pol);
+	}
+}
+
+
+int main(int argc, char **argv)
+{
+	extern char *optarg;
+	extern int optind, opterr, optopt;
+	int ret = 0, cont = 1;
+	unsigned long freq = 0;
+	char gov[20];
+	int double_parm = 0;
+	int related = 0;
+	int policychange = 0;
+	struct cpufreq_policy new_pol = {
+		.min = 0,
+		.max = 0,
+		.governor = NULL,
+	};
+	struct cpufreq_affected_cpus single_cpu = {
+		.cpu = 0,
+		.next = NULL,
+		.first = &single_cpu,
+	};
+	struct cpufreq_affected_cpus *cpus = NULL;
+
+	setlocale(LC_ALL, "");
+	textdomain (PACKAGE);
+
+	/* parameter parsing */
+	do {
+		ret = getopt_long(argc, argv, "c:d:u:g:f:hr", set_opts, NULL);
+		switch (ret) {
+		case '?':
+			print_unknown_arg();
+			return -EINVAL;
+		case 'h':
+			print_header();
+			print_help();
+			return 0;
+		case -1:
+			cont = 0;
+			break;
+		case 'r':
+			if (related)
+				double_parm++;
+			related++;
+			break;
+		case 'c':
+			if (cpus)
+				double_parm++;
+			cpus = &single_cpu;
+			if ((sscanf(optarg, "%d ", &single_cpu.cpu)) != 1) {
+				print_unknown_arg();
+				return -EINVAL;
+                        }
+			break;
+		case 'd':
+			if (new_pol.min)
+				double_parm++;
+			policychange++;
+			new_pol.min = string_to_frequency(optarg);
+			if (new_pol.min == 0) {
+				print_unknown_arg();
+				return -EINVAL;
+			}
+			break;
+		case 'u':
+			if (new_pol.max)
+				double_parm++;
+			policychange++;
+			new_pol.max = string_to_frequency(optarg);
+			if (new_pol.max == 0) {
+				print_unknown_arg();
+				return -EINVAL;
+			}
+			break;
+		case 'f':
+			if (freq)
+				double_parm++;
+			freq = string_to_frequency(optarg);
+			if (freq == 0) {
+				print_unknown_arg();
+				return -EINVAL;
+			}
+			break;
+		case 'g':
+			if (new_pol.governor)
+				double_parm++;
+			policychange++;
+			if ((strlen(optarg) < 3) || (strlen(optarg) > 18)) {
+				print_unknown_arg();
+				return -EINVAL;
+                        }
+			if ((sscanf(optarg, "%s", gov)) != 1) {
+				print_unknown_arg();
+				return -EINVAL;
+                        }
+			new_pol.governor = gov;
+			break;
+		}
+	} while(cont);
+
+	/* parameter checking */
+	if (double_parm) {
+		print_header();
+		printf("the same parameter was passed more than once\n");
+		return -EINVAL;
+	}
+
+	if (freq && policychange) {
+		printf(gettext("the -f/--freq parameter cannot be combined with -d/--min, -u/--max or\n"
+				"-g/--governor parameters\n"));
+		return -EINVAL;
+	}
+
+	if (!freq && !policychange) {
+		printf(gettext("At least one parameter out of -f/--freq, -d/--min, -u/--max, and\n"
+				"-g/--governor must be passed\n"));
+		return -EINVAL;
+	}
+
+
+	/* which CPUs shall we modify? */
+	if (!cpus)
+		cpus = &single_cpu;
+
+	if (related)
+		cpus = cpufreq_get_related_cpus(cpus->cpu);
+
+	/* loop over CPUs */
+	while (1) {
+		ret = do_one_cpu(cpus->cpu, &new_pol, freq, policychange);
+		if (ret)
+			break;
+
+		if (!cpus->next)
+			break;
+
+		cpus = cpus->next;
+	}
+
+	/* cleanup */
+	if (cpus->first != &single_cpu)
+		cpufreq_put_related_cpus(cpus->first);
+
+	if (ret)
+		print_error();
+
+	return ret;
+}
diff --git a/utils/info.c b/utils/info.c
deleted file mode 100644
index 38d906a..0000000
--- a/utils/info.c
+++ /dev/null
@@ -1,629 +0,0 @@
-/*
- *  (C) 2004-2009  Dominik Brodowski <linux@dominikbrodowski.de>
- *
- *  Licensed under the terms of the GNU GPL License version 2.
- */
-
-
-#include <unistd.h>
-#include <stdio.h>
-#include <errno.h>
-#include <stdlib.h>
-#include <string.h>
-#include <libintl.h>
-#include <locale.h>
-
-#include <getopt.h>
-
-#include "cpufreq.h"
-
-
-#define _(String) gettext (String)
-#define gettext_noop(String) String
-#define N_(String) gettext_noop (String)
-
-#define LINE_LEN 10
-
-static unsigned int count_cpus(void)
-{
-	FILE *fp;
-	char value[LINE_LEN];
-	unsigned int ret = 0;
-	unsigned int cpunr = 0;
-
-	fp = fopen("/proc/stat", "r");
-	if(!fp) {
-		printf(gettext("Couldn't count the number of CPUs (%s: %s), assuming 1\n"), "/proc/stat", strerror(errno));
-		return 1;
-	}
-
-	while (!feof(fp)) {
-		if (!fgets(value, LINE_LEN, fp))
-			continue;
-		value[LINE_LEN - 1] = '\0';
-		if (strlen(value) < (LINE_LEN - 2))
-			continue;
-		if (strstr(value, "cpu "))
-			continue;
-		if (sscanf(value, "cpu%d ", &cpunr) != 1)
-			continue;
-		if (cpunr > ret)
-			ret = cpunr;
-	}
-	fclose(fp);
-
-	/* cpu count starts from 0, on error return 1 (UP) */
-	return (ret+1);
-}
-
-
-static void proc_cpufreq_output(void)
-{
-	unsigned int cpu, nr_cpus;
-	struct cpufreq_policy *policy;
-	unsigned int min_pctg = 0;
-	unsigned int max_pctg = 0;
-	unsigned long min, max;
-
-	printf(gettext("          minimum CPU frequency  -  maximum CPU frequency  -  governor\n"));
-
-	nr_cpus = count_cpus();
-	for (cpu=0; cpu < nr_cpus; cpu++) {
-		policy = cpufreq_get_policy(cpu);
-		if (!policy)
-			continue;
-
-		if (cpufreq_get_hardware_limits(cpu, &min, &max)) {
-			max = 0;
-		} else {
-			min_pctg = (policy->min * 100) / max;
-			max_pctg = (policy->max * 100) / max;
-		}
-		printf("CPU%3d    %9lu kHz (%3d %%)  -  %9lu kHz (%3d %%)  -  %s\n",
-		       cpu , policy->min, max ? min_pctg : 0, policy->max, max ? max_pctg : 0, policy->governor);
-
-		cpufreq_put_policy(policy);
-	}
-}
-
-static void print_speed(unsigned long speed)
-{
-	unsigned long tmp;
-
-	if (speed > 1000000) {
-		tmp = speed % 10000;
-		if (tmp >= 5000)
-			speed += 10000;
-		printf ("%u.%02u GHz", ((unsigned int) speed/1000000),
-			((unsigned int) (speed%1000000)/10000));
-	} else if (speed > 100000) {
-		tmp = speed % 1000;
-		if (tmp >= 500)
-			speed += 1000;
-		printf ("%u MHz", ((unsigned int) speed / 1000));
-	} else if (speed > 1000) {
-		tmp = speed % 100;
-		if (tmp >= 50)
-			speed += 100;
-		printf ("%u.%01u MHz", ((unsigned int) speed/1000),
-			((unsigned int) (speed%1000)/100));
-	} else
-		printf ("%lu kHz", speed);
-
-	return;
-}
-
-static void print_duration(unsigned long duration)
-{
-	unsigned long tmp;
-
-	if (duration > 1000000) {
-		tmp = duration % 10000;
-		if (tmp >= 5000)
-			duration += 10000;
-		printf ("%u.%02u ms", ((unsigned int) duration/1000000),
-			((unsigned int) (duration%1000000)/10000));
-	} else if (duration > 100000) {
-		tmp = duration % 1000;
-		if (tmp >= 500)
-			duration += 1000;
-		printf ("%u us", ((unsigned int) duration / 1000));
-	} else if (duration > 1000) {
-		tmp = duration % 100;
-		if (tmp >= 50)
-			duration += 100;
-		printf ("%u.%01u us", ((unsigned int) duration/1000),
-			((unsigned int) (duration%1000)/100));
-	} else
-		printf ("%lu ns", duration);
-
-	return;
-}
-
-static void debug_output_one(unsigned int cpu)
-{
-	char *driver;
-	struct cpufreq_affected_cpus *cpus;
-	struct cpufreq_available_frequencies *freqs;
-	unsigned long min, max, freq_kernel, freq_hardware;
-	unsigned long total_trans, latency;
-	unsigned long long total_time;
-	struct cpufreq_policy *policy;
-	struct cpufreq_available_governors * governors;
-	struct cpufreq_stats *stats;
-
-	if (cpufreq_cpu_exists(cpu)) {
-		printf(gettext ("couldn't analyze CPU %d as it doesn't seem to be present\n"), cpu);
-		return;
-	}
-
-	printf(gettext ("analyzing CPU %d:\n"), cpu);
-
-	freq_kernel = cpufreq_get_freq_kernel(cpu);
-	freq_hardware = cpufreq_get_freq_hardware(cpu);
-
-	driver = cpufreq_get_driver(cpu);
-	if (!driver) {
-		printf(gettext ("  no or unknown cpufreq driver is active on this CPU\n"));
-	} else {
-		printf(gettext ("  driver: %s\n"), driver);
-		cpufreq_put_driver(driver);
-	}
-
-	cpus = cpufreq_get_related_cpus(cpu);
-	if (cpus) {
-		printf(gettext ("  CPUs which run at the same hardware frequency: "));
-		while (cpus->next) {
-			printf("%d ", cpus->cpu);
-			cpus = cpus->next;
-		}
-		printf("%d\n", cpus->cpu);
-		cpufreq_put_related_cpus(cpus);
-	}
-
-	cpus = cpufreq_get_affected_cpus(cpu);
-	if (cpus) {
-		printf(gettext ("  CPUs which need to have their frequency coordinated by software: "));
-		while (cpus->next) {
-			printf("%d ", cpus->cpu);
-			cpus = cpus->next;
-		}
-		printf("%d\n", cpus->cpu);
-		cpufreq_put_affected_cpus(cpus);
-	}
-
-	latency = cpufreq_get_transition_latency(cpu);
-	if (latency) {
-		printf(gettext ("  maximum transition latency: "));
-		print_duration(latency);
-		printf(".\n");
-	}
-
-	if (!(cpufreq_get_hardware_limits(cpu, &min, &max))) {
-		printf(gettext ("  hardware limits: "));
-		print_speed(min);
-		printf(" - ");
-		print_speed(max);
-		printf("\n");
-	}
-
-	freqs = cpufreq_get_available_frequencies(cpu);
-	if (freqs) {
-		printf(gettext ("  available frequency steps: "));
-		while (freqs->next) {
-			print_speed(freqs->frequency);
-			printf(", ");
-			freqs = freqs->next;
-		}
-		print_speed(freqs->frequency);
-		printf("\n");
-		cpufreq_put_available_frequencies(freqs);
-	}
-
-	governors = cpufreq_get_available_governors(cpu);
-	if (governors) {
-		printf(gettext ("  available cpufreq governors: "));
-		while (governors->next) {
-			printf("%s, ", governors->governor);
-			governors = governors->next;
-		}
-		printf("%s\n", governors->governor);
-		cpufreq_put_available_governors(governors);
-	}
-
-	policy = cpufreq_get_policy(cpu);
-	if (policy) {
-		printf(gettext ("  current policy: frequency should be within "));
-		print_speed(policy->min);
-		printf(gettext (" and "));
-		print_speed(policy->max);
-
-		printf(".\n                  ");
-		printf(gettext ("The governor \"%s\" may"
-		       " decide which speed to use\n                  within this range.\n"),
-		       policy->governor);
-		cpufreq_put_policy(policy);
-	}
-
-	if (freq_kernel || freq_hardware) {
-		printf(gettext ("  current CPU frequency is "));
-		if (freq_hardware) {
-			print_speed(freq_hardware);
-			printf(gettext (" (asserted by call to hardware)"));
-		}
-		else
-			print_speed(freq_kernel);
-		printf(".\n");
-	}
-	stats = cpufreq_get_stats(cpu, &total_time);
-	if (stats) {
-		printf(gettext ("  cpufreq stats: "));
-		while (stats) {
-			print_speed(stats->frequency);
-			printf(":%.2f%%", (100.0 * stats->time_in_state) / total_time);
-			stats = stats->next;
-			if (stats)
-				printf(", ");
-		}
-		cpufreq_put_stats(stats);
-		total_trans = cpufreq_get_transitions(cpu);
-		if (total_trans)
-			printf("  (%lu)\n", total_trans);
-		else
-			printf("\n");
-	}
-}
-
-static void debug_output(unsigned int cpu, unsigned int all) {
-	if (all) {
-		unsigned int nr_cpus = count_cpus();
-		for (cpu=0; cpu < nr_cpus; cpu++) {
-			if (cpufreq_cpu_exists(cpu))
-				continue;
-			debug_output_one(cpu);
-		}
-	} else
-		debug_output_one(cpu);
-}
-
-
-/* --freq / -f */
-
-static int get_freq_kernel(unsigned int cpu, unsigned int human) {
-	unsigned long freq = cpufreq_get_freq_kernel(cpu);
-	if (!freq)
-		return -EINVAL;
-	if (human) {
-		print_speed(freq);
-		printf("\n");
-	} else
-		printf("%lu\n", freq);
-	return 0;
-}
-
-
-/* --hwfreq / -w */
-
-static int get_freq_hardware(unsigned int cpu, unsigned int human) {
-	unsigned long freq = cpufreq_get_freq_hardware(cpu);
-	if (!freq)
-		return -EINVAL;
-	if (human) {
-		print_speed(freq);
-		printf("\n");
-	} else
-		printf("%lu\n", freq);
-	return 0;
-}
-
-/* --hwlimits / -l */
-
-static int get_hardware_limits(unsigned int cpu) {
-	unsigned long min, max;
-	if (cpufreq_get_hardware_limits(cpu, &min, &max))
-		return -EINVAL;
-	printf("%lu %lu\n", min, max);
-	return 0;
-}
-
-/* --driver / -d */
-
-static int get_driver(unsigned int cpu) {
-	char *driver = cpufreq_get_driver(cpu);
-	if (!driver)
-		return -EINVAL;
-	printf("%s\n", driver);
-	cpufreq_put_driver(driver);
-	return 0;
-}
-
-/* --policy / -p */
-
-static int get_policy(unsigned int cpu) {
-	struct cpufreq_policy *policy = cpufreq_get_policy(cpu);
-	if (!policy)
-		return -EINVAL;
-	printf("%lu %lu %s\n", policy->min, policy->max, policy->governor);
-	cpufreq_put_policy(policy);
-	return 0;
-}
-
-/* --governors / -g */
-
-static int get_available_governors(unsigned int cpu) {
-	struct cpufreq_available_governors *governors = cpufreq_get_available_governors(cpu);
-	if (!governors)
-		return -EINVAL;
-
-	while (governors->next) {
-		printf("%s ", governors->governor);
-		governors = governors->next;
-	}
-	printf("%s\n", governors->governor);
-	cpufreq_put_available_governors(governors);
-	return 0;
-}
-
-
-/* --affected-cpus  / -a */
-
-static int get_affected_cpus(unsigned int cpu) {
-	struct cpufreq_affected_cpus *cpus = cpufreq_get_affected_cpus(cpu);
-	if (!cpus)
-		return -EINVAL;
-
-	while (cpus->next) {
-		printf("%d ", cpus->cpu);
-		cpus = cpus->next;
-	}
-	printf("%d\n", cpus->cpu);
-	cpufreq_put_affected_cpus(cpus);
-	return 0;
-}
-
-/* --related-cpus  / -r */
-
-static int get_related_cpus(unsigned int cpu) {
-	struct cpufreq_affected_cpus *cpus = cpufreq_get_related_cpus(cpu);
-	if (!cpus)
-		return -EINVAL;
-
-	while (cpus->next) {
-		printf("%d ", cpus->cpu);
-		cpus = cpus->next;
-	}
-	printf("%d\n", cpus->cpu);
-	cpufreq_put_related_cpus(cpus);
-	return 0;
-}
-
-/* --stats / -s */
-
-static int get_freq_stats(unsigned int cpu, unsigned int human) {
-	unsigned long total_trans = cpufreq_get_transitions(cpu);
-	unsigned long long total_time;
-	struct cpufreq_stats *stats = cpufreq_get_stats(cpu, &total_time);
-	while (stats) {
-		if (human) {
-			print_speed(stats->frequency);
-			printf(":%.2f%%", (100.0 * stats->time_in_state) / total_time);
-		}
-		else
-			printf("%lu:%llu", stats->frequency, stats->time_in_state);
-		stats = stats->next;
-		if (stats)
-			printf(", ");
-	}
-	cpufreq_put_stats(stats);
-	if (total_trans)
-		printf("  (%lu)\n", total_trans);
-	return 0;
-}
-
-/* --latency / -y */
-
-static int get_latency(unsigned int cpu, unsigned int human) {
-	unsigned long latency = cpufreq_get_transition_latency(cpu);
-	if (!latency)
-		return -EINVAL;
-
-	if (human) {
-		print_duration(latency);
-		printf("\n");
-	} else
-		printf("%lu\n", latency);
-	return 0;
-}
-
-static void print_header(void) {
-	printf(PACKAGE " " VERSION ": cpufreq-info (C) Dominik Brodowski 2004-2009\n");
-	printf(gettext ("Report errors and bugs to %s, please.\n"), PACKAGE_BUGREPORT);
-}
-
-static void print_help(void) {
-	printf(gettext ("Usage: cpufreq-info [options]\n"));
-	printf(gettext ("Options:\n"));
-	printf(gettext ("  -c CPU, --cpu CPU    CPU number which information shall be determined about\n"));
-	printf(gettext ("  -e, --debug          Prints out debug information\n"));
-	printf(gettext ("  -f, --freq           Get frequency the CPU currently runs at, according\n"
-	       "                       to the cpufreq core *\n"));
-	printf(gettext ("  -w, --hwfreq         Get frequency the CPU currently runs at, by reading\n"
-	       "                       it from hardware (only available to root) *\n"));
-	printf(gettext ("  -l, --hwlimits       Determine the minimum and maximum CPU frequency allowed *\n"));
-	printf(gettext ("  -d, --driver         Determines the used cpufreq kernel driver *\n"));
-	printf(gettext ("  -p, --policy         Gets the currently used cpufreq policy *\n"));
-	printf(gettext ("  -g, --governors      Determines available cpufreq governors *\n"));
-	printf(gettext ("  -r, --related-cpus   Determines which CPUs run at the same hardware frequency *\n"));
-	printf(gettext ("  -a, --affected-cpus  Determines which CPUs need to have their frequency\n"
-			"                       coordinated by software *\n"));
-	printf(gettext ("  -s, --stats          Shows cpufreq statistics if available\n"));
-	printf(gettext ("  -y, --latency        Determines the maximum latency on CPU frequency changes *\n"));
-	printf(gettext ("  -o, --proc           Prints out information like provided by the /proc/cpufreq\n"
-	       "                       interface in 2.4. and early 2.6. kernels\n"));
-	printf(gettext ("  -m, --human          human-readable output for the -f, -w, -s and -y parameters\n"));
-	printf(gettext ("  -h, --help           Prints out this screen\n"));
-
-	printf("\n");
-	printf(gettext ("If no argument or only the -c, --cpu parameter is given, debug output about\n"
-	       "cpufreq is printed which is useful e.g. for reporting bugs.\n"));
-	printf(gettext ("For the arguments marked with *, omitting the -c or --cpu argument is\n"
-	"equivalent to setting it to zero\n"));
-}
-
-static struct option info_opts[] = {
-	{ .name="cpu",		.has_arg=required_argument,	.flag=NULL,	.val='c'},
-	{ .name="debug",	.has_arg=no_argument,		.flag=NULL,	.val='e'},
-	{ .name="freq",		.has_arg=no_argument,		.flag=NULL,	.val='f'},
-	{ .name="hwfreq",	.has_arg=no_argument,		.flag=NULL,	.val='w'},
-	{ .name="hwlimits",	.has_arg=no_argument,		.flag=NULL,	.val='l'},
-	{ .name="driver",	.has_arg=no_argument,		.flag=NULL,	.val='d'},
-	{ .name="policy",	.has_arg=no_argument,		.flag=NULL,	.val='p'},
-	{ .name="governors",	.has_arg=no_argument,		.flag=NULL,	.val='g'},
-	{ .name="related-cpus", .has_arg=no_argument,		.flag=NULL,	.val='r'},
-	{ .name="affected-cpus",.has_arg=no_argument,		.flag=NULL,	.val='a'},
-	{ .name="stats",	.has_arg=no_argument,		.flag=NULL,	.val='s'},
-	{ .name="latency",	.has_arg=no_argument,		.flag=NULL,	.val='y'},
-	{ .name="proc",		.has_arg=no_argument,		.flag=NULL,	.val='o'},
-	{ .name="human",	.has_arg=no_argument,		.flag=NULL,	.val='m'},
-	{ .name="help",		.has_arg=no_argument,		.flag=NULL,	.val='h'},
-};
-
-int main(int argc, char **argv) {
-	extern char *optarg;
-	extern int optind, opterr, optopt;
-	int ret = 0, cont = 1;
-	unsigned int cpu = 0;
-	unsigned int cpu_defined = 0;
-	unsigned int human = 0;
-	int output_param = 0;
-
-	setlocale(LC_ALL, "");
-	textdomain (PACKAGE);
-
-	do {
-		ret = getopt_long(argc, argv, "c:hoefwldpgrasmy", info_opts, NULL);
-		switch (ret) {
-		case '?':
-			output_param = '?';
-			cont = 0;
-			break;
-		case 'h':
-			output_param = 'h';
-			cont = 0;
-			break;
-		case -1:
-			cont = 0;
-			break;
-		case 'o':
-		case 'a':
-		case 'r':
-		case 'g':
-		case 'p':
-		case 'd':
-		case 'l':
-		case 'w':
-		case 'f':
-		case 'e':
-		case 's':
-		case 'y':
-			if (output_param) {
-				output_param = -1;
-				cont = 0;
-				break;
-			}
-			output_param = ret;
-			break;
-		case 'c':
-			if (cpu_defined) {
-				output_param = -1;
-				cont = 0;
-				break;
-			}
-			if ((sscanf(optarg, "%d ", &cpu)) != 1) {
-				output_param = '?';
-				cont = 0;
-			}
-			cpu_defined = 1;
-			break;
-		case 'm':
-			if (human) {
-				output_param = -1;
-				cont = 0;
-				break;
-			}
-			human = 1;
-			break;
-		}
-	} while(cont);
-
-	switch (output_param) {
-	case 'o':
-		if (cpu_defined) {
-			print_header();
-			printf(gettext ("The argument passed to this tool can't be combined with passing a --cpu argument\n"));
-			return -EINVAL;
-		}
-		break;
-	case 0:
-		output_param = 'e';
-	}
-
-	ret = 0;
-
-	switch (output_param) {
-	case -1:
-		print_header();
-		printf(gettext ("You can't specify more than one --cpu parameter and/or\n"
-		       "more than one output-specific argument\n"));
-		return -EINVAL;
-		break;
-	case '?':
-		print_header();
-		printf(gettext ("invalid or unknown argument\n"));
-		print_help();
-		ret = -EINVAL;
-		break;
-	case 'h':
-		print_header();
-		print_help();
-		break;
-	case 'o':
-		proc_cpufreq_output();
-		break;
-	case 'e':
-		print_header();
-		debug_output(cpu, !(cpu_defined));
-		break;
-	case 'a':
-		ret = get_affected_cpus(cpu);
-		break;
-	case 'r':
-		ret = get_related_cpus(cpu);
-		break;
-	case 'g':
-		ret = get_available_governors(cpu);
-		break;
-	case 'p':
-		ret = get_policy(cpu);
-		break;
-	case 'd':
-		ret = get_driver(cpu);
-		break;
-	case 'l':
-		ret = get_hardware_limits(cpu);
-		break;
-	case 'w':
-		ret = get_freq_hardware(cpu, human);
-		break;
-	case 'f':
-		ret = get_freq_kernel(cpu, human);
-		break;
-	case 's':
-		ret = get_freq_stats(cpu, human);
-		break;
-	case 'y':
-		ret = get_latency(cpu, human);
-		break;
-	}
-	return (ret);
-}
diff --git a/utils/set.c b/utils/set.c
deleted file mode 100644
index 2ece47e..0000000
--- a/utils/set.c
+++ /dev/null
@@ -1,375 +0,0 @@
-/*
- *  (C) 2004-2009  Dominik Brodowski <linux@dominikbrodowski.de>
- *
- *  Licensed under the terms of the GNU GPL License version 2.
- */
-
-
-#include <unistd.h>
-#include <stdio.h>
-#include <errno.h>
-#include <stdlib.h>
-#include <limits.h>
-#include <string.h>
-#include <ctype.h>
-#include <libintl.h>
-#include <locale.h>
-
-#include <getopt.h>
-
-#include "cpufreq.h"
-
-#define _(String) gettext(String)
-#define gettext_noop(String) String
-#define N_(String) gettext_noop(String)
-
-#define NORM_FREQ_LEN 32
-
-static void print_header(void)
-{
-        printf(PACKAGE " " VERSION ": cpufreq-set (C) Dominik Brodowski 2004-2009\n");
-	printf(gettext("Report errors and bugs to %s, please.\n"), PACKAGE_BUGREPORT);
-}
-
-static void print_help(void)
-{
-	printf(gettext("Usage: cpufreq-set [options]\n"));
-	printf(gettext("Options:\n"));
-	printf(gettext("  -c CPU, --cpu CPU        number of CPU where cpufreq settings shall be modified\n"));
-	printf(gettext("  -d FREQ, --min FREQ      new minimum CPU frequency the governor may select\n"));
-	printf(gettext("  -u FREQ, --max FREQ      new maximum CPU frequency the governor may select\n"));
-	printf(gettext("  -g GOV, --governor GOV   new cpufreq governor\n"));
-	printf(gettext("  -f FREQ, --freq FREQ     specific frequency to be set. Requires userspace\n"
-	       "                           governor to be available and loaded\n"));
-	printf(gettext("  -r, --related            Switches all hardware-related CPUs\n"));
-	printf(gettext("  -h, --help               Prints out this screen\n"));
-	printf("\n");
-	printf(gettext("Notes:\n"
-	       "1. Omitting the -c or --cpu argument is equivalent to setting it to zero\n"
-	       "2. The -f FREQ, --freq FREQ parameter cannot be combined with any other parameter\n"
-	       "   except the -c CPU, --cpu CPU parameter\n"
-	       "3. FREQuencies can be passed in Hz, kHz (default), MHz, GHz, or THz\n"
-	       "   by postfixing the value with the wanted unit name, without any space\n"
-	       "   (FREQuency in kHz =^ Hz * 0.001 =^ MHz * 1000 =^ GHz * 1000000).\n"));
-
-}
-
-static struct option set_opts[] = {
-	{ .name="cpu",		.has_arg=required_argument,	.flag=NULL,	.val='c'},
-	{ .name="min",		.has_arg=required_argument,	.flag=NULL,	.val='d'},
-	{ .name="max",		.has_arg=required_argument,	.flag=NULL,	.val='u'},
-	{ .name="governor",	.has_arg=required_argument,	.flag=NULL,	.val='g'},
-	{ .name="freq",		.has_arg=required_argument,	.flag=NULL,	.val='f'},
-	{ .name="help",		.has_arg=no_argument,		.flag=NULL,	.val='h'},
-	{ .name="related",	.has_arg=no_argument,		.flag=NULL,	.val='r'},
-};
-
-static void print_error(void)
-{
-	printf(gettext("Error setting new values. Common errors:\n"
-			"- Do you have proper administration rights? (super-user?)\n"
-			"- Is the governor you requested available and modprobed?\n"
-			"- Trying to set an invalid policy?\n"
-			"- Trying to set a specific frequency, but userspace governor is not available,\n"
-			"   for example because of hardware which cannot be set to a specific frequency\n"
-			"   or because the userspace governor isn't loaded?\n"));
-};
-
-struct freq_units {
-	char*		str_unit;
-	int		power_of_ten;
-};
-
-const struct freq_units def_units[] = {
-	{"hz", -3},
-	{"khz", 0}, /* default */
-	{"mhz", 3},
-	{"ghz", 6},
-	{"thz", 9},
-	{NULL, 0}
-};
-
-static void print_unknown_arg(void)
-{
-	print_header();
-	printf(gettext("invalid or unknown argument\n"));
-	print_help();
-}
-
-static unsigned long string_to_frequency(const char *str)
-{
-	char normalized[NORM_FREQ_LEN];
-	const struct freq_units *unit;
-	const char *scan;
-	char *end;
-	unsigned long freq;
-	int power = 0, match_count = 0, i, cp, pad;
-
-	while (*str == '0')
-		str++;
-
-	for (scan = str; isdigit(*scan) || *scan == '.'; scan++) {
-		if (*scan == '.' && match_count == 0)
-			match_count = 1;
-		else if (*scan == '.' && match_count == 1)
-			return 0;
-	}
-
-	if (*scan) {
-		match_count = 0;
-		for (unit = def_units; unit->str_unit; unit++) {
-			for (i = 0;
-			     scan[i] && tolower(scan[i]) == unit->str_unit[i];
-			     ++i)
-				continue;
-			if (scan[i])
-				continue;
-			match_count++;
-			power = unit->power_of_ten;
-		}
-		if (match_count != 1)
-			return 0;
-	}
-
-	/* count the number of digits to be copied */
-	for (cp = 0; isdigit(str[cp]); cp++)
-		continue;
-
-	if (str[cp] == '.') {
-		while (power > -1 && isdigit(str[cp+1]))
-			cp++, power--;
-	}
-	if (power >= -1)	/* not enough => pad */
-		pad = power + 1;
-	else			/* to much => strip */
-		pad = 0, cp += power + 1;
-	/* check bounds */
-	if (cp <= 0 || cp + pad > NORM_FREQ_LEN - 1)
-		return 0;
-
-	/* copy digits */
-	for (i = 0; i < cp; i++, str++) {
-		if (*str == '.')
-			str++;
-		normalized[i] = *str;
-	}
-	/* and pad */
-	for (; i < cp + pad; i++)
-		normalized[i] = '0';
-
-	/* round up, down ? */
-	match_count = (normalized[i-1] >= '5');
-	/* and drop the decimal part */
-	normalized[i-1] = 0; /* cp > 0 && pad >= 0 ==> i > 0 */
-
-	/* final conversion (and applying rounding) */
-	errno = 0;
-	freq = strtoul(normalized, &end, 10);
-	if (errno)
-		return 0;
-	else {
-		if (match_count && freq != ULONG_MAX)
-			freq++;
-		return freq;
-	}
-}
-
-static int do_new_policy(unsigned int cpu, struct cpufreq_policy *new_pol)
-{
-	struct cpufreq_policy *cur_pol = cpufreq_get_policy(cpu);
-	int ret;
-
-	if (!cur_pol) {
-		printf(gettext("wrong, unknown or unhandled CPU?\n"));
-		return -EINVAL;
-	}
-
-	if (!new_pol->min)
-		new_pol->min = cur_pol->min;
-
-	if (!new_pol->max)
-		new_pol->max = cur_pol->max;
-
-	if (!new_pol->governor)
-		new_pol->governor = cur_pol->governor;
-
-	ret = cpufreq_set_policy(cpu, new_pol);
-
-	cpufreq_put_policy(cur_pol);
-
-	return ret;
-}
-
-	
-static int do_one_cpu(unsigned int cpu, struct cpufreq_policy *new_pol,
-		unsigned long freq, unsigned int pc)
-{
-	switch (pc) {
-	case 0:
-		return cpufreq_set_frequency(cpu, freq);
-
-	case 1:
-		/* if only one value of a policy is to be changed, we can
-		 * use a "fast path".
-		 */
-		if (new_pol->min)
-			return cpufreq_modify_policy_min(cpu, new_pol->min);
-		else if (new_pol->max)
-			return cpufreq_modify_policy_max(cpu, new_pol->max);
-		else if (new_pol->governor)
-			return cpufreq_modify_policy_governor(cpu, new_pol->governor);
-
-	default:
-		/* slow path */
-		return do_new_policy(cpu, new_pol);
-	}
-}
-
-
-int main(int argc, char **argv)
-{
-	extern char *optarg;
-	extern int optind, opterr, optopt;
-	int ret = 0, cont = 1;
-	unsigned long freq = 0;
-	char gov[20];
-	int double_parm = 0;
-	int related = 0;
-	int policychange = 0;
-	struct cpufreq_policy new_pol = {
-		.min = 0,
-		.max = 0,
-		.governor = NULL,
-	};
-	struct cpufreq_affected_cpus single_cpu = {
-		.cpu = 0,
-		.next = NULL,
-		.first = &single_cpu,
-	};
-	struct cpufreq_affected_cpus *cpus = NULL;
-
-	setlocale(LC_ALL, "");
-	textdomain (PACKAGE);
-
-	/* parameter parsing */
-	do {
-		ret = getopt_long(argc, argv, "c:d:u:g:f:hr", set_opts, NULL);
-		switch (ret) {
-		case '?':
-			print_unknown_arg();
-			return -EINVAL;
-		case 'h':
-			print_header();
-			print_help();
-			return 0;
-		case -1:
-			cont = 0;
-			break;
-		case 'r':
-			if (related)
-				double_parm++;
-			related++;
-			break;
-		case 'c':
-			if (cpus)
-				double_parm++;
-			cpus = &single_cpu;
-			if ((sscanf(optarg, "%d ", &single_cpu.cpu)) != 1) {
-				print_unknown_arg();
-				return -EINVAL;
-                        }
-			break;
-		case 'd':
-			if (new_pol.min)
-				double_parm++;
-			policychange++;
-			new_pol.min = string_to_frequency(optarg);
-			if (new_pol.min == 0) {
-				print_unknown_arg();
-				return -EINVAL;
-			}
-			break;
-		case 'u':
-			if (new_pol.max)
-				double_parm++;
-			policychange++;
-			new_pol.max = string_to_frequency(optarg);
-			if (new_pol.max == 0) {
-				print_unknown_arg();
-				return -EINVAL;
-			}
-			break;
-		case 'f':
-			if (freq)
-				double_parm++;
-			freq = string_to_frequency(optarg);
-			if (freq == 0) {
-				print_unknown_arg();
-				return -EINVAL;
-			}
-			break;
-		case 'g':
-			if (new_pol.governor)
-				double_parm++;
-			policychange++;
-			if ((strlen(optarg) < 3) || (strlen(optarg) > 18)) {
-				print_unknown_arg();
-				return -EINVAL;
-                        }
-			if ((sscanf(optarg, "%s", gov)) != 1) {
-				print_unknown_arg();
-				return -EINVAL;
-                        }
-			new_pol.governor = gov;
-			break;
-		}
-	} while(cont);
-
-	/* parameter checking */
-	if (double_parm) {
-		print_header();
-		printf("the same parameter was passed more than once\n");
-		return -EINVAL;
-	}
-
-	if (freq && policychange) {
-		printf(gettext("the -f/--freq parameter cannot be combined with -d/--min, -u/--max or\n"
-				"-g/--governor parameters\n"));
-		return -EINVAL;
-	}
-
-	if (!freq && !policychange) {
-		printf(gettext("At least one parameter out of -f/--freq, -d/--min, -u/--max, and\n"
-				"-g/--governor must be passed\n"));
-		return -EINVAL;
-	}
-
-
-	/* which CPUs shall we modify? */
-	if (!cpus)
-		cpus = &single_cpu;
-
-	if (related)
-		cpus = cpufreq_get_related_cpus(cpus->cpu);
-
-	/* loop over CPUs */
-	while (1) {
-		ret = do_one_cpu(cpus->cpu, &new_pol, freq, policychange);
-		if (ret)
-			break;
-
-		if (!cpus->next)
-			break;
-
-		cpus = cpus->next;
-	}
-
-	/* cleanup */
-	if (cpus->first != &single_cpu)
-		cpufreq_put_related_cpus(cpus->first);
-
-	if (ret)
-		print_error();
-
-	return ret;
-}
-- 
1.6.4.2

