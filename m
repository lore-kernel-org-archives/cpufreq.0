From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 2/4] speedstep-centrino: use information in ACPI tables to
	determine valid CPU frequency and voltage pairs
Date: Fri, 20 Feb 2004 09:44:38 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040220084438.GB10473@dominikbrodowski.de>
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
To: davej@redhat.com, jeremy@goop.org
Cc: cpufreq@www.linux.org.uk

Use ACPI _PSS data to determine valid frequency and voltage pairs on Enhanced
SpeedStep-capable processors. An original form of such ACPI-PentiumM-cpufreq 
interaction was sent to the cpufreq list by David Moore in June last year; the
attached patch utilizes his code to set _PDC.

The new ACPI "P-States library" is utilized to obtain the correct frequency
and MSR value pairs for the speedstep-centrino driver. Only if no such proper
table exists (!CONFIG_ACPI, broken ACPI tables, etc.), fall back to the
existing hard-coded table.

If anyone has a better idea for the Kconfig section, please tell me so.

 arch/i386/kernel/cpu/cpufreq/Kconfig              |   15 ++
 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |  137 +++++++++++++++++++++-
 2 files changed, 147 insertions(+), 5 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig linux/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-02-18 10:22:09.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-02-19 20:27:17.869427056 +0100
@@ -120,6 +120,21 @@
 	  
 	  If in doubt, say N.
 
+config X86_SPEEDSTEP_CENTRINO_TABLE
+	bool
+	depends on X86_SPEEDSTEP_CENTRINO
+	default y
+
+config X86_SPEEDSTEP_CENTRINO_ACPI
+	bool "Use ACPI tables to decode valid frequency/voltage pairs (EXPERIMENTAL)"
+	depends on EXPERIMENTAL
+	depends on ((X86_SPEEDSTEP_CENTRINO = "m" && ACPI_PROCESSOR) || (X86_SPEEDSTEP_CENTRINO = "y" && ACPI_PROCESSOR = "y"))
+	help
+	  Use primarily the information provided in the BIOS ACPI tables
+	  to determine valid CPU frequency and voltage pairings.
+
+	  If in doubt, say Y.
+
 config X86_SPEEDSTEP_ICH
 	tristate "Intel Speedstep on ICH-M chipsets (ioport interface)"
 	depends on CPU_FREQ_TABLE
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-02-19 17:24:34.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-02-19 20:16:32.568527704 +0100
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/cpufreq.h>
+#include <linux/config.h>
 
 #include <asm/msr.h>
 #include <asm/processor.h>
@@ -46,7 +47,9 @@
 };
 
 /* Operating points for current CPU */
-static const struct cpu_model *centrino_model;
+static struct cpu_model *centrino_model;
+
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE
 
 /* Computes the correct form for IA32_PERF_CTL MSR for a particular
    frequency/voltage operating point; frequency in MHz, volts in mV.
@@ -172,7 +175,7 @@
 
 /* CPU models, their operating frequency range, and freq/voltage
    operating points */
-static const struct cpu_model models[] = 
+static struct cpu_model models[] = 
 {
        _CPU( 900, " 900"),
 	CPU(1000),
@@ -190,7 +193,7 @@
 static int centrino_cpu_init_table(struct cpufreq_policy *policy)
 {
 	struct cpuinfo_x86 *cpu = &cpu_data[policy->cpu];
-	const struct cpu_model *model;
+	struct cpu_model *model;
 
 	if (!cpu_has(cpu, X86_FEATURE_EST))
 		return -ENODEV;
@@ -225,6 +228,9 @@
 	return 0;
 }
 
+#else
+static inline int centrino_cpu_init_table(struct cpufreq_policy *policy) { return -ENODEV; }
+#endif /* CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE */
 
 /* Extract clock in kHz from PERF_CTL value */
 static unsigned extract_clock(unsigned msr)
@@ -242,6 +248,105 @@
 	return extract_clock(l);
 }
 
+
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
+
+static struct acpi_processor_performance p;
+
+#include <linux/acpi.h>
+#include <acpi/processor.h>
+
+#define ACPI_PDC_CAPABILITY_ENHANCED_SPEEDSTEP 0x1
+
+static int centrino_cpu_init_acpi(struct cpufreq_policy *policy)
+{
+	union acpi_object		arg0 = {ACPI_TYPE_BUFFER};
+	u32				arg0_buf[3];
+	struct acpi_object_list 	arg_list = {1, &arg0};
+	int				result = 0, i;
+
+	/* _PDC settings */
+        arg0.buffer.length = 12;
+        arg0.buffer.pointer = (u8 *) arg0_buf;
+        arg0_buf[0] = ACPI_PDC_REVISION_ID;
+        arg0_buf[1] = 1;
+        arg0_buf[2] = ACPI_PDC_CAPABILITY_ENHANCED_SPEEDSTEP;
+
+	p.pdc = &arg_list;
+
+	/* register with ACPI core */
+        if (acpi_processor_register_performance(&p, 0))
+                return -EIO;
+
+	/* verify the acpi_data */
+	if (p.state_count <= 1) {
+                printk(KERN_DEBUG "No P-States\n");
+                result = -ENODEV;
+                goto err_unreg;
+ 	}
+
+	if ((p.control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
+	    (p.status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
+		printk(KERN_DEBUG "Invalid control/status registers\n");
+		result = -EIO;
+		goto err_unreg;
+	}
+
+	for (i=0; i<p.state_count; i++) {
+		if (p.states[i].control != p.states[i].status) {
+			printk(KERN_DEBUG "Different control and status values\n");
+			result = -EINVAL;
+			goto err_unreg;
+		}
+
+		if (!p.states[i].core_frequency) {
+			printk(KERN_DEBUG "Zero core frequency\n");
+			result = -EINVAL;
+			goto err_unreg;
+		}
+
+		if (extract_clock(p.states[i].control) != 
+		    (p.states[i].core_frequency * 1000)) {
+			printk(KERN_DEBUG "Invalid encoded frequency\n");
+			result = -EINVAL;
+			goto err_unreg;
+		}
+	}
+
+	centrino_model = kmalloc(sizeof(struct cpu_model), GFP_KERNEL);
+	if (!centrino_model) {
+		result = -ENOMEM;
+		goto err_unreg;
+	}
+	memset(centrino_model, 0, sizeof(struct cpu_model));
+
+	centrino_model->model_name=NULL;
+	centrino_model->max_freq = p.states[0].core_frequency * 1000;
+	centrino_model->op_points =  kmalloc(sizeof(struct cpufreq_frequency_table) * 
+					     (p.state_count + 1), GFP_KERNEL);
+        if (!centrino_model->op_points) {
+                result = -ENOMEM;
+                goto err_kfree;
+        }
+
+        for (i=0; i<p.state_count; i++) {
+		centrino_model->op_points[i].index = p.states[i].control;
+		centrino_model->op_points[i].frequency = p.states[i].core_frequency * 1000;
+	}
+	centrino_model->op_points[p.state_count].frequency = CPUFREQ_TABLE_END;
+
+	return 0;
+
+ err_kfree:
+	kfree(centrino_model);
+ err_unreg:
+	acpi_processor_unregister_performance(&p, 0);
+	return (result);
+}
+#else
+static inline int centrino_cpu_init_acpi(struct cpufreq_policy *policy) { return -ENODEV; }
+#endif
+
 static int centrino_cpu_init(struct cpufreq_policy *policy)
 {
 	unsigned freq;
@@ -250,8 +355,11 @@
 	if (policy->cpu != 0)
 		return -ENODEV;
 
-	if (centrino_cpu_init_table(policy))
-		return -ENODEV;
+	if (centrino_cpu_init_acpi(policy)) {
+		if (centrino_cpu_init_table(policy)) {
+			return -ENODEV;
+		}
+	}
 
 	/* Check to see if Enhanced SpeedStep is enabled, and try to
 	   enable it if not. */
@@ -281,6 +389,24 @@
 	return cpufreq_frequency_table_cpuinfo(policy, centrino_model->op_points);
 }
 
+static int centrino_cpu_exit(struct cpufreq_policy *policy)
+{
+	if (!centrino_model)
+		return -ENODEV;
+
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
+	if (!centrino_model->model_name) {
+		acpi_processor_unregister_performance(&p, 0);
+		kfree(centrino_model->op_points);
+		kfree(centrino_model);
+	}
+#endif
+
+	centrino_model = NULL;
+
+	return 0;
+}
+
 /**
  * centrino_verify - verifies a new CPUFreq policy
  * @freq: new policy
@@ -358,6 +484,7 @@
 	.name		= "centrino", /* should be speedstep-centrino, 
 					 but there's a 16 char limit */
 	.init		= centrino_cpu_init,
+	.exit		= centrino_cpu_exit,
 	.verify 	= centrino_verify,
 	.target 	= centrino_target,
 	.owner		= THIS_MODULE,
