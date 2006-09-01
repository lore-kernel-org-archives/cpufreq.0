From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] Workaround for BIOS bug in software coordination of
	frequency
Date: Fri, 1 Sep 2006 14:02:24 -0700
Message-ID: <20060901140224.B14821@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: alexey.y.starikovskiy@intel.com, cpufreq <cpufreq@www.linux.org.uk>



Some buggy BIOSes do a "software any" kind of coordination without telling
about it to OS. So, when OS sets frequency on one CPU on these platforms,
it will also impact all the other logical CPUs that are in the same power
domain. Attached patch is a workaround for those buggy BIOSes.
Patch should be a noop on the normal non-buggy platforms.

Applies over previously sent acpi-cpufreq and software coordination
bug fix patch

Signed-off-by: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>

Index: linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.18-rc4.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -32,6 +32,7 @@
 #include <linux/seq_file.h>
 #include <linux/compiler.h>
 #include <linux/sched.h>	/* current */
+#include <linux/dmi.h>
 #include <asm/io.h>
 #include <asm/delay.h>
 #include <asm/uaccess.h>
@@ -392,6 +393,33 @@ static int acpi_cpufreq_early_init_acpi(
 	return acpi_processor_preregister_performance(acpi_perf_data);
 }
 
+/*
+ * Some BIOSes do SW_ANY coordination internally, either set it up in hw
+ * or do it in BIOS firmware and won't inform about it to OS. If not
+ * detected, this has a side effect of making CPU run at a different speed
+ * than OS intended it to run at. Detect it and handle it cleanly.
+ */
+static int bios_with_sw_any_bug;
+
+static int __init sw_any_bug_found(struct dmi_system_id *d)
+{
+	bios_with_sw_any_bug = 1;
+	return 0;
+}
+
+static struct dmi_system_id __initdata sw_any_bug_dmi_table[] = {
+	{
+		.callback = sw_any_bug_found,
+		.ident = "Supermicro Server X6DLP",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Supermicro"),
+			DMI_MATCH(DMI_BIOS_VERSION, "080010"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X6DLP"),
+		},
+	},
+	{ }
+};
+
 static int
 acpi_cpufreq_cpu_init (
 	struct cpufreq_policy   *policy)
@@ -427,8 +455,17 @@ acpi_cpufreq_cpu_init (
 	 * coordination is required.
 	 */
 	if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
-	    policy->shared_type == CPUFREQ_SHARED_TYPE_ANY)
+	    policy->shared_type == CPUFREQ_SHARED_TYPE_ANY) {
 		policy->cpus = perf->shared_cpu_map;
+	}
+
+#ifdef CONFIG_SMP
+	dmi_check_system(sw_any_bug_dmi_table);
+	if (bios_with_sw_any_bug && cpus_weight(policy->cpus) == 1) {
+		policy->shared_type = CPUFREQ_SHARED_TYPE_ALL;
+		policy->cpus = cpu_core_map[cpu];
+	}
+#endif
 
 	if (cpu_has(c, X86_FEATURE_CONSTANT_TSC)) {
 		acpi_cpufreq_driver.flags |= CPUFREQ_CONST_LOOPS;
Index: linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
===================================================================
--- linux-2.6.18-rc4.orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
+++ linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
@@ -23,6 +23,7 @@
 
 #ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <acpi/processor.h>
 #endif
 
@@ -377,6 +378,35 @@ static int centrino_cpu_early_init_acpi(
 	return 0;
 }
 
+
+/*
+ * Some BIOSes do SW_ANY coordination internally, either set it up in hw
+ * or do it in BIOS firmware and won't inform about it to OS. If not
+ * detected, this has a side effect of making CPU run at a different speed
+ * than OS intended it to run at. Detect it and handle it cleanly.
+ */
+static int bios_with_sw_any_bug;
+static int __init sw_any_bug_found(struct dmi_system_id *d)
+{
+	bios_with_sw_any_bug = 1;
+	return 0;
+}
+
+
+static struct dmi_system_id __initdata sw_any_bug_dmi_table[] = {
+	{
+		.callback = sw_any_bug_found,
+		.ident = "Supermicro Server X6DLP",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Supermicro"),
+			DMI_MATCH(DMI_BIOS_VERSION, "080010"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X6DLP"),
+		},
+	},
+	{ }
+};
+
+
 /*
  * centrino_cpu_init_acpi - register with ACPI P-States library
  *
@@ -398,14 +428,24 @@ static int centrino_cpu_init_acpi(struct
 		dprintk(PFX "obtaining ACPI data failed\n");
 		return -EIO;
 	}
+
 	policy->shared_type = p->shared_type;
 	/*
 	 * Will let policy->cpus know about dependency only when software 
 	 * coordination is required.
 	 */
 	if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
-	    policy->shared_type == CPUFREQ_SHARED_TYPE_ANY)
+	    policy->shared_type == CPUFREQ_SHARED_TYPE_ANY) {
 		policy->cpus = p->shared_cpu_map;
+	}
+
+#ifdef CONFIG_SMP
+	dmi_check_system(sw_any_bug_dmi_table);
+	if (bios_with_sw_any_bug && cpus_weight(policy->cpus) == 1) {
+		policy->shared_type = CPUFREQ_SHARED_TYPE_ALL;
+		policy->cpus = cpu_core_map[cpu];
+	}
+#endif
 
 	/* verify the acpi_data */
 	if (p->state_count <= 1) {
