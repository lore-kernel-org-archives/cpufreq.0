From: Len Brown <len.brown@intel.com>
Subject: [PATCH 2/2 vs 2.6.18-rc1] ondemand: add powersave_bias tunable
Date: Thu, 13 Jul 2006 16:21:31 -0400
Message-ID: <200607131621.31600.len.brown@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: davej@codemonkey.org.uk
Cc: alexey.y.starikovskiy@intel.com, cpufreq@lists.linux.org.uk

From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

cpufreq_ondemand.c |  164 +++++++++++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 153 insertions(+), 11 deletions(-)

ondemand selects the minimum frequency that can retire
a workload with negligible idle time -- ideally resulting in the highest
performance/power efficiency with negligible performance impact.

But on some systems and some workloads, this algorithm
is more performance biased than necessary, and
de-tuning it a bit to allow some performance impact
can save measurable power.

This patch adds a "powersave_bias" tunable to ondemand
to allow it to reduce its target frequency by a specified percent.

By default, the powersave_bias is 0 and has no effect.
powersave_bias is in units of 0.1%, so it has an effective range
of 1 through 1000, resulting in 0.1% to 100% impact.

In practice, users will not be able to detect a difference between
0.1% increments, but 1.0% increments turned out to be too large.
Also, the max value of 1000 (100%) would simply peg the system
in its deepest power saving P-state, unless the processor really has
a hardware P-state at 0Hz:-)

For example, If ondemand requests 2.0GHz based on utilization,
and powersave_bias=100, this code will knock 10% off the target
and seek  a target of 1.8GHz instead of 2.0GHz until the
next sampling.  If 1.8 is an exact match with an hardware frequency
we use it, otherwise we average our time between the frequency
next higher than 1.8 and next lower than 1.8.

Note that a user or administrative program can change powersave_bias
at run-time depending on how they expect the system to be used.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
Signed-off-by: Len Brown <len.brown@intel.com>

Index: from-linus/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- from-linus.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ from-linus/drivers/cpufreq/cpufreq_ondemand.c
@@ -55,6 +55,10 @@ struct cpu_dbs_info_s {
 	struct cpufreq_policy *cur_policy;
  	struct work_struct work;
 	unsigned int enable;
+	struct cpufreq_frequency_table *freq_table;
+	unsigned int freq_lo;
+	unsigned int freq_lo_jiffies;
+	unsigned int freq_hi_jiffies;
 };
 static DEFINE_PER_CPU(struct cpu_dbs_info_s, cpu_dbs_info);
 
@@ -77,11 +81,13 @@ struct dbs_tuners {
 	unsigned int sampling_rate_jiffies;
 	unsigned int up_threshold;
 	unsigned int ignore_nice;
+	unsigned int powersave_bias;
 };
 
 static struct dbs_tuners dbs_tuners_ins = {
 	.up_threshold = DEF_FREQUENCY_UP_THRESHOLD,
 	.ignore_nice = 0,
+	.powersave_bias = 0,
 };
 
 static inline cputime64_t get_cpu_idle_time(unsigned int cpu)
@@ -97,6 +103,69 @@ static inline cputime64_t get_cpu_idle_t
 	return retval;
 }
 
+/*
+ * Find right freq to be set now with powersave_bias on.
+ * Returns the freq_hi to be used right now and will set freq_hi_jiffies,
+ * freq_lo, and freq_lo_jiffies in percpu area for averaging freqs.
+ */
+unsigned int powersave_bias_target(struct cpufreq_policy *policy,
+		unsigned int freq_next, unsigned int relation)
+{
+	unsigned int freq_req, freq_reduc, freq_avg;
+	unsigned int freq_hi, freq_lo;
+	unsigned int index = 0;
+	unsigned int jiffies_total, jiffies_hi, jiffies_lo;
+	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, policy->cpu);
+
+	if (!dbs_info->freq_table) {
+		dbs_info->freq_lo = 0;
+		dbs_info->freq_lo_jiffies = 0;
+		return freq_next;
+	}
+
+	cpufreq_frequency_table_target(policy, dbs_info->freq_table, freq_next,
+			relation, &index);
+	freq_req = dbs_info->freq_table[index].frequency;
+	freq_reduc = freq_req * dbs_tuners_ins.powersave_bias / 1000;
+	freq_avg = freq_req - freq_reduc;
+
+	/* Find freq bounds for freq_avg in freq_table */
+	index = 0;
+	cpufreq_frequency_table_target(policy, dbs_info->freq_table, freq_avg,
+			CPUFREQ_RELATION_H, &index);
+	freq_lo = dbs_info->freq_table[index].frequency;
+	index = 0;
+	cpufreq_frequency_table_target(policy, dbs_info->freq_table, freq_avg,
+			CPUFREQ_RELATION_L, &index);
+	freq_hi = dbs_info->freq_table[index].frequency;
+
+	/* Find out how long we have to be in hi and lo freqs */
+	if (freq_hi == freq_lo) {
+		dbs_info->freq_lo = 0;
+		dbs_info->freq_lo_jiffies = 0;
+		return freq_lo;
+	}
+	jiffies_total = dbs_tuners_ins.sampling_rate_jiffies;
+	jiffies_hi = (freq_avg - freq_lo) * jiffies_total;
+	jiffies_hi += ((freq_hi - freq_lo) / 2);
+	jiffies_hi /= (freq_hi - freq_lo);
+	jiffies_lo = jiffies_total - jiffies_hi;
+	dbs_info->freq_lo = freq_lo;
+	dbs_info->freq_lo_jiffies = jiffies_lo;
+	dbs_info->freq_hi_jiffies = jiffies_hi;
+	return freq_hi;
+}
+
+static void ondemand_powersave_bias_init(void)
+{
+	int i;
+	for_each_online_cpu(i) {
+		struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, i);
+		dbs_info->freq_table = cpufreq_frequency_get_table(i);
+		dbs_info->freq_lo = 0;
+	}
+}
+
 /************************** sysfs interface ************************/
 static ssize_t show_sampling_rate_max(struct cpufreq_policy *policy, char *buf)
 {
@@ -125,6 +194,7 @@ static ssize_t show_##file_name						\
 show_one(sampling_rate, sampling_rate);
 show_one(up_threshold, up_threshold);
 show_one(ignore_nice_load, ignore_nice);
+show_one(powersave_bias, powersave_bias);
 
 static ssize_t store_sampling_rate(struct cpufreq_policy *unused,
 		const char *buf, size_t count)
@@ -200,6 +270,27 @@ static ssize_t store_ignore_nice_load(st
 	return count;
 }
 
+static ssize_t store_powersave_bias(struct cpufreq_policy *unused,
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+	ret = sscanf(buf, "%u", &input);
+
+	if (ret != 1)
+		return -EINVAL;
+
+	if (input > 1000)
+		input = 1000;
+
+	mutex_lock(&dbs_mutex);
+	dbs_tuners_ins.powersave_bias = input;
+	ondemand_powersave_bias_init();
+	mutex_unlock(&dbs_mutex);
+
+	return count;
+}
+
 #define define_one_rw(_name) \
 static struct freq_attr _name = \
 __ATTR(_name, 0644, show_##_name, store_##_name)
@@ -207,6 +298,7 @@ __ATTR(_name, 0644, show_##_name, store_
 define_one_rw(sampling_rate);
 define_one_rw(up_threshold);
 define_one_rw(ignore_nice_load);
+define_one_rw(powersave_bias);
 
 static struct attribute * dbs_attributes[] = {
 	&sampling_rate_max.attr,
@@ -214,6 +306,7 @@ static struct attribute * dbs_attributes
 	&sampling_rate.attr,
 	&up_threshold.attr,
 	&ignore_nice_load.attr,
+	&powersave_bias.attr,
 	NULL
 };
 
@@ -236,6 +329,7 @@ static void dbs_check_cpu(struct cpu_dbs
 	if (!this_dbs_info->enable)
 		return;
 
+	this_dbs_info->freq_lo = 0;
 	policy = this_dbs_info->cur_policy;
 	cur_jiffies = jiffies64_to_cputime64(get_jiffies_64());
 	total_ticks = (unsigned int) cputime64_sub(cur_jiffies,
@@ -274,11 +368,18 @@ static void dbs_check_cpu(struct cpu_dbs
 	/* Check for frequency increase */
 	if (load > dbs_tuners_ins.up_threshold) {
 		/* if we are already at full speed then break out early */
-		if (policy->cur == policy->max)
-			return;
-
-		__cpufreq_driver_target(policy, policy->max,
-			CPUFREQ_RELATION_H);
+		if (!dbs_tuners_ins.powersave_bias) {
+			if (policy->cur == policy->max)
+				return;
+
+			__cpufreq_driver_target(policy, policy->max,
+				CPUFREQ_RELATION_H);
+		} else {
+			int freq = powersave_bias_target(policy, policy->max,
+					CPUFREQ_RELATION_H);
+			__cpufreq_driver_target(policy, freq,
+				CPUFREQ_RELATION_L);
+		}
 		return;
 	}
 
@@ -293,23 +394,63 @@ static void dbs_check_cpu(struct cpu_dbs
 	 * policy. To be safe, we focus 10 points under the threshold.
 	 */
 	if (load < (dbs_tuners_ins.up_threshold - 10)) {
-		unsigned int freq_next;
-		freq_next = (policy->cur * load) /
+		unsigned int freq_next = (policy->cur * load) /
 			(dbs_tuners_ins.up_threshold - 10);
-
-		__cpufreq_driver_target(policy, freq_next, CPUFREQ_RELATION_L);
+		if (!dbs_tuners_ins.powersave_bias) {
+			__cpufreq_driver_target(policy, freq_next,
+					CPUFREQ_RELATION_L);
+		} else {
+			int freq = powersave_bias_target(policy, freq_next,
+					CPUFREQ_RELATION_L);
+			__cpufreq_driver_target(policy, freq,
+				CPUFREQ_RELATION_L);
+		}
 	}
 }
 
+/* Sampling types */
+enum {DBS_NORMAL_SAMPLE, DBS_SUB_SAMPLE};
+
 static void do_dbs_timer(void *data)
 {
 	unsigned int cpu = smp_processor_id();
 	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, cpu);
+	/* We want all CPUs to do sampling nearly on same jiffy */
 	int delay = dbs_tuners_ins.sampling_rate_jiffies -
 		(jiffies % dbs_tuners_ins.sampling_rate_jiffies);
+	if (!dbs_tuners_ins.powersave_bias) {
+		/* Common NORMAL_SAMPLE setup */
+		INIT_WORK(&dbs_info->work, do_dbs_timer,
+				(void *)DBS_NORMAL_SAMPLE);
+		dbs_check_cpu(dbs_info);
+		/* We want all CPUs to do sampling nearly on same jiffy */
+		delay = dbs_tuners_ins.sampling_rate_jiffies -
+	        	(jiffies % dbs_tuners_ins.sampling_rate_jiffies);
+		queue_delayed_work_on(cpu, kondemand_wq,
+				&dbs_info->work, delay);
+		return;
+	}
 
-	dbs_check_cpu(dbs_info);
-	/* We want all CPUs to do sampling nearly on same jiffy */
+	/* powersave_bias is set */
+	if ((unsigned long) data == DBS_NORMAL_SAMPLE) {
+		dbs_check_cpu(dbs_info);
+		if (dbs_info->freq_lo) {
+			/* Setup timer for SUB_SAMPLE and return */
+			INIT_WORK(&dbs_info->work, do_dbs_timer,
+					(void *)DBS_SUB_SAMPLE);
+			queue_delayed_work_on(cpu,
+					kondemand_wq,
+					&dbs_info->work,
+					dbs_info->freq_hi_jiffies);
+			return;
+		}
+	} else if ((unsigned long) data == DBS_SUB_SAMPLE) {
+		__cpufreq_driver_target(dbs_info->cur_policy,
+	                        	dbs_info->freq_lo,
+	                        	CPUFREQ_RELATION_H);
+	}
+
+	INIT_WORK(&dbs_info->work, do_dbs_timer, (void *)DBS_NORMAL_SAMPLE);
 	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work, delay);
 }
 
@@ -319,6 +460,7 @@ static inline void dbs_timer_init(unsign
 	int delay = dbs_tuners_ins.sampling_rate_jiffies -
 		(jiffies % dbs_tuners_ins.sampling_rate_jiffies);
 
+	ondemand_powersave_bias_init();
 	INIT_WORK(&dbs_info->work, do_dbs_timer, 0);
 	/* We want all CPUs to do sampling nearly on same jiffy */
 	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work, delay);
