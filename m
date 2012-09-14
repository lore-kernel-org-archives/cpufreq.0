From: Michal Pecio <mpecio@nvidia.com>
Subject: [PATCHv2 2/2] cpufreq: conservative: update frequency when limits
 are relaxed
Date: Thu, 13 Sep 2012 21:06:39 -0700
Message-ID: <F22FC3EF73EF0942A7CD99A3AC5E4E1F380C50F194@HQMAIL04.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Thomas Renninger <trenn@suse.de>

From: Michal Pecio <mpecio@nvidia.com>

Reevaluate CPU load and update frequency immediately whenever limits
are changed. Currently conservative doesn't do that when limits are
relaxed, wasting power on systems with relatively low sampling rate.

Signed-off-by: Michal Pecio <mpecio@nvidia.com>
---
 drivers/cpufreq/cpufreq_conservative.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 235a340..f1c6cbe 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -583,6 +583,7 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 			__cpufreq_driver_target(
 					this_dbs_info->cur_policy,
 					policy->min, CPUFREQ_RELATION_L);
+		dbs_check_cpu(this_dbs_info);
 		mutex_unlock(&this_dbs_info->timer_mutex);
 
 		break;
-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
