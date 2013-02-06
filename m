From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH 3/3] dts: Add cpufreq controller node for Exynos5440 SoC
Date: Wed,  6 Feb 2013 11:39:22 -0800
Message-ID: <1360179562-19950-3-git-send-email-amit.daniel@samsung.com>
References: <1360179562-19950-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=EFxPGRzcdoOe0iAcMVZYFji5kxtN+LExPO6123hosmo=;
        b=aQP7VeCywMSML8q4PTZqDL7lrAm4tucDBKca6QXHVofH0PG909cWK9AYL3yJOd8Yht
         kjsTEHVCUpdIyvJgAsgsl10mkjHKBAMoZ/bbDn4V/9wWDMOeH2r1AN4Sw/aTJnwqUpm/
         yxRHGkb+1UVHBBJ4L6aWJl9QzsxEPQ81g7HIHpVlVf08JQWknrWfedZvhezJ8lOPNoiH
         B9/0OfJCGwkS0sv11rEc48O00knotRrXYfn2eit8AZhYT4pKy3kB7ZCK1FH3z0aR0sCa
         SpEbC3OnCxYGioEV+KcIX64+VGlbhJN7bBsSybPSpMMKj+JnbIFDL8AFZ2371DzGJCfc
         zi6Q==
In-Reply-To: <1360179562-19950-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org

Add cpufreq controller device node for Exynos5440 SoC for passing
parameters like controller base address, interrupt and cpufreq
table.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 024269d..b20b517 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -63,6 +63,15 @@
 
 	};
 
+	cpufreq@160000 {
+		compatible = "samsung,exynos5440-cpufreq";
+		reg = <0x160000 0x1000>;
+		interrupts = <0 57 0>;
+		cpufreq_tbl = <	1200000 1025000
+				1000000 975000
+				800000  925000 >;
+	};
+
 	serial@B0000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0xB0000 0x1000>;
-- 
1.7.10.4

