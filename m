From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] [4/5] ondemand governor automatic downscaling
Date: Wed, 18 May 2005 13:38:52 -0700
Message-ID: <20050518133852.E22282@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Alexander Clouter <alex-kernel@digriz.org.uk>, cpufreq@lists.linux.org.uk, Eric Piel <Eric.Piel@tremplin-utc.net>, linux@dominikbrodowski.net, Rajesh Shah <rajesh.shah@intel.com>


[PATCH] [4/5] ondemand governor automatic downscaling

Here is a change of policy for the ondemand governor. The modification
concerns the frequency downscaling. Instead of decreasing to a lower
frequency when the CPU usage is under 20%, this new policy automatically
scales to the optimal frequency. The optimal frequency being the lowest
frequency which provides enough power to not trigger the upscaling policy.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

diff -purN linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_ondemand.c linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_ondemand.c
--- linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_ondemand.c	2005-05-18 07:50:06.855928712 -0700
+++ linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_ondemand.c	2005-05-18 08:23:30.037398840 -0700
@@ -34,13 +34,9 @@
  */
 
 #define DEF_FREQUENCY_UP_THRESHOLD		(80)
-#define MIN_FREQUENCY_UP_THRESHOLD		(0)
+#define MIN_FREQUENCY_UP_THRESHOLD		(11)
 #define MAX_FREQUENCY_UP_THRESHOLD		(100)
 
-#define DEF_FREQUENCY_DOWN_THRESHOLD		(20)
-#define MIN_FREQUENCY_DOWN_THRESHOLD		(0)
-#define MAX_FREQUENCY_DOWN_THRESHOLD		(100)
-
 /* 
  * The polling frequency of this governor depends on the capability of 
  * the processor. Default polling frequency is 1000 times the transition
@@ -77,14 +73,11 @@ struct dbs_tuners {
 	unsigned int 		sampling_rate;
 	unsigned int		sampling_down_factor;
 	unsigned int		up_threshold;
-	unsigned int		down_threshold;
 	unsigned int		ignore_nice;
-	unsigned int		freq_step;
 };
 
 static struct dbs_tuners dbs_tuners_ins = {
 	.up_threshold 		= DEF_FREQUENCY_UP_THRESHOLD,
-	.down_threshold 	= DEF_FREQUENCY_DOWN_THRESHOLD,
 	.sampling_down_factor 	= DEF_SAMPLING_DOWN_FACTOR,
 };
 
@@ -125,9 +118,7 @@ static ssize_t show_##file_name						\
 show_one(sampling_rate, sampling_rate);
 show_one(sampling_down_factor, sampling_down_factor);
 show_one(up_threshold, up_threshold);
-show_one(down_threshold, down_threshold);
 show_one(ignore_nice, ignore_nice);
-show_one(freq_step, freq_step);
 
 static ssize_t store_sampling_down_factor(struct cpufreq_policy *unused, 
 		const char *buf, size_t count)
@@ -173,8 +164,7 @@ static ssize_t store_up_threshold(struct
 
 	down(&dbs_sem);
 	if (ret != 1 || input > MAX_FREQUENCY_UP_THRESHOLD || 
-			input < MIN_FREQUENCY_UP_THRESHOLD ||
-			input <= dbs_tuners_ins.down_threshold) {
+			input < MIN_FREQUENCY_UP_THRESHOLD) {
 		up(&dbs_sem);
 		return -EINVAL;
 	}
@@ -185,27 +175,6 @@ static ssize_t store_up_threshold(struct
 	return count;
 }
 
-static ssize_t store_down_threshold(struct cpufreq_policy *unused, 
-		const char *buf, size_t count)
-{
-	unsigned int input;
-	int ret;
-	ret = sscanf (buf, "%u", &input);
-
-	down(&dbs_sem);
-	if (ret != 1 || input > MAX_FREQUENCY_DOWN_THRESHOLD || 
-			input < MIN_FREQUENCY_DOWN_THRESHOLD ||
-			input >= dbs_tuners_ins.up_threshold) {
-		up(&dbs_sem);
-		return -EINVAL;
-	}
-
-	dbs_tuners_ins.down_threshold = input;
-	up(&dbs_sem);
-
-	return count;
-}
-
 static ssize_t store_ignore_nice(struct cpufreq_policy *policy,
 		const char *buf, size_t count)
 {
@@ -240,29 +209,6 @@ static ssize_t store_ignore_nice(struct 
 	return count;
 }
 
-static ssize_t store_freq_step(struct cpufreq_policy *policy,
-		const char *buf, size_t count)
-{
-	unsigned int input;
-	int ret;
-
-	ret = sscanf (buf, "%u", &input);
-
-	if ( ret != 1 )
-		return -EINVAL;
-
-	if ( input > 100 )
-		input = 100;
-	
-	/* no need to test here if freq_step is zero as the user might actually
-	 * want this, they would be crazy though :) */
-	down(&dbs_sem);
-	dbs_tuners_ins.freq_step = input;
-	up(&dbs_sem);
-
-	return count;
-}
-
 #define define_one_rw(_name) \
 static struct freq_attr _name = \
 __ATTR(_name, 0644, show_##_name, store_##_name)
@@ -270,9 +216,7 @@ __ATTR(_name, 0644, show_##_name, store_
 define_one_rw(sampling_rate);
 define_one_rw(sampling_down_factor);
 define_one_rw(up_threshold);
-define_one_rw(down_threshold);
 define_one_rw(ignore_nice);
-define_one_rw(freq_step);
 
 static struct attribute * dbs_attributes[] = {
 	&sampling_rate_max.attr,
@@ -280,9 +224,7 @@ static struct attribute * dbs_attributes
 	&sampling_rate.attr,
 	&sampling_down_factor.attr,
 	&up_threshold.attr,
-	&down_threshold.attr,
 	&ignore_nice.attr,
-	&freq_step.attr,
 	NULL
 };
 
@@ -295,8 +237,8 @@ static struct attribute_group dbs_attr_g
 
 static void dbs_check_cpu(int cpu)
 {
-	unsigned int idle_ticks, up_idle_ticks, down_idle_ticks;
-	unsigned int freq_down_step;
+	unsigned int idle_ticks, up_idle_ticks, total_ticks;
+	unsigned int freq_next;
 	unsigned int freq_down_sampling_rate;
 	static int down_skip[NR_CPUS];
 	struct cpu_dbs_info_s *this_dbs_info;
@@ -310,17 +252,15 @@ static void dbs_check_cpu(int cpu)
 
 	policy = this_dbs_info->cur_policy;
 	/* 
-	 * The default safe range is 20% to 80% 
-	 * Every sampling_rate, we check
-	 * 	- If current idle time is less than 20%, then we try to 
-	 * 	  increase frequency
-	 * Every sampling_rate*sampling_down_factor, we check
-	 * 	- If current idle time is more than 80%, then we try to
-	 * 	  decrease frequency
+	 * Every sampling_rate, we check, if current idle time is less
+	 * than 20% (default), then we try to increase frequency
+	 * Every sampling_rate*sampling_down_factor, we look for a the lowest
+	 * frequency which can sustain the load while keeping idle time over
+	 * 30%. If such a frequency exist, we try to decrease to this frequency.
 	 *
 	 * Any frequency increase takes it to the maximum frequency. 
 	 * Frequency reduction happens at minimum steps of 
-	 * 5% (default) of max_frequency 
+	 * 5% (default) of current frequency 
 	 */
 
 	/* Check for frequency increase */
@@ -383,33 +323,27 @@ static void dbs_check_cpu(int cpu)
 			idle_ticks = tmp_idle_ticks;
 	}
 
-	/* Scale idle ticks by 100 and compare with up and down ticks */
-	idle_ticks *= 100;
 	down_skip[cpu] = 0;
+	/* if we cannot reduce the frequency anymore, break out early */
+	if (policy->cur == policy->min)
+		return;
 
+	/* Compute how many ticks there are between two measurements */
 	freq_down_sampling_rate = dbs_tuners_ins.sampling_rate *
 		dbs_tuners_ins.sampling_down_factor;
-	down_idle_ticks = (100 - dbs_tuners_ins.down_threshold) *
-		usecs_to_jiffies(freq_down_sampling_rate);
-
-	if (idle_ticks > down_idle_ticks) {
-		/* if we are already at the lowest speed then break out early
-		 * or if we 'cannot' reduce the speed as the user might want
-		 * freq_step to be zero */
-		if (policy->cur == policy->min || dbs_tuners_ins.freq_step == 0)
-			return;
+	total_ticks = usecs_to_jiffies(freq_down_sampling_rate);
 
-		freq_down_step = (dbs_tuners_ins.freq_step * policy->max) / 100;
-
-		/* max freq cannot be less than 100. But who knows.... */
-		if (unlikely(freq_down_step == 0))
-			freq_down_step = 5;
+	/*
+	 * The optimal frequency is the frequency that is the lowest that
+	 * can support the current CPU usage without triggering the up
+	 * policy. To be safe, we focus 10 points under the threshold.
+	 */
+	freq_next = ((total_ticks - idle_ticks) * 100) / total_ticks;
+	freq_next = (freq_next * policy->cur) / 
+			(dbs_tuners_ins.up_threshold - 10);
 
-		__cpufreq_driver_target(policy,
-			policy->cur - freq_down_step,
-			CPUFREQ_RELATION_H);
-		return;
-	}
+	if (freq_next <= ((policy->cur * 95) / 100))
+		__cpufreq_driver_target(policy, freq_next, CPUFREQ_RELATION_L);
 }
 
 static void do_dbs_timer(void *data)
@@ -487,7 +421,6 @@ static int cpufreq_governor_dbs(struct c
 					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
 			dbs_tuners_ins.sampling_rate = def_sampling_rate;
 			dbs_tuners_ins.ignore_nice = 0;
-			dbs_tuners_ins.freq_step = 5;
 
 			dbs_timer_init();
 		}
