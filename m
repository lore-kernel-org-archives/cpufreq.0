From: Matthew Garrett <mjg@redhat.com>
Subject: [PATCH] cpufreq: Handle CPUs with different capabilities in acpi-cpufreq
Date: Wed, 13 Jul 2011 17:58:32 -0400
Message-ID: <1310594312-15966-1-git-send-email-mjg@redhat.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

acpi-cpufreq checks each CPU for aperf/mperf support, but only sets a
global flag. This will cause errors if some CPUs in the system don't
support the feature. Check boot_cpu_has() instead in order to make sure
that all CPUs support it.

Signed-off-by: Matthew Garrett <mjg@redhat.com>
---
 drivers/cpufreq/acpi-cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 596d5dd..56c6c6b 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -655,7 +655,7 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	acpi_processor_notify_smm(THIS_MODULE);
 
 	/* Check for APERF/MPERF support in hardware */
-	if (cpu_has(c, X86_FEATURE_APERFMPERF))
+	if (boot_cpu_has(X86_FEATURE_APERFMPERF))
 		acpi_cpufreq_driver.getavg = cpufreq_get_measured_perf;
 
 	pr_debug("CPU%u - ACPI performance management activated.\n", cpu);
-- 
1.7.6

