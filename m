From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Fix exposure of ARM_EXYNOS4210_CPUFREQ
Date: Mon, 13 Feb 2012 09:49:40 +0000
Message-ID: <20120213094940.GA15338@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:Content-Type:MIME-Version:Message-ID:Subject:To:From:Date; bh=gdtF0cRNsSfW/5w+5hqi2xy9Bim962lWV3ICMZjqOVY=;
	b=S7u/0Opy5Y6gfjQMp+R8OsljWLFOpyDgL3M8rMYODsVl7GDwWwQns0UA4qPtbd12Fb3L8UKOM+vLLSMqpcuq/kKWbrcf7bHPPhxAyn4Hm5tL6Q1QOG9/T+axFDsgg25FinOjyAohr+yk5456eLe5B220H6KAavvsAxAPVnaqSR0=;
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

From: Russell King <rmk+kernel@arm.linux.org.uk>

exynos4210-cpufreq.c is not buildable on non-exynos builds, so it's
pointless allowing this option to be exposed.  Fix this by adding a
dependency on ARCH_EXYNOS.

drivers/cpufreq/exynos4210-cpufreq.c:20:29: error: mach/regs-clock.h: No such file or directory
drivers/cpufreq/exynos4210-cpufreq.c:21:26: error: mach/cpufreq.h: No such file or directory

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>
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
