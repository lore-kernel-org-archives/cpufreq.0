From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC][PATCH] cpufreq: arm Kconfig fixes
Date: Fri, 3 Sep 2004 22:43:20 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040903204320.GC19921@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rmk@arm.linux.org.uk, cpufreq@www.linux.org.uk

arm cpufreq Kconfig enhancements:
- don't force the deprecated 24_API on SA11x0 any more, as it will be removed
  ~2005-01-01 and different interfaces have been available for a long time
- don't mark CPU_FREQ as being EXPERIMENTAL any longer
- re-order it in the same way other arches are ordered

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/arm/Kconfig linux/arch/arm/Kconfig
--- linux-original/arch/arm/Kconfig	2004-08-30 22:44:57.000000000 +0200
+++ linux/arch/arm/Kconfig	2004-09-03 22:36:44.656217768 +0200
@@ -339,9 +339,10 @@
 	  while the decompressor is running.  Unless you have special requirements,
 	  you should not change this value.
 
+if (ARCH_SA1100 || ARCH_INTEGRATOR)
+
 config CPU_FREQ
-	bool "Support CPU clock change (EXPERIMENTAL)"
-	depends on (ARCH_SA1100 || ARCH_INTEGRATOR) && EXPERIMENTAL
+	bool "Support CPU clock change"
 	help
 	  CPU clock scaling allows you to change the clock speed of the
 	  running CPU on the fly. This is a nice method to save battery power,
@@ -351,20 +352,17 @@
 	  written) to implement the policy. If you don't understand what this
 	  is all about, it's safe to say 'N'.
 
-
-# CPUfreq on SA11x0 is special -- it _needs_ the userspace governor
+source "drivers/cpufreq/Kconfig"
 
 config CPU_FREQ_SA1100
 	bool
 	depends on CPU_FREQ && SA1100_LART
 	default y
-	select CPU_FREQ_24_API if SYSCTL
 
 config CPU_FREQ_SA1110
 	bool
 	depends on CPU_FREQ && (SA1100_ASSABET || SA1100_CERF || SA1100_PT_SYSTEM3)
 	default y
-	select CPU_FREQ_24_API if SYSCTL
 
 config CPU_FREQ_INTEGRATOR
 	tristate "CPUfreq driver for ARM Integrator CPUs"
@@ -377,10 +375,6 @@
 
 	  If in doubt, say Y.
 
-if (CPU_FREQ_INTEGRATOR) || (CPU_FREQ_SA1110) || (CPU_FREQ_SA1100)
-
-source "drivers/cpufreq/Kconfig"
-
 endif
 
 source "drivers/pci/Kconfig"
