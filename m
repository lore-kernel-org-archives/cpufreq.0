From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/4] cpupower: mperf monitor - Use TSC to calculate max frequency if possible
Date: Fri, 12 Aug 2011 01:11:35 +0200
Message-ID: <1313104298-45443-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trenn@suse.de, cpufreq@vger.kernel.org, linux@dominikbrodowski.net

Which makes the implementation independent from cpufreq drivers.
Therefore this would also work on a Xen kernel where the hypervisor
is doing frequency switching and idle entering.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 tools/power/cpupower/Makefile                      |    2 +-
 .../cpupower/utils/idle_monitor/mperf_monitor.c    |  177 ++++++++++++++-----
 2 files changed, 131 insertions(+), 48 deletions(-)

diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index 94c2cf0..11521d2 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -24,7 +24,7 @@
 
 # Set the following to `true' to make a unstripped, unoptimized
 # binary. Leave this set to `false' for production use.
-DEBUG ?=	false
+DEBUG ?=	true
 
 # make the build silent. Set this to something else to make it noisy again.
 V ?=		false
diff --git a/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c b/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c
index 63ca87a..4f5599e 100644
--- a/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c
+++ b/tools/power/cpupower/utils/idle_monitor/mperf_monitor.c
@@ -22,12 +22,15 @@
 
 #define MSR_TSC	0x10
 
+#define MSR_AMD_HWCR 0xc0010015
+
 enum mperf_id { C0 = 0, Cx, AVG_FREQ, MPERF_CSTATE_COUNT };
 
 static int mperf_get_count_percent(unsigned int self_id, double *percent,
 				   unsigned int cpu);
 static int mperf_get_count_freq(unsigned int id, unsigned long long *count,
 				unsigned int cpu);
+static struct timespec time_start, time_end;
 
 static cstate_t mperf_cstates[MPERF_CSTATE_COUNT] = {
 	{
@@ -54,19 +57,33 @@ static cstate_t mperf_cstates[MPERF_CSTATE_COUNT] = {
 	},
 };
 
+enum MAX_FREQ_MODE { MAX_FREQ_SYSFS, MAX_FREQ_TSC_REF };
+static int max_freq_mode;
+/*
+ * The max frequency mperf is ticking at (in C0), either retrieved via:
+ *   1) calculated after measurements if we know TSC ticks at mperf/P0 frequency
+ *   2) cpufreq /sys/devices/.../cpu0/cpufreq/cpuinfo_max_freq at init time
+ * 1. Is preferred as it also works without cpufreq subsystem (e.g. on Xen)
+ */
+static unsigned long max_frequency;
+
 static unsigned long long tsc_at_measure_start;
 static unsigned long long tsc_at_measure_end;
-static unsigned long max_frequency;
 static unsigned long long *mperf_previous_count;
 static unsigned long long *aperf_previous_count;
 static unsigned long long *mperf_current_count;
 static unsigned long long *aperf_current_count;
+
 /* valid flag for all CPUs. If a MSR read failed it will be zero */
 static int *is_valid;
 
 static int mperf_get_tsc(unsigned long long *tsc)
 {
-	return read_msr(0, MSR_TSC, tsc);
+	int ret;
+	ret = read_msr(0, MSR_TSC, tsc);
+	if (ret)
+		dprint("Reading TSC MSR failed, returning %llu\n", *tsc);
+	return ret;
 }
 
 static int mperf_init_stats(unsigned int cpu)
@@ -97,36 +114,11 @@ static int mperf_measure_stats(unsigned int cpu)
 	return 0;
 }
 
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
-static unsigned long get_average_perf(unsigned long long aperf_diff,
-				      unsigned long long mperf_diff)
-{
-	unsigned int perf_percent = 0;
-	if (((unsigned long)(-1) / 100) < aperf_diff) {
-		int shift_count = 7;
-		aperf_diff >>= shift_count;
-		mperf_diff >>= shift_count;
-	}
-	perf_percent = (aperf_diff * 100) / mperf_diff;
-	return (max_frequency * perf_percent) / 100;
-}
-
 static int mperf_get_count_percent(unsigned int id, double *percent,
 				   unsigned int cpu)
 {
 	unsigned long long aperf_diff, mperf_diff, tsc_diff;
+	unsigned long long timediff;
 
 	if (!is_valid[cpu])
 		return -1;
@@ -136,11 +128,19 @@ static int mperf_get_count_percent(unsigned int id, double *percent,
 
 	mperf_diff = mperf_current_count[cpu] - mperf_previous_count[cpu];
 	aperf_diff = aperf_current_count[cpu] - aperf_previous_count[cpu];
-	tsc_diff = tsc_at_measure_end - tsc_at_measure_start;
 
-	*percent = 100.0 * mperf_diff / tsc_diff;
-	dprint("%s: mperf_diff: %llu, tsc_diff: %llu\n",
-	       mperf_cstates[id].name, mperf_diff, tsc_diff);
+	if (max_freq_mode == MAX_FREQ_TSC_REF) {
+		tsc_diff = tsc_at_measure_end - tsc_at_measure_start;
+		*percent = 100.0 * mperf_diff / tsc_diff;
+		dprint("%s: TSC Ref - mperf_diff: %llu, tsc_diff: %llu\n",
+		       mperf_cstates[id].name, mperf_diff, tsc_diff);
+	} else if (max_freq_mode == MAX_FREQ_SYSFS) {
+		timediff = timespec_diff_us(time_start, time_end);
+		*percent = 100.0 * mperf_diff / timediff;
+		dprint("%s: MAXFREQ - mperf_diff: %llu, time_diff: %llu\n",
+		       mperf_cstates[id].name, mperf_diff, timediff);
+	} else
+		return -1;
 
 	if (id == Cx)
 		*percent = 100.0 - *percent;
@@ -154,7 +154,7 @@ static int mperf_get_count_percent(unsigned int id, double *percent,
 static int mperf_get_count_freq(unsigned int id, unsigned long long *count,
 				unsigned int cpu)
 {
-	unsigned long long aperf_diff, mperf_diff;
+	unsigned long long aperf_diff, mperf_diff, time_diff, tsc_diff;
 
 	if (id != AVG_FREQ)
 		return 1;
@@ -165,11 +165,21 @@ static int mperf_get_count_freq(unsigned int id, unsigned long long *count,
 	mperf_diff = mperf_current_count[cpu] - mperf_previous_count[cpu];
 	aperf_diff = aperf_current_count[cpu] - aperf_previous_count[cpu];
 
-	/* Return MHz for now, might want to return KHz if column width is more
-	   generic */
-	*count = get_average_perf(aperf_diff, mperf_diff) / 1000;
-	dprint("%s: %llu\n", mperf_cstates[id].name, *count);
+	if (max_freq_mode == MAX_FREQ_TSC_REF) {
+		/* Calculate max_freq from TSC count */
+		tsc_diff = tsc_at_measure_end - tsc_at_measure_start;
+		time_diff = timespec_diff_us(time_start, time_end);
+		max_frequency = tsc_diff / time_diff;
+	}
 
+	*count = max_frequency * ((double)aperf_diff / mperf_diff);
+	dprint("%s: Average freq based on %s maximum frequency:\n",
+	       mperf_cstates[id].name,
+	       (max_freq_mode == MAX_FREQ_TSC_REF) ? "TSC calculated" : "sysfs read");
+	dprint("%max_frequency: %lu", max_frequency);
+	dprint("aperf_diff: %llu\n", aperf_diff);
+	dprint("mperf_diff: %llu\n", mperf_diff);
+	dprint("avg freq:   %llu\n", *count);
 	return 0;
 }
 
@@ -178,6 +188,7 @@ static int mperf_start(void)
 	int cpu;
 	unsigned long long dbg;
 
+	clock_gettime(CLOCK_REALTIME, &time_start);
 	mperf_get_tsc(&tsc_at_measure_start);
 
 	for (cpu = 0; cpu < cpu_count; cpu++)
@@ -193,32 +204,104 @@ static int mperf_stop(void)
 	unsigned long long dbg;
 	int cpu;
 
-	mperf_get_tsc(&tsc_at_measure_end);
-
 	for (cpu = 0; cpu < cpu_count; cpu++)
 		mperf_measure_stats(cpu);
 
+	mperf_get_tsc(&tsc_at_measure_end);
+	clock_gettime(CLOCK_REALTIME, &time_end);
+
 	mperf_get_tsc(&dbg);
 	dprint("TSC diff: %llu\n", dbg - tsc_at_measure_end);
 
 	return 0;
 }
 
-struct cpuidle_monitor mperf_monitor;
-
-struct cpuidle_monitor *mperf_register(void)
+/*
+ * Mperf register is defined to tick at P0 (maximum) frequency
+ * 
+ * Instead of reading out P0 which can be tricky to read out from HW,
+ * we use TSC counter if it reliably ticks at P0/mperf frequency.
+ * 
+ * Still try to fall back to:
+ * /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq
+ * on older Intel HW without invariant TSC feature.
+ * Or on AMD machines where TSC does not tick at P0 (do not exist yet, but
+ * it's still double checked (MSR_AMD_HWCR)).
+ * 
+ * On these machines the user would still get useful mperf
+ * stats when acpi-cpufreq driver is loaded.
+ */
+static int init_maxfreq_mode(void)
 {
+	int ret;
+	unsigned long long hwcr;
 	unsigned long min;
 
-	if (!(cpupower_cpu_info.caps & CPUPOWER_CAP_APERF))
-		return NULL;
-
-	/* Assume min/max all the same on all cores */
+	if (!cpupower_cpu_info.caps & CPUPOWER_CAP_INV_TSC)
+		goto use_sysfs;
+
+	if (cpupower_cpu_info.vendor == X86_VENDOR_AMD) {
+		/* MSR_AMD_HWCR tells us whether TSC runs at P0/mperf
+		 * freq.
+		 * A test whether hwcr is accessable/available would be:
+		 * (cpupower_cpu_info.family > 0x10 ||
+		 *   cpupower_cpu_info.family == 0x10 &&
+		 *   cpupower_cpu_info.model >= 0x2))
+		 * This should be the case for all aperf/mperf
+		 * capable AMD machines and is therefore safe to test here.
+		 * Compare with Linus kernel git commit: acf01734b1747b1ec4
+		 */
+		ret = read_msr(0, MSR_AMD_HWCR, &hwcr);
+		/*
+		 * If the MSR read failed, assume a Xen system that did
+		 * not explicitly provide access to it and assume TSC works
+		*/
+		if (ret != 0) {
+			dprint("TSC read 0x%x failed - assume TSC working\n",
+			       MSR_AMD_HWCR);
+			return 0;
+		} else if (1 & (hwcr >> 24)) {
+			max_freq_mode = MAX_FREQ_TSC_REF;
+			return 0;
+		} else { /* Use sysfs max frequency if available */ }
+	} else if (cpupower_cpu_info.vendor == X86_VENDOR_INTEL) {
+		/*
+		 * On Intel we assume mperf (in C0) is ticking at same
+		 * rate than TSC
+		 */
+		max_freq_mode = MAX_FREQ_TSC_REF;
+		return 0;
+	}
+use_sysfs:
 	if (cpufreq_get_hardware_limits(0, &min, &max_frequency)) {
 		dprint("Cannot retrieve max freq from cpufreq kernel "
 		       "subsystem\n");
-		return NULL;
+		return -1;
 	}
+	max_freq_mode = MAX_FREQ_SYSFS;
+	return 0;
+}
+
+/*
+ * This monitor provides:
+ * 
+ * 1) Average frequency a CPU resided in
+ *    This always works if the CPU has aperf/mperf capabilities
+ *
+ * 2) C0 and Cx (any sleep state) time a CPU resided in
+ *    Works if mperf timer stops ticking in sleep states which
+ *    seem to be the case on all current HW.
+ * Both is directly retrieved from HW registers and is independent
+ * from kernel statistics.
+ */
+struct cpuidle_monitor mperf_monitor;
+struct cpuidle_monitor *mperf_register(void)
+{
+	if (!(cpupower_cpu_info.caps & CPUPOWER_CAP_APERF))
+		return NULL;
+
+	if (init_maxfreq_mode())
+		return NULL;
 
 	/* Free this at program termination */
 	is_valid = calloc(cpu_count, sizeof(int));
-- 
1.7.3.4

