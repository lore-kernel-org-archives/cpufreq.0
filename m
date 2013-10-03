From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 79/92] cpufreq: exynos: use cpufreq_generic_init() routine
Date: Thu,  3 Oct 2013 20:29:13 +0530
Message-ID: <f586043980195f6c199bcef3d1bf010de2e11ddb.1380783079.git.viresh.kumar@linaro.org>
References: <cover.1380783079.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1380783079.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1380783079.git.viresh.kumar@linaro.org>
References: <cover.1380783079.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

Use generic cpufreq_generic_init() routine instead of replicating the same code
here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/exynos-cpufreq.c     |  7 +------
 drivers/cpufreq/exynos5440-cpufreq.c | 14 ++------------
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 5244086..b96fcc8 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -241,12 +241,7 @@ static struct notifier_block exynos_cpufreq_nb = {
 
 static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	/* set the transition latency value */
-	policy->cpuinfo.transition_latency = 100000;
-
-	cpumask_setall(policy->cpus);
-
-	return cpufreq_table_validate_and_show(policy, exynos_info->freq_table);
+	return cpufreq_generic_init(policy, exynos_info->freq_table, 100000);
 }
 
 static struct cpufreq_driver exynos_driver = {
diff --git a/drivers/cpufreq/exynos5440-cpufreq.c b/drivers/cpufreq/exynos5440-cpufreq.c
index 9b7fdec..06b73e8 100644
--- a/drivers/cpufreq/exynos5440-cpufreq.c
+++ b/drivers/cpufreq/exynos5440-cpufreq.c
@@ -318,18 +318,8 @@ static void exynos_sort_descend_freq_table(void)
 
 static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	int ret;
-
-	ret = cpufreq_table_validate_and_show(policy, dvfs_info->freq_table);
-	if (ret) {
-		dev_err(dvfs_info->dev, "Invalid frequency table: %d\n", ret);
-		return ret;
-	}
-
-	policy->cpuinfo.transition_latency = dvfs_info->latency;
-	cpumask_setall(policy->cpus);
-
-	return 0;
+	return cpufreq_generic_init(policy, dvfs_info->freq_table,
+			dvfs_info->latency);
 }
 
 static struct cpufreq_driver exynos_driver = {
-- 
1.7.12.rc2.18.g61b472e

