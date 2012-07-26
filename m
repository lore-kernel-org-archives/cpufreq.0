From: Andre Przywara <andre.przywara@amd.com>
Subject: [PATCH 2/8] acpi-cpufreq: Add quirk to disable _PSD usage on all AMD CPUs
Date: Thu, 26 Jul 2012 14:28:38 +0200
Message-ID: <1343305724-2809-3-git-send-email-andre.przywara@amd.com>
References: <1343305724-2809-1-git-send-email-andre.przywara@amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1343305724-2809-1-git-send-email-andre.przywara@amd.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Renninger <trenn@suse.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@amd.com>

To workaround some Windows specific behavior, the ACPI _PSD table
on AMD desktop boards advertises all cores as dependent, meaning
that they all can only use the same P-state. acpi-cpufreq strictly
obeys this description, instantiating one CPU only and symlinking
the others. But the hardware can have distinct frequencies for each
core and powernow-k8 did it that way.
So, in order to use the hardware to its full potential and keep the
original powernow-k8 behavior, lets override the _PSD table setting
on AMD hardware.
We use the siblings table, as it matches the current hardware
behavior.

Signed-off-by: Andre Przywara <andre.przywara@amd.com>
---
 drivers/cpufreq/acpi-cpufreq.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 067a61f..ea949b8 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -586,6 +586,14 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 		policy->shared_type = CPUFREQ_SHARED_TYPE_ALL;
 		cpumask_copy(policy->cpus, cpu_core_mask(cpu));
 	}
+
+	if (check_amd_hwpstate_cpu(cpu) && !acpi_pstate_strict) {
+		cpumask_clear(policy->cpus);
+		cpumask_set_cpu(cpu, policy->cpus);
+		cpumask_copy(policy->related_cpus, cpu_sibling_mask(cpu));
+		policy->shared_type = CPUFREQ_SHARED_TYPE_HW;
+		pr_info_once("overriding _PSD data for CPU %d\n", cpu);
+	}
 #endif
 
 	/* capability check */
-- 
1.7.4.4


