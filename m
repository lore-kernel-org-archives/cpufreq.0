From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH] ondemand governor : avoid too high frequency for stats
Date: Fri, 19 Aug 2005 19:04:58 +0200
Message-ID: <4306113A.9060301@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070500010509050600060503"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
To: venkatesh.pallipadi@intel.com
Cc: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------070500010509050600060503
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

In the ondemand governor, there is a periodic measurement of the CPU=20
usage. This CPU usage is updated by the scheduler after every tick=20
(basically, by adding 1 either to "idle" or to "user" or to "system").=20
So if the frequency of the governor is too high, the stat will be=20
meaningless (as mostly no number have changed).

So this patch checks that the measurements are separated by at least 10=20
ticks. It means that by default, stats will have about 5% error (20=20
ticks). Of course those numbers can be argued but, IMHO, they look sane.=20
The patch also includes a small clean-up to check more explictly the=20
result of the conversion from ns to =C2=B5s being null.

Let's note that (on x86) this has never been really needed before 2.6.13=20
because HZ was always 1000. Now that HZ can be 100, some CPU might be=20
affected by this problem. For instance, the centrino which has a 10=C2=B5=
s=20
transition latency would lead to the governor allowing to read stats=20
every tick (10ms)!

Please apply,
Eric Piel

--
From: Eric Piel <eric.piel@tremplin-utc.net>

Avoid the ondemand cpufreq goveror to use a too high frequency for stats.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
--

--------------070500010509050600060503
Content-Type: text/x-patch;
	name="ondemand-stat-at-least-10-ticks-2.6.13-rc6.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="ondemand-stat-at-least-10-ticks-2.6.13-rc6.patch"

--- linux-2.6.13-rc6/drivers/cpufreq/cpufreq_ondemand.c.bak	2005-08-18 16:54:45.000000000 +0200
+++ linux-2.6.13-rc6/drivers/cpufreq/cpufreq_ondemand.c	2005-08-18 17:46:31.000000000 +0200
@@ -48,7 +48,10 @@
  * All times here are in uS.
  */
 static unsigned int 				def_sampling_rate;
-#define MIN_SAMPLING_RATE			(def_sampling_rate / 2)
+#define MIN_SAMPLING_RATE_RATIO			(2)
+/* for correct statistics, we need at least 10 ticks between each measure */
+#define MIN_STAT_SAMPLING_RATE			(MIN_SAMPLING_RATE_RATIO * jiffies_to_usecs(10))
+#define MIN_SAMPLING_RATE			(def_sampling_rate / MIN_SAMPLING_RATE_RATIO)
 #define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
 #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
 #define DEF_SAMPLING_DOWN_FACTOR		(1)
@@ -416,13 +419,16 @@ static int cpufreq_governor_dbs(struct c
 		if (dbs_enable == 1) {
 			unsigned int latency;
 			/* policy latency is in nS. Convert it to uS first */
+			latency = policy->cpuinfo.transition_latency / 1000;
+			if (latency == 0)
+				latency = 1;
 
-			latency = policy->cpuinfo.transition_latency;
-			if (latency < 1000)
-				latency = 1000;
-
-			def_sampling_rate = (latency / 1000) *
+			def_sampling_rate = latency *
 					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
+
+			if (def_sampling_rate < MIN_STAT_SAMPLING_RATE)
+				def_sampling_rate = MIN_STAT_SAMPLING_RATE;
+
 			dbs_tuners_ins.sampling_rate = def_sampling_rate;
 			dbs_tuners_ins.ignore_nice = 0;
 

--------------070500010509050600060503
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------070500010509050600060503--

