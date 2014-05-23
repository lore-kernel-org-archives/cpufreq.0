From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v5 6/7] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Fri, 23 May 2014 19:57:39 +0530
Message-ID: <1400855260-6807-7-git-send-email-thomas.ab@samsung.com>
References: <1400855260-6807-1-git-send-email-thomas.ab@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Xxt38VYPx8jozGVP3svnSOusG4nztf/9O6p5OmOzlHw=;
        b=cclRLa2Syz3H7YLNGxSUbuvmquelXY3Q/FNzAq2p6837ySXwm0pflt2AhACe9fgEnh
         GR45yS4c2Lkazou4Pz3YELvn7Vd7Gx7mzK4Up+6S89diA6c4cW16DBWgp3b8WfxlLLLv
         P4IvLACkoOy8ZfZUcVWeH5382DmuYGYQEkiCkf4LLw+JTyWwKjYgWXWkBaX6kq23L0bL
         aiFmIQHB+MajmJyekMo03uFDwvehNpVlcG/psFow8oAK2c0eaSASr0pk3za2uh2BDNc1
         fcRb4M3HeLcen7yRkhXqaLKDzYki/sfy4j5glm2HGzdxDJ2zLmPM6LlDJMIM8nJxDPGh
         ntZQ==
In-Reply-To: <1400855260-6807-1-git-send-email-thomas.ab@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, shawn.guo@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, thomas.ab@samsung.com, heiko@sntech.de

From: Thomas Abraham <thomas.ab@samsung.com>

Remove the platform device instantiation for Exynos specific cpufreq
driver and add the platform device for cpufreq-cpu0 driver.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos/exynos.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 93507ee..2193061 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -184,7 +184,9 @@ void __init exynos_cpuidle_init(void)
 
 void __init exynos_cpufreq_init(void)
 {
-	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
+	if (!(of_machine_is_compatible("samsung,exynos5420")) &&
+		!(of_machine_is_compatible("samsung,exynos5440")))
+		platform_device_register_simple("cpufreq-cpu0", -1, NULL, 0);
 }
 
 void __init exynos_init_late(void)
-- 
1.7.9.5

