From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 01/44] cpufreq: arm_big_little: call cpufreq_frequency_table_put_attr()
Date: Sat, 10 Aug 2013 12:13:57 +0530
Message-ID: <978bcbe9348cc446c9fe7f94a9c486f04f77a517.1376116345.git.viresh.kumar@linaro.org>
References: <cover.1376116344.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1376116344.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1376116344.git.viresh.kumar@linaro.org>
References: <cover.1376116344.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

Drivers which have an exit path must call cpufreq_frequency_table_put_attr() if
they have called cpufreq_frequency_table_get_attr() in their init path.

This driver was missing this part and is fixed with this patch.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/arm_big_little.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/arm_big_little.c b/drivers/cpufreq/arm_big_little.c
index 5070273..9acfb82 100644
--- a/drivers/cpufreq/arm_big_little.c
+++ b/drivers/cpufreq/arm_big_little.c
@@ -198,6 +198,7 @@ static int bL_cpufreq_exit(struct cpufreq_policy *policy)
 		return -ENODEV;
 	}
 
+	cpufreq_frequency_table_put_attr(policy->cpu);
 	put_cluster_clk_and_freq_table(cpu_dev);
 	dev_dbg(cpu_dev, "%s: Exited, cpu: %d\n", __func__, policy->cpu);
 
-- 
1.7.12.rc2.18.g61b472e

