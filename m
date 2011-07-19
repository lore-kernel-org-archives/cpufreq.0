From: Donggeun Kim <dg77.kim@samsung.com>
Subject: [PATCH] cpufreq: exynos4210: Show list of available frequencies
Date: Tue, 19 Jul 2011 14:41:57 +0900
Message-ID: <1311054117-11587-1-git-send-email-dg77.kim@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org
Cc: davej@redhat.com, kgene.kim@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-kernel@vger.kernel.org

This patch enables 'scaling_available_frequencies' attribute
showing list of available frequencies.

Signed-off-by: Donggeun Kim <dg77.kim@samsung.com>
Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: KyungMin Park <kyungmin.park@samsung.com>
---
 drivers/cpufreq/exynos4210-cpufreq.c |   23 ++++++++++++++++++++++-
 1 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
index b7c3a84..6f88757 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -464,6 +464,8 @@ static int exynos4_cpufreq_resume(struct cpufreq_policy *policy)
 
 static int exynos4_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
+	int ret;
+
 	policy->cur = policy->min = policy->max = exynos4_getspeed(policy->cpu);
 
 	cpufreq_frequency_table_get_attr(exynos4_freq_table, policy->cpu);
@@ -479,16 +481,35 @@ static int exynos4_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	 */
 	cpumask_setall(policy->cpus);
 
-	return cpufreq_frequency_table_cpuinfo(policy, exynos4_freq_table);
+	ret = cpufreq_frequency_table_cpuinfo(policy, exynos4_freq_table);
+	if (ret)
+		return ret;
+
+	cpufreq_frequency_table_get_attr(exynos4_freq_table, policy->cpu);
+
+	return 0;
 }
 
+static int exynos4_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+{
+	cpufreq_frequency_table_put_attr(policy->cpu);
+	return 0;
+}
+
+static struct freq_attr *exynos4_cpufreq_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
 static struct cpufreq_driver exynos4_driver = {
 	.flags		= CPUFREQ_STICKY,
 	.verify		= exynos4_verify_speed,
 	.target		= exynos4_target,
 	.get		= exynos4_getspeed,
 	.init		= exynos4_cpufreq_cpu_init,
+	.exit		= exynos4_cpufreq_cpu_exit,
 	.name		= "exynos4_cpufreq",
+	.attr		= exynos4_cpufreq_attr,
 #ifdef CONFIG_PM
 	.suspend	= exynos4_cpufreq_suspend,
 	.resume		= exynos4_cpufreq_resume,
-- 
1.7.4.1

