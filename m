From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC][PATCH] cpufreq: unify CPU_FREQ config options
Date: Sat, 4 Sep 2004 08:39:34 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040904063934.GA1693@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, rmk@arm.linux.org.uk, benh@kernel.crashing.org, davem@davemloft.net, lethal@linux-sh.org, ak@suse.de

Depends on the previously submitted arm/i386/x86_64/cpufreq core Kconfig 
patches.

Unify the CPU_FREQ config option.

Signed-off-by: Dominik Brodowski

diff -ruN linux-original/arch/arm/Kconfig linux/arch/arm/Kconfig
--- linux-original/arch/arm/Kconfig	2004-09-04 08:12:02.000000000 +0200
+++ linux/arch/arm/Kconfig	2004-09-04 08:22:22.000000000 +0200
@@ -341,17 +341,6 @@
 
 if (ARCH_SA1100 || ARCH_INTEGRATOR)
 
-config CPU_FREQ
-	bool "Support CPU clock change"
-	help
-	  CPU clock scaling allows you to change the clock speed of the
-	  running CPU on the fly. This is a nice method to save battery power,
-	  because the lower the clock speed, the less power the CPU
-	  consumes. Note that this driver doesn't automatically change the CPU
-	  clock speed, you need some userland tools (which still have to be
-	  written) to implement the policy. If you don't understand what this
-	  is all about, it's safe to say 'N'.
-
 source "drivers/cpufreq/Kconfig"
 
 config CPU_FREQ_SA1100
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig linux/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-09-04 08:12:04.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-09-04 08:22:40.000000000 +0200
@@ -4,18 +4,6 @@
 
 menu "CPU Frequency scaling"
 
-config CPU_FREQ
-	bool "CPU Frequency scaling"
-	help
-	  Clock scaling allows you to change the clock speed of CPUs on the
-	  fly. This is a nice method to save battery power on notebooks,
-	  because the lower the clock speed, the less power the CPU consumes.
-
-	  For more information, take a look at <file:Documentation/cpu-freq/>
-	  or at <http://www.codemonkey.org.uk/projects/cpufreq/>
-
-	  If in doubt, say N.
-
 source "drivers/cpufreq/Kconfig"
 
 config CPU_FREQ_TABLE
diff -ruN linux-original/arch/ppc/Kconfig linux/arch/ppc/Kconfig
--- linux-original/arch/ppc/Kconfig	2004-08-30 22:44:58.000000000 +0200
+++ linux/arch/ppc/Kconfig	2004-09-04 08:23:05.000000000 +0200
@@ -184,18 +184,6 @@
 	  here.  Saying Y here will not hurt performance (on any machine) but
 	  will increase the size of the kernel.
 
-config CPU_FREQ
-	bool "CPU Frequency scaling"
-	help
-	  Clock scaling allows you to change the clock speed of CPUs on the
-	  fly. This is a nice method to save battery power on notebooks,
-	  because the lower the clock speed, the less power the CPU consumes.
-
-	  For more information, take a look at <file:Documentation/cpu-freq> or
-	  at <http://www.brodo.de/cpufreq/>
-
-	  If in doubt, say N.
-
 source "drivers/cpufreq/Kconfig"
 
 config CPU_FREQ_PMAC
diff -ruN linux-original/arch/sh/Kconfig linux/arch/sh/Kconfig
--- linux-original/arch/sh/Kconfig	2004-08-30 22:44:58.000000000 +0200
+++ linux/arch/sh/Kconfig	2004-09-04 08:23:28.000000000 +0200
@@ -595,16 +595,6 @@
 
 menu "CPU Frequency scaling"
 
-config CPU_FREQ
-	bool "CPU Frequency scaling"
-	help
-	  CPU clock scaling allows you to change the clock speed of the
-	  running CPU on the fly.
-
-	  For details, take a look at <file:Documentation/cpu-freq>.
-
-	  If unsure, say N.
-
 source "drivers/cpufreq/Kconfig"
 
 config CPU_FREQ_TABLE
diff -ruN linux-original/arch/sparc64/Kconfig linux/arch/sparc64/Kconfig
--- linux-original/arch/sparc64/Kconfig	2004-08-30 22:44:58.000000000 +0200
+++ linux/arch/sparc64/Kconfig	2004-09-04 08:24:04.000000000 +0200
@@ -131,16 +131,7 @@
 	depends on SMP
 	default "32"
 
-config CPU_FREQ
-	bool "CPU Frequency scaling"
-	help
-	  Clock scaling allows you to change the clock speed of CPUs on the
-	  fly.  Currently there are only sparc64 drivers for UltraSPARC-III
-	  and UltraSPARC-IIe processors.
-
-	  For details, take a look at <file:Documentation/cpu-freq>.
-
-	  If in doubt, say N.
+source "drivers/cpufreq/Kconfig"
 
 config CPU_FREQ_TABLE
        tristate "CPU frequency table helpers"
@@ -172,8 +163,6 @@
 
 	  If in doubt, say N.
 
-source "drivers/cpufreq/Kconfig"
-
 # Identify this as a Sparc64 build
 config SPARC64
 	bool
diff -ruN linux-original/arch/x86_64/kernel/cpufreq/Kconfig linux/arch/x86_64/kernel/cpufreq/Kconfig
--- linux-original/arch/x86_64/kernel/cpufreq/Kconfig	2004-09-04 08:12:06.000000000 +0200
+++ linux/arch/x86_64/kernel/cpufreq/Kconfig	2004-09-04 08:24:56.000000000 +0200
@@ -4,18 +4,6 @@
 
 menu "CPU Frequency scaling"
 
-config CPU_FREQ
-	bool "CPU Frequency scaling"
-	help
-	  Clock scaling allows you to change the clock speed of CPUs on the
-	  fly. This is a nice method to save battery power on notebooks,
-	  because the lower the clock speed, the less power the CPU consumes.
-
-	  For more information, take a look at <file:Documentation/cpu-freq/>
-	  or at <http://www.codemonkey.org.uk/projects/cpufreq/>
-
-	  If in doubt, say N.
-
 source "drivers/cpufreq/Kconfig"
 
 config CPU_FREQ_TABLE
diff -ruN linux-original/drivers/cpufreq/Kconfig linux/drivers/cpufreq/Kconfig
--- linux-original/drivers/cpufreq/Kconfig	2004-09-04 08:36:06.306695264 +0200
+++ linux/drivers/cpufreq/Kconfig	2004-09-04 08:30:04.000000000 +0200
@@ -1,3 +1,18 @@
+config CPU_FREQ
+	bool "CPU Frequency scaling"
+	help
+	  CPU Frequency scaling allows you to change the clock speed of 
+	  CPUs on the fly. This is a nice method to save power, because 
+	  the lower the CPU clock speed, the less power the CPU consumes.
+
+	  Note that this driver doesn't automatically change the CPU
+	  clock speed, you need to either enable a dynamic cpufreq governor
+	  (see below) after boot, or use a userspace tool.
+
+	  For details, take a look at <file:Documentation/cpu-freq>.
+
+	  If in doubt, say N.
+
 config CPU_FREQ_PROC_INTF
 	tristate "/proc/cpufreq interface (deprecated)"
 	depends on CPU_FREQ && PROC_FS
