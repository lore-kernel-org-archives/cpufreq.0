From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] powernow-k7:  unregistering from ACPI perflib in ->exit(),
	do kfree in ->exit()
Date: Fri, 8 Oct 2004 21:46:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041008194643.GC8562@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, davej@redhat.com

The unregistration of the ACPI performance library should be done in the
CPU exit function, and the cleanup too.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-09-29 18:47:59.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-08 21:34:35.636201672 +0200
@@ -632,6 +632,17 @@
 
 static int powernow_cpu_exit (struct cpufreq_policy *policy) {
 	cpufreq_frequency_table_put_attr(policy->cpu);
+
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
+	if (acpi_processor_perf) {
+		acpi_processor_unregister_performance(acpi_processor_perf, 0);
+		kfree(acpi_processor_perf);
+	}
+#endif
+
+	if (powernow_table)
+		kfree(powernow_table);
+
 	return 0;
 }
 
@@ -661,15 +672,7 @@
 
 static void __exit powernow_exit (void)
 {
-#ifdef CONFIG_X86_POWERNOW_K7_ACPI
-	if (acpi_processor_perf) {
-		acpi_processor_unregister_performance(acpi_processor_perf, 0);
-		kfree(acpi_processor_perf);
-	}
-#endif
 	cpufreq_unregister_driver(&powernow_driver);
-	if (powernow_table)
-		kfree(powernow_table);
 }
 
 module_param(acpi_force,  int, 0444);
