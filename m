From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 02/92] cpufreq: acpi: Use generic cpufreq routines
Date: Thu,  3 Oct 2013 20:27:56 +0530
Message-ID: <8dbee6ae00548598f38110ca2e4d818eb0b4ff8c.1380783079.git.viresh.kumar@linaro.org>
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

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/acpi-cpufreq.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index d993211..94a5a1d 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -516,15 +516,6 @@ out:
 	return result;
 }
 
-static int acpi_cpufreq_verify(struct cpufreq_policy *policy)
-{
-	struct acpi_cpufreq_data *data = per_cpu(acfreq_data, policy->cpu);
-
-	pr_debug("acpi_cpufreq_verify\n");
-
-	return cpufreq_frequency_table_verify(policy, data->freq_table);
-}
-
 static unsigned long
 acpi_cpufreq_guess_freq(struct acpi_cpufreq_data *data, unsigned int cpu)
 {
@@ -927,7 +918,7 @@ static struct freq_attr *acpi_cpufreq_attr[] = {
 };
 
 static struct cpufreq_driver acpi_cpufreq_driver = {
-	.verify		= acpi_cpufreq_verify,
+	.verify		= cpufreq_generic_frequency_table_verify,
 	.target		= acpi_cpufreq_target,
 	.bios_limit	= acpi_processor_get_bios_limit,
 	.init		= acpi_cpufreq_cpu_init,
-- 
1.7.12.rc2.18.g61b472e

