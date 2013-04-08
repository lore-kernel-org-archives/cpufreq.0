From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V6 4/4] arm: dts: Add cpufreq controller node for Exynos5440 SoC
Date: Mon,  8 Apr 2013 13:47:38 +0530
Message-ID: <1365409058-32643-5-git-send-email-amit.daniel@samsung.com>
References: <1365409058-32643-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=YTEgPAMiVVapJwTbF62TL80LTSqHoec5FZRekLfsS28=;
        b=AfBBeolaNDVrU/PhMbfPls3WQ1AMUCWuJg1XS8rb/ZStjdALAIFPnVUq3v4qypN0+U
         EM5mAWL4DFdX3NoEpjSPuwBXXZYvqpKzP5Nk6YunQBEtuCxp5RODUkxqNJ6oLaE5PmDC
         k71QY5wvAQ1tu5qN7iUp/XRHGg+rgutm+twFfOcUXWgFJ7IHnpQASaUHVCDPIYpQFcpJ
         v4lr9ELNGsForlEjtjTW84/dQRhWchKuBoyG7hD0+72VMb2jmPHhE523IsrgMFEBFoat
         mJiMDWDS/gSrgINElU2+ykIOigFHjb96mEqbCFISZ827poMZTcmGYNxHkxccrlkRxVdR
         rFLA==
In-Reply-To: <1365409058-32643-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org, Inderpal Singh <inderpal.singh@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>

Add cpufreq controller device node for Exynos5440 SoC for passing
parameters like controller base address, interrupt and cpufreq
table. This node is added outside cpu0 as this driver is now a platform
driver and a new device structure is needed.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael J. Wysocki <rjw@sisk.pl>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 9a99755..94074ea 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -63,6 +63,18 @@
 
 	};
 
+	cpufreq@160000 {
+		compatible = "samsung,exynos5440-cpufreq";
+		reg = <0x160000 0x1000>;
+		interrupts = <0 57 0>;
+		operating-points = <
+				/* KHz	  uV */
+				1200000 1025000
+				1000000 975000
+				800000  925000
+		>;
+	};
+
 	serial@B0000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0xB0000 0x1000>;
-- 
1.7.1

