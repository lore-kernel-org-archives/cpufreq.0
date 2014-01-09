From: Thomas Abraham <ta.omasab@gmail.com>
Subject: [PATCH 5/6] arm: exynos4-dt: statically add platform device for cpufreq-cpu0 platform driver
Date: Thu,  9 Jan 2014 21:29:24 +0530
Message-ID: <1389283165-17708-6-git-send-email-thomas.ab@samsung.com>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N3+z7UNhvzuLsnF7xk1WjEE1ElXUCxz2jWYEwJM5m7M=;
        b=f3Rnb59OFWT/kAycDprEJbft05uMvifibEjzs+8HPpzygXawNDyjJgf0IunyklJvmb
         leQjCpEmIG6y3/8yDaJI/RqK3QTN83d+w6B/dDsfRQaCDhlplT5DU+lY81lC6hd2Y/gi
         8cZg/8sWl5YzFXpF6ChPKevbCxgYGkNW52WlQ4vOStPEVJlAEmf1W4gB0Gtn2/O8zRmj
         x7ime1AWhICCbmgjJCDIgaDKRxk9WcKsIbqfDmi5rjRv+PGx/mSSKePsaDx7dKsQW2rb
         TzYbTPDMyXG3Daax0MLJLbvZL4cXjebVWuiGupNjHn8IYkZPe72VQigQ4ze2TM2MaP+r
         wEuA==
In-Reply-To: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, shawn.guo@linaro.org, viresh.kumar@linaro.org

In order to use the cpufreq-cpu0 driver on Exynos4 based platforms,
statically add the platform device for cpufreq-cpu0 platform driver.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index d3e54b7..8b8ad41 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -19,11 +19,17 @@
 
 #include "common.h"
 
+static struct platform_device cpufreq_device = {
+	.name		= "cpufreq-cpu0",
+	.id		= -1,
+};
+
 static void __init exynos4_dt_machine_init(void)
 {
 	exynos_cpuidle_init();
 	exynos_cpufreq_init();
 
+	platform_device_register(&cpufreq_device);
 	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
 }
 
-- 
1.6.6.rc2
