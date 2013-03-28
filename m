From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V5 4/4] arm: dts: Add cpufreq controller node for Exynos5440 SoC
Date: Thu, 28 Mar 2013 13:35:22 +0530
Message-ID: <1364457923-8499-5-git-send-email-amit.daniel@samsung.com>
References: <1364457923-8499-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=ljEpPIQdLN2UVQfLMt0MqlZsFH/tr8hIsCdIE98E3GA=;
        b=PWNu4inuzICzIiDzSFkvxGsvqR0MV9EGIcDaQDbEw4+Shlit1o4/yKeSM6NaV/b7DX
         7bRRk/aXYQUiZrAlJ5bJg9o6A9em9niu2ee4gBNKhFvJfsFw9c3bxh9FU7UVqxLkb7sU
         Uo1vdUojE6lWxQwgq9t+f+sH5YXZLLoTrFXAkilPHLuf2HzHL0d+/+8ihGfWQuJKz9tl
         ai9WXm4tU91tBNF/un4hxDwgaFzLxwD9aGaiKfNvGN30Lt+He9YJggjwYzTTR/yuLBIp
         H2h0Td8A/WvG4eIkw3LidTSCBjWRW9DGWo0yNpMU2gJqp5i4eqaQBSa5+r8YIVpkYHLF
         qjag==
In-Reply-To: <1364457923-8499-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
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
