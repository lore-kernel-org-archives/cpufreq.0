From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: i386 Kconfig fixes
Date: Fri, 3 Sep 2004 22:38:29 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040903203829.GA19921@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

i386 cpufreq Kconfig fixes:
- /proc/acpi/processor/../performance is available for all ACPI perflib drivers
- powernow-k8 depends on FREQ_TABLE
- clarify the heavy dependency of SPEEDSTEP_CENTRINO on ACPI
- remove the EXPERIMENTAL tag of SPEEDSTEP_CENTRINO_ACPI
- allow to disable SPEEDSTEP_CENTRINO_TABLE

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig linux/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-08-30 22:50:56.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-09-03 18:47:41.401393720 +0200
@@ -42,16 +42,6 @@
 
 	  If in doubt, say N.
 
-config X86_ACPI_CPUFREQ_PROC_INTF
-        bool "/proc/acpi/processor/../performance interface (deprecated)"
-	depends on X86_ACPI_CPUFREQ && PROC_FS
-	help
-	  This enables the deprecated /proc/acpi/processor/../performance 
-	  interface. While it is helpful for debugging, the generic,
-	  cross-architecture cpufreq interfaces should be used.
-
-	  If in doubt, say N.
-
 config ELAN_CPUFREQ
 	tristate "AMD Elan"
 	depends on CPU_FREQ_TABLE && X86_ELAN
@@ -95,7 +85,7 @@
 
 config X86_POWERNOW_K8
 	tristate "AMD Opteron/Athlon64 PowerNow!"
-	depends on CPU_FREQ && EXPERIMENTAL
+	depends on CPU_FREQ_TABLE && EXPERIMENTAL
 	help
 	  This adds the CPUFreq driver for mobile AMD Opteron/Athlon64 processors.
 
@@ -122,29 +112,40 @@
 config X86_SPEEDSTEP_CENTRINO
 	tristate "Intel Enhanced SpeedStep"
 	depends on CPU_FREQ_TABLE
+	select X86_SPEEDSTEP_CENTRINO_TABLE if (!X86_SPEEDSTEP_CENTRINO_ACPI)
 	help
 	  This adds the CPUFreq driver for Enhanced SpeedStep enabled
-	  mobile CPUs.  This means Intel Pentium M (Centrino) CPUs.
+	  mobile CPUs.  This means Intel Pentium M (Centrino) CPUs. However,
+	  you also need to say Y to "Use ACPI tables to decode..." below
+	  [which might imply enabling ACPI] if you want to use this driver
+	  on non-Banias CPUs.
 	  
 	  For details, take a look at <file:Documentation/cpu-freq/>.
 	  
 	  If in doubt, say N.
 
-config X86_SPEEDSTEP_CENTRINO_TABLE
-	bool
-	depends on X86_SPEEDSTEP_CENTRINO
-	default y
-
 config X86_SPEEDSTEP_CENTRINO_ACPI
-	bool "Use ACPI tables to decode valid frequency/voltage pairs (EXPERIMENTAL)"
-	depends on EXPERIMENTAL
+	bool "Use ACPI tables to decode valid frequency/voltage pairs"
+	depends on X86_SPEEDSTEP_CENTRINO
 	depends on ((X86_SPEEDSTEP_CENTRINO = "m" && ACPI_PROCESSOR) || (X86_SPEEDSTEP_CENTRINO = "y" && ACPI_PROCESSOR = "y"))
+	default y
 	help
 	  Use primarily the information provided in the BIOS ACPI tables
-	  to determine valid CPU frequency and voltage pairings.
+	  to determine valid CPU frequency and voltage pairings. It is
+	  required for the driver to work on non-Banias CPUs.
 
 	  If in doubt, say Y.
 
+config X86_SPEEDSTEP_CENTRINO_TABLE
+	bool "Built-in tables for Banias CPUs"
+	depends on X86_SPEEDSTEP_CENTRINO
+	default y
+	help
+	  Use built-in tables for Banias CPUs if ACPI encoding
+	  is not available.
+
+	  If in doubt, say N.
+
 config X86_SPEEDSTEP_ICH
 	tristate "Intel Speedstep on ICH-M chipsets (ioport interface)"
 	depends on CPU_FREQ_TABLE
@@ -181,21 +182,6 @@
 
 	  If in doubt, say N.
 
-config X86_SPEEDSTEP_LIB
-	tristate
-	depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD)
-	default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD)
-
-config X86_SPEEDSTEP_RELAXED_CAP_CHECK
-	bool "Relaxed speedstep capability checks"
-	depends on (X86_SPEEDSTEP_SMI || X86_SPEEDSTEP_ICH)
-	help
-	  Don't perform all checks for a speedstep capable system which would 
-	  normally be done. Some ancient or strange systems, though speedstep 
-	  capable, don't always indicate that they are speedstep capable. This 
-	  option let's the probing code bypass some of those checks if the
-	  parameter "relaxed_check=1" is passed to the module.
-
 config X86_LONGRUN
 	tristate "Transmeta LongRun"
 	depends on CPU_FREQ
@@ -219,4 +205,34 @@
 
 	  If in doubt, say N.
 
+comment "shared options"
+	depends on CPU_FREQ
+
+config X86_ACPI_CPUFREQ_PROC_INTF
+        bool "/proc/acpi/processor/../performance interface (deprecated)"
+	depends on PROC_FS
+	depends on X86_ACPI_CPUFREQ || X86_SPEEDSTEP_CENTRINO_ACPI || X86_POWERNOW_K7_ACPI || X86_POWERNOW_K8_ACPI
+	help
+	  This enables the deprecated /proc/acpi/processor/../performance 
+	  interface. While it is helpful for debugging, the generic,
+	  cross-architecture cpufreq interfaces should be used.
+
+	  If in doubt, say N.
+
+config X86_SPEEDSTEP_LIB
+	tristate
+	depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD)
+	default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD)
+
+config X86_SPEEDSTEP_RELAXED_CAP_CHECK
+	bool "Relaxed speedstep capability checks"
+	depends on (X86_SPEEDSTEP_SMI || X86_SPEEDSTEP_ICH)
+	help
+	  Don't perform all checks for a speedstep capable system which would 
+	  normally be done. Some ancient or strange systems, though speedstep 
+	  capable, don't always indicate that they are speedstep capable. This 
+	  option lets the probing code bypass some of those checks if the
+	  parameter "relaxed_check=1" is passed to the module.
+
+
 endmenu
