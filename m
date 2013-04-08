From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V6 3/4] arm: exynos: Enable OPP library support for exynos5440
Date: Mon,  8 Apr 2013 13:47:37 +0530
Message-ID: <1365409058-32643-4-git-send-email-amit.daniel@samsung.com>
References: <1365409058-32643-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=G5wNZEGxubEJefR7U5sPAj39cWNldVNOdTOYhDy3KV0=;
        b=afZoVWcZoVYKgn2ZUBTHHgJLN+Jo5aSCl8W7upe6pbEcdi45ezn5PWKs8/RmRyLTx5
         Us1jbK/Qg3496BuS7KNcVNXbuaTlBAGgHqn5xFYIklgt1JSKCxVOEhF8vb6biEWmUDEN
         IvNfoYiOgDKH/U0lQyoL1KO7FfbGI1SoWqN4Ja+1NUlRE38MMOPMe7ADs+zSLQOmgp3w
         /zaKYsf4bxIXILV1d15u5fp735fsZGZ08bWPV8JsRfXjQWNvng2Yxvp92XiZEUvjgWW3
         TbI8m/gJ3JmL7+Tko+EbdK1+l7yKRouc+zio+Kg7cpK2SH9/FhABk5iFaPAti5oROQJi
         b3rw==
In-Reply-To: <1365409058-32643-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org, Inderpal Singh <inderpal.singh@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>

The OPP library support is needed for exynos5440 cpu frequency
dynamic scaling driver.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael J. Wysocki <rjw@sisk.pl>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/mach-exynos/Kconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 70f94c8..d5dde07 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -72,10 +72,12 @@ config SOC_EXYNOS5440
 	bool "SAMSUNG EXYNOS5440"
 	default y
 	depends on ARCH_EXYNOS5
+	select ARCH_HAS_OPP
 	select ARM_ARCH_TIMER
 	select AUTO_ZRELADDR
 	select PINCTRL
 	select PINCTRL_EXYNOS5440
+	select PM_OPP
 	help
 	  Enable EXYNOS5440 SoC support
 
-- 
1.7.1
