From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH] support for CPUFREQ_ETERNAL drivers by the ondemand governor
Date: Sun, 06 Feb 2005 23:33:49 +0100
Message-ID: <42069B4D.6090505@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070809050905050601030803"
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
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
Cc: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------070809050905050601030803
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

For now the ondemand governor doesn't support the drivers which reports 
a transition latency of CPUFREQ_ETERNAL. That's really a problem because 
most of the drivers declare such a latency (simply because it's not 
known, not really because the transition will take an eternal time). 
All userspace daemons suport those drivers, they just don't pay 
attention to the transition latency.

This patch proposes to consider a CPUFREQ_ETERNAL latency as the maximum 
possible latency of the governor (10 ms). I think this should be 
conservative enough to be safe with any driver.

Hoping you like it,
Eric

--
Support for CPUFREQ_ETERNAL drivers by the ondemand governor.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
--

--------------070809050905050601030803
Content-Type: text/x-patch;
	name="ondemand-accept-eternel-transition-latency-2.6.11-rc3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="ondemand-accept-eternel-transition-latency-2.6.11-rc3.patch"

--- linux-2.6.11-rc3/drivers/cpufreq/cpufreq_ondemand.c.orig	2005-02-05 17:09:30.000000000 +0100
+++ linux-2.6.11-rc3/drivers/cpufreq/cpufreq_ondemand.c	2005-02-05 18:02:55.000000000 +0100
@@ -56,7 +56,7 @@ static unsigned int 				def_sampling_rat
 #define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
 #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
 #define DEF_SAMPLING_DOWN_FACTOR		(10)
-#define TRANSITION_LATENCY_LIMIT		(10 * 1000)
+#define TRANSITION_LATENCY_LIMIT		(10 * 1000 * 1000) /* ns */
 #define sampling_rate_in_HZ(x)			(((x * HZ) < (1000 * 1000))?1:((x * HZ) / (1000 * 1000)))
 
 static void do_dbs_timer(void *data);
@@ -385,8 +385,8 @@ static int cpufreq_governor_dbs(struct c
 		    (!policy->cur))
 			return -EINVAL;
 
-		if (policy->cpuinfo.transition_latency >
-				(TRANSITION_LATENCY_LIMIT * 1000))
+		if ((policy->cpuinfo.transition_latency > TRANSITION_LATENCY_LIMIT) &&
+		    (policy->cpuinfo.transition_latency != CPUFREQ_ETERNAL))
 			return -EINVAL;
 		if (this_dbs_info->enable) /* Already enabled */
 			break;
@@ -416,6 +416,8 @@ static int cpufreq_governor_dbs(struct c
 			/* policy latency is in nS. Convert it to uS first */
 
 			latency = policy->cpuinfo.transition_latency;
+			if (latency == CPUFREQ_ETERNAL)
+				latency = TRANSITION_LATENCY_LIMIT;
 			if (latency < 1000)
 				latency = 1000;
 

--------------070809050905050601030803
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------070809050905050601030803--

