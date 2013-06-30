From: Nell Hardcastle <nell@spicious.com>
Subject: [PATCH V2] intel_pstate: Add Haswell CPU models
Date: Sun, 30 Jun 2013 15:58:57 -0700
Message-ID: <51D0B831.3000707@spicious.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org
Cc: linux-pm@vger.kernel.org, dirk.j.brandewie@intel.com

Enable the intel_pstate driver for Haswell CPUs. One missing Ivy Bridge
model (0x3E) is also included. Models referenced from
tools/power/x86/turbostat/turbostat.c:has_nehalem_turbo_ratio_limit

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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

