From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix CONFIG_ACPI_PROCESSOR="m", CONFIG_X86_POWERNOW_K{7,
	8}="y" build issue
Date: Fri, 18 Jun 2004 14:42:42 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040618124242.GB5535@dominikbrodowski.de>
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

Fix the build dependency between powernow-k{7,8} and acpi/processor.o by
adding a CONFIG_X86_POWERNOW_K{7,8}_ACPI bool, just like SPEEDSTEP_CENTRINO
does it. See http://forums.gentoo.org/viewtopic.php?t=186887 for a
bugreport.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig linux/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-06-16 18:38:40.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-06-18 14:34:25.048123072 +0200
@@ -88,6 +88,11 @@
 
 	  If in doubt, say N.
 
+config X86_POWERNOW_K7_ACPI
+	bool
+	depends on ((X86_POWERNOW_K7 = "m" && ACPI_PROCESSOR) || (X86_POWERNOW_K7 = "y" && ACPI_PROCESSOR = "y"))
+	default y
+
 config X86_POWERNOW_K8
 	tristate "AMD Opteron/Athlon64 PowerNow!"
 	depends on CPU_FREQ && EXPERIMENTAL
@@ -98,6 +103,11 @@
 
 	  If in doubt, say N.
 
+config X86_POWERNOW_K8_ACPI
+	bool
+	depends on ((X86_POWERNOW_K8 = "m" && ACPI_PROCESSOR) || (X86_POWERNOW_K8 = "y" && ACPI_PROCESSOR = "y"))
+	default y
+
 config X86_GX_SUSPMOD
 	tristate "Cyrix MediaGX/NatSemi Geode Suspend Modulation"
 	depends on CPU_FREQ
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-06-16 18:38:40.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-06-18 14:32:44.702377944 +0200
@@ -28,7 +28,7 @@
 #include <asm/io.h>
 #include <asm/system.h>
 
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
 #include <linux/acpi.h>
 #include <acpi/processor.h>
 #endif
@@ -63,7 +63,7 @@
 	u8 numpstates;
 };
 
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
 union powernow_acpi_control_t {
 	struct {
 		unsigned long fid:5,
@@ -189,7 +189,7 @@
 		speed = powernow_table[j].frequency;
 
 		if ((fid_codes[fid] % 10)==5) {
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
 			if (have_a0 == 1)
 				powernow_table[j].frequency = CPUFREQ_ENTRY_INVALID;
 #endif
@@ -293,7 +293,7 @@
 }
 
 
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
 
 struct acpi_processor_performance *acpi_processor_perf;
 
@@ -642,7 +642,7 @@
 
 static void __exit powernow_exit (void)
 {
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
 	if (acpi_processor_perf) {
 		acpi_processor_unregister_performance(acpi_processor_perf, 0);
 		kfree(acpi_processor_perf);
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-06-18 14:26:45.374004160 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-06-18 14:33:26.237063712 +0200
@@ -32,7 +32,7 @@
 #include <asm/io.h>
 #include <asm/delay.h>
 
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#ifdef CONFIG_X86_POWERNOW_K8_ACPI
 #include <linux/acpi.h>
 #include <acpi/processor.h>
 #endif
@@ -664,7 +664,7 @@
 	return -ENODEV;
 }
 
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#ifdef CONFIG_X86_POWERNOW_K8_ACPI
 static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data, unsigned int index)
 {
 	if (!data->acpi_data.state_count)
diff -ruN linux-original/arch/x86_64/kernel/cpufreq/Kconfig linux/arch/x86_64/kernel/cpufreq/Kconfig
--- linux-original/arch/x86_64/kernel/cpufreq/Kconfig	2004-06-16 18:38:40.000000000 +0200
+++ linux/arch/x86_64/kernel/cpufreq/Kconfig	2004-06-18 14:35:13.448765056 +0200
@@ -41,4 +41,9 @@
 
 	  If in doubt, say N.
 
+config X86_POWERNOW_K8_ACPI
+	bool
+	depends on ((X86_POWERNOW_K8 = "m" && ACPI_PROCESSOR) || (X86_POWERNOW_K8 = "y" && ACPI_PROCESSOR = "y"))
+	default y
+
 endmenu
