From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 1/4] minor optimizations to ondemand governor
Date: Wed, 28 Jun 2006 13:49:52 -0700
Message-ID: <20060628134952.B12989@unix-os.sc.intel.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: cpufreq <cpufreq@www.linux.org.uk>
Cc: alexey.y.starikovskiy@intel.com, Dave Jones <davej@redhat.com>, Len Brown <lenb@unix-os.sc.intel.com>


ondemand_remove_slowdown_06.patch

Remove slowdown from ondemand sampling path. This reduces the code path length
in dbs_check_cpu() by half. slowdown was not used by ondemand by default.
If there are any user level tools that were using this tunable, they 
may report error now.

Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.17.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c
@@ -5,6 +5,10 @@
  *            (C)  2003 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>.
  *                      Jun Nakajima <jun.nakajima@intel.com>
  *
+ *  Jun 2006 - Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
+ *             Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
+ *      - Remove slow down option and reduce the path length dbs_check_cpu
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
@@ -56,16 +60,14 @@ static unsigned int def_sampling_rate;
 #define MIN_SAMPLING_RATE			(def_sampling_rate / MIN_SAMPLING_RATE_RATIO)
 #define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
 #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
-#define DEF_SAMPLING_DOWN_FACTOR		(1)
-#define MAX_SAMPLING_DOWN_FACTOR		(10)
 #define TRANSITION_LATENCY_LIMIT		(10 * 1000)
 
 static void do_dbs_timer(void *data);
 
 struct cpu_dbs_info_s {
+	cputime64_t prev_cpu_idle;
+	cputime64_t prev_cpu_wall;
 	struct cpufreq_policy *cur_policy;
-	unsigned int prev_cpu_idle_up;
-	unsigned int prev_cpu_idle_down;
 	unsigned int enable;
 };
 static DEFINE_PER_CPU(struct cpu_dbs_info_s, cpu_dbs_info);
@@ -87,24 +89,26 @@ static struct workqueue_struct *dbs_work
 
 struct dbs_tuners {
 	unsigned int sampling_rate;
-	unsigned int sampling_down_factor;
 	unsigned int up_threshold;
 	unsigned int ignore_nice;
 };
 
 static struct dbs_tuners dbs_tuners_ins = {
 	.up_threshold = DEF_FREQUENCY_UP_THRESHOLD,
-	.sampling_down_factor = DEF_SAMPLING_DOWN_FACTOR,
 	.ignore_nice = 0,
 };
 
-static inline unsigned int get_cpu_idle_time(unsigned int cpu)
+static inline cputime64_t get_cpu_idle_time(unsigned int cpu)
 {
-	return	kstat_cpu(cpu).cpustat.idle +
-		kstat_cpu(cpu).cpustat.iowait +
-		( dbs_tuners_ins.ignore_nice ?
-		  kstat_cpu(cpu).cpustat.nice :
-		  0);
+	cputime64_t retval;
+
+	retval = cputime64_add(kstat_cpu(cpu).cpustat.idle,
+			kstat_cpu(cpu).cpustat.iowait);
+
+	if (dbs_tuners_ins.ignore_nice)
+		retval = cputime64_add(retval, kstat_cpu(cpu).cpustat.nice);
+
+	return retval;
 }
 
 /************************** sysfs interface ************************/
@@ -133,29 +137,9 @@ static ssize_t show_##file_name						\
 	return sprintf(buf, "%u\n", dbs_tuners_ins.object);		\
 }
 show_one(sampling_rate, sampling_rate);
-show_one(sampling_down_factor, sampling_down_factor);
 show_one(up_threshold, up_threshold);
 show_one(ignore_nice_load, ignore_nice);
 
-static ssize_t store_sampling_down_factor(struct cpufreq_policy *unused,
-		const char *buf, size_t count)
-{
-	unsigned int input;
-	int ret;
-	ret = sscanf (buf, "%u", &input);
-	if (ret != 1 )
-		return -EINVAL;
-
-	if (input > MAX_SAMPLING_DOWN_FACTOR || input < 1)
-		return -EINVAL;
-
-	mutex_lock(&dbs_mutex);
-	dbs_tuners_ins.sampling_down_factor = input;
-	mutex_unlock(&dbs_mutex);
-
-	return count;
-}
-
 static ssize_t store_sampling_rate(struct cpufreq_policy *unused,
 		const char *buf, size_t count)
 {
@@ -217,12 +201,12 @@ static ssize_t store_ignore_nice_load(st
 	}
 	dbs_tuners_ins.ignore_nice = input;
 
-	/* we need to re-evaluate prev_cpu_idle_up and prev_cpu_idle_down */
+	/* we need to re-evaluate prev_cpu_idle */
 	for_each_online_cpu(j) {
-		struct cpu_dbs_info_s *j_dbs_info;
-		j_dbs_info = &per_cpu(cpu_dbs_info, j);
-		j_dbs_info->prev_cpu_idle_up = get_cpu_idle_time(j);
-		j_dbs_info->prev_cpu_idle_down = j_dbs_info->prev_cpu_idle_up;
+		struct cpu_dbs_info_s *dbs_info;
+		dbs_info = &per_cpu(cpu_dbs_info, j);
+		dbs_info->prev_cpu_idle = get_cpu_idle_time(j);
+		dbs_info->prev_cpu_wall = get_jiffies_64();
 	}
 	mutex_unlock(&dbs_mutex);
 
@@ -234,7 +218,6 @@ static struct freq_attr _name = \
 __ATTR(_name, 0644, show_##_name, store_##_name)
 
 define_one_rw(sampling_rate);
-define_one_rw(sampling_down_factor);
 define_one_rw(up_threshold);
 define_one_rw(ignore_nice_load);
 
@@ -242,7 +225,6 @@ static struct attribute * dbs_attributes
 	&sampling_rate_max.attr,
 	&sampling_rate_min.attr,
 	&sampling_rate.attr,
-	&sampling_down_factor.attr,
 	&up_threshold.attr,
 	&ignore_nice_load.attr,
 	NULL
@@ -257,11 +239,10 @@ static struct attribute_group dbs_attr_g
 
 static void dbs_check_cpu(int cpu)
 {
-	unsigned int idle_ticks, up_idle_ticks, total_ticks;
-	unsigned int freq_next;
-	unsigned int freq_down_sampling_rate;
-	static int down_skip[NR_CPUS];
+	unsigned int idle_ticks, total_ticks;
+	unsigned int load;
 	struct cpu_dbs_info_s *this_dbs_info;
+	cputime64_t cur_jiffies;
 
 	struct cpufreq_policy *policy;
 	unsigned int j;
@@ -271,10 +252,14 @@ static void dbs_check_cpu(int cpu)
 		return;
 
 	policy = this_dbs_info->cur_policy;
+	cur_jiffies = jiffies64_to_cputime64(get_jiffies_64());
+	total_ticks = (unsigned int) cputime64_sub(cur_jiffies,
+			this_dbs_info->prev_cpu_wall);
+	this_dbs_info->prev_cpu_wall = cur_jiffies;
 	/*
 	 * Every sampling_rate, we check, if current idle time is less
 	 * than 20% (default), then we try to increase frequency
-	 * Every sampling_rate*sampling_down_factor, we look for a the lowest
+	 * Every sampling_rate, we look for a the lowest
 	 * frequency which can sustain the load while keeping idle time over
 	 * 30%. If such a frequency exist, we try to decrease to this frequency.
 	 *
@@ -283,36 +268,26 @@ static void dbs_check_cpu(int cpu)
 	 * 5% (default) of current frequency
 	 */
 
-	/* Check for frequency increase */
+	/* Get Idle Time */
 	idle_ticks = UINT_MAX;
 	for_each_cpu_mask(j, policy->cpus) {
-		unsigned int tmp_idle_ticks, total_idle_ticks;
+		cputime64_t total_idle_ticks;
+		unsigned int tmp_idle_ticks;
 		struct cpu_dbs_info_s *j_dbs_info;
 
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
 		total_idle_ticks = get_cpu_idle_time(j);
-		tmp_idle_ticks = total_idle_ticks -
-			j_dbs_info->prev_cpu_idle_up;
-		j_dbs_info->prev_cpu_idle_up = total_idle_ticks;
+		tmp_idle_ticks = (unsigned int) cputime64_sub(total_idle_ticks,
+				j_dbs_info->prev_cpu_idle);
+		j_dbs_info->prev_cpu_idle = total_idle_ticks;
 
 		if (tmp_idle_ticks < idle_ticks)
 			idle_ticks = tmp_idle_ticks;
 	}
+	load = (100 * (total_ticks - idle_ticks)) / total_ticks;
 
-	/* Scale idle ticks by 100 and compare with up and down ticks */
-	idle_ticks *= 100;
-	up_idle_ticks = (100 - dbs_tuners_ins.up_threshold) *
-			usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
-
-	if (idle_ticks < up_idle_ticks) {
-		down_skip[cpu] = 0;
-		for_each_cpu_mask(j, policy->cpus) {
-			struct cpu_dbs_info_s *j_dbs_info;
-
-			j_dbs_info = &per_cpu(cpu_dbs_info, j);
-			j_dbs_info->prev_cpu_idle_down =
-					j_dbs_info->prev_cpu_idle_up;
-		}
+	/* Check for frequency increase */
+	if (load > dbs_tuners_ins.up_threshold) {
 		/* if we are already at full speed then break out early */
 		if (policy->cur == policy->max)
 			return;
@@ -323,50 +298,22 @@ static void dbs_check_cpu(int cpu)
 	}
 
 	/* Check for frequency decrease */
-	down_skip[cpu]++;
-	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
-		return;
-
-	idle_ticks = UINT_MAX;
-	for_each_cpu_mask(j, policy->cpus) {
-		unsigned int tmp_idle_ticks, total_idle_ticks;
-		struct cpu_dbs_info_s *j_dbs_info;
-
-		j_dbs_info = &per_cpu(cpu_dbs_info, j);
-		/* Check for frequency decrease */
-		total_idle_ticks = j_dbs_info->prev_cpu_idle_up;
-		tmp_idle_ticks = total_idle_ticks -
-			j_dbs_info->prev_cpu_idle_down;
-		j_dbs_info->prev_cpu_idle_down = total_idle_ticks;
-
-		if (tmp_idle_ticks < idle_ticks)
-			idle_ticks = tmp_idle_ticks;
-	}
-
-	down_skip[cpu] = 0;
 	/* if we cannot reduce the frequency anymore, break out early */
 	if (policy->cur == policy->min)
 		return;
 
-	/* Compute how many ticks there are between two measurements */
-	freq_down_sampling_rate = dbs_tuners_ins.sampling_rate *
-		dbs_tuners_ins.sampling_down_factor;
-	total_ticks = usecs_to_jiffies(freq_down_sampling_rate);
-
 	/*
 	 * The optimal frequency is the frequency that is the lowest that
 	 * can support the current CPU usage without triggering the up
 	 * policy. To be safe, we focus 10 points under the threshold.
 	 */
-	freq_next = ((total_ticks - idle_ticks) * 100) / total_ticks;
-	freq_next = (freq_next * policy->cur) /
+	if (load < (dbs_tuners_ins.up_threshold - 10)) {
+		unsigned int freq_next;
+		freq_next = (policy->cur * load) /
 			(dbs_tuners_ins.up_threshold - 10);
 
-	if (freq_next < policy->min)
-		freq_next = policy->min;
-
-	if (freq_next <= ((policy->cur * 95) / 100))
 		__cpufreq_driver_target(policy, freq_next, CPUFREQ_RELATION_L);
+	}
 }
 
 static void do_dbs_timer(void *data)
@@ -432,9 +379,8 @@ static int cpufreq_governor_dbs(struct c
 			j_dbs_info = &per_cpu(cpu_dbs_info, j);
 			j_dbs_info->cur_policy = policy;
 
-			j_dbs_info->prev_cpu_idle_up = get_cpu_idle_time(j);
-			j_dbs_info->prev_cpu_idle_down
-				= j_dbs_info->prev_cpu_idle_up;
+			j_dbs_info->prev_cpu_idle = get_cpu_idle_time(j);
+			j_dbs_info->prev_cpu_wall = get_jiffies_64();
 		}
 		this_dbs_info->enable = 1;
 		sysfs_create_group(&policy->kobj, &dbs_attr_group);
Index: linux-2.6.17/include/asm-generic/cputime.h
===================================================================
--- linux-2.6.17.orig/include/asm-generic/cputime.h
+++ linux-2.6.17/include/asm-generic/cputime.h
@@ -24,7 +24,9 @@ typedef u64 cputime64_t;
 
 #define cputime64_zero (0ULL)
 #define cputime64_add(__a, __b)		((__a) + (__b))
+#define cputime64_sub(__a, __b)		((__a) - (__b))
 #define cputime64_to_jiffies64(__ct)	(__ct)
+#define jiffies64_to_cputime64(__jif)	(__jif)
 #define cputime_to_cputime64(__ct)	((u64) __ct)
