From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH][3/3] ondemand governor automatic downscaling
Date: Wed, 11 May 2005 14:31:56 +0200
Message-ID: <4281FB3C.5090400@tremplin-utc.net>
References: <200503140829.04750.lkml@kcore.org>	<42354400.7070500@tremplin-utc.net>	<20050511013334.GB8039@redhat.com>
	<20050511023448.GA25506@redhat.com>
	<4281F837.5070608@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090903040809040100050304"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <4281F837.5070608@tremplin-utc.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@zenii.linux.org.uk, linux@dominikbrodowski.net

This is a multi-part message in MIME format.
--------------090903040809040100050304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This patch has been redone for latest snapshot. Very little differences 
from before, use the usecs_to_jiffies() instead of the old 
sampling_rate_in_HZ() and comments updated.

Eric

--
Here is a new policy for the ondemand governor. The modification 
concerns the frequency downscaling. Instead of decreasing to a lower 
frequency when the CPU usage is under 20%, this new policy automatically 
scales to the optimal frequency. The optimal frequency being the lowest 
frequency which provides enough power to not trigger the upscaling policy.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

--

--------------090903040809040100050304
Content-Type: text/x-patch;
	name="ondemand-automatic-downscaling-2.6.11-20050511.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="ondemand-automatic-downscaling-2.6.11-20050511.patch"

--- linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c.cpufreq-20050501-2	2005-05-11 13:32:14.000000000 +0200
+++ linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c	2005-05-11 14:06:06.000000000 +0200
@@ -34,13 +34,9 @@
  */
 
 #define DEF_FREQUENCY_UP_THRESHOLD		(80)
-#define MIN_FREQUENCY_UP_THRESHOLD		(0)
+#define MIN_FREQUENCY_UP_THRESHOLD		(10)
 #define MAX_FREQUENCY_UP_THRESHOLD		(100)
 
-#define DEF_FREQUENCY_DOWN_THRESHOLD		(20)
-#define MIN_FREQUENCY_DOWN_THRESHOLD		(0)
-#define MAX_FREQUENCY_DOWN_THRESHOLD		(100)
-
 /* 
  * The polling frequency of this governor depends on the capability of 
  * the processor. Default polling frequency is 1000 times the transition
@@ -77,12 +73,10 @@ struct dbs_tuners {
 	unsigned int 		sampling_rate;
 	unsigned int		sampling_down_factor;
 	unsigned int		up_threshold;
-	unsigned int		down_threshold;
 };
 
 static struct dbs_tuners dbs_tuners_ins = {
 	.up_threshold 		= DEF_FREQUENCY_UP_THRESHOLD,
-	.down_threshold 	= DEF_FREQUENCY_DOWN_THRESHOLD,
 	.sampling_down_factor 	= DEF_SAMPLING_DOWN_FACTOR,
 };
 
@@ -114,7 +108,6 @@ static ssize_t show_##file_name						\
 show_one(sampling_rate, sampling_rate);
 show_one(sampling_down_factor, sampling_down_factor);
 show_one(up_threshold, up_threshold);
-show_one(down_threshold, down_threshold);
 
 static ssize_t store_sampling_down_factor(struct cpufreq_policy *unused, 
 		const char *buf, size_t count)
@@ -160,8 +153,7 @@ static ssize_t store_up_threshold(struct
 
 	down(&dbs_sem);
 	if (ret != 1 || input > MAX_FREQUENCY_UP_THRESHOLD || 
-			input < MIN_FREQUENCY_UP_THRESHOLD ||
-			input <= dbs_tuners_ins.down_threshold) {
+			input < MIN_FREQUENCY_UP_THRESHOLD) {
 		up(&dbs_sem);
 		return -EINVAL;
 	}
@@ -172,26 +164,6 @@ static ssize_t store_up_threshold(struct
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
 
 #define define_one_rw(_name) \
 static struct freq_attr _name = \
@@ -200,7 +172,6 @@ __ATTR(_name, 0644, show_##_name, store_
 define_one_rw(sampling_rate);
 define_one_rw(sampling_down_factor);
 define_one_rw(up_threshold);
-define_one_rw(down_threshold);
 
 static struct attribute * dbs_attributes[] = {
 	&sampling_rate_max.attr,
@@ -208,7 +179,6 @@ static struct attribute * dbs_attributes
 	&sampling_rate.attr,
 	&sampling_down_factor.attr,
 	&up_threshold.attr,
-	&down_threshold.attr,
 	NULL
 };
 
@@ -221,8 +191,8 @@ static struct attribute_group dbs_attr_g
 
 static void dbs_check_cpu(int cpu)
 {
-	unsigned int idle_ticks, up_idle_ticks, down_idle_ticks;
-	unsigned int freq_down_step;
+	unsigned int idle_ticks, up_idle_ticks, total_ticks;
+	unsigned int freq_next;
 	unsigned int freq_down_sampling_rate;
 	static int down_skip[NR_CPUS];
 	struct cpu_dbs_info_s *this_dbs_info;
@@ -240,13 +210,13 @@ static void dbs_check_cpu(int cpu)
 	 * Every sampling_rate, we check
 	 * 	- If current idle time is less than 20%, then we try to 
 	 * 	  increase frequency
-	 * Every sampling_rate*sampling_down_factor, we check
-	 * 	- If current idle time is more than 80%, then we try to
-	 * 	  decrease frequency
+	 * Every sampling_rate*sampling_down_factor, we look for a the lowest
+	 * frequency which can sustain the load while keeping idle time over
+	 * 30%. If such a frequency exist, we try to decrease to this frequency.
 	 *
 	 * Any frequency increase takes it to the maximum frequency. 
-	 * Frequency reduction happens at minimum steps of 
-	 * 5% of max_frequency 
+	 * Frequency reduction happens at minimum steps of 5% of current 
+	 * frequency. 
 	 */
 
 	/* Check for frequency increase */
@@ -289,7 +259,12 @@ static void dbs_check_cpu(int cpu)
 	down_skip[cpu]++;
 	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
 		return;
+	down_skip[cpu] = 0;
 
+	/* don't try to decrease the frequency if it's already the min */
+	if (policy->cur == policy->min)
+		return;
+	
 	idle_ticks = UINT_MAX;
 	for_each_cpu_mask(j, policy->cpus) {
 		unsigned int tmp_idle_ticks, total_idle_ticks;
@@ -307,27 +282,21 @@ static void dbs_check_cpu(int cpu)
 			idle_ticks = tmp_idle_ticks;
 	}
 
-	/* Scale idle ticks by 100 and compare with up and down ticks */
-	idle_ticks *= 100;
-	down_skip[cpu] = 0;
-
+ 	/* Compute how many ticks there are between two measurements */
 	freq_down_sampling_rate = dbs_tuners_ins.sampling_rate *
 		dbs_tuners_ins.sampling_down_factor;
-	down_idle_ticks = (100 - dbs_tuners_ins.down_threshold) *
-			usecs_to_jiffies(freq_down_sampling_rate);
-
-	if (idle_ticks > down_idle_ticks) {
-		freq_down_step = (5 * policy->max) / 100;
-
-		/* max freq cannot be less than 100. But who knows.... */
-		if (unlikely(freq_down_step == 0))
-			freq_down_step = 5;
-
-		__cpufreq_driver_target(policy,
-			policy->cur - freq_down_step, 
-			CPUFREQ_RELATION_H);
-		return;
-	}
+ 	total_ticks = usecs_to_jiffies(freq_down_sampling_rate);
+ 	
+ 	/* 
+ 	 * The optimal frequency is the frequency that is the lowest that
+ 	 * can support the current CPU usage without triggering 
+ 	 * the up policy. To be safe, we focus 10 points under the threshold.
+ 	 */
+ 	freq_next = ((total_ticks - idle_ticks) * 100) / total_ticks;
+ 	freq_next = (freq_next * policy->cur) / (dbs_tuners_ins.up_threshold - 10);
+ 
+ 	if (freq_next <= ((policy->cur * 95) / 100))
+ 		__cpufreq_driver_target(policy, freq_next, CPUFREQ_RELATION_L);
 }
 
 static void do_dbs_timer(void *data)

--------------090903040809040100050304
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------090903040809040100050304--

