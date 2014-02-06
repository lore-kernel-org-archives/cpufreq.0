From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/2] cpufreq: imx6q: Drop devm_clk/regulator_get usage
Date: Thu,  6 Feb 2014 16:11:24 +0100
Message-ID: <1391699485-2212-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>

This driver is using devres managed calls incorrectly, giving the cpu0
device as first parameter instead of the cpufreq platform device.
This results in resources not being freed if the cpufreq platform device
is unbound, for example if probing has to be deferred for a missing
regulator. This is currently a theoretical problem since the anatop
regulators are probed earlier, but this might change when adding
support for external switching regulators.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/cpufreq/imx6q-cpufreq.c | 53 ++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index ce69059..b1fc5ef 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -171,25 +171,25 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	arm_clk = devm_clk_get(cpu_dev, "arm");
-	pll1_sys_clk = devm_clk_get(cpu_dev, "pll1_sys");
-	pll1_sw_clk = devm_clk_get(cpu_dev, "pll1_sw");
-	step_clk = devm_clk_get(cpu_dev, "step");
-	pll2_pfd2_396m_clk = devm_clk_get(cpu_dev, "pll2_pfd2_396m");
+	arm_clk = clk_get(cpu_dev, "arm");
+	pll1_sys_clk = clk_get(cpu_dev, "pll1_sys");
+	pll1_sw_clk = clk_get(cpu_dev, "pll1_sw");
+	step_clk = clk_get(cpu_dev, "step");
+	pll2_pfd2_396m_clk = clk_get(cpu_dev, "pll2_pfd2_396m");
 	if (IS_ERR(arm_clk) || IS_ERR(pll1_sys_clk) || IS_ERR(pll1_sw_clk) ||
 	    IS_ERR(step_clk) || IS_ERR(pll2_pfd2_396m_clk)) {
 		dev_err(cpu_dev, "failed to get clocks\n");
 		ret = -ENOENT;
-		goto put_node;
+		goto put_clk;
 	}
 
-	arm_reg = devm_regulator_get(cpu_dev, "arm");
-	pu_reg = devm_regulator_get(cpu_dev, "pu");
-	soc_reg = devm_regulator_get(cpu_dev, "soc");
+	arm_reg = regulator_get(cpu_dev, "arm");
+	pu_reg = regulator_get(cpu_dev, "pu");
+	soc_reg = regulator_get(cpu_dev, "soc");
 	if (IS_ERR(arm_reg) || IS_ERR(pu_reg) || IS_ERR(soc_reg)) {
 		dev_err(cpu_dev, "failed to get regulators\n");
 		ret = -ENOENT;
-		goto put_node;
+		goto put_reg;
 	}
 
 	/*
@@ -202,21 +202,21 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 		ret = of_init_opp_table(cpu_dev);
 		if (ret < 0) {
 			dev_err(cpu_dev, "failed to init OPP table: %d\n", ret);
-			goto put_node;
+			goto put_reg;
 		}
 
 		num = dev_pm_opp_get_opp_count(cpu_dev);
 		if (num < 0) {
 			ret = num;
 			dev_err(cpu_dev, "no OPP table is found: %d\n", ret);
-			goto put_node;
+			goto put_reg;
 		}
 	}
 
 	ret = dev_pm_opp_init_cpufreq_table(cpu_dev, &freq_table);
 	if (ret) {
 		dev_err(cpu_dev, "failed to init cpufreq table: %d\n", ret);
-		goto put_node;
+		goto put_reg;
 	}
 
 	/* Make imx6_soc_volt array's size same as arm opp number */
@@ -302,7 +302,24 @@ soc_opp_out:
 
 free_freq_table:
 	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
-put_node:
+put_reg:
+	if (!IS_ERR(arm_reg))
+		regulator_put(arm_reg);
+	if (!IS_ERR(pu_reg))
+		regulator_put(pu_reg);
+	if (!IS_ERR(soc_reg))
+		regulator_put(soc_reg);
+put_clk:
+	if (!IS_ERR(arm_clk))
+		clk_put(arm_clk);
+	if (!IS_ERR(pll1_sys_clk))
+		clk_put(pll1_sys_clk);
+	if (!IS_ERR(pll1_sw_clk))
+		clk_put(pll1_sw_clk);
+	if (!IS_ERR(step_clk))
+		clk_put(step_clk);
+	if (!IS_ERR(pll2_pfd2_396m_clk))
+		clk_put(pll2_pfd2_396m_clk);
 	of_node_put(np);
 	return ret;
 }
@@ -311,6 +328,14 @@ static int imx6q_cpufreq_remove(struct platform_device *pdev)
 {
 	cpufreq_unregister_driver(&imx6q_cpufreq_driver);
 	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
+	regulator_put(arm_reg);
+	regulator_put(pu_reg);
+	regulator_put(soc_reg);
+	clk_put(arm_clk);
+	clk_put(pll1_sys_clk);
+	clk_put(pll1_sw_clk);
+	clk_put(step_clk);
+	clk_put(pll2_pfd2_396m_clk);
 
 	return 0;
 }
-- 
1.8.5.3

