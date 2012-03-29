From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] [CPUFREQ] EXYNOS: fix dependency for EXYNOS_CPUFREQ
Date: Thu, 29 Mar 2012 09:51:24 +0900
Message-ID: <1332982284-8143-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer;
        bh=w9oeaeNiH/LlrxVUYL6F+g8JWSN38wkWEPOv42uXjfk=;
        b=Sirrd9YwF3+NSZ8lZQ9NyeKofSN83/KZkEYz7jjVkLqyjqbwJROqQAxCfUdE7HOVjK
         GBT7z5+4ut56urscFTap9AHV4WA14DzF7xO3eFj1z3fPoWlzsfe77VbAsfdgWjiQGw+V
         yp0FnL4YOkokQaKgKesLlb+0qAtIOFZKlUx7JHUGjXl2Jn15HWDyVwhgXDyDBD4ZjX/X
         sOXsbOaEiCxeBtK6aamlcwZHzX9wGuDFcfBkVhKIR8XubFVAV6KqyKlYywYR3mlAF2lS
         IGNXpImtfxF9Nrx8nDXHQ8qB/xQpm5PpnSSzQSZMDysvyy1OS5PiaYk5eB7h20mzc4HO
         PIoA==
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org
Cc: davej@redhat.com, rmk+kernel@arm.linux.org.uk, Kukjin Kim <kgene.kim@samsung.com>

This fixes the CPUFREQ dependency for regarding EXYNOS SoCs
such as EXYNOS4210, EXYNOS4X12 and EXYNOS5250. Its cpufreq
driver should be built with selection of SoC arch part.

Reported-by: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/cpufreq/Kconfig.arm |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 32d790d..ffbb446 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -51,9 +51,6 @@ config ARM_S5PV210_CPUFREQ
 config ARM_EXYNOS_CPUFREQ
 	bool "SAMSUNG EXYNOS SoCs"
 	depends on ARCH_EXYNOS
-	select ARM_EXYNOS4210_CPUFREQ if CPU_EXYNOS4210
-	select ARM_EXYNOS4X12_CPUFREQ if (SOC_EXYNOS4212 || SOC_EXYNOS4412)
-	select ARM_EXYNOS5250_CPUFREQ if SOC_EXYNOS5250
 	default y
 	help
 	  This adds the CPUFreq driver common part for Samsung
@@ -62,20 +59,19 @@ config ARM_EXYNOS_CPUFREQ
 	  If in doubt, say N.
 
 config ARM_EXYNOS4210_CPUFREQ
-	bool "Samsung EXYNOS4210"
-	depends on ARCH_EXYNOS
+	def_bool CPU_EXYNOS4210
 	help
 	  This adds the CPUFreq driver for Samsung EXYNOS4210
 	  SoC (S5PV310 or S5PC210).
 
 config ARM_EXYNOS4X12_CPUFREQ
-	bool "Samsung EXYNOS4X12"
+	def_bool (SOC_EXYNOS4212 || SOC_EXYNOS4412)
 	help
 	  This adds the CPUFreq driver for Samsung EXYNOS4X12
 	  SoC (EXYNOS4212 or EXYNOS4412).
 
 config ARM_EXYNOS5250_CPUFREQ
-	bool "Samsung EXYNOS5250"
+	def_bool SOC_EXYNOS5250
 	help
 	  This adds the CPUFreq driver for Samsung EXYNOS5250
 	  SoC.
-- 
1.7.2.3
