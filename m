From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 06/92] cpufreq: cpu0: Use generic cpufreq routines
Date: Thu,  3 Oct 2013 20:28:00 +0530
Message-ID: <476cf3427ef5f450a4d7fd8558dc5b4070533c48.1380783079.git.viresh.kumar@linaro.org>
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

Most of the CPUFreq drivers do similar things in .exit() and .verify() routines
and .attr. So its better if we have generic routines for them which can be used
by cpufreq drivers then.

This patch uses these generic routines for this driver.

Acked-by: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq-cpu0.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
index b24f8c4..ecea8fc 100644
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@ -30,11 +30,6 @@ static struct clk *cpu_clk;
 static struct regulator *cpu_reg;
 static struct cpufreq_frequency_table *freq_table;
 
-static int cpu0_verify_speed(struct cpufreq_policy *policy)
-{
-	return cpufreq_frequency_table_verify(policy, freq_table);
-}
-
 static unsigned int cpu0_get_speed(unsigned int cpu)
 {
 	return clk_get_rate(cpu_clk) / 1000;
@@ -148,27 +143,15 @@ static int cpu0_cpufreq_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int cpu0_cpufreq_exit(struct cpufreq_policy *policy)
-{
-	cpufreq_frequency_table_put_attr(policy->cpu);
-
-	return 0;
-}
-
-static struct freq_attr *cpu0_cpufreq_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
-	NULL,
-};
-
 static struct cpufreq_driver cpu0_cpufreq_driver = {
 	.flags = CPUFREQ_STICKY,
-	.verify = cpu0_verify_speed,
+	.verify = cpufreq_generic_frequency_table_verify,
 	.target = cpu0_set_target,
 	.get = cpu0_get_speed,
 	.init = cpu0_cpufreq_init,
-	.exit = cpu0_cpufreq_exit,
+	.exit = cpufreq_generic_exit,
 	.name = "generic_cpu0",
-	.attr = cpu0_cpufreq_attr,
+	.attr = cpufreq_generic_attr,
 };
 
 static int cpu0_cpufreq_probe(struct platform_device *pdev)
-- 
1.7.12.rc2.18.g61b472e

