From: Hans-Christian Egtvedt <egtvedt@samfundet.no>
Subject: [PATCH] cpufreq: add frequency table to at32ap driver
Date: Mon, 12 Aug 2013 21:10:57 +0200
Message-ID: <1376334657-23578-1-git-send-email-egtvedt@samfundet.no>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, viresh.kumar@linaro.org
Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>

This patch adds a dynamically calculated frequency table to the at32ap driver.
In short the architecture can scale in power of two between a maximum and
minimum frequency. Min, max, and the steps in between are added to the table.

Signed-off-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>
---
 drivers/cpufreq/at32ap-cpufreq.c | 47 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/at32ap-cpufreq.c b/drivers/cpufreq/at32ap-cpufreq.c
index 6544887..dbf3f3d 100644
--- a/drivers/cpufreq/at32ap-cpufreq.c
+++ b/drivers/cpufreq/at32ap-cpufreq.c
@@ -19,8 +19,10 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/slab.h>
 
 static struct clk *cpuclk;
+static struct cpufreq_frequency_table *freq_table;
 
 static int at32_verify_speed(struct cpufreq_policy *policy)
 {
@@ -85,13 +87,19 @@ static int at32_set_target(struct cpufreq_policy *policy,
 
 static int __init at32_cpufreq_driver_init(struct cpufreq_policy *policy)
 {
+	unsigned int frequency;
+	int retval;
+	int steps;
+	int i;
+
 	if (policy->cpu != 0)
 		return -EINVAL;
 
 	cpuclk = clk_get(NULL, "cpu");
 	if (IS_ERR(cpuclk)) {
 		pr_debug("cpufreq: could not get CPU clk\n");
-		return PTR_ERR(cpuclk);
+		retval = PTR_ERR(cpuclk);
+		goto out_err;
 	}
 
 	policy->cpuinfo.min_freq = (clk_round_rate(cpuclk, 1) + 500) / 1000;
@@ -101,9 +109,46 @@ static int __init at32_cpufreq_driver_init(struct cpufreq_policy *policy)
 	policy->min = policy->cpuinfo.min_freq;
 	policy->max = policy->cpuinfo.max_freq;
 
+	/*
+	 * AVR32 CPU frequency rate scales in power of two between maximum and
+	 * minimum, also add space for the table end marker.
+	 *
+	 * Further validate that the frequency is usable, and append it to the
+	 * frequency table.
+	 */
+	steps = fls(policy->cpuinfo.max_freq / policy->cpuinfo.min_freq) + 1;
+	freq_table = kzalloc(steps * sizeof(struct cpufreq_frequency_table),
+			GFP_KERNEL);
+	if (!freq_table) {
+		retval = -ENOMEM;
+		goto out_err_put_clk;
+	}
+
+	frequency = policy->cpuinfo.max_freq;
+	for (i = 0; i < (steps - 1); i++) {
+		unsigned int rate = clk_round_rate(cpuclk, frequency * 1000);
+		rate /= 1000;
+		if (rate != frequency)
+			freq_table[i].frequency = CPUFREQ_ENTRY_INVALID;
+		else
+			freq_table[i].frequency = frequency;
+		frequency /= 2;
+	}
+	freq_table[steps - 1].frequency = CPUFREQ_TABLE_END;
+
+	retval = cpufreq_frequency_table_cpuinfo(policy, freq_table);
+	if (retval)
+		goto out_err_kfree;
+
 	printk("cpufreq: AT32AP CPU frequency driver\n");
 
 	return 0;
+out_err_kfree:
+	kfree(freq_table);
+out_err_put_clk:
+	clk_put(cpuclk);
+out_err:
+	return retval;
 }
 
 static struct cpufreq_driver at32_driver = {
-- 
1.8.1.2

