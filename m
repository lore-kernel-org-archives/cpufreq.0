From: Dominik Brodowski <linux@brodo.de>
Subject: [RFC] cpufreq: use new acpi processor perflib in speedstep-centrino
	[Was: Re: [ACPI] _PDC method in DSDT]
Date: Fri, 5 Sep 2003 01:19:32 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030904231932.GA8518@brodo.de>
References: <20030623133834.GA2330@brodo.de>
	<20030623161136.GG19556@poupinou.org>
	<1056388336.15250.62.camel@ixodes.goop.org>
	<1056398545.10322.111.camel@aldebaran.caltech.edu>
	<20030623213726.GA1317@brodo.de>
	<1056417280.10323.148.camel@aldebaran.caltech.edu>
	<1056418635.5977.20.camel@sherkaner.pao.digeo.com>
	<1056420149.10322.160.camel@aldebaran.caltech.edu>
	<20030624091836.GI19556@poupinou.org>
	<1056491271.3979.15.camel@aldebaran.caltech.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1056491271.3979.15.camel@aldebaran.caltech.edu>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Moore <dcm@acm.org>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Ducrot Bruno <ducrot@poupinou.org>, Andrew Grover <andrew.grover@intel.com>, cpufreq list <cpufreq@www.linux.org.uk>, "Adachi,
	Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net

This patch modifies the speedstep-centrino driver to use the ACPI 
processor perflib if no hardcoded value could be found. Centrino-specific
stuff is taken from a patch to arch/i386/kernel/cpu/cpufreq/acpi.c by 
David Moore [in this thread].

 arch/i386/kernel/cpu/cpufreq/Kconfig              |   14 +++
 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |   88 ++++++++++++++++++----
2 files changed, 89 insertions(+), 13 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig linux/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig	2003-09-04 21:36:58.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2003-09-05 01:13:44.374639488 +0200
@@ -113,6 +113,20 @@
 	  
 	  If in doubt, say N.
 
+config X86_SPEEDSTEP_CENTRINO_ACPI
+	bool "Fall back to ACPI tables info"
+	depends on X86_SPEEDSTEP_CENTRINO && ACPI_PROCESSOR_PERFLIB
+	default n
+	help
+	  If your Intel Pentium M (Centrino) CPU is so new that
+	  it cannot be found yet by the Intel Enhanced SpeedStep
+	  CPUfreq driver, you might want to try enabling this option.
+
+	  It reads out the ACPI tables trying to determine the correct
+	  settings.
+	  
+	  If in doubt, say N.
+
 config X86_SPEEDSTEP_LIB
        tristate
        depends on X86_SPEEDSTEP_ICH
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2003-09-04 20:52:48.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2003-09-05 01:13:55.006023272 +0200
@@ -37,6 +37,7 @@
 #define dprintk(msg...) do { } while(0)
 #endif
 
+
 struct cpu_model
 {
 	const char	*model_name;
@@ -46,7 +47,7 @@
 };
 
 /* Operating points for current CPU */
-static const struct cpu_model *centrino_model;
+static struct cpufreq_frequency_table *centrino_table;
 
 /* Computes the correct form for IA32_PERF_CTL MSR for a particular
    frequency/voltage operating point; frequency in MHz, volts in mV.
@@ -196,7 +197,7 @@
 {
 	unsigned freq;
 
-	if (policy->cpu != 0 || centrino_model == NULL)
+	if (policy->cpu != 0 || centrino_table == NULL)
 		return -ENODEV;
 
 	freq = get_cur_freq();
@@ -207,8 +208,8 @@
 
 	dprintk(KERN_INFO PFX "centrino_cpu_init: policy=%d cur=%dkHz\n",
 		policy->policy, policy->cur);
-	
-	return cpufreq_frequency_table_cpuinfo(policy, centrino_model->op_points);
+
+	return cpufreq_frequency_table_cpuinfo(policy, centrino_table);
 }
 
 /**
@@ -220,7 +221,7 @@
  */
 static int centrino_verify (struct cpufreq_policy *policy)
 {
-	return cpufreq_frequency_table_verify(policy, centrino_model->op_points);
+	return cpufreq_frequency_table_verify(policy, centrino_table);
 }
 
 /**
@@ -237,14 +238,14 @@
 	unsigned int	msr, oldmsr, h;
 	struct cpufreq_freqs	freqs;
 
-	if (centrino_model == NULL)
+	if (centrino_table == NULL)
 		return -ENODEV;
 
-	if (cpufreq_frequency_table_target(policy, centrino_model->op_points, target_freq,
+	if (cpufreq_frequency_table_target(policy, centrino_table, target_freq,
 					   relation, &newstate))
 		return -EINVAL;
 
-	msr = centrino_model->op_points[newstate].index;
+	msr = centrino_table[newstate].index;
 	rdmsr(MSR_IA32_PERF_CTL, oldmsr, h);
 
 	if (msr == (oldmsr & 0xffff))
@@ -293,6 +294,63 @@
 	.owner		= THIS_MODULE,
 };
 
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
+#include <linux/acpi.h>
+#include <acpi/processor.h>
+
+#define ACPI_PDC_REVISION_ID			0x1
+#define ACPI_PDC_CAPABILITY_ENHANCED_SPEEDSTEP	0x1
+
+static struct cpufreq_frequency_table * get_frequency_table_from_acpi(void) 
+{
+	union acpi_object		arg0 = {ACPI_TYPE_BUFFER};
+	u32				arg0_buf[3];
+	struct acpi_object_list		arg_list = {1, &arg0};
+	struct acpi_perflib_driver	perflib_driver;
+	struct acpi_perflib_data 	*data;
+	struct cpufreq_frequency_table	*table = NULL;
+	int				i;
+
+	/* First call _PDC, if available, to indicate to ACPI that this
+	 * driver supports Enhanced Speedstep.
+	 * Documentation for the _PDC method is at:
+	 * http://www.microsoft.com/whdc/hwdev/tech/onnow/procperfctrl.mspx */
+	arg0.buffer.length = 12;
+	arg0.buffer.pointer = (u8 *) arg0_buf;
+	arg0_buf[0] = ACPI_PDC_REVISION_ID;
+	arg0_buf[1] = 1;
+	arg0_buf[2] = ACPI_PDC_CAPABILITY_ENHANCED_SPEEDSTEP;
+
+	perflib_driver.pdc = &arg_list;
+
+	data = acpi_processor_perflib_register(&perflib_driver, 0);
+	if (!data)
+		return NULL;
+
+	if ((data->state_count < 2) ||
+	    (data->pct_status.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
+	    (data->pct_control.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
+	    (data->pct_status.address != MSR_IA32_PERF_STATUS) ||
+	    (data->pct_control.address != MSR_IA32_PERF_CTL))
+		goto out;
+
+	table = kmalloc(sizeof(struct cpufreq_frequency_table) * (data->state_count + 1), GFP_KERNEL);
+	if (!table)
+		goto out;
+
+	for (i=0; i < data->state_count; i++) {
+		table[i].index = data->states[i].control;
+		table[i].frequency = data->states[i].core_frequency * 1000;
+	}
+        table[data->state_count].frequency = CPUFREQ_TABLE_END;
+
+ out:
+	acpi_processor_perflib_unregister(&perflib_driver, 0);
+	return table;
+
+}
+#endif
+
 
 /**
  * centrino_init - initializes the Enhanced SpeedStep CPUFreq driver
@@ -348,15 +406,19 @@
 	for(model = models; model->model_name != NULL; model++)
 		if (strcmp(cpu->x86_model_id, model->model_name) == 0)
 			break;
-	if (model->model_name == NULL) {
-		printk(KERN_INFO PFX "no support for CPU model \"%s\": "
+	if (model->model_name) {
+		centrino_table = model->op_points;
+	} else if (model->model_name == NULL) {
+		printk(KERN_INFO PFX "no hardcoded support for CPU model \"%s\": "
 		       "send /proc/cpuinfo to " MAINTAINER "\n",
 		       cpu->x86_model_id);
-		return -ENOENT;
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
+		centrino_table = get_frequency_table_from_acpi();
+		if (!centrino_table)
+#endif
+			return -ENOENT;
 	}
 
-	centrino_model = model;
-		
 	printk(KERN_INFO PFX "found \"%s\": max frequency: %dkHz\n",
 	       model->model_name, model->max_freq);
