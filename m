From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH] Add module aliases for acpi-cpufreq
Date: Tue, 22 Jan 2013 11:42:24 -0500
Message-ID: <1358872944-7676-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bp@alien8.de
Cc: rjw@sisk.pl, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>

The acpi core will call request_module("acpi-cpufreq") on subsystem init,
but this will fail if the module isn't available at that stage of boot.
Add some module aliases to ensure that udev can load the module on Intel
and AMD systems with the appropriate feature bits - I /think/ that this
will also work on VIA systems, but haven't verified that.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/cpufreq/acpi-cpufreq.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 0d048f6..7b0d49d 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -1030,4 +1030,11 @@ MODULE_PARM_DESC(acpi_pstate_strict,
 late_initcall(acpi_cpufreq_init);
 module_exit(acpi_cpufreq_exit);
 
+static const struct x86_cpu_id acpi_cpufreq_ids[] = {
+	X86_FEATURE_MATCH(X86_FEATURE_ACPI),
+	X86_FEATURE_MATCH(X86_FEATURE_HW_PSTATE),
+	{}
+};
+MODULE_DEVICE_TABLE(x86cpu, acpi_cpufreq_ids);
+
 MODULE_ALIAS("acpi");
-- 
1.8.0.2

