From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V5 3/4] arm: exynos: Enable OPP library support for exynos5440
Date: Thu, 28 Mar 2013 13:35:21 +0530
Message-ID: <1364457923-8499-4-git-send-email-amit.daniel@samsung.com>
References: <1364457923-8499-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=gNtDwCJSoaxz9hLTCQBP+npVdnloK9A3XMVF7Es3as4=;
        b=ptEwSLQjPr1ftIHdvtI62oTkF6SVw9jNpUoFZNjJXSmO2U+C6eBBPW7dtIhsyDpjCM
         PTK0gjWVFuayN6Ij+rx3SrpMYZxX2AFsIHp4NEf0LnTuJUpSA2gXEwX6wniIk/mdqXkO
         AOt6a3v5lI3qDpab/Pem5+eZa3xuZlpgBdwmXnstLvFRyksL+ZxvuOL6fwY+cxT9Perp
         LdUX+CYhUrFJlpP9kZ1yIKPoB47Rrjv5kKn/FuwxAzz1xn0FKA+Hm9pa1Bb1J2nX/qk4
         yW4t9RGBOcvRCZfySMTFp0JmK3fpYZ3A+UhqXliOM/c6dXbXA+SFyQ0WQ0s1h8RFOxc2
         FWxw==
In-Reply-To: <1364457923-8499-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org, Inderpal Singh <inderpal.singh@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>

The OPP library support is needed for exynos5440 cpu frequency
dynamic scaling driver.

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

