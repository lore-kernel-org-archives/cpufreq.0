From: Ross Lagerwall <rosslagerwall@gmail.com>
Subject: [PATCH] acpi-cpufreq: set current frequency based on target P-State
Date: Fri, 31 May 2013 20:45:17 +0100
Message-ID: <1370029517-10423-1-git-send-email-rosslagerwall@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=IgohNJtQb4h01Ze+j8iitLP5kRzWkOop7k3TNpRachI=;
        b=0Ffak6Qh2v3RdOT20Jf/+x+VnhrvhQv58U6yhBAre0hZfVCJ8Ny9ZaEVVwugYiYSKm
         TxuaBQhO4pSDN/SRlgbAYtWZJhOLmftUi58rNlqdVkVa/ZDUIjJIsMLujrhC4glgCD9v
         kOFg5BQGkt2edOg70YpwNtn3mEmdZYttx7vftdvc8N3eorIwrfG0LWIo9evUzNTAqGQh
         XWvecHOrBLt4F3T3hx5NBWff8KtfifmyJ5c58/bY2B7ov9vC1Ev5fuaCytgUwMokewQu
         9H2qh6mmb9GMop+Y3QUsly9sMWtThd3ttxed+6dz2T7efoO2GwHKzUl+g8ZyQqqZ/Bq0
         6jqQ==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Andre Przywara <andre.przywara@amd.com>, Matthew Garrett <mjg@redhat.com>, Ross Lagerwall <rosslagerwall@gmail.com>

4b31e774 fixed bug #4634 and caused the driver to always set the
target P-State at least once since the initial P-State may not be the
desired one.  5a1c0228 caused a regression in this behavior.

This fixes the regression by setting policy->cur based on the CPU's
target frequency rather than the CPU's current reported frequency
(which may be different).  This means the P-State will be set initially
if the CPU's target frequency is different from the governor's target
frequency.

This fixes an issue where setting the default governor to performance
wouldn't correctly enable turbo mode on all cores.

Signed-off-by: Ross Lagerwall <rosslagerwall@gmail.com>
---
 drivers/cpufreq/acpi-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 11b8b4b..edc089e 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -347,11 +347,11 @@ static u32 get_cur_val(const struct cpumask *mask)
 	switch (per_cpu(acfreq_data, cpumask_first(mask))->cpu_feature) {
 	case SYSTEM_INTEL_MSR_CAPABLE:
 		cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
-		cmd.addr.msr.reg = MSR_IA32_PERF_STATUS;
+		cmd.addr.msr.reg = MSR_IA32_PERF_CTL;
 		break;
 	case SYSTEM_AMD_MSR_CAPABLE:
 		cmd.type = SYSTEM_AMD_MSR_CAPABLE;
-		cmd.addr.msr.reg = MSR_AMD_PERF_STATUS;
+		cmd.addr.msr.reg = MSR_AMD_PERF_CTL;
 		break;
 	case SYSTEM_IO_CAPABLE:
 		cmd.type = SYSTEM_IO_CAPABLE;
-- 
1.8.3

