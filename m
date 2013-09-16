From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 06/44] cpufreq: arm_big_little: use cpufreq_table_validate_and_show()
Date: Mon, 16 Sep 2013 18:56:08 +0530
Message-ID: <93d548978b2ad6a92ad660ce23f8432f9c41de6f.1379309339.git.viresh.kumar@linaro.org>
References: <cover.1379309339.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1379309339.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1379309339.git.viresh.kumar@linaro.org>
References: <cover.1379309339.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

Lets use cpufreq_table_validate_and_show() instead of calling
cpufreq_frequency_table_cpuinfo() and cpufreq_frequency_table_get_attr().

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/arm_big_little.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/cpufreq/arm_big_little.c b/drivers/cpufreq/arm_big_little.c
index 3549f07..5070273 100644
--- a/drivers/cpufreq/arm_big_little.c
+++ b/drivers/cpufreq/arm_big_little.c
@@ -165,7 +165,7 @@ static int bL_cpufreq_init(struct cpufreq_policy *policy)
 	if (ret)
 		return ret;
 
-	ret = cpufreq_frequency_table_cpuinfo(policy, freq_table[cur_cluster]);
+	ret = cpufreq_table_validate_and_show(policy, freq_table[cur_cluster]);
 	if (ret) {
 		dev_err(cpu_dev, "CPU %d, cluster: %d invalid freq table\n",
 				policy->cpu, cur_cluster);
@@ -173,8 +173,6 @@ static int bL_cpufreq_init(struct cpufreq_policy *policy)
 		return ret;
 	}
 
-	cpufreq_frequency_table_get_attr(freq_table[cur_cluster], policy->cpu);
-
 	if (arm_bL_ops->get_transition_latency)
 		policy->cpuinfo.transition_latency =
 			arm_bL_ops->get_transition_latency(cpu_dev);
-- 
1.7.12.rc2.18.g61b472e

