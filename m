From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] cpufreq: exynos: allow disabling cpufreq drivers
Date: Fri, 19 Apr 2013 15:54:29 +0200
Message-ID: <201304191554.29679.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <t.figa@samsung.com>, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>

Commit 6e6aac7590 "ARM: EXYNOS: Migrate clock support to common
clock framework" broke support for the exynos cpufreq drivers.
While we're waiting for a fix for this, let's get back to a state
where the kernel builds again with the cpufreq subsystem enabled
but ARM_EXYNOS_CPUFREQ disabled. I assume that this was the intention
behind this Kconfig symbol anyway.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: cpufreq@vger.kernel.org
Cc: Rafael J. Wysocki <rjw@sisk.pl>
---
Rafael, I'm putting this patch into the arm-soc tree now to avoid
a bug based on a patch that I got from Kukjin. If you have any
objections, please let me know so I can revert it again.

Everyone else: Why does 6e6aac7590 have your "Tested-by" and
"Signed-off-by" tags on it when it's obviously broken? Who is
fixing this? Having no working exynos cpufreq support in 3.10
would be a serious regression.

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 030ddf6..2b8862d 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -61,18 +61,21 @@ config ARM_EXYNOS_CPUFREQ
 
 config ARM_EXYNOS4210_CPUFREQ
 	def_bool CPU_EXYNOS4210
+	depends on ARM_EXYNOS_CPUFREQ
 	help
 	  This adds the CPUFreq driver for Samsung EXYNOS4210
 	  SoC (S5PV310 or S5PC210).
 
 config ARM_EXYNOS4X12_CPUFREQ
 	def_bool (SOC_EXYNOS4212 || SOC_EXYNOS4412)
+	depends on ARM_EXYNOS_CPUFREQ
 	help
 	  This adds the CPUFreq driver for Samsung EXYNOS4X12
 	  SoC (EXYNOS4212 or EXYNOS4412).
 
 config ARM_EXYNOS5250_CPUFREQ
 	def_bool SOC_EXYNOS5250
+	depends on ARM_EXYNOS_CPUFREQ
 	help
 	  This adds the CPUFreq driver for Samsung EXYNOS5250
 	  SoC.
