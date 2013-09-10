From: tianyu.lan@intel.com
Subject: [Update PATCH 1/1] Cpufreq: Remove fossil comment of cpufreq_set_policy
Date: Tue, 10 Sep 2013 10:53:18 -0400
Message-ID: <1378824798-7983-1-git-send-email-tianyu.lan@intel.com>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, viresh.kumar@linaro.org
Cc: Lan Tianyu <tianyu.lan@intel.com>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

From: Lan Tianyu <tianyu.lan@intel.com>

The cpufreq_set_policy() has been removed by commit 632786c. So remove
related comment.

Signed-off-by: Lan Tianyu <tianyu.lan@intel.com>
---
Update: miss signed-off due to using my new script. Sorry for nosiy. 

 drivers/cpufreq/cpufreq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 5c75e31..a504313 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -506,10 +506,6 @@ static ssize_t store_scaling_governor(struct cpufreq_policy *policy,
 						&new_policy.governor))
 		return -EINVAL;
 
-	/*
-	 * Do not use cpufreq_set_policy here or the user_policy.max
-	 * will be wrongly overridden
-	 */
 	ret = __cpufreq_set_policy(policy, &new_policy);
 
 	policy->user_policy.policy = policy->policy;
-- 
1.8.2.1

