From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] cpufreq: cpufreq-cpu0: Use devm_regulator_get_optional()
Date: Fri,  9 Aug 2013 19:08:03 +0100
Message-ID: <1376071683-19013-1-git-send-email-broonie@kernel.org>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Since the cpufreq-cpu0 driver is capable of coping without a software
controllable regulator and would be confused by a dummy one it should
use devm_regulator_get_optional() to ensure no dummy is provided.

Signed-off-by: Mark Brown <broonie@linaro.org>
---

devm_regulator_get_optional() is a new API in my tree for -next, is it
OK to merge this patch via that branch?

 drivers/cpufreq/cpufreq-cpu0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
index 09cd3a7..b946ac7 100644
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@ -197,7 +197,7 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
 	cpu_dev = &pdev->dev;
 	cpu_dev->of_node = np;
 
-	cpu_reg = devm_regulator_get(cpu_dev, "cpu0");
+	cpu_reg = devm_regulator_get_optional(cpu_dev, "cpu0");
 	if (IS_ERR(cpu_reg)) {
 		/*
 		 * If cpu0 regulator supply node is present, but regulator is
-- 
1.8.4.rc1

