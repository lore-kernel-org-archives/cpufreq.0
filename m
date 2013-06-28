From: Nell Hardcastle <nell@spicious.com>
Subject: [PATCH] intel_pstate: Add Haswell CPU models
Date: Fri, 28 Jun 2013 05:24:39 -0700
Message-ID: <51CD8087.7030303@spicious.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org
Cc: dirk.j.brandewie@intel.com

Enable the intel_pstate driver for Haswell CPUs and one Ivy Bridge model not already included (0x3E). I've been testing this change on the Core i5-4200u (model 0x45) and I referenced the list of models in tools/power/x86/turbostat/turbostat.c:has_nehalem_turbo_ratio_limit to determine the others.

Fixes https://bugzilla.kernel.org/show_bug.cgi?id=60211

Signed-off-by: Nell Hardcastle <nell@spicious.com>
---
 drivers/cpufreq/intel_pstate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 07f2840..dbd1032 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -522,6 +522,11 @@ static const struct x86_cpu_id intel_pstate_cpu_ids[] = {
 	ICPU(0x2a, default_policy),
 	ICPU(0x2d, default_policy),
 	ICPU(0x3a, default_policy),
+	ICPU(0x3c, default_policy),
+	ICPU(0x3e, default_policy),
+	ICPU(0x3f, default_policy),
+	ICPU(0x45, default_policy),
+	ICPU(0x46, default_policy),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, intel_pstate_cpu_ids);
-- 
1.8.3.1
