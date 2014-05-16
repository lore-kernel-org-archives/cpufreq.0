From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH] cpufreq: cpu0: drop wrong devm usage
Date: Fri, 16 May 2014 12:20:42 +0200
Message-ID: <1400235642-4124-1-git-send-email-l.stach@pengutronix.de>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, kernel@pengutronix.de

This driver is using devres managed calls incorrectly, giving the cpu0
device as first parameter instead of the cpufreq platform device.
This results in resources not being freed if the cpufreq platform device
is unbound, for example if probing has to be deferred for a missing
regulator.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/cpufreq/cpufreq-cpu0.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
index 1bf6bbac3e03..09b9129c7bd3 100644
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@ -130,7 +130,7 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	cpu_reg = devm_regulator_get_optional(cpu_dev, "cpu0");
+	cpu_reg = regulator_get_optional(cpu_dev, "cpu0");
 	if (IS_ERR(cpu_reg)) {
 		/*
 		 * If cpu0 regulator supply node is present, but regulator is
@@ -145,23 +145,23 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
 			PTR_ERR(cpu_reg));
 	}
 
-	cpu_clk = devm_clk_get(cpu_dev, NULL);
+	cpu_clk = clk_get(cpu_dev, NULL);
 	if (IS_ERR(cpu_clk)) {
 		ret = PTR_ERR(cpu_clk);
 		pr_err("failed to get cpu0 clock: %d\n", ret);
-		goto out_put_node;
+		goto out_put_reg;
 	}
 
 	ret = of_init_opp_table(cpu_dev);
 	if (ret) {
 		pr_err("failed to init OPP table: %d\n", ret);
-		goto out_put_node;
+		goto out_put_clk;
 	}
 
 	ret = dev_pm_opp_init_cpufreq_table(cpu_dev, &freq_table);
 	if (ret) {
 		pr_err("failed to init cpufreq table: %d\n", ret);
-		goto out_put_node;
+		goto out_put_clk;
 	}
 
 	of_property_read_u32(np, "voltage-tolerance", &voltage_tolerance);
@@ -216,6 +216,12 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
 
 out_free_table:
 	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
+out_put_clk:
+	if (!IS_ERR(cpu_clk))
+		clk_put(cpu_clk);
+out_put_reg:
+	if (!IS_ERR(cpu_reg))
+		regulator_put(cpu_reg);
 out_put_node:
 	of_node_put(np);
 	return ret;
-- 
2.0.0.rc0

