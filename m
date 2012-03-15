From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 2/6] CPUFREQ: Fix exposure of ARM_EXYNOS4210_CPUFREQ
Date: Thu, 15 Mar 2012 10:29:39 +0000
Message-ID: <E1S87wB-0000Mq-MM@rmk-PC.arm.linux.org.uk>
References: <20120315102845.GB16389@n2100.arm.linux.org.uk>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Date:Sender:Message-Id:Subject:Cc:Cc:From:References:In-Reply-To; bh=EukSGgl0VM3dXjioMl8nRd7GqjteOLoUdgtAGvtWCfA=;
	b=E5soIMG1gaBGI0R5zZ0t5p//H13lhuSFkTz0ZlBOroLJaGuyvqta8FTUX3H85h/cNcmpEwe569+R0ksB+vJn0dEGtCrI7eDbV8b1htmh0qtwNSAEAAssGFbh/kK2PDQL96nOOeNRaCra5LY4yF8N0dZulMAzvV4bAw6cYcMwaRM=;
In-Reply-To: <20120315102845.GB16389@n2100.arm.linux.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

exynos4210-cpufreq.c is not buildable on non-exynos builds, so it's
pointless allowing this option to be exposed.  Fix this by adding a
dependency on ARCH_EXYNOS.

drivers/cpufreq/exynos4210-cpufreq.c:20:29: error: mach/regs-clock.h: No such file or directory
drivers/cpufreq/exynos4210-cpufreq.c:21:26: error: mach/cpufreq.h: No such file or directory

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 drivers/cpufreq/Kconfig.arm |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index e0664fe..c8bde43 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -34,6 +34,7 @@ config ARM_EXYNOS_CPUFREQ
 
 config ARM_EXYNOS4210_CPUFREQ
 	bool "Samsung EXYNOS4210"
+	depends on ARCH_EXYNOS
 	help
 	  This adds the CPUFreq driver for Samsung EXYNOS4210
 	  SoC (S5PV310 or S5PC210).
-- 
1.7.4.4

