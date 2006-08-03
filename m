From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: [PATCH 4/8] acpi-cpufreq: remove ACPI from speedstep-centrino driver
 -- updated to not revert Jeremy's patch
Date: Thu, 03 Aug 2006 13:02:47 +0400
Message-ID: <44D1BBB7.6010903@linux.intel.com>
References: <44CE5015.2090200@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44CE5015.2090200@linux.intel.com>
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
To: "Brown, Len" <len.brown@intel.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

 speedstep-centrino.c |  234 +++------------------------------------------------
 1 file changed, 17 insertions(+), 217 deletions(-)

remove ACPI from speedstep-centrino driver

Signed-off-by: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Index: linux-2.6.15.1/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
===================================================================
--- linux-2.6.15.1.orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
2006-08-03 12:37:51.000000000 +0400
+++ linux-2.6.15.1/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2006-08-03
12:58:01.000000000 +0400
@@ -21,11 +21,6 @@
 #include <linux/delay.h>
 #include <linux/compiler.h>

-#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
-#include <linux/acpi.h>
-#include <acpi/processor.h>
-#endif
-
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
@@ -255,9 +250,6 @@
 		/* Matched a non-match */
 		dprintk("no table support for CPU model \"%s\"\n",
 		       cpu->x86_model_id);
-#ifndef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
-		dprintk("try compiling with CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled\n");
-#endif
 		return -ENOENT;
 	}

@@ -344,169 +336,6 @@
 }


-#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
-
-static struct acpi_processor_performance *acpi_perf_data[NR_CPUS];
-
-/*
- * centrino_cpu_early_init_acpi - Do the preregistering with ACPI P-States
- * library
- *
- * Before doing the actual init, we need to do _PSD related setup whenever
- * supported by the BIOS. These are handled by this early_init routine.
- */
-static int centrino_cpu_early_init_acpi(void)
-{
-	unsigned int	i, j;
-	struct acpi_processor_performance	*data;
-
-	for_each_possible_cpu(i) {
-		data = kzalloc(sizeof(struct acpi_processor_performance),
-				GFP_KERNEL);
-		if (!data) {
-			for_each_possible_cpu(j) {
-				kfree(acpi_perf_data[j]);
-				acpi_perf_data[j] = NULL;
-			}
-			return (-ENOMEM);
-		}
-		acpi_perf_data[i] = data;
-	}
-
-	acpi_processor_preregister_performance(acpi_perf_data);
-	return 0;
-}
-
-/*
- * centrino_cpu_init_acpi - register with ACPI P-States library
- *
- * Register with the ACPI P-States library (part of drivers/acpi/processor.c)
- * in order to determine correct frequency and voltage pairings by reading
- * the _PSS of the ACPI DSDT or SSDT tables.
- */
-static int centrino_cpu_init_acpi(struct cpufreq_policy *policy)
-{
-	unsigned long			cur_freq;
-	int				result = 0, i;
-	unsigned int			cpu = policy->cpu;
-	struct acpi_processor_performance	*p;
-
-	p = acpi_perf_data[cpu];
-
-	/* register with ACPI core */
-	if (acpi_processor_register_performance(p, cpu)) {
-		dprintk(PFX "obtaining ACPI data failed\n");
-		return -EIO;
-	}
-	policy->shared_type = p->shared_type;
-	/*
-	 * Will let policy->cpus know about dependency only when software
-	 * coordination is required.
-	 */
-	if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
-	    policy->shared_type == CPUFREQ_SHARED_TYPE_ANY)
-		policy->cpus = p->shared_cpu_map;
-
-	/* verify the acpi_data */
-	if (p->state_count <= 1) {
-		dprintk("No P-States\n");
-		result = -ENODEV;
-		goto err_unreg;
-	}
-
-	if ((p->control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
-	    (p->status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
-		dprintk("Invalid control/status registers (%x - %x)\n",
-			p->control_register.space_id, p->status_register.space_id);
-		result = -EIO;
-		goto err_unreg;
-	}
-
-	for (i=0; i<p->state_count; i++) {
-		if (p->states[i].control != p->states[i].status) {
-			dprintk("Different control (%llu) and status values (%llu)\n",
-				p->states[i].control, p->states[i].status);
-			result = -EINVAL;
-			goto err_unreg;
-		}
-
-		if (!p->states[i].core_frequency) {
-			dprintk("Zero core frequency for state %u\n", i);
-			result = -EINVAL;
-			goto err_unreg;
-		}
-
-		if (p->states[i].core_frequency > p->states[0].core_frequency) {
-			dprintk("P%u has larger frequency (%llu) than P0 (%llu), skipping\n", i,
-				p->states[i].core_frequency, p->states[0].core_frequency);
-			p->states[i].core_frequency = 0;
-			continue;
-		}
-	}
-
-	centrino_model[cpu] = kzalloc(sizeof(struct cpu_model), GFP_KERNEL);
-	if (!centrino_model[cpu]) {
-		result = -ENOMEM;
-		goto err_unreg;
-	}
-
-	centrino_model[cpu]->model_name=NULL;
-	centrino_model[cpu]->max_freq = p->states[0].core_frequency * 1000;
-	centrino_model[cpu]->op_points =  kmalloc(sizeof(struct cpufreq_frequency_table) *
-					     (p->state_count + 1), GFP_KERNEL);
-        if (!centrino_model[cpu]->op_points) {
-                result = -ENOMEM;
-                goto err_kfree;
-        }
-
-        for (i=0; i<p->state_count; i++) {
-		centrino_model[cpu]->op_points[i].index = p->states[i].control;
-		centrino_model[cpu]->op_points[i].frequency = p->states[i].core_frequency * 1000;
-		dprintk("adding state %i with frequency %u and control value %04x\n",
-			i, centrino_model[cpu]->op_points[i].frequency,
centrino_model[cpu]->op_points[i].index);
-	}
-	centrino_model[cpu]->op_points[p->state_count].frequency = CPUFREQ_TABLE_END;
-
-	cur_freq = get_cur_freq(cpu);
-
-	for (i=0; i<p->state_count; i++) {
-		if (!p->states[i].core_frequency) {
-			dprintk("skipping state %u\n", i);
-			centrino_model[cpu]->op_points[i].frequency = CPUFREQ_ENTRY_INVALID;
-			continue;
-		}
-		
-		if (extract_clock(centrino_model[cpu]->op_points[i].index, cpu, 0) !=
-		    (centrino_model[cpu]->op_points[i].frequency)) {
-			dprintk("Invalid encoded frequency (%u vs. %u)\n",
-				extract_clock(centrino_model[cpu]->op_points[i].index, cpu, 0),
-				centrino_model[cpu]->op_points[i].frequency);
-			result = -EINVAL;
-			goto err_kfree_all;
-		}
-
-		if (cur_freq == centrino_model[cpu]->op_points[i].frequency)
-			p->state = i;
-	}
-
-	/* notify BIOS that we exist */
-	acpi_processor_notify_smm(THIS_MODULE);
-
-	return 0;
-
- err_kfree_all:
-	kfree(centrino_model[cpu]->op_points);
- err_kfree:
-	kfree(centrino_model[cpu]);
- err_unreg:
-	acpi_processor_unregister_performance(p, cpu);
-	dprintk(PFX "invalid ACPI data\n");
-	return (result);
-}
-#else
-static inline int centrino_cpu_init_acpi(struct cpufreq_policy *policy) {
return -ENODEV; }
-static inline int centrino_cpu_early_init_acpi(void) { return 0; }
-#endif

 static int centrino_cpu_init(struct cpufreq_policy *policy)
 {
@@ -523,27 +352,25 @@
 	if (cpu_has(cpu, X86_FEATURE_CONSTANT_TSC))
 		centrino_driver.flags |= CPUFREQ_CONST_LOOPS;

-	if (centrino_cpu_init_acpi(policy)) {
-		if (policy->cpu != 0)
-			return -ENODEV;
+	if (policy->cpu != 0)
+		return -ENODEV;

-		for (i = 0; i < N_IDS; i++)
-			if (centrino_verify_cpu_id(cpu, &cpu_ids[i]))
-				break;
-
-		if (i != N_IDS)
-			centrino_cpu[policy->cpu] = &cpu_ids[i];
-
-		if (!centrino_cpu[policy->cpu]) {
-			dprintk("found unsupported CPU with "
-			"Enhanced SpeedStep: send /proc/cpuinfo to "
-			MAINTAINER "\n");
-			return -ENODEV;
-		}
+	for (i = 0; i < N_IDS; i++)
+		if (centrino_verify_cpu_id(cpu, &cpu_ids[i]))
+			break;

-		if (centrino_cpu_init_table(policy)) {
-			return -ENODEV;
-		}
+	if (i != N_IDS)
+		centrino_cpu[policy->cpu] = &cpu_ids[i];
+
+	if (!centrino_cpu[policy->cpu]) {
+		dprintk("found unsupported CPU with "
+		"Enhanced SpeedStep: send /proc/cpuinfo to "
+		MAINTAINER "\n");
+		return -ENODEV;
+	}
+
+	if (centrino_cpu_init_table(policy)) {
+		return -ENODEV;
 	}

 	/* Check to see if Enhanced SpeedStep is enabled, and try to
@@ -589,20 +416,6 @@

 	cpufreq_frequency_table_put_attr(cpu);

-#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
-	if (!centrino_model[cpu]->model_name) {
-		static struct acpi_processor_performance *p;
-
-		if (acpi_perf_data[cpu]) {
-			p = acpi_perf_data[cpu];
-			dprintk("unregistering and freeing ACPI data\n");
-			acpi_processor_unregister_performance(p, cpu);
-			kfree(centrino_model[cpu]->op_points);
-			kfree(centrino_model[cpu]);
-		}
-	}
-#endif
-
 	centrino_model[cpu] = NULL;

 	return 0;
@@ -796,25 +609,12 @@
 	if (!cpu_has(cpu, X86_FEATURE_EST))
 		return -ENODEV;

-	centrino_cpu_early_init_acpi();
-
 	return cpufreq_register_driver(&centrino_driver);
 }

 static void __exit centrino_exit(void)
 {
-#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
-	unsigned int j;
-#endif
-	
 	cpufreq_unregister_driver(&centrino_driver);
-
-#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
-	for_each_possible_cpu(j) {
-		kfree(acpi_perf_data[j]);
-		acpi_perf_data[j] = NULL;
-	}
-#endif
 }

 MODULE_AUTHOR ("Jeremy Fitzhardinge <jeremy@goop.org>");
