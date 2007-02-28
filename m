From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [Bug 8081] Conservative governor sets wrong and too high
 sampling rates
Date: Wed, 28 Feb 2007 20:39:57 +0100
Message-ID: <45E5DA8D.1020802@interia.pl>
References: <JE5ZRP$B081F2DA00BA3B983E6C3095805551EA@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <JE5ZRP$B081F2DA00BA3B983E6C3095805551EA@libero.it>
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
To: stefano ferri <ferriste@libero.it>
Cc: cpufreq@lists.linux.org.uk, Alexander Clouter <alex-kernel@digriz.org.uk>

> [...]
> With the new code you wrote the governor should satisfy more users. 
> [...]
> So now, if I have a default sampling rate of 199000, the min will be 19900... good
> Oops.. wrong calculus. With the original code of the kernel default is 1990000, 
> min with your patch will be 1/10, so 199000. Could you please align the 
> min values with that of ondemand? (for my processor is 99500). 
> It should be 1/20 of the default, and the min sampling rate 
> that one can set would be about 1/10 of second.
OK. Adjusted. 
>> OK. Patch below is touching only min value. It is for 2.6.20. Is it sufficent?
> 
> Yes, if it will be a change in the next release of the kernel!
If author of this governor will accept it then probably will.

Question to Alexander Clouter:
Is this patch/change acceptable?

---
 drivers/cpufreq/cpufreq_conservative.c |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -49,12 +49,11 @@
  * All times here are in uS.
  */
 static unsigned int 				def_sampling_rate;
+static unsigned int 				min_sampling_rate;
 #define MIN_SAMPLING_RATE_RATIO			(2)
 /* for correct statistics, we need at least 10 ticks between each measure */
 #define MIN_STAT_SAMPLING_RATE			\
 			(MIN_SAMPLING_RATE_RATIO * jiffies_to_usecs(10))
-#define MIN_SAMPLING_RATE			\
-			(def_sampling_rate / MIN_SAMPLING_RATE_RATIO)
 #define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
 #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
 #define DEF_SAMPLING_DOWN_FACTOR		(1)
@@ -125,7 +124,7 @@ static ssize_t show_sampling_rate_max(struct cpufreq_policy *policy, char *buf)
 
 static ssize_t show_sampling_rate_min(struct cpufreq_policy *policy, char *buf)
 {
-	return sprintf (buf, "%u\n", MIN_SAMPLING_RATE);
+	return sprintf (buf, "%u\n", min_sampling_rate);
 }
 
 #define define_one_ro(_name) 					\
@@ -173,7 +172,7 @@ static ssize_t store_sampling_rate(struct cpufreq_policy *unused,
 	ret = sscanf (buf, "%u", &input);
 
 	mutex_lock(&dbs_mutex);
-	if (ret != 1 || input > MAX_SAMPLING_RATE || input < MIN_SAMPLING_RATE) {
+	if (ret != 1 || input > MAX_SAMPLING_RATE || input < min_sampling_rate) {
 		mutex_unlock(&dbs_mutex);
 		return -EINVAL;
 	}
@@ -510,10 +509,13 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 
 			def_sampling_rate = 10 * latency *
 					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
-
 			if (def_sampling_rate < MIN_STAT_SAMPLING_RATE)
 				def_sampling_rate = MIN_STAT_SAMPLING_RATE;
 
+			min_sampling_rate = def_sampling_rate / 20;
+			if (min_sampling_rate < MIN_STAT_SAMPLING_RATE)
+				min_sampling_rate = MIN_STAT_SAMPLING_RATE;
+
 			dbs_tuners_ins.sampling_rate = def_sampling_rate;
 
 			dbs_timer_init();


----------------------------------------------------------------------
Oficjalne konto pocztowe europejskich internautow! 
>>> http://link.interia.pl/f19e8
