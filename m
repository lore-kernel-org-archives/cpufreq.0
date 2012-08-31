From: Michal Pecio <mpecio@nvidia.com>
Subject: [PATCH] cpufreq: ondemand: update frequency when limits are relaxed
Date: Fri, 31 Aug 2012 11:09:47 -0700
Message-ID: <F22FC3EF73EF0942A7CD99A3AC5E4E1F380AF6B7BF@HQMAIL04.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>

From: Michal Pecio <mpecio@nvidia.com>

Reevaluate CPU load and update frequency immediately whenever limits 
are changed. Currently ondemand doesn't do so when limits are relaxed,
wasting power on CPUs with relatively low sampling rate.
Also, update the prev_cpu_* variables on frequency transitions. Their
old values aren't valid anymore because the governor assumes constant
frequency during entire sampling period.

Signed-off-by: Michal Pecio <mpecio@nvidia.com>
---

diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index 1aaf7af..8cee63e 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -754,12 +754,7 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 
 	case CPUFREQ_GOV_LIMITS:
 		mutex_lock(&this_dbs_info->timer_mutex);
-		if (policy->max < this_dbs_info->cur_policy->cur)
-			__cpufreq_driver_target(this_dbs_info->cur_policy,
-				policy->max, CPUFREQ_RELATION_H);
-		else if (policy->min > this_dbs_info->cur_policy->cur)
-			__cpufreq_driver_target(this_dbs_info->cur_policy,
-				policy->min, CPUFREQ_RELATION_L);
+		dbs_check_cpu(this_dbs_info);
 		mutex_unlock(&this_dbs_info->timer_mutex);
 		break;
 	}
-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
