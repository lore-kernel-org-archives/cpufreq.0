From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH][RFC] ondemand governor automatic downscaling
Date: Mon, 07 Mar 2005 00:36:01 +0100
Message-ID: <422B93E1.7050604@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090006090109060603020708"
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
To: cpufreq@zenii.linux.org.uk

This is a multi-part message in MIME format.
--------------090006090109060603020708
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Here is a new policy for the ondemand governor. The modification 
concerns the frequency downscaling. Instead of decreasing to a lower 
frequency when the CPU usage is under 20%, this new policy automatically 
scales to the optimal frequency. The optimal frequency being the lowest 
frequency which provides enough power to not trigger the upscaling policy.

An exemple: let's say you are watching a DVD, this takes 40% of the cpu 
usage when frequency is maximum. With the current governor, the 
frequency would be at the maximum, 1Ghz (because when you started the 
player, the cpu usage reached, briefly, 100%). With this new algorithm, 
the optimal frequency is computed. The goal is to have a usage of 70% 
(== 80% minus a delta). Therefore the optimal frequency is 571Mhz, from 
this request we get the closest hardware frequency which is on this 
computer 700Mhz. We've saved 300Mhz.

The beautifulness of this approach is that, in addition to have a 
frequency better fitting the CPU usage, the code is simpler than before 
and, cherry on the cake, there is no need for down_threshold anymore!

Ok, so as you've understood, I'm happy with this new algorithm. It works 
on my computer (speedstep-ich) and it should bring even more conveniency 
with hardware that supports more than 2 frequencies. Does anyone see any 
disavantage in this approach? Venkatesh, what do you think of 
incorporating this new algorithm in the ondemand governor?

Eric

PS: This applies on vanilla 2.6.11, after my two previous patches 
(although they are not technically required).

--
Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>

--------------090006090109060603020708
Content-Type: text/x-patch; name="ondemand-automatic-downscaling-2.6.11.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="ondemand-automatic-downscaling-2.6.11.patch"

--- linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c.factorise-allcpu	2005-03-06 19:30:29.000000000 +0100
+++ linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c	2005-03-06 23:41:03.000000000 +0100
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
@@ -78,12 +74,10 @@ struct dbs_tuners {
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
 
@@ -115,7 +109,6 @@ static ssize_t show_##file_name						\
 show_one(sampling_rate, sampling_rate);
 show_one(sampling_down_factor, sampling_down_factor);
 show_one(up_threshold, up_threshold);
-show_one(down_threshold, down_threshold);
 
 static ssize_t store_sampling_down_factor(struct cpufreq_policy *unused, 
 		const char *buf, size_t count)
@@ -161,8 +154,7 @@ static ssize_t store_up_threshold(struct
 
 	down(&dbs_sem);
 	if (ret != 1 || input > MAX_FREQUENCY_UP_THRESHOLD || 
-			input < MIN_FREQUENCY_UP_THRESHOLD ||
-			input <= dbs_tuners_ins.down_threshold) {
+			input < MIN_FREQUENCY_UP_THRESHOLD) {
 		up(&dbs_sem);
 		return -EINVAL;
 	}
@@ -173,26 +165,6 @@ static ssize_t store_up_threshold(struct
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
@@ -201,7 +173,6 @@ __ATTR(_name, 0644, show_##_name, store_
 define_one_rw(sampling_rate);
 define_one_rw(sampling_down_factor);
 define_one_rw(up_threshold);
-define_one_rw(down_threshold);
 
 static struct attribute * dbs_attributes[] = {
 	&sampling_rate_max.attr,
@@ -209,7 +180,6 @@ static struct attribute * dbs_attributes
 	&sampling_rate.attr,
 	&sampling_down_factor.attr,
 	&up_threshold.attr,
-	&down_threshold.attr,
 	NULL
 };
 
@@ -222,8 +192,8 @@ static struct attribute_group dbs_attr_g
 
 static void dbs_check_cpu(int cpu)
 {
-	unsigned int idle_ticks, up_idle_ticks, down_idle_ticks;
-	unsigned int freq_down_step;
+	unsigned int idle_ticks, up_idle_ticks, total_ticks;
+	unsigned int freq_next;
 	unsigned int freq_down_sampling_rate;
 	static int down_skip[NR_CPUS];
 	struct cpu_dbs_info_s *this_dbs_info;
@@ -290,7 +261,12 @@ static void dbs_check_cpu(int cpu)
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
@@ -308,27 +285,23 @@ static void dbs_check_cpu(int cpu)
 			idle_ticks = tmp_idle_ticks;
 	}
 
-	/* Scale idle ticks by 100 and compare with up and down ticks */
-	idle_ticks *= 100;
-	down_skip[cpu] = 0;
-
+	/* Compute how many ticks there are between two measurements */
 	freq_down_sampling_rate = dbs_tuners_ins.sampling_rate *
 		dbs_tuners_ins.sampling_down_factor;
-	down_idle_ticks = (100 - dbs_tuners_ins.down_threshold) *
-			sampling_rate_in_HZ(freq_down_sampling_rate);
-
-	if (idle_ticks > down_idle_ticks) {
-		freq_down_step = (5 * policy->max) / 100;
-
-		/* max freq cannot be less than 100. But who knows.... */
-		if (unlikely(freq_down_step == 0))
-			freq_down_step = 5;
+	total_ticks = sampling_rate_in_HZ(freq_down_sampling_rate);
+	
+	/* 
+	 * The optimal frequency is the frequency that is the lowest that
+	 * can support the current CPU usage without triggering 
+	 * the up policy. To be safe, we focus 10 points under the threshold.
+	 */
+	freq_next = ((total_ticks - idle_ticks) * 100 * policy->cur) /
+	       		(total_ticks * (dbs_tuners_ins.up_threshold - 10));
 
+	if (freq_next <= ((policy->cur * 95) / 100))
 		__cpufreq_driver_target(policy,
-			policy->cur - freq_down_step, 
-			CPUFREQ_RELATION_H);
-		return;
-	}
+			freq_next, 
+			CPUFREQ_RELATION_L);
 }
 
 static void do_dbs_timer(void *data)

--------------090006090109060603020708
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------090006090109060603020708--

