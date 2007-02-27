From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [Bug 8081] Conservative governor sets wrong and too high
 sampling rates
Date: Tue, 27 Feb 2007 20:27:44 +0100
Message-ID: <45E48630.7060708@interia.pl>
References: <JE4E69$34CFDAE2EA17565934BFEA5A3CDD1785@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <JE4E69$34CFDAE2EA17565934BFEA5A3CDD1785@libero.it>
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
Cc: cpufreq@lists.linux.org.uk

> [...]
> Correcting that line of code I mentioned above one can choose a value between 0.0995 seconds and 9.95. I don't know what should I do with a maximum of 99.5...
Me too, but maybe there is someone using it. I don't see the reason to touch it.
> I hope we can agree a little on this... If you want the kernel 
> set a default value of 1 second ok, but let users free to set it 
> to a vrey lower value decreasing the value contained in sampling_rate_min.
I agree.
> [...]
> fan starts very rarely also with my version of conservative, ondemand, yes, makes it start for too much time.
> Why don't you try?
Current value is good for me.
>> [...]
> If the load is constant (as you said, when compiling) conservative increases 
> frequency, but it takes ten second to pass from 400 Mhz to 2133, 
> it's too much... The governor works but I think it's not very useful 
> for a desktop use if I am not free to set a sampling rate lower than a second...
It takes ten seconds for me too (66MHz step). It isn't probem for me. 
>> You are changing *default* value. If You don't like min value then change 
>> min value. I disagree with Your change because You are changing *powersaver* 
>> governor into step-by-step ondemand.
> 
> If you think, the default value can remain the same, 1 or 2 seconds as now, 
> but I would have the opportunity to set it to 0.1 seconds for example, while 
> my sampling_rate_min is 995000, it is not possible in this condition! 
> A conservative governor with the possibility to choose a lower sampling 
> rate could be useful. As you said, it would be a step-by-step ondemand.
OK. Patch below is touching only min value. It is for 2.6.20. Is it sufficent?
---
 drivers/cpufreq/cpufreq_conservative.c |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

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
@@ -510,10 +509,14 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 
 			def_sampling_rate = 10 * latency *
 					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
-
 			if (def_sampling_rate < MIN_STAT_SAMPLING_RATE)
 				def_sampling_rate = MIN_STAT_SAMPLING_RATE;
 
+			min_sampling_rate = latency *
+					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
+			if (min_sampling_rate < MIN_STAT_SAMPLING_RATE)
+				min_sampling_rate = MIN_STAT_SAMPLING_RATE;
+
 			dbs_tuners_ins.sampling_rate = def_sampling_rate;
 
 			dbs_timer_init();

----------------------------------------------------------------------
Oficjalne konto pocztowe europejskich internautow! 
>>> http://link.interia.pl/f19e8
