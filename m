From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V4 3/4] arm: exynos: Enable OPP library support for exynos5440
Date: Tue, 12 Mar 2013 15:28:18 +0530
Message-ID: <1363082299-10561-4-git-send-email-amit.daniel@samsung.com>
References: <1363082299-10561-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=gNtDwCJSoaxz9hLTCQBP+npVdnloK9A3XMVF7Es3as4=;
        b=bfs9paELIwTGjX9n3EJrdM+RjWbAB0sNPxFHjQ9fDpvT7Jmwo9VgSzOHFkAAwiysAK
         HftUZ5HnyBXXE0WzxkhLdEKlKT7NTpiwRVqttmHCKQPY9tS+IKn1kRvgG/xEMdFSIgjH
         3xaHzcs/5Bvo4KFTzDFVvjXPJtHs8WdCkDoV0DTbFVRyM98EoX9Qta2pUJkRzH/Ai1DK
         bbcFp05r1C3PrjbKohQ3QPnYzvaAEEInTnCtH8UJV7CMzbq/BU2K6bdPwq3bzifHrrSz
         z05eHadU6raJWff11CbD90o6zl5NVoH36DIoBcDTQFI3uTuC1OtvBJ2Fi70YXh/vfCjO
         /g7w==
In-Reply-To: <1363082299-10561-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
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
