From: Jungseok Lee <jays.lee@samsung.com>
Subject: [PATCH] cpufreq: exynos: Show a list of available frequencies
Date: Fri, 11 Oct 2013 14:21:14 +0900
Message-ID: <00bd01cec641$b4dbf150$1e93d3f0$%lee@samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
Content-language: ko
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rjw@sisk.pl, viresh.kumar@linaro.org, amit.daniel@samsung.com
Cc: linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, kgene.kim@samsung.com

This patch adds freq_attr to show a list of exynos5440 scaling
available frequencies through sysfs. Common exynos driver already
supports this attribute.

Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
---
 drivers/cpufreq/exynos5440-cpufreq.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/cpufreq/exynos5440-cpufreq.c b/drivers/cpufreq/exynos5440-cpufreq.c
index 24df155..2cc4797 100644
--- a/drivers/cpufreq/exynos5440-cpufreq.c
+++ b/drivers/cpufreq/exynos5440-cpufreq.c
@@ -345,6 +345,11 @@ static int exynos_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 	return 0;
 }
 
+static struct freq_attr *exynos_cpufreq_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
 static struct cpufreq_driver exynos_driver = {
 	.flags		= CPUFREQ_STICKY,
 	.verify		= exynos_verify_speed,
@@ -353,6 +358,7 @@ static struct cpufreq_driver exynos_driver = {
 	.init		= exynos_cpufreq_cpu_init,
 	.exit		= exynos_cpufreq_cpu_exit,
 	.name		= CPUFREQ_NAME,
+	.attr		= exynos_cpufreq_attr,
 };
 
 static const struct of_device_id exynos_cpufreq_match[] = {
-- 
1.7.10.4


