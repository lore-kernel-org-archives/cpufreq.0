From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: x86_64 Kconfig fixes
Date: Fri, 3 Sep 2004 22:40:15 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040903204015.GB19921@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, ak@suse.de

x86_64 cpufreq Kconfig fixes:
- SPEEDSTEP_CENTRINO _needs_ the ACPI perflib as the tables are for
  Banias only, and the Banias is only 32bit
- SPEEDSTEP_CENTRINO_TABLE won't be built in any longer as it only wastes 
  space
- /proc/acpi/processor/../performance is available for all ACPI perflib drivers

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/x86_64/kernel/cpufreq/Kconfig linux/arch/x86_64/kernel/cpufreq/Kconfig
--- linux-original/arch/x86_64/kernel/cpufreq/Kconfig	2004-08-30 22:50:40.000000000 +0200
+++ linux/arch/x86_64/kernel/cpufreq/Kconfig	2004-09-03 18:51:15.494846568 +0200
@@ -48,7 +48,7 @@
 
 config X86_SPEEDSTEP_CENTRINO
 	tristate "Intel Enhanced SpeedStep"
-	depends on CPU_FREQ_TABLE
+	depends on CPU_FREQ_TABLE && ACPI_PROCESSOR
 	help
 	  This adds the CPUFreq driver for Enhanced SpeedStep enabled
 	  mobile CPUs.  This means Intel Pentium M (Centrino) CPUs
@@ -58,21 +58,11 @@
 
 	  If in doubt, say N.
 
-config X86_SPEEDSTEP_CENTRINO_TABLE
+config X86_SPEEDSTEP_CENTRINO_ACPI
 	bool
 	depends on X86_SPEEDSTEP_CENTRINO
 	default y
 
-config X86_SPEEDSTEP_CENTRINO_ACPI
-	bool "Use ACPI tables to decode valid frequency/voltage pairs (EXPERIMENTAL)"
-	depends on EXPERIMENTAL
-	depends on ((X86_SPEEDSTEP_CENTRINO = "m" && ACPI_PROCESSOR) || (X86_SPEEDSTEP_CENTRINO = "y" && ACPI_PROCESSOR = "y"))
-	help
-	  Use primarily the information provided in the BIOS ACPI tables
-	  to determine valid CPU frequency and voltage pairings.
-
-	  If in doubt, say Y.
-
 config X86_ACPI_CPUFREQ
 	tristate "ACPI Processor P-States driver"
 	depends on CPU_FREQ_TABLE && ACPI_PROCESSOR
@@ -84,9 +74,13 @@
 
 	  If in doubt, say N.
 
+comment "shared options"
+	depends on CPU_FREQ
+
 config X86_ACPI_CPUFREQ_PROC_INTF
         bool "/proc/acpi/processor/../performance interface (deprecated)"
-	depends on X86_ACPI_CPUFREQ && PROC_FS
+	depends on PROC_FS
+	depends on X86_ACPI_CPUFREQ || X86_SPEEDSTEP_CENTRINO_ACPI || X86_POWERNOW_K8_ACPI
 	help
 	  This enables the deprecated /proc/acpi/processor/../performance
 	  interface. While it is helpful for debugging, the generic,
