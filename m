From: Thomas Abraham <ta.omasab@gmail.com>
Subject: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Wed, 14 May 2014 06:41:15 +0530
Message-ID: <1400029876-5830-8-git-send-email-thomas.ab@samsung.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EmZzRWTNI4bcYkQwsYxBtQfyy+pjZTjgRjAL8lIuNZs=;
        b=k7Q3Lvv8MXiWc6ehQiTn/UpYs/wYEq9CshPCmVo3kKP4m76+OGU5/y4w7vHOXCTBcz
         KVLN+ECudBMIIKqJTQLzXQtC1eM65YQ9xOMqWxQF4tEuay26t1XsiNN1w5E2ETotoOen
         chiChUi8C/to5KOLdGNOoHwWVDieI+mic6jqIq0hLtl3COy8JNdyjAnCzH0ULy81yxyA
         nlVnr+D4UTiwDI7SD5QAtcauyxG4SHc7XPclb8QyG90Y2YvJGKNYF8voJO+OJGqX/BWm
         lBhabJMsObaX6AWoTgHiYYUPTKbJHrpFWYI7Sn12nDfG52fUNM0kf71oxkJ65gW8KwgJ
         grcA==
In-Reply-To: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, shawn.guo@linaro.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, heiko@sntech.de, thomas.ab@samsung.com

From: Thomas Abraham <thomas.ab@samsung.com>

Remove the platform device instantiation for Exynos specific cpufreq
driver and add the platform device for cpufreq-cpu0 driver.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos/exynos.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index b32a907..489a495 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -232,7 +232,9 @@ void __init exynos_cpuidle_init(void)
 
 void __init exynos_cpufreq_init(void)
 {
-	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
+	if (!(of_machine_is_compatible("samsung,exynos5420")) &&
+		!(of_machine_is_compatible("samsung,exynos5440")))
+		platform_device_register_simple("cpufreq-cpu0", -1, NULL, 0);
 }
 
 void __init exynos_init_late(void)
-- 
1.7.4.4

