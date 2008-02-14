From: Alessandro Guido <alessandro.guido@gmail.com>
Subject: [PATCH v2] Use menuconfig for CONFIG_CPU_FREQ
Date: Thu, 14 Feb 2008 09:44:49 +0100
Message-ID: <200802140944.50236.alessandro.guido@gmail.com>
References: <200802132330.23817.alessandro.guido@gmail.com>
	<Pine.LNX.4.64.0802140246440.1822@scrub.home>
	<20080214075115.GB17110@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080214075115.GB17110@flint.arm.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: davej@codemonkey.org.uk
Cc: Roman Zippel <zippel@linux-m68k.org>, cpufreq@lists.linux.org.uk, Russell King <rmk@arm.linux.org.uk>, linux-arch@vger.kernel.org

Use menuconfig for CONFIG_CPU_FREQ.
This version tries to be more explicit about dependencies on the
CPU_FREQ symbol in the arch specific Kconfigs.

Signed-off-by: Alessandro Guido <alessandro.guido@gmail.com>

---

 arch/arm/Kconfig                    |   16 ++++++++--------
 arch/avr32/Kconfig                  |    8 ++++----
 arch/blackfin/Kconfig               |   14 +++++---------
 arch/powerpc/platforms/Kconfig      |    5 ++---
 arch/sh/Kconfig                     |    7 +++----
 arch/x86/kernel/cpu/cpufreq/Kconfig |    4 ----
 drivers/cpufreq/Kconfig             |    2 +-
 7 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9619c43..9f174df 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -948,23 +948,23 @@ endmenu
 
 if (ARCH_SA1100 || ARCH_INTEGRATOR || ARCH_OMAP || ARCH_IMX || ARCH_PXA)
 
-menu "CPU Frequency scaling"
-
 source "drivers/cpufreq/Kconfig"
 
+if CPU_FREQ
+
 config CPU_FREQ_SA1100
 	bool
-	depends on CPU_FREQ && (SA1100_H3100 || SA1100_H3600 || SA1100_H3800 || SA1100_LART || SA1100_PLEB || SA1100_BADGE4 || SA1100_HACKKIT)
+	depends on SA1100_H3100 || SA1100_H3600 || SA1100_H3800 || SA1100_LART || SA1100_PLEB || SA1100_BADGE4 || SA1100_HACKKIT
 	default y
 
 config CPU_FREQ_SA1110
 	bool
-	depends on CPU_FREQ && (SA1100_ASSABET || SA1100_CERF || SA1100_PT_SYSTEM3)
+	depends on SA1100_ASSABET || SA1100_CERF || SA1100_PT_SYSTEM3
 	default y
 
 config CPU_FREQ_INTEGRATOR
 	tristate "CPUfreq driver for ARM Integrator CPUs"
-	depends on ARCH_INTEGRATOR && CPU_FREQ
+	depends on ARCH_INTEGRATOR
 	default y
 	help
 	  This enables the CPUfreq driver for ARM Integrator CPUs.
@@ -975,7 +975,7 @@ config CPU_FREQ_INTEGRATOR
 
 config CPU_FREQ_IMX
 	tristate "CPUfreq driver for i.MX CPUs"
-	depends on ARCH_IMX && CPU_FREQ
+	depends on ARCH_IMX
 	default n
 	help
 	  This enables the CPUfreq driver for i.MX CPUs.
@@ -984,11 +984,11 @@ config CPU_FREQ_IMX
 
 config CPU_FREQ_PXA
 	bool
-	depends on CPU_FREQ && ARCH_PXA && PXA25x
+	depends on ARCH_PXA && PXA25x
 	default y
 	select CPU_FREQ_DEFAULT_GOV_USERSPACE
 
-endmenu
+endif # CPU_FREQ
 
 endif
 
diff --git a/arch/avr32/Kconfig b/arch/avr32/Kconfig
index c75d708..c76b1df 100644
--- a/arch/avr32/Kconfig
+++ b/arch/avr32/Kconfig
@@ -197,13 +197,13 @@ endmenu
 
 menu "Power management options"
 
-menu "CPU Frequency scaling"
-
 source "drivers/cpufreq/Kconfig"
 
+if CPU_FREQ
+
 config CPU_FREQ_AT32AP
 	bool "CPU frequency driver for AT32AP"
-	depends on CPU_FREQ && PLATFORM_AT32AP
+	depends on PLATFORM_AT32AP
 	default n
 	help
 	  This enables the CPU frequency driver for AT32AP processors.
@@ -214,7 +214,7 @@ config CPU_FREQ_AT32AP
 
 endmenu
 
-endmenu
+endif # CPU_FREQ
 
 menu "Bus options"
 
diff --git a/arch/blackfin/Kconfig b/arch/blackfin/Kconfig
index 589c6ac..5914e4b 100644
--- a/arch/blackfin/Kconfig
+++ b/arch/blackfin/Kconfig
@@ -964,17 +964,13 @@ endmenu
 
 if (BF537 || BF533 || BF54x)
 
-menu "CPU Frequency scaling"
-
 source "drivers/cpufreq/Kconfig"
 
-config CPU_FREQ
-	bool
-	default n
-	help
-	  If you want to enable this option, you should select the
-	  DPMC driver from Character Devices.
-endmenu
+if CPU_FREQ
+
+comment "You should select the DPMC driver from Character Devices for this to work"
+
+endif # CPU_FREQ
 
 endif
 
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index fcedbec..f00f8d4 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -180,8 +180,7 @@ config GENERIC_IOMAP
 
 source "drivers/cpufreq/Kconfig"
 
-menu "CPU Frequency drivers"
-	depends on CPU_FREQ
+if CPU_FREQ
 
 config CPU_FREQ_PMAC
 	bool "Support for Apple PowerBooks"
@@ -209,7 +208,7 @@ config PPC_PASEMI_CPUFREQ
 	  This adds the support for frequency switching on PA Semi
 	  PWRficient processors.
 
-endmenu
+endif # CPU_FREQ
 
 config PPC601_SYNC_FIX
 	bool "Workarounds for PPC601 bugs"
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index d87d4bf..ee4cd7c 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -599,13 +599,12 @@ source "kernel/time/Kconfig"
 
 endmenu
 
-menu "CPU Frequency scaling"
-
 source "drivers/cpufreq/Kconfig"
 
+if CPU_FREQ
+
 config SH_CPU_FREQ
 	tristate "SuperH CPU Frequency driver"
-	depends on CPU_FREQ
 	select CPU_FREQ_TABLE
 	help
 	  This adds the cpufreq driver for SuperH. At present, only
@@ -615,7 +614,7 @@ config SH_CPU_FREQ
 
 	  If unsure, say N.
 
-endmenu
+endif # CPU_FREQ
 
 source "arch/sh/drivers/Kconfig"
 
diff --git a/arch/x86/kernel/cpu/cpufreq/Kconfig b/arch/x86/kernel/cpu/cpufreq/Kconfig
index cb7a571..fc5254d 100644
--- a/arch/x86/kernel/cpu/cpufreq/Kconfig
+++ b/arch/x86/kernel/cpu/cpufreq/Kconfig
@@ -2,8 +2,6 @@
 # CPU Frequency scaling
 #
 
-menu "CPU Frequency scaling"
-
 source "drivers/cpufreq/Kconfig"
 
 if CPU_FREQ
@@ -271,5 +269,3 @@ config X86_SPEEDSTEP_RELAXED_CAP_CHECK
 	  parameter "relaxed_check=1" is passed to the module.
 
 endif	# CPU_FREQ
-
-endmenu
diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index c159ae6..ef80bd0 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -1,4 +1,4 @@
-config CPU_FREQ
+menuconfig CPU_FREQ
 	bool "CPU Frequency scaling"
 	help
 	  CPU Frequency scaling allows you to change the clock speed of 
