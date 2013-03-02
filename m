From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V2 3/4] arm: exynos: Enable OPP library support for exynos5440
Date: Sat,  2 Mar 2013 15:04:13 +0530
Message-ID: <1362216854-6633-3-git-send-email-amit.daniel@samsung.com>
References: <1362216854-6633-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
 :in-reply-to:references;
 bh=gNtDwCJSoaxz9hLTCQBP+npVdnloK9A3XMVF7Es3as4=;
 b=PC+zEqicUpht9kS5JmaxNQ+w13h7KnwQPJFe+oApbHMO6+RNM86zo9LKqhH4QYpaN+
 Z9SBgpnQkyAebCNrt3rkNexPiKSd1Bbx9wSPSW+9HKfNpvdE2poHSVe8PYmj0oaXHmQM
 bi3xkt9aS3gfR+YI4KuI5Cmx2FgWaA7L/tAXp+3ut22csBpuG9ErY3bzu0EyLzskXJiz
 mb+ywdR7haPKa57sXkqS6NvcGVOCaVKjVa/yUeHdT8Hpe7vH7AgN8ic3zrSBI6M6Pdcx
 7SK2Q+eml60kYmg+1Dhmo64lESZDsz9cw977169rHAcWTERlw+Klf0DKA7yAI/BWjxtP
 qH8w==
In-Reply-To: <1362216854-6633-1-git-send-email-amit.daniel@samsung.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-pm@vger.kernel.org
Cc: kgene.kim@samsung.com, Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Inderpal Singh <inderpal.singh@linaro.org>, linux-arm-kernel@lists.infradead.org

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
