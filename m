From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V3 3/4] arm: exynos: Enable OPP library support for exynos5440
Date: Thu,  7 Mar 2013 09:43:46 +0530
Message-ID: <1362629627-10012-3-git-send-email-amit.daniel@samsung.com>
References: <1362629627-10012-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=gNtDwCJSoaxz9hLTCQBP+npVdnloK9A3XMVF7Es3as4=;
        b=JreGOuZxsN0CLkBqNa30/H81GTtNcAQ65nJ1Tdbo0xM7Fu5OPQz2DZ5G3maFwl0WyP
         swskEX1i5AOMXOYLB/mJONcRlBAk3Dc0mT5l/6Rrw86rnQ0mov0LnXHzCzN4fkilqYUs
         Uwpl0LF8rdchuCOiAL6wGxwM+hfoF5ulvfXZOMnc7b2KJDZqvuWLo5oXuBMw6FqTkJFE
         94K4aIqs9JkU2K0pb9zk70V/UvAkNOIjvgjRIHudBUifFxr1SwGhHJWs3hl/05GZJwxU
         P03NiEU+x9q4HRSUA6xZ/BhzUNUPVGHPejt1W83DHmcEOPb7zi/FbPk3oUmBv0BnOC8Q
         Y2qQ==
In-Reply-To: <1362629627-10012-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org, Inderpal Singh <inderpal.singh@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>

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
