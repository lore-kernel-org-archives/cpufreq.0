From: Thomas Abraham <ta.omasab@gmail.com>
Subject: [PATCH 6/6] arm: dts: add cpu nodes for Exynos4210 SoC
Date: Thu,  9 Jan 2014 21:29:25 +0530
Message-ID: <1389283165-17708-7-git-send-email-thomas.ab@samsung.com>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GrLyyj7bdNhO18vJX+5lSByyGWU053WnGJC5EWu6byk=;
        b=FGDV/+/UrJ9uGRBc/Mcm2lj6nbrPy3Xy8NZVEMTHuL09ZSIbImOh+ugiKy2wPmAOa0
         Ut9BfaJ6Kgw3gsb9nUELb/je0pnI57FSbMe1qV1sFxyC19MpETs6eVOiSIJB6Igl6JEd
         5ltX17LroXPku0a2OhVlsa2PstIVvhxqC8Olh3Ykw3AaKGX7iBonMgCa4m+0EwuvHHKP
         +NUDjRiqykzdTzJ+1obrkGkSjToH9onpaAtu9Lz7OPwY9B0UcMqZRWLvil6b7n5zOX33
         6aCzxB1FszYxoBP99uJMMehufLrP91iW/iVTY+Afk8cdGDB+iY/mA3wzmXMYkF+dUY9o
         469w==
In-Reply-To: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, shawn.guo@linaro.org, viresh.kumar@linaro.org

Add CPU nodes for Exynos4210 SoC and also properties required by the
cpufreq-cpu0 driver.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/boot/dts/exynos4210-origen.dts         |    6 ++++++
 arch/arm/boot/dts/exynos4210-trats.dts          |    6 ++++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts |    6 ++++++
 arch/arm/boot/dts/exynos4210.dtsi               |   22 ++++++++++++++++++++++
 4 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 2aa13cb..afecd8f 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -32,6 +32,12 @@
 		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
 	};
 
+	cpus {
+		cpu: cpu@0 {
+			cpu0-supply = <&buck1_reg>;
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 63cc571..25487d7 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -30,6 +30,12 @@
 		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rootwait earlyprintk panic=5";
 	};
 
+	cpus {
+		cpu: cpu@0 {
+			cpu0-supply = <&varm_breg>;
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index d2e3f5f..74d5a70 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -28,6 +28,12 @@
 		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rw rootwait earlyprintk panic=5 maxcpus=1";
 	};
 
+	cpus {
+		cpu: cpu@0 {
+			cpu0-supply = <&vdd_arm_reg>;
+		};
+	};
+
 	mct@10050000 {
 		compatible = "none";
 	};
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 48ecd7a..3db2da8 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -36,6 +36,28 @@
 		reg = <0x10023CA0 0x20>;
 	};
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0>;
+			clocks = <&clock 12>;
+			clock-names = "cpu";
+
+			operating-points = <
+				200000	950000
+				400000	975000
+				500000	975000
+				800000	1075000
+				1000000	1150000
+				1200000	1250000
+			>;
+			safe-opp-index = <3>;
+		};
+	};
+
 	gic: interrupt-controller@10490000 {
 		cpu-offset = <0x8000>;
 	};
-- 
1.6.6.rc2
