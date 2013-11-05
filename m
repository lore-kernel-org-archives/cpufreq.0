From: rjying <rjying@gmail.com>
Subject: [PATCH 1/1] cpufreq: cpufreq-cpu0: use the max voltage instead of voltage-tolerance
Date: Tue,  5 Nov 2013 11:10:14 +0800
Message-ID: <1383621014-11202-1-git-send-email-rongjun.ying@csr.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=jAATKGfBbRyojgNrHptc5CJHRa/e4pi39o2Q2jP0GoE=;
        b=cToYfwsh+KAjsgO4yGOk0O6whFZUkRA12+OJ0H/bl15kzVE2UsjsmQKlku/joo2RzE
         YTgR3XTG69+OMxbKn0o6s7DVmWg8AZxnDhlkUWaQXAIqLGgY1bi7qIXUWpmcat8+EDYz
         t4eTAJJHlmIrEK69+33TVjScgyfuS5PPxHqNCZSyU1O7wYI2d2BaCgL1ZcG3uT/LbpyZ
         xYYbv4QaQgN9vwRn9vV/lXS89v/ECoftZgsjxrJq/qd0Go2XyLbRkJxwogB0AUTxlPfl
         YLuakHfyILZ8abR790t0fRGgtOx9QZwXKzc8XvyiQVNUgAAMPLkib4yK5T57eEDPj3WO
         xMBw==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, rongjun.ying@gcsr.com, Rongjun Ying <rongjun.ying@csr.com>

From: Rongjun Ying <rongjun.ying@csr.com>

Sometime the regulator can't supply appropriate voltages for requestion of cpu.
All voltage tolerance value can't figure out a good voltage.

Signed-off-by: Rongjun Ying <rongjun.ying@csr.com>
---
 drivers/cpufreq/cpufreq-cpu0.c |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
index c522a95..0c9e6b9 100644
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@ -23,7 +23,7 @@
 #include <linux/slab.h>
 
 static unsigned int transition_latency;
-static unsigned int voltage_tolerance; /* in percentage */
+static unsigned int voltage_max;
 
 static struct device *cpu_dev;
 static struct clk *cpu_clk;
@@ -45,7 +45,7 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
 {
 	struct cpufreq_freqs freqs;
 	struct opp *opp;
-	unsigned long volt = 0, volt_old = 0, tol = 0;
+	unsigned long volt = 0, volt_old = 0;
 	long freq_Hz, freq_exact;
 	unsigned int index;
 	int ret;
@@ -82,7 +82,6 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
 		}
 		volt = opp_get_voltage(opp);
 		rcu_read_unlock();
-		tol = volt * voltage_tolerance / 100;
 		volt_old = regulator_get_voltage(cpu_reg);
 	}
 
@@ -92,7 +91,7 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
 
 	/* scaling up?  scale voltage before frequency */
 	if (!IS_ERR(cpu_reg) && freqs.new > freqs.old) {
-		ret = regulator_set_voltage_tol(cpu_reg, volt, tol);
+		ret = regulator_set_voltage(cpu_reg, volt, voltage_max);
 		if (ret) {
 			pr_err("failed to scale voltage up: %d\n", ret);
 			freqs.new = freqs.old;
@@ -104,14 +103,14 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
 	if (ret) {
 		pr_err("failed to set clock rate: %d\n", ret);
 		if (!IS_ERR(cpu_reg))
-			regulator_set_voltage_tol(cpu_reg, volt_old, tol);
+			regulator_set_voltage(cpu_reg, volt_old, voltage_max);
 		freqs.new = freqs.old;
 		goto post_notify;
 	}
 
 	/* scaling down?  scale voltage after frequency */
 	if (!IS_ERR(cpu_reg) && freqs.new < freqs.old) {
-		ret = regulator_set_voltage_tol(cpu_reg, volt, tol);
+		ret = regulator_set_voltage(cpu_reg, volt, voltage_max);
 		if (ret) {
 			pr_err("failed to scale voltage down: %d\n", ret);
 			clk_set_rate(cpu_clk, freqs.old * 1000);
@@ -224,7 +223,11 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
 		goto out_put_node;
 	}
 
-	of_property_read_u32(np, "voltage-tolerance", &voltage_tolerance);
+	ret = of_property_read_u32(np, "voltage-max", &voltage_max);
+	if (ret) {
+		pr_err("failed to get max voltage: %d\n", ret);
+		goto out_put_node;
+	}
 
 	if (of_property_read_u32(np, "clock-latency", &transition_latency))
 		transition_latency = CPUFREQ_ETERNAL;
-- 
1.7.5.4

