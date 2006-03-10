From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH] Warn if ondemand governor can not run due to too long
 transition latency
Date: Fri, 10 Mar 2006 11:34:16 +0200
Message-ID: <44114818.4060301@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000502090807090706030808"
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
--------------000502090807090706030808
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

The ondemand governor will not run if the transition latency of the 
driver is more than 10 ms. In such case, the selection of the governor 
will fail _silently_ (for the user). This is quite confusing and, 
indeed, there has already been several reports on this mailing list of 
user considering this as a bug.

So I suggest printing a warning message if this condition is triggered. 
That's what does the attached patch :-)

see you,
Eric

---
From: Eric Piel <eric.piel@tremplin-utc.net>

Display a warning if the ondemand governor can not be selected due to a 
transition latency of the cpufreq driver which is too long.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>

--------------000502090807090706030808
Content-Type: text/x-patch;
	name="cpufreq-ondemand-warn-too-long-transition-latency.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="cpufreq-ondemand-warn-too-long-transition-latency.patch"

--- linux-2.6.16-rc5/drivers/cpufreq/cpufreq_ondemand.c-keep-ignore-nice	2006-03-07 11:07:37.000000000 +0200
+++ linux-2.6.16-rc5/drivers/cpufreq/cpufreq_ondemand.c	2006-03-07 11:11:45.000000000 +0200
@@ -396,8 +396,11 @@ static int cpufreq_governor_dbs(struct c
 			return -EINVAL;
 
 		if (policy->cpuinfo.transition_latency >
-				(TRANSITION_LATENCY_LIMIT * 1000))
+				(TRANSITION_LATENCY_LIMIT * 1000)) {
+			printk(KERN_WARNING "ondemand governor failed to load "
+			       "due to too long transition latency\n");
 			return -EINVAL;
+		}
 		if (this_dbs_info->enable) /* Already enabled */
 			break;
 		 

--------------000502090807090706030808
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------000502090807090706030808--


