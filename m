From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH] keep ignore_nice_load value when the ondemand govenor is
 reselected
Date: Fri, 10 Mar 2006 11:35:27 +0200
Message-ID: <4411485F.1010401@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010503020202090107000900"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Dave Jones <davej@redhat.com>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>

This is a multi-part message in MIME format.
--------------010503020202090107000900
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

With the ondemand governor, ignore_nice_load is reset each time the 
governor is selected. That's annoying because each time I change to 
another governor and change back to ondemand, I also have to set up 
ignore_nice_load. eg:
# cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/ignore_nice_load
1
# cpufreq-set -g powersave
# cpufreq-set -g ondemand
# cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/ignore_nice_load
0

This behavior is also inconsistent with the other variables of 
/sys/devices/system/cpu/cpu0/cpufreq/ondemand/

Attached is a patch that corrects the behavior.

see you,
Eric

---
From: Eric Piel <eric.piel@tremplin-utc.net>

Keep the value of ignore_nice_load of the ondemand governor even after 
the governor has been deselected and selected back. This is the behavior 
of the other exported values of the ondemand governor and it's much more 
user-friendly.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>


--------------010503020202090107000900
Content-Type: text/x-patch;
	name="cpufreq-ondemand-keep-ignore-nice-load-setting-2.6.16.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="cpufreq-ondemand-keep-ignore-nice-load-setting-2.6.16.patch"

--- linux-2.6.16-rc5.bak/drivers/cpufreq/cpufreq_ondemand.c	2006-03-03 22:10:26.000000000 +0100
+++ linux-2.6.16-rc5/drivers/cpufreq/cpufreq_ondemand.c	2006-03-03 21:58:58.000000000 +0100
@@ -84,6 +84,7 @@ struct dbs_tuners {
 static struct dbs_tuners dbs_tuners_ins = {
 	.up_threshold 		= DEF_FREQUENCY_UP_THRESHOLD,
 	.sampling_down_factor 	= DEF_SAMPLING_DOWN_FACTOR,
+	.ignore_nice		= 0,
 };
 
 static inline unsigned int get_cpu_idle_time(unsigned int cpu)
@@ -431,8 +432,6 @@ static int cpufreq_governor_dbs(struct c
 				def_sampling_rate = MIN_STAT_SAMPLING_RATE;
 
 			dbs_tuners_ins.sampling_rate = def_sampling_rate;
-			dbs_tuners_ins.ignore_nice = 0;
-
 			dbs_timer_init();
 		}
 		

--------------010503020202090107000900
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------010503020202090107000900--

