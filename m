From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH/RFC v2 2/2] ARM: shmobile: kzm9g-reference: add CPUFreq
 support
Date: Mon, 25 Feb 2013 18:17:13 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1302251814430.3030@axis700.grange>
References: <Pine.LNX.4.64.1302251644010.3030@axis700.grange>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1302251644010.3030@axis700.grange>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sh@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org

This patch enables the use of the generic cpufreq-cpu0 driver on kzm9g.
Providing a regulator and a list of OPPs in DT, combined with a clock,
attached to the cpu0 device is everything, the cpufreq-cpu0 driver needs.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
---

v2: adjust CPU frequencies in the OPP list according to v2 of patch 1/2.

 arch/arm/boot/dts/sh73a0-kzm9g-reference.dts |   19 ++++++++++++++++---
 arch/arm/mach-shmobile/Kconfig               |    2 ++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts b/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
index d9f6c18..d7f18fd 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
@@ -18,6 +18,19 @@
 	model = "KZM-A9-GT";
 	compatible = "renesas,kzm9g-reference", "renesas,sh73a0";
 
+	cpus {
+		cpu@0 {
+			cpu0-supply = <&vdd_dvfs>;
+			operating-points = <
+				/* kHz  uV */
+				1196000 1315000
+				 598000 1175000
+				 398667 1065000
+			>;
+			voltage-tolerance = <1>; /* 1% */
+		};
+	};
+
 	chosen {
 		bootargs = "console=tty0 console=ttySC4,115200 root=/dev/nfs ip=dhcp ignore_loglevel earlyprintk=sh-sci.4,115200";
 	};
@@ -118,10 +131,10 @@
 		reg = <0x40>;
 
 		regulators {
-			sd1 {
+			vdd_dvfs: sd1 {
 				regulator-name = "1.315V CPU";
-				regulator-min-microvolt = <1315000>;
-				regulator-max-microvolt = <1335000>;
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
 			};
diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 927eecc..6f621ac 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -141,6 +141,8 @@ config MACH_KZM9G
 config MACH_KZM9G_REFERENCE
 	bool "KZM-A9-GT board - Reference Device Tree Implementation"
 	depends on ARCH_SH73A0
+	select ARCH_HAS_CPUFREQ
+	select ARCH_HAS_OPP
 	select ARCH_REQUIRE_GPIOLIB
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	select SND_SOC_AK4642 if SND_SIMPLE_CARD
-- 
1.7.2.5

