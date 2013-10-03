From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 17/92] cpufreq: loongson2: Use generic cpufreq routines
Date: Thu,  3 Oct 2013 20:28:11 +0530
Message-ID: <8a7319649e8e366b6f96a772cb58f7adb8c8ca7d.1380783079.git.viresh.kumar@linaro.org>
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
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, John Crispin <blogic@openwrt.org>

Most of the CPUFreq drivers do similar things in .exit() and .verify() routines
and .attr. So its better if we have generic routines for them which can be used
by cpufreq drivers then.

This patch uses these generic routines for this driver.

Cc: John Crispin <blogic@openwrt.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/loongson2_cpufreq.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index cec4e72..ed7fbe2 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -137,12 +137,6 @@ static int loongson2_cpufreq_cpu_init(struct cpufreq_policy *policy)
 					    &loongson2_clockmod_table[0]);
 }
 
-static int loongson2_cpufreq_verify(struct cpufreq_policy *policy)
-{
-	return cpufreq_frequency_table_verify(policy,
-					      &loongson2_clockmod_table[0]);
-}
-
 static int loongson2_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	cpufreq_frequency_table_put_attr(policy->cpu);
@@ -150,19 +144,14 @@ static int loongson2_cpufreq_exit(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static struct freq_attr *loongson2_table_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
-	NULL,
-};
-
 static struct cpufreq_driver loongson2_cpufreq_driver = {
 	.name = "loongson2",
 	.init = loongson2_cpufreq_cpu_init,
-	.verify = loongson2_cpufreq_verify,
+	.verify = cpufreq_generic_frequency_table_verify,
 	.target = loongson2_cpufreq_target,
 	.get = loongson2_cpufreq_get,
 	.exit = loongson2_cpufreq_exit,
-	.attr = loongson2_table_attr,
+	.attr = cpufreq_generic_attr,
 };
 
 static struct platform_device_id platform_device_ids[] = {
-- 
1.7.12.rc2.18.g61b472e

