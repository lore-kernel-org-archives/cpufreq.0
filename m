From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] ondemand governor clean-ups
Date: Mon, 07 Feb 2005 22:03:37 +0100
Message-ID: <4207D7A9.807@tremplin-utc.net>
References: <88056F38E9E48644A0F562A38C64FB6003F34484@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090303030604060507050707"
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6003F34484@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@zenii.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>

This is a multi-part message in MIME format.
--------------090303030604060507050707
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Pallipadi, Venkatesh wrote:
>  
> 
> Hi,
> 
> Thanks for the patch. Looks good. Can you also remove the #define for
> sampling_rate_in_HZ, as it is no longer required.
Oops, I had done it but it went wrong when doing the patch. My second 
tried is attached :-)

Eric
> 
>>-----Original Message-----
>>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net] 
>>Sent: Sunday, February 06, 2005 3:06 PM
>>To: Pallipadi, Venkatesh; Nakajima, Jun
>>Cc: cpufreq@ZenII.linux.org.uk
>>Subject: [PATCH] ondemand governor clean-ups
>>
>>Hello,
>>
>>Having a look at the ondemand governor I noticed some possible trivial 
>>and minimal clean-ups.
>>
>>Here they are:
>>- change from sampling_rate_in_HZ() to the official function 
>>usecs_to_jiffies().
>>- use for_each_online_cpu() to instead of using "if (cpu_online(i))"
>>
>>Those are just trivial clean-ups, please apply,
>>Eric
Oops,
--
Trivial ondemand governor clean-ups

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
--

--------------090303030604060507050707
Content-Type: text/x-patch;
 name="ondemand-cleanup-macro-2.6.11-rc3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="ondemand-cleanup-macro-2.6.11-rc3.patch"

--- linux-2.6.11-rc3/drivers/cpufreq/cpufreq_ondemand.c.bak	2005-02-06 23:35:41.000000000 +0100
+++ linux-2.6.11-rc3/drivers/cpufreq/cpufreq_ondemand.c	2005-02-07 21:45:18.000000000 +0100
@@ -57,7 +57,6 @@ static unsigned int 				def_sampling_rat
 #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
 #define DEF_SAMPLING_DOWN_FACTOR		(10)
 #define TRANSITION_LATENCY_LIMIT		(10 * 1000)
-#define sampling_rate_in_HZ(x)			(((x * HZ) < (1000 * 1000))?1:((x * HZ) / (1000 * 1000)))
 
 static void do_dbs_timer(void *data);
 
@@ -281,7 +280,7 @@ static void dbs_check_cpu(int cpu)
 	/* Scale idle ticks by 100 and compare with up and down ticks */
 	idle_ticks *= 100;
 	up_idle_ticks = (100 - dbs_tuners_ins.up_threshold) *
-			sampling_rate_in_HZ(dbs_tuners_ins.sampling_rate);
+			usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
 
 	if (idle_ticks < up_idle_ticks) {
 		__cpufreq_driver_target(policy, policy->max, 
@@ -328,7 +327,7 @@ static void dbs_check_cpu(int cpu)
 	freq_down_sampling_rate = dbs_tuners_ins.sampling_rate *
 		dbs_tuners_ins.sampling_down_factor;
 	down_idle_ticks = (100 - dbs_tuners_ins.down_threshold) *
-			sampling_rate_in_HZ(freq_down_sampling_rate);
+			usecs_to_jiffies(freq_down_sampling_rate);
 
 	if (idle_ticks > down_idle_ticks ) {
 		freq_down_step = (5 * policy->max) / 100;
@@ -348,11 +347,10 @@ static void do_dbs_timer(void *data)
 { 
 	int i;
 	down(&dbs_sem);
-	for (i = 0; i < NR_CPUS; i++)
-		if (cpu_online(i))
-			dbs_check_cpu(i);
+	for_each_online_cpu(i)
+		dbs_check_cpu(i);
 	schedule_delayed_work(&dbs_work, 
-			sampling_rate_in_HZ(dbs_tuners_ins.sampling_rate));
+			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
 	up(&dbs_sem);
 } 
 
@@ -360,7 +358,7 @@ static inline void dbs_timer_init(void)
 {
 	INIT_WORK(&dbs_work, do_dbs_timer, NULL);
 	schedule_delayed_work(&dbs_work,
-			sampling_rate_in_HZ(dbs_tuners_ins.sampling_rate));
+			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
 	return;
 }
 

--------------090303030604060507050707
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------090303030604060507050707--

