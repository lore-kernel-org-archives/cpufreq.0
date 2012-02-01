From: "Rudramuni, Vishwesh M" <vishwesh.m.rudramuni@intel.com>
Subject: sfi based cpufreq driver for intel soc platforms
Date: Wed, 1 Feb 2012 10:59:49 +0000
Message-ID: <C9B248CF4BE2844B92616616440223E8049984@BGSMSX101.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_C9B248CF4BE2844B92616616440223E8049984BGSMSX101garcorpi_"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "davej@redhat.com" <davej@redhat.com>
Cc: "Seshadri, Harinarayanan" <harinarayanan.seshadri@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Brown, Len" <len.brown@intel.com>

--_002_C9B248CF4BE2844B92616616440223E8049984BGSMSX101garcorpi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 507b896942045c0df3073960922c9d5d88b8fa2c Mon Sep 17 00:00:00 2001
From: Vishwesh M Rudramuni <vishwesh.m.rudramuni@intel.com>
Date: Thu, 2 Feb 2012 16:07:31 +0530
Subject: [PATCH] [CPUFREQ] sfi based p-state driver

This is the sfi p-state driver for all the intel soc platforms.
This is based on the acpi p-state driver.This patch is generated
against linux 3.2.2.

Signed-off-by: Vishwesh M Rudramuni <vishwesh.m.rudramuni@intel.com>
Acked-by: Len Brown <len.brown@intel.com>
Reviewed-by: Hari Sesadri <harinarayanan.sesadri@intel.com>
Reviewed-by: Rajeev D Muralidhar <rajeev.d.muralidhar@intel.com>
---
 drivers/cpufreq/Kconfig.x86   |   15 ++
 drivers/cpufreq/Makefile      |    1 +
 drivers/cpufreq/sfi-cpufreq.c |  529 +++++++++++++++++++++++++++++++++++++=
++++
 drivers/cpufreq/sfi-cpufreq.h |   65 +++++
 4 files changed, 610 insertions(+), 0 deletions(-)
 create mode 100644 drivers/cpufreq/sfi-cpufreq.c
 create mode 100644 drivers/cpufreq/sfi-cpufreq.h

diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
index 78ff7ee..7c53591 100644
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@ -32,6 +32,21 @@ config X86_ACPI_CPUFREQ
=20
 	  If in doubt, say N.
=20
+config X86_SFI_CPUFREQ
+        tristate "SFI Processor P-States driver"
+        select CPU_FREQ_TABLE
+        help
+	This driver adds a CPUFreq driver which utilizes the SFI
+	Processor Performance States.
+	This driver also supports Intel Enhanced Speedstep.
+
+	To compile this driver as a module, choose M here: the
+	module will be called sfi-cpufreq.
+
+	For details, take a look at <file:Documentation/cpu-freq/>.
+
+	If in doubt, say N.
+
 config ELAN_CPUFREQ
 	tristate "AMD Elan SC400 and SC410"
 	select CPU_FREQ_TABLE
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index a48bc02..5ac8987 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_CPU_FREQ_TABLE)		+=3D freq_table.o
=20
 obj-$(CONFIG_X86_POWERNOW_K8)		+=3D powernow-k8.o mperf.o
 obj-$(CONFIG_X86_ACPI_CPUFREQ)		+=3D acpi-cpufreq.o mperf.o
+obj-$(CONFIG_X86_ACPI_CPUFREQ)		+=3D sfi-cpufreq.o mperf.o
 obj-$(CONFIG_X86_PCC_CPUFREQ)		+=3D pcc-cpufreq.o
 obj-$(CONFIG_X86_POWERNOW_K6)		+=3D powernow-k6.o
 obj-$(CONFIG_X86_POWERNOW_K7)		+=3D powernow-k7.o
diff --git a/drivers/cpufreq/sfi-cpufreq.c b/drivers/cpufreq/sfi-cpufreq.c
new file mode 100644
index 0000000..591d41e
--- /dev/null
+++ b/drivers/cpufreq/sfi-cpufreq.c
@@ -0,0 +1,529 @@
+/*
+ * sfi_cpufreq.c - sfi Processor P-States Driver
+ *
+ * (C) 2010-2011 Intel Corporation
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License.
+ *
+ *  This program is distributed in the hope that it will be useful, but
+ *  WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *  You should have received a copy of the GNU General Public License alon=
g
+ *  with this program; if not, write to the Free Software Foundation, Inc.=
,
+ *  59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
+ * Author: Vishwesh M Rudramuni
+ * Contact information: Vishwesh Rudramuni <vishwesh.m.rudramuni@intel.com=
>
+ */
+
+/*
+ * This sfi Processor P-States Driver re-uses most part of the code availa=
ble
+ * in acpi cpufreq driver.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/smp.h>
+#include <linux/sched.h>
+#include <linux/cpufreq.h>
+#include <linux/compiler.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/uaccess.h>
+#include <linux/sfi.h>
+#include <linux/io.h>
+
+#include <asm/msr.h>
+#include <asm/processor.h>
+#include <asm/cpufeature.h>
+
+#include "sfi-cpufreq.h"
+#include "mperf.h"
+
+MODULE_AUTHOR("Vishwesh Rudramuni");
+MODULE_DESCRIPTION("SFI Processor P-States Driver");
+MODULE_LICENSE("GPL");
+
+DEFINE_PER_CPU(struct sfi_processor *, sfi_processors);
+
+static DEFINE_MUTEX(performance_mutex);
+static int sfi_cpufreq_num;
+static u32 sfi_cpu_num;
+
+#define		SFI_FREQ_MAX            32
+#define		INTEL_MSR_RANGE		(0xffff)
+#define		SFI_CPU_MAX		8
+
+
+struct sfi_cpufreq_data {
+	struct sfi_processor_performance *sfi_data;
+	struct cpufreq_frequency_table *freq_table;
+	unsigned int max_freq;
+	unsigned int resume;
+};
+
+static DEFINE_PER_CPU(struct sfi_cpufreq_data *, drv_data);
+struct sfi_freq_table_entry sfi_cpufreq_array[SFI_FREQ_MAX];
+static struct sfi_cpu_table_entry sfi_cpu_array[SFI_CPU_MAX];
+
+/* sfi_perf_data is a pointer to percpu data. */
+static struct sfi_processor_performance *sfi_perf_data;
+
+static struct cpufreq_driver sfi_cpufreq_driver;
+
+static int parse_freq(struct sfi_table_header *table)
+{
+	struct sfi_table_simple *sb;
+	struct sfi_freq_table_entry *pentry;
+	int totallen;
+
+	sb =3D (struct sfi_table_simple *)table;
+	if (!sb) {
+		printk(KERN_WARNING "SFI: Unable to map FREQ\n");
+		return -ENODEV;
+	}
+
+	if (!sfi_cpufreq_num) {
+		sfi_cpufreq_num =3D SFI_GET_NUM_ENTRIES(sb,
+			 struct sfi_freq_table_entry);
+		pentry =3D (struct sfi_freq_table_entry *)sb->pentry;
+		totallen =3D sfi_cpufreq_num * sizeof(*pentry);
+		memcpy(sfi_cpufreq_array, pentry, totallen);
+	}
+
+	return 0;
+}
+
+static int sfi_processor_get_performance_states(struct sfi_processor *pr)
+{
+	int result =3D 0;
+	int i;
+
+	pr->performance->state_count =3D sfi_cpufreq_num;
+	pr->performance->states =3D
+	    kmalloc(sizeof(struct sfi_processor_px) * sfi_cpufreq_num,
+		    GFP_KERNEL);
+	if (!pr->performance->states)
+		result =3D -ENOMEM;
+
+	printk(KERN_INFO "Num p-states %d\n", sfi_cpufreq_num);
+
+	/* Populate the P-states info from the SFI table here */
+	for (i =3D 0; i < sfi_cpufreq_num; i++) {
+		pr->performance->states[i].core_frequency =3D \
+			sfi_cpufreq_array[i].freq_mhz;
+		pr->performance->states[i].transition_latency =3D \
+			sfi_cpufreq_array[i].latency;
+		pr->performance->states[i].control =3D \
+			sfi_cpufreq_array[i].ctrl_val;
+		printk(KERN_INFO "State [%d]: core_frequency[%d] transition_latency[%d] =
control[0x%x]\n",
+			i,
+			(u32) pr->performance->states[i].core_frequency,
+			(u32) pr->performance->states[i].transition_latency,
+			(u32) pr->performance->states[i].control);
+	}
+
+	return result;
+}
+
+static int sfi_processor_register_performance(struct sfi_processor_perform=
ance
+				    *performance, unsigned int cpu)
+{
+	struct sfi_processor *pr;
+
+	mutex_lock(&performance_mutex);
+
+	pr =3D per_cpu(sfi_processors, cpu);
+	if (!pr) {
+		mutex_unlock(&performance_mutex);
+		return -ENODEV;
+	}
+
+	if (pr->performance) {
+		mutex_unlock(&performance_mutex);
+		return -EBUSY;
+	}
+
+	WARN_ON(!performance);
+
+	pr->performance =3D performance;
+
+	/* parse the freq table from sfi */
+	sfi_cpufreq_num =3D 0;
+	sfi_table_parse(SFI_SIG_FREQ, NULL, NULL, parse_freq);
+
+	sfi_processor_get_performance_states(pr);
+
+	mutex_unlock(&performance_mutex);
+	return 0;
+}
+
+void sfi_processor_unregister_performance(struct sfi_processor_performance
+				      *performance, unsigned int cpu)
+{
+	struct sfi_processor *pr;
+
+
+	mutex_lock(&performance_mutex);
+
+	pr =3D per_cpu(sfi_processors, cpu);
+	if (!pr) {
+		mutex_unlock(&performance_mutex);
+		return;
+	}
+
+	if (pr->performance)
+		kfree(pr->performance->states);
+	pr->performance =3D NULL;
+
+	mutex_unlock(&performance_mutex);
+
+	return;
+}
+
+static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
+{
+	struct sfi_cpufreq_data *data =3D per_cpu(drv_data, cpu);
+	unsigned int cached_freq;
+
+	pr_debug("get_cur_freq_on_cpu (%d)\n", cpu);
+
+	if (unlikely(data =3D=3D NULL ||
+		data->sfi_data =3D=3D NULL || data->freq_table =3D=3D NULL)) {
+		return 0;
+	}
+
+	cached_freq =3D data->freq_table[data->sfi_data->state].frequency;
+
+	return cached_freq;
+}
+
+static int sfi_cpufreq_target(struct cpufreq_policy *policy,
+			       unsigned int target_freq, unsigned int relation)
+{
+	struct sfi_cpufreq_data *data =3D per_cpu(drv_data, policy->cpu);
+	struct sfi_processor_performance *perf;
+	struct cpufreq_freqs freqs;
+	unsigned int next_state =3D 0; /* Index into freq_table */
+	unsigned int next_perf_state =3D 0; /* Index into perf table */
+	int result =3D 0;
+	u32 lo, hi;
+
+	pr_debug("sfi_cpufreq_target %d (%d)\n", target_freq, policy->cpu);
+
+	if (unlikely(data =3D=3D NULL ||
+	     data->sfi_data =3D=3D NULL || data->freq_table =3D=3D NULL)) {
+		return -ENODEV;
+	}
+
+	perf =3D data->sfi_data;
+	result =3D cpufreq_frequency_table_target(policy,
+						data->freq_table,
+						target_freq,
+						relation, &next_state);
+	if (unlikely(result))
+		return -ENODEV;
+
+	next_perf_state =3D data->freq_table[next_state].index;
+	if (perf->state =3D=3D next_perf_state) {
+		if (unlikely(data->resume)) {
+			pr_debug("Called after resume, resetting to P%d\n",
+				next_perf_state);
+			data->resume =3D 0;
+		} else {
+			pr_debug("Already at target state (P%d)\n",
+				next_perf_state);
+			return 0;
+		}
+	}
+
+	freqs.old =3D perf->states[perf->state].core_frequency * 1000;
+	freqs.new =3D data->freq_table[next_state].frequency;
+	freqs.cpu =3D policy->cpu;
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+
+	rdmsr_on_cpu(policy->cpu, MSR_IA32_PERF_CTL, &lo, &hi);
+	lo =3D (lo & ~INTEL_MSR_RANGE) |
+		((u32) perf->states[next_perf_state].control & INTEL_MSR_RANGE);
+	wrmsr_on_cpu(policy->cpu, MSR_IA32_PERF_CTL, lo, hi);
+
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	perf->state =3D next_perf_state;
+
+	return result;
+}
+
+static int sfi_cpufreq_verify(struct cpufreq_policy *policy)
+{
+	struct sfi_cpufreq_data *data =3D per_cpu(drv_data, policy->cpu);
+
+	pr_debug("sfi_cpufreq_verify\n");
+
+	return cpufreq_frequency_table_verify(policy, data->freq_table);
+}
+
+/*
+ * sfi_cpufreq_early_init - initialize SFI P-States library
+ *
+ * Initialize the SFI P-States library (drivers/sfi/processor_perflib.c)
+ * in order to cope with the correct frequency and voltage pairings.
+ */
+static int __init sfi_cpufreq_early_init(void)
+{
+	sfi_perf_data =3D alloc_percpu(struct sfi_processor_performance);
+	if (!sfi_perf_data) {
+		pr_debug("Memory allocation error for sfi_perf_data.\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+
+static int sfi_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+	unsigned int i;
+	unsigned int valid_states =3D 0;
+	unsigned int cpu =3D policy->cpu;
+	struct sfi_cpufreq_data *data;
+	unsigned int result =3D 0;
+	struct cpuinfo_x86 *c =3D &cpu_data(policy->cpu);
+	struct sfi_processor_performance *perf;
+
+	pr_debug("sfi_cpufreq_cpu_init CPU:%d\n", policy->cpu);
+
+	data =3D kzalloc(sizeof(struct sfi_cpufreq_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->sfi_data =3D per_cpu_ptr(sfi_perf_data, cpu);
+	per_cpu(drv_data, cpu) =3D data;
+
+	sfi_cpufreq_driver.flags |=3D CPUFREQ_CONST_LOOPS;
+
+
+	result =3D sfi_processor_register_performance(data->sfi_data, cpu);
+	if (result)
+		goto err_free;
+
+	perf =3D data->sfi_data;
+	policy->shared_type =3D CPUFREQ_SHARED_TYPE_HW;
+
+	cpumask_set_cpu(policy->cpu, policy->cpus);
+	cpumask_set_cpu(policy->cpu, policy->related_cpus);
+
+	/* capability check */
+	if (perf->state_count <=3D 1) {
+		pr_debug("No P-States\n");
+		result =3D -ENODEV;
+		goto err_unreg;
+	}
+
+	data->freq_table =3D kzalloc(sizeof(struct cpufreq_frequency_table) *
+		    (perf->state_count+1), GFP_KERNEL);
+	if (!data->freq_table) {
+		result =3D -ENOMEM;
+		goto err_unreg;
+	}
+
+	/* detect transition latency */
+	policy->cpuinfo.transition_latency =3D 0;
+	for (i =3D 0; i < perf->state_count; i++) {
+		if ((perf->states[i].transition_latency * 1000) >
+		    policy->cpuinfo.transition_latency)
+			policy->cpuinfo.transition_latency =3D
+			    perf->states[i].transition_latency * 1000;
+	}
+
+	data->max_freq =3D perf->states[0].core_frequency * 1000;
+	/* table init */
+	for (i =3D 0; i < perf->state_count; i++) {
+		if (i > 0 && perf->states[i].core_frequency >=3D
+		    data->freq_table[valid_states-1].frequency / 1000)
+			continue;
+
+		data->freq_table[valid_states].index =3D i;
+		data->freq_table[valid_states].frequency =3D
+		    perf->states[i].core_frequency * 1000;
+		valid_states++;
+	}
+	data->freq_table[valid_states].frequency =3D CPUFREQ_TABLE_END;
+	perf->state =3D 0;
+
+	result =3D cpufreq_frequency_table_cpuinfo(policy, data->freq_table);
+	if (result)
+		goto err_freqfree;
+
+	sfi_cpufreq_driver.get =3D get_cur_freq_on_cpu;
+	policy->cur =3D get_cur_freq_on_cpu(cpu);
+
+
+	/* Check for APERF/MPERF support in hardware */
+	if (cpu_has(c, X86_FEATURE_APERFMPERF))
+		sfi_cpufreq_driver.getavg =3D cpufreq_get_measured_perf;
+
+	pr_debug("CPU%u - SFI performance management activated.\n", cpu);
+	for (i =3D 0; i < perf->state_count; i++)
+		pr_debug("     %cP%d: %d MHz, %d uS\n",
+			(i =3D=3D perf->state ? '*' : ' '), i,
+			(u32) perf->states[i].core_frequency,
+			(u32) perf->states[i].transition_latency);
+
+	cpufreq_frequency_table_get_attr(data->freq_table, policy->cpu);
+
+	/*
+	 * the first call to ->target() should result in us actually
+	 * writing something to the appropriate registers.
+	 */
+	data->resume =3D 1;
+
+	return result;
+
+err_freqfree:
+	kfree(data->freq_table);
+err_unreg:
+	sfi_processor_unregister_performance(perf, cpu);
+err_free:
+	kfree(data);
+	per_cpu(drv_data, cpu) =3D NULL;
+
+	return result;
+}
+
+static int sfi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+{
+	struct sfi_cpufreq_data *data =3D per_cpu(drv_data, policy->cpu);
+
+	pr_debug("sfi_cpufreq_cpu_exit\n");
+
+	if (data) {
+		cpufreq_frequency_table_put_attr(policy->cpu);
+		per_cpu(drv_data, policy->cpu) =3D NULL;
+		sfi_processor_unregister_performance(data->sfi_data,
+							policy->cpu);
+		kfree(data);
+	}
+
+	return 0;
+}
+
+static int sfi_cpufreq_resume(struct cpufreq_policy *policy)
+{
+	struct sfi_cpufreq_data *data =3D per_cpu(drv_data, policy->cpu);
+
+	pr_debug("sfi_cpufreq_resume\n");
+
+	data->resume =3D 1;
+
+	return 0;
+}
+
+static struct freq_attr *sfi_cpufreq_attr[] =3D {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
+static struct cpufreq_driver sfi_cpufreq_driver =3D {
+	.verify =3D sfi_cpufreq_verify,
+	.target =3D sfi_cpufreq_target,
+	.init =3D sfi_cpufreq_cpu_init,
+	.exit =3D sfi_cpufreq_cpu_exit,
+	.resume =3D sfi_cpufreq_resume,
+	.name =3D "sfi-cpufreq",
+	.owner =3D THIS_MODULE,
+	.attr =3D sfi_cpufreq_attr,
+};
+
+static int __init parse_cpus(struct sfi_table_header *table)
+{
+	struct sfi_table_simple *sb;
+	struct sfi_cpu_table_entry *pentry;
+	int i;
+
+	sb =3D (struct sfi_table_simple *)table;
+
+	sfi_cpu_num =3D SFI_GET_NUM_ENTRIES(sb, struct sfi_cpu_table_entry);
+
+	pentry =3D (struct sfi_cpu_table_entry *) sb->pentry;
+	for (i =3D 0; i < sfi_cpu_num; i++) {
+		sfi_cpu_array[i].apic_id =3D pentry->apic_id;
+		printk(KERN_INFO "APIC ID: %d\n", pentry->apic_id);
+		pentry++;
+	}
+
+	return 0;
+
+}
+
+
+static int __init init_sfi_processor_list(void)
+{
+	struct sfi_processor *pr;
+	int i;
+	int result;
+
+	/* parse the cpus from the sfi table */
+	result =3D sfi_table_parse(SFI_SIG_CPUS, NULL, NULL, parse_cpus);
+
+	if (result < 0)
+		return result;
+
+	pr =3D kzalloc(sfi_cpu_num * sizeof(struct sfi_processor), GFP_KERNEL);
+	if (!pr)
+		return -ENOMEM;
+
+	for (i =3D 0; i < sfi_cpu_num; i++) {
+		pr->id =3D sfi_cpu_array[i].apic_id;
+		per_cpu(sfi_processors, pr->id) =3D pr;
+		pr++;
+	}
+
+	return 0;
+}
+
+static int __init sfi_cpufreq_init(void)
+{
+	int ret;
+
+	pr_debug("sfi_cpufreq_init\n");
+
+	ret =3D init_sfi_processor_list();
+	if (ret)
+		return ret;
+
+	ret =3D sfi_cpufreq_early_init();
+	if (ret)
+		return ret;
+
+	return cpufreq_register_driver(&sfi_cpufreq_driver);
+}
+
+static void __exit sfi_cpufreq_exit(void)
+{
+
+	struct sfi_processor *pr;
+
+	pr_debug("sfi_cpufreq_exit\n");
+
+	pr =3D per_cpu(sfi_processors, 0);
+	kfree(pr);
+
+	cpufreq_unregister_driver(&sfi_cpufreq_driver);
+
+	free_percpu(sfi_perf_data);
+
+	return;
+}
+late_initcall(sfi_cpufreq_init);
+module_exit(sfi_cpufreq_exit);
+
+MODULE_ALIAS("sfi");
diff --git a/drivers/cpufreq/sfi-cpufreq.h b/drivers/cpufreq/sfi-cpufreq.h
new file mode 100644
index 0000000..7e01c1e
--- /dev/null
+++ b/drivers/cpufreq/sfi-cpufreq.h
@@ -0,0 +1,65 @@
+/*
+ * sfi_processor.h
+ * Copyright (c) 2010, Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along=
 with
+ * this program; if not, write to the Free Software Foundation, Inc.,
+ * 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
+ *
+ */
+
+#ifndef __SFI_PROCESSOR_H__
+#define __SFI_PROCESSOR_H__
+
+#include <linux/sfi.h>
+#include <linux/cpuidle.h>
+
+struct sfi_processor_power {
+	struct cpuidle_device dev;
+	u32 default_state;
+	int count;
+	struct cpuidle_state *states;
+	struct sfi_cstate_table_entry *sfi_cstates;
+};
+
+struct sfi_processor_flags {
+	u8 valid;
+	u8 power;
+};
+
+struct sfi_processor {
+	u32 id;
+	struct sfi_processor_flags flags;
+	struct sfi_processor_power power;
+	struct sfi_processor_performance *performance;
+};
+
+/* Performance management */
+struct sfi_processor_px {
+	u32 core_frequency;	/* megahertz */
+	u32 transition_latency;	/* microseconds */
+	u32 control;	/* control value */
+};
+
+struct sfi_processor_performance {
+	unsigned int state;
+	unsigned int state_count;
+	struct sfi_processor_px *states;
+};
+
+/* for communication between multiple parts of the processor kernel module=
 */
+DECLARE_PER_CPU(struct sfi_processor *, sfi_processors);
+
+int sfi_processor_power_init(struct sfi_processor *pr);
+int sfi_processor_power_exit(struct sfi_processor *pr);
+
+#endif /*__SFI_PROCESSOR_H__*/
--=20
1.7.0.4


--_002_C9B248CF4BE2844B92616616440223E8049984BGSMSX101garcorpi_
Content-Type: application/octet-stream;
	name="0001-CPUFREQ-sfi-based-p-state-driver.patch"
Content-Description: 0001-CPUFREQ-sfi-based-p-state-driver.patch
Content-Disposition: attachment;
	filename="0001-CPUFREQ-sfi-based-p-state-driver.patch"; size=18245;
	creation-date="Wed, 01 Feb 2012 10:37:41 GMT";
	modification-date="Wed, 01 Feb 2012 10:56:22 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1MDdiODk2OTQyMDQ1YzBkZjMwNzM5NjA5MjJjOWQ1ZDg4YjhmYTJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXNod2VzaCBNIFJ1ZHJhbXVuaSA8dmlzaHdlc2gubS5ydWRy
YW11bmlAaW50ZWwuY29tPgpEYXRlOiBUaHUsIDIgRmViIDIwMTIgMTY6MDc6MzEgKzA1MzAKU3Vi
amVjdDogW1BBVENIXSBbQ1BVRlJFUV0gc2ZpIGJhc2VkIHAtc3RhdGUgZHJpdmVyCgpUaGlzIGlz
IHRoZSBzZmkgcC1zdGF0ZSBkcml2ZXIgZm9yIGFsbCB0aGUgaW50ZWwgc29jIHBsYXRmb3Jtcy4K
VGhpcyBpcyBiYXNlZCBvbiB0aGUgYWNwaSBwLXN0YXRlIGRyaXZlci5UaGlzIHBhdGNoIGlzIGdl
bmVyYXRlZAphZ2FpbnN0IGxpbnV4IDMuMi4yLgoKU2lnbmVkLW9mZi1ieTogVmlzaHdlc2ggTSBS
dWRyYW11bmkgPHZpc2h3ZXNoLm0ucnVkcmFtdW5pQGludGVsLmNvbT4KQWNrZWQtYnk6IExlbiBC
cm93biA8bGVuLmJyb3duQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcmkgU2VzYWRyaSA8aGFy
aW5hcmF5YW5hbi5zZXNhZHJpQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFJhamVldiBEIE11cmFs
aWRoYXIgPHJhamVldi5kLm11cmFsaWRoYXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvY3B1ZnJl
cS9LY29uZmlnLng4NiAgIHwgICAxNSArKwogZHJpdmVycy9jcHVmcmVxL01ha2VmaWxlICAgICAg
fCAgICAxICsKIGRyaXZlcnMvY3B1ZnJlcS9zZmktY3B1ZnJlcS5jIHwgIDUyOSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9jcHVmcmVxL3NmaS1jcHVm
cmVxLmggfCAgIDY1ICsrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDYxMCBpbnNlcnRpb25zKCspLCAw
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY3B1ZnJlcS9zZmktY3B1
ZnJlcS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jcHVmcmVxL3NmaS1jcHVmcmVxLmgK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWZyZXEvS2NvbmZpZy54ODYgYi9kcml2ZXJzL2NwdWZy
ZXEvS2NvbmZpZy54ODYKaW5kZXggNzhmZjdlZS4uN2M1MzU5MSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9jcHVmcmVxL0tjb25maWcueDg2CisrKyBiL2RyaXZlcnMvY3B1ZnJlcS9LY29uZmlnLng4NgpA
QCAtMzIsNiArMzIsMjEgQEAgY29uZmlnIFg4Nl9BQ1BJX0NQVUZSRVEKIAogCSAgSWYgaW4gZG91
YnQsIHNheSBOLgogCitjb25maWcgWDg2X1NGSV9DUFVGUkVRCisgICAgICAgIHRyaXN0YXRlICJT
RkkgUHJvY2Vzc29yIFAtU3RhdGVzIGRyaXZlciIKKyAgICAgICAgc2VsZWN0IENQVV9GUkVRX1RB
QkxFCisgICAgICAgIGhlbHAKKwlUaGlzIGRyaXZlciBhZGRzIGEgQ1BVRnJlcSBkcml2ZXIgd2hp
Y2ggdXRpbGl6ZXMgdGhlIFNGSQorCVByb2Nlc3NvciBQZXJmb3JtYW5jZSBTdGF0ZXMuCisJVGhp
cyBkcml2ZXIgYWxzbyBzdXBwb3J0cyBJbnRlbCBFbmhhbmNlZCBTcGVlZHN0ZXAuCisKKwlUbyBj
b21waWxlIHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUKKwltb2R1
bGUgd2lsbCBiZSBjYWxsZWQgc2ZpLWNwdWZyZXEuCisKKwlGb3IgZGV0YWlscywgdGFrZSBhIGxv
b2sgYXQgPGZpbGU6RG9jdW1lbnRhdGlvbi9jcHUtZnJlcS8+LgorCisJSWYgaW4gZG91YnQsIHNh
eSBOLgorCiBjb25maWcgRUxBTl9DUFVGUkVRCiAJdHJpc3RhdGUgIkFNRCBFbGFuIFNDNDAwIGFu
ZCBTQzQxMCIKIAlzZWxlY3QgQ1BVX0ZSRVFfVEFCTEUKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1
ZnJlcS9NYWtlZmlsZSBiL2RyaXZlcnMvY3B1ZnJlcS9NYWtlZmlsZQppbmRleCBhNDhiYzAyLi41
YWM4OTg3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2NwdWZyZXEvTWFrZWZpbGUKKysrIGIvZHJpdmVy
cy9jcHVmcmVxL01ha2VmaWxlCkBAIC0yMSw2ICsyMSw3IEBAIG9iai0kKENPTkZJR19DUFVfRlJF
UV9UQUJMRSkJCSs9IGZyZXFfdGFibGUubwogCiBvYmotJChDT05GSUdfWDg2X1BPV0VSTk9XX0s4
KQkJKz0gcG93ZXJub3ctazgubyBtcGVyZi5vCiBvYmotJChDT05GSUdfWDg2X0FDUElfQ1BVRlJF
USkJCSs9IGFjcGktY3B1ZnJlcS5vIG1wZXJmLm8KK29iai0kKENPTkZJR19YODZfQUNQSV9DUFVG
UkVRKQkJKz0gc2ZpLWNwdWZyZXEubyBtcGVyZi5vCiBvYmotJChDT05GSUdfWDg2X1BDQ19DUFVG
UkVRKQkJKz0gcGNjLWNwdWZyZXEubwogb2JqLSQoQ09ORklHX1g4Nl9QT1dFUk5PV19LNikJCSs9
IHBvd2Vybm93LWs2Lm8KIG9iai0kKENPTkZJR19YODZfUE9XRVJOT1dfSzcpCQkrPSBwb3dlcm5v
dy1rNy5vCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWZyZXEvc2ZpLWNwdWZyZXEuYyBiL2RyaXZl
cnMvY3B1ZnJlcS9zZmktY3B1ZnJlcS5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAuLjU5MWQ0MWUKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2NwdWZyZXEvc2ZpLWNwdWZy
ZXEuYwpAQCAtMCwwICsxLDUyOSBAQAorLyoKKyAqIHNmaV9jcHVmcmVxLmMgLSBzZmkgUHJvY2Vz
c29yIFAtU3RhdGVzIERyaXZlcgorICoKKyAqIChDKSAyMDEwLTIwMTEgSW50ZWwgQ29ycG9yYXRp
b24KKyAqCisgKiB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgorICoKKyAqICBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICogIGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVi
bGlzaGVkIGJ5CisgKiAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNp
b24gMiBvZiB0aGUgTGljZW5zZS4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVk
IGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsIGJ1dAorICogIFdJVEhPVVQgQU5Z
IFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqICBNRVJD
SEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhl
IEdOVQorICogIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqICBZ
b3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhbG9uZworICogIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRo
ZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisgKiAgNTkgVGVtcGxlIFBsYWNlLCBT
dWl0ZSAzMzAsIEJvc3RvbiwgTUEgMDIxMTEtMTMwNyBVU0EuCisgKgorICogfn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KKyAqIEF1dGhvcjogVmlzaHdlc2ggTSBSdWRyYW11bmkKKyAqIENvbnRhY3QgaW5mb3Jt
YXRpb246IFZpc2h3ZXNoIFJ1ZHJhbXVuaSA8dmlzaHdlc2gubS5ydWRyYW11bmlAaW50ZWwuY29t
PgorICovCisKKy8qCisgKiBUaGlzIHNmaSBQcm9jZXNzb3IgUC1TdGF0ZXMgRHJpdmVyIHJlLXVz
ZXMgbW9zdCBwYXJ0IG9mIHRoZSBjb2RlIGF2YWlsYWJsZQorICogaW4gYWNwaSBjcHVmcmVxIGRy
aXZlci4KKyAqLworCisjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CisjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvaW5pdC5oPgorI2luY2x1ZGUgPGxpbnV4L3NtcC5o
PgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+CisjaW5jbHVkZSA8bGludXgvY3B1ZnJlcS5oPgor
I2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+CisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorI2lu
Y2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CisjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgorI2luY2x1
ZGUgPGxpbnV4L3NmaS5oPgorI2luY2x1ZGUgPGxpbnV4L2lvLmg+CisKKyNpbmNsdWRlIDxhc20v
bXNyLmg+CisjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgorI2luY2x1ZGUgPGFzbS9jcHVmZWF0
dXJlLmg+CisKKyNpbmNsdWRlICJzZmktY3B1ZnJlcS5oIgorI2luY2x1ZGUgIm1wZXJmLmgiCisK
K01PRFVMRV9BVVRIT1IoIlZpc2h3ZXNoIFJ1ZHJhbXVuaSIpOworTU9EVUxFX0RFU0NSSVBUSU9O
KCJTRkkgUHJvY2Vzc29yIFAtU3RhdGVzIERyaXZlciIpOworTU9EVUxFX0xJQ0VOU0UoIkdQTCIp
OworCitERUZJTkVfUEVSX0NQVShzdHJ1Y3Qgc2ZpX3Byb2Nlc3NvciAqLCBzZmlfcHJvY2Vzc29y
cyk7CisKK3N0YXRpYyBERUZJTkVfTVVURVgocGVyZm9ybWFuY2VfbXV0ZXgpOworc3RhdGljIGlu
dCBzZmlfY3B1ZnJlcV9udW07CitzdGF0aWMgdTMyIHNmaV9jcHVfbnVtOworCisjZGVmaW5lCQlT
RklfRlJFUV9NQVggICAgICAgICAgICAzMgorI2RlZmluZQkJSU5URUxfTVNSX1JBTkdFCQkoMHhm
ZmZmKQorI2RlZmluZQkJU0ZJX0NQVV9NQVgJCTgKKworCitzdHJ1Y3Qgc2ZpX2NwdWZyZXFfZGF0
YSB7CisJc3RydWN0IHNmaV9wcm9jZXNzb3JfcGVyZm9ybWFuY2UgKnNmaV9kYXRhOworCXN0cnVj
dCBjcHVmcmVxX2ZyZXF1ZW5jeV90YWJsZSAqZnJlcV90YWJsZTsKKwl1bnNpZ25lZCBpbnQgbWF4
X2ZyZXE7CisJdW5zaWduZWQgaW50IHJlc3VtZTsKK307CisKK3N0YXRpYyBERUZJTkVfUEVSX0NQ
VShzdHJ1Y3Qgc2ZpX2NwdWZyZXFfZGF0YSAqLCBkcnZfZGF0YSk7CitzdHJ1Y3Qgc2ZpX2ZyZXFf
dGFibGVfZW50cnkgc2ZpX2NwdWZyZXFfYXJyYXlbU0ZJX0ZSRVFfTUFYXTsKK3N0YXRpYyBzdHJ1
Y3Qgc2ZpX2NwdV90YWJsZV9lbnRyeSBzZmlfY3B1X2FycmF5W1NGSV9DUFVfTUFYXTsKKworLyog
c2ZpX3BlcmZfZGF0YSBpcyBhIHBvaW50ZXIgdG8gcGVyY3B1IGRhdGEuICovCitzdGF0aWMgc3Ry
dWN0IHNmaV9wcm9jZXNzb3JfcGVyZm9ybWFuY2UgKnNmaV9wZXJmX2RhdGE7CisKK3N0YXRpYyBz
dHJ1Y3QgY3B1ZnJlcV9kcml2ZXIgc2ZpX2NwdWZyZXFfZHJpdmVyOworCitzdGF0aWMgaW50IHBh
cnNlX2ZyZXEoc3RydWN0IHNmaV90YWJsZV9oZWFkZXIgKnRhYmxlKQoreworCXN0cnVjdCBzZmlf
dGFibGVfc2ltcGxlICpzYjsKKwlzdHJ1Y3Qgc2ZpX2ZyZXFfdGFibGVfZW50cnkgKnBlbnRyeTsK
KwlpbnQgdG90YWxsZW47CisKKwlzYiA9IChzdHJ1Y3Qgc2ZpX3RhYmxlX3NpbXBsZSAqKXRhYmxl
OworCWlmICghc2IpIHsKKwkJcHJpbnRrKEtFUk5fV0FSTklORyAiU0ZJOiBVbmFibGUgdG8gbWFw
IEZSRVFcbiIpOworCQlyZXR1cm4gLUVOT0RFVjsKKwl9CisKKwlpZiAoIXNmaV9jcHVmcmVxX251
bSkgeworCQlzZmlfY3B1ZnJlcV9udW0gPSBTRklfR0VUX05VTV9FTlRSSUVTKHNiLAorCQkJIHN0
cnVjdCBzZmlfZnJlcV90YWJsZV9lbnRyeSk7CisJCXBlbnRyeSA9IChzdHJ1Y3Qgc2ZpX2ZyZXFf
dGFibGVfZW50cnkgKilzYi0+cGVudHJ5OworCQl0b3RhbGxlbiA9IHNmaV9jcHVmcmVxX251bSAq
IHNpemVvZigqcGVudHJ5KTsKKwkJbWVtY3B5KHNmaV9jcHVmcmVxX2FycmF5LCBwZW50cnksIHRv
dGFsbGVuKTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCBzZmlfcHJvY2Vzc29y
X2dldF9wZXJmb3JtYW5jZV9zdGF0ZXMoc3RydWN0IHNmaV9wcm9jZXNzb3IgKnByKQoreworCWlu
dCByZXN1bHQgPSAwOworCWludCBpOworCisJcHItPnBlcmZvcm1hbmNlLT5zdGF0ZV9jb3VudCA9
IHNmaV9jcHVmcmVxX251bTsKKwlwci0+cGVyZm9ybWFuY2UtPnN0YXRlcyA9CisJICAgIGttYWxs
b2Moc2l6ZW9mKHN0cnVjdCBzZmlfcHJvY2Vzc29yX3B4KSAqIHNmaV9jcHVmcmVxX251bSwKKwkJ
ICAgIEdGUF9LRVJORUwpOworCWlmICghcHItPnBlcmZvcm1hbmNlLT5zdGF0ZXMpCisJCXJlc3Vs
dCA9IC1FTk9NRU07CisKKwlwcmludGsoS0VSTl9JTkZPICJOdW0gcC1zdGF0ZXMgJWRcbiIsIHNm
aV9jcHVmcmVxX251bSk7CisKKwkvKiBQb3B1bGF0ZSB0aGUgUC1zdGF0ZXMgaW5mbyBmcm9tIHRo
ZSBTRkkgdGFibGUgaGVyZSAqLworCWZvciAoaSA9IDA7IGkgPCBzZmlfY3B1ZnJlcV9udW07IGkr
KykgeworCQlwci0+cGVyZm9ybWFuY2UtPnN0YXRlc1tpXS5jb3JlX2ZyZXF1ZW5jeSA9IFwKKwkJ
CXNmaV9jcHVmcmVxX2FycmF5W2ldLmZyZXFfbWh6OworCQlwci0+cGVyZm9ybWFuY2UtPnN0YXRl
c1tpXS50cmFuc2l0aW9uX2xhdGVuY3kgPSBcCisJCQlzZmlfY3B1ZnJlcV9hcnJheVtpXS5sYXRl
bmN5OworCQlwci0+cGVyZm9ybWFuY2UtPnN0YXRlc1tpXS5jb250cm9sID0gXAorCQkJc2ZpX2Nw
dWZyZXFfYXJyYXlbaV0uY3RybF92YWw7CisJCXByaW50ayhLRVJOX0lORk8gIlN0YXRlIFslZF06
IGNvcmVfZnJlcXVlbmN5WyVkXSB0cmFuc2l0aW9uX2xhdGVuY3lbJWRdIGNvbnRyb2xbMHgleF1c
biIsCisJCQlpLAorCQkJKHUzMikgcHItPnBlcmZvcm1hbmNlLT5zdGF0ZXNbaV0uY29yZV9mcmVx
dWVuY3ksCisJCQkodTMyKSBwci0+cGVyZm9ybWFuY2UtPnN0YXRlc1tpXS50cmFuc2l0aW9uX2xh
dGVuY3ksCisJCQkodTMyKSBwci0+cGVyZm9ybWFuY2UtPnN0YXRlc1tpXS5jb250cm9sKTsKKwl9
CisKKwlyZXR1cm4gcmVzdWx0OworfQorCitzdGF0aWMgaW50IHNmaV9wcm9jZXNzb3JfcmVnaXN0
ZXJfcGVyZm9ybWFuY2Uoc3RydWN0IHNmaV9wcm9jZXNzb3JfcGVyZm9ybWFuY2UKKwkJCQkgICAg
KnBlcmZvcm1hbmNlLCB1bnNpZ25lZCBpbnQgY3B1KQoreworCXN0cnVjdCBzZmlfcHJvY2Vzc29y
ICpwcjsKKworCW11dGV4X2xvY2soJnBlcmZvcm1hbmNlX211dGV4KTsKKworCXByID0gcGVyX2Nw
dShzZmlfcHJvY2Vzc29ycywgY3B1KTsKKwlpZiAoIXByKSB7CisJCW11dGV4X3VubG9jaygmcGVy
Zm9ybWFuY2VfbXV0ZXgpOworCQlyZXR1cm4gLUVOT0RFVjsKKwl9CisKKwlpZiAocHItPnBlcmZv
cm1hbmNlKSB7CisJCW11dGV4X3VubG9jaygmcGVyZm9ybWFuY2VfbXV0ZXgpOworCQlyZXR1cm4g
LUVCVVNZOworCX0KKworCVdBUk5fT04oIXBlcmZvcm1hbmNlKTsKKworCXByLT5wZXJmb3JtYW5j
ZSA9IHBlcmZvcm1hbmNlOworCisJLyogcGFyc2UgdGhlIGZyZXEgdGFibGUgZnJvbSBzZmkgKi8K
KwlzZmlfY3B1ZnJlcV9udW0gPSAwOworCXNmaV90YWJsZV9wYXJzZShTRklfU0lHX0ZSRVEsIE5V
TEwsIE5VTEwsIHBhcnNlX2ZyZXEpOworCisJc2ZpX3Byb2Nlc3Nvcl9nZXRfcGVyZm9ybWFuY2Vf
c3RhdGVzKHByKTsKKworCW11dGV4X3VubG9jaygmcGVyZm9ybWFuY2VfbXV0ZXgpOworCXJldHVy
biAwOworfQorCit2b2lkIHNmaV9wcm9jZXNzb3JfdW5yZWdpc3Rlcl9wZXJmb3JtYW5jZShzdHJ1
Y3Qgc2ZpX3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZQorCQkJCSAgICAgICpwZXJmb3JtYW5jZSwgdW5z
aWduZWQgaW50IGNwdSkKK3sKKwlzdHJ1Y3Qgc2ZpX3Byb2Nlc3NvciAqcHI7CisKKworCW11dGV4
X2xvY2soJnBlcmZvcm1hbmNlX211dGV4KTsKKworCXByID0gcGVyX2NwdShzZmlfcHJvY2Vzc29y
cywgY3B1KTsKKwlpZiAoIXByKSB7CisJCW11dGV4X3VubG9jaygmcGVyZm9ybWFuY2VfbXV0ZXgp
OworCQlyZXR1cm47CisJfQorCisJaWYgKHByLT5wZXJmb3JtYW5jZSkKKwkJa2ZyZWUocHItPnBl
cmZvcm1hbmNlLT5zdGF0ZXMpOworCXByLT5wZXJmb3JtYW5jZSA9IE5VTEw7CisKKwltdXRleF91
bmxvY2soJnBlcmZvcm1hbmNlX211dGV4KTsKKworCXJldHVybjsKK30KKworc3RhdGljIHVuc2ln
bmVkIGludCBnZXRfY3VyX2ZyZXFfb25fY3B1KHVuc2lnbmVkIGludCBjcHUpCit7CisJc3RydWN0
IHNmaV9jcHVmcmVxX2RhdGEgKmRhdGEgPSBwZXJfY3B1KGRydl9kYXRhLCBjcHUpOworCXVuc2ln
bmVkIGludCBjYWNoZWRfZnJlcTsKKworCXByX2RlYnVnKCJnZXRfY3VyX2ZyZXFfb25fY3B1ICgl
ZClcbiIsIGNwdSk7CisKKwlpZiAodW5saWtlbHkoZGF0YSA9PSBOVUxMIHx8CisJCWRhdGEtPnNm
aV9kYXRhID09IE5VTEwgfHwgZGF0YS0+ZnJlcV90YWJsZSA9PSBOVUxMKSkgeworCQlyZXR1cm4g
MDsKKwl9CisKKwljYWNoZWRfZnJlcSA9IGRhdGEtPmZyZXFfdGFibGVbZGF0YS0+c2ZpX2RhdGEt
PnN0YXRlXS5mcmVxdWVuY3k7CisKKwlyZXR1cm4gY2FjaGVkX2ZyZXE7Cit9CisKK3N0YXRpYyBp
bnQgc2ZpX2NwdWZyZXFfdGFyZ2V0KHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5LAorCQkJ
ICAgICAgIHVuc2lnbmVkIGludCB0YXJnZXRfZnJlcSwgdW5zaWduZWQgaW50IHJlbGF0aW9uKQor
eworCXN0cnVjdCBzZmlfY3B1ZnJlcV9kYXRhICpkYXRhID0gcGVyX2NwdShkcnZfZGF0YSwgcG9s
aWN5LT5jcHUpOworCXN0cnVjdCBzZmlfcHJvY2Vzc29yX3BlcmZvcm1hbmNlICpwZXJmOworCXN0
cnVjdCBjcHVmcmVxX2ZyZXFzIGZyZXFzOworCXVuc2lnbmVkIGludCBuZXh0X3N0YXRlID0gMDsg
LyogSW5kZXggaW50byBmcmVxX3RhYmxlICovCisJdW5zaWduZWQgaW50IG5leHRfcGVyZl9zdGF0
ZSA9IDA7IC8qIEluZGV4IGludG8gcGVyZiB0YWJsZSAqLworCWludCByZXN1bHQgPSAwOworCXUz
MiBsbywgaGk7CisKKwlwcl9kZWJ1Zygic2ZpX2NwdWZyZXFfdGFyZ2V0ICVkICglZClcbiIsIHRh
cmdldF9mcmVxLCBwb2xpY3ktPmNwdSk7CisKKwlpZiAodW5saWtlbHkoZGF0YSA9PSBOVUxMIHx8
CisJICAgICBkYXRhLT5zZmlfZGF0YSA9PSBOVUxMIHx8IGRhdGEtPmZyZXFfdGFibGUgPT0gTlVM
TCkpIHsKKwkJcmV0dXJuIC1FTk9ERVY7CisJfQorCisJcGVyZiA9IGRhdGEtPnNmaV9kYXRhOwor
CXJlc3VsdCA9IGNwdWZyZXFfZnJlcXVlbmN5X3RhYmxlX3RhcmdldChwb2xpY3ksCisJCQkJCQlk
YXRhLT5mcmVxX3RhYmxlLAorCQkJCQkJdGFyZ2V0X2ZyZXEsCisJCQkJCQlyZWxhdGlvbiwgJm5l
eHRfc3RhdGUpOworCWlmICh1bmxpa2VseShyZXN1bHQpKQorCQlyZXR1cm4gLUVOT0RFVjsKKwor
CW5leHRfcGVyZl9zdGF0ZSA9IGRhdGEtPmZyZXFfdGFibGVbbmV4dF9zdGF0ZV0uaW5kZXg7CisJ
aWYgKHBlcmYtPnN0YXRlID09IG5leHRfcGVyZl9zdGF0ZSkgeworCQlpZiAodW5saWtlbHkoZGF0
YS0+cmVzdW1lKSkgeworCQkJcHJfZGVidWcoIkNhbGxlZCBhZnRlciByZXN1bWUsIHJlc2V0dGlu
ZyB0byBQJWRcbiIsCisJCQkJbmV4dF9wZXJmX3N0YXRlKTsKKwkJCWRhdGEtPnJlc3VtZSA9IDA7
CisJCX0gZWxzZSB7CisJCQlwcl9kZWJ1ZygiQWxyZWFkeSBhdCB0YXJnZXQgc3RhdGUgKFAlZClc
biIsCisJCQkJbmV4dF9wZXJmX3N0YXRlKTsKKwkJCXJldHVybiAwOworCQl9CisJfQorCisJZnJl
cXMub2xkID0gcGVyZi0+c3RhdGVzW3BlcmYtPnN0YXRlXS5jb3JlX2ZyZXF1ZW5jeSAqIDEwMDA7
CisJZnJlcXMubmV3ID0gZGF0YS0+ZnJlcV90YWJsZVtuZXh0X3N0YXRlXS5mcmVxdWVuY3k7CisJ
ZnJlcXMuY3B1ID0gcG9saWN5LT5jcHU7CisKKwljcHVmcmVxX25vdGlmeV90cmFuc2l0aW9uKCZm
cmVxcywgQ1BVRlJFUV9QUkVDSEFOR0UpOworCisJcmRtc3Jfb25fY3B1KHBvbGljeS0+Y3B1LCBN
U1JfSUEzMl9QRVJGX0NUTCwgJmxvLCAmaGkpOworCWxvID0gKGxvICYgfklOVEVMX01TUl9SQU5H
RSkgfAorCQkoKHUzMikgcGVyZi0+c3RhdGVzW25leHRfcGVyZl9zdGF0ZV0uY29udHJvbCAmIElO
VEVMX01TUl9SQU5HRSk7CisJd3Jtc3Jfb25fY3B1KHBvbGljeS0+Y3B1LCBNU1JfSUEzMl9QRVJG
X0NUTCwgbG8sIGhpKTsKKworCisJY3B1ZnJlcV9ub3RpZnlfdHJhbnNpdGlvbigmZnJlcXMsIENQ
VUZSRVFfUE9TVENIQU5HRSk7CisJcGVyZi0+c3RhdGUgPSBuZXh0X3BlcmZfc3RhdGU7CisKKwly
ZXR1cm4gcmVzdWx0OworfQorCitzdGF0aWMgaW50IHNmaV9jcHVmcmVxX3ZlcmlmeShzdHJ1Y3Qg
Y3B1ZnJlcV9wb2xpY3kgKnBvbGljeSkKK3sKKwlzdHJ1Y3Qgc2ZpX2NwdWZyZXFfZGF0YSAqZGF0
YSA9IHBlcl9jcHUoZHJ2X2RhdGEsIHBvbGljeS0+Y3B1KTsKKworCXByX2RlYnVnKCJzZmlfY3B1
ZnJlcV92ZXJpZnlcbiIpOworCisJcmV0dXJuIGNwdWZyZXFfZnJlcXVlbmN5X3RhYmxlX3Zlcmlm
eShwb2xpY3ksIGRhdGEtPmZyZXFfdGFibGUpOworfQorCisvKgorICogc2ZpX2NwdWZyZXFfZWFy
bHlfaW5pdCAtIGluaXRpYWxpemUgU0ZJIFAtU3RhdGVzIGxpYnJhcnkKKyAqCisgKiBJbml0aWFs
aXplIHRoZSBTRkkgUC1TdGF0ZXMgbGlicmFyeSAoZHJpdmVycy9zZmkvcHJvY2Vzc29yX3BlcmZs
aWIuYykKKyAqIGluIG9yZGVyIHRvIGNvcGUgd2l0aCB0aGUgY29ycmVjdCBmcmVxdWVuY3kgYW5k
IHZvbHRhZ2UgcGFpcmluZ3MuCisgKi8KK3N0YXRpYyBpbnQgX19pbml0IHNmaV9jcHVmcmVxX2Vh
cmx5X2luaXQodm9pZCkKK3sKKwlzZmlfcGVyZl9kYXRhID0gYWxsb2NfcGVyY3B1KHN0cnVjdCBz
ZmlfcHJvY2Vzc29yX3BlcmZvcm1hbmNlKTsKKwlpZiAoIXNmaV9wZXJmX2RhdGEpIHsKKwkJcHJf
ZGVidWcoIk1lbW9yeSBhbGxvY2F0aW9uIGVycm9yIGZvciBzZmlfcGVyZl9kYXRhLlxuIik7CisJ
CXJldHVybiAtRU5PTUVNOworCX0KKworCXJldHVybiAwOworfQorCisKK3N0YXRpYyBpbnQgc2Zp
X2NwdWZyZXFfY3B1X2luaXQoc3RydWN0IGNwdWZyZXFfcG9saWN5ICpwb2xpY3kpCit7CisJdW5z
aWduZWQgaW50IGk7CisJdW5zaWduZWQgaW50IHZhbGlkX3N0YXRlcyA9IDA7CisJdW5zaWduZWQg
aW50IGNwdSA9IHBvbGljeS0+Y3B1OworCXN0cnVjdCBzZmlfY3B1ZnJlcV9kYXRhICpkYXRhOwor
CXVuc2lnbmVkIGludCByZXN1bHQgPSAwOworCXN0cnVjdCBjcHVpbmZvX3g4NiAqYyA9ICZjcHVf
ZGF0YShwb2xpY3ktPmNwdSk7CisJc3RydWN0IHNmaV9wcm9jZXNzb3JfcGVyZm9ybWFuY2UgKnBl
cmY7CisKKwlwcl9kZWJ1Zygic2ZpX2NwdWZyZXFfY3B1X2luaXQgQ1BVOiVkXG4iLCBwb2xpY3kt
PmNwdSk7CisKKwlkYXRhID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHNmaV9jcHVmcmVxX2RhdGEp
LCBHRlBfS0VSTkVMKTsKKwlpZiAoIWRhdGEpCisJCXJldHVybiAtRU5PTUVNOworCisJZGF0YS0+
c2ZpX2RhdGEgPSBwZXJfY3B1X3B0cihzZmlfcGVyZl9kYXRhLCBjcHUpOworCXBlcl9jcHUoZHJ2
X2RhdGEsIGNwdSkgPSBkYXRhOworCisJc2ZpX2NwdWZyZXFfZHJpdmVyLmZsYWdzIHw9IENQVUZS
RVFfQ09OU1RfTE9PUFM7CisKKworCXJlc3VsdCA9IHNmaV9wcm9jZXNzb3JfcmVnaXN0ZXJfcGVy
Zm9ybWFuY2UoZGF0YS0+c2ZpX2RhdGEsIGNwdSk7CisJaWYgKHJlc3VsdCkKKwkJZ290byBlcnJf
ZnJlZTsKKworCXBlcmYgPSBkYXRhLT5zZmlfZGF0YTsKKwlwb2xpY3ktPnNoYXJlZF90eXBlID0g
Q1BVRlJFUV9TSEFSRURfVFlQRV9IVzsKKworCWNwdW1hc2tfc2V0X2NwdShwb2xpY3ktPmNwdSwg
cG9saWN5LT5jcHVzKTsKKwljcHVtYXNrX3NldF9jcHUocG9saWN5LT5jcHUsIHBvbGljeS0+cmVs
YXRlZF9jcHVzKTsKKworCS8qIGNhcGFiaWxpdHkgY2hlY2sgKi8KKwlpZiAocGVyZi0+c3RhdGVf
Y291bnQgPD0gMSkgeworCQlwcl9kZWJ1ZygiTm8gUC1TdGF0ZXNcbiIpOworCQlyZXN1bHQgPSAt
RU5PREVWOworCQlnb3RvIGVycl91bnJlZzsKKwl9CisKKwlkYXRhLT5mcmVxX3RhYmxlID0ga3ph
bGxvYyhzaXplb2Yoc3RydWN0IGNwdWZyZXFfZnJlcXVlbmN5X3RhYmxlKSAqCisJCSAgICAocGVy
Zi0+c3RhdGVfY291bnQrMSksIEdGUF9LRVJORUwpOworCWlmICghZGF0YS0+ZnJlcV90YWJsZSkg
eworCQlyZXN1bHQgPSAtRU5PTUVNOworCQlnb3RvIGVycl91bnJlZzsKKwl9CisKKwkvKiBkZXRl
Y3QgdHJhbnNpdGlvbiBsYXRlbmN5ICovCisJcG9saWN5LT5jcHVpbmZvLnRyYW5zaXRpb25fbGF0
ZW5jeSA9IDA7CisJZm9yIChpID0gMDsgaSA8IHBlcmYtPnN0YXRlX2NvdW50OyBpKyspIHsKKwkJ
aWYgKChwZXJmLT5zdGF0ZXNbaV0udHJhbnNpdGlvbl9sYXRlbmN5ICogMTAwMCkgPgorCQkgICAg
cG9saWN5LT5jcHVpbmZvLnRyYW5zaXRpb25fbGF0ZW5jeSkKKwkJCXBvbGljeS0+Y3B1aW5mby50
cmFuc2l0aW9uX2xhdGVuY3kgPQorCQkJICAgIHBlcmYtPnN0YXRlc1tpXS50cmFuc2l0aW9uX2xh
dGVuY3kgKiAxMDAwOworCX0KKworCWRhdGEtPm1heF9mcmVxID0gcGVyZi0+c3RhdGVzWzBdLmNv
cmVfZnJlcXVlbmN5ICogMTAwMDsKKwkvKiB0YWJsZSBpbml0ICovCisJZm9yIChpID0gMDsgaSA8
IHBlcmYtPnN0YXRlX2NvdW50OyBpKyspIHsKKwkJaWYgKGkgPiAwICYmIHBlcmYtPnN0YXRlc1tp
XS5jb3JlX2ZyZXF1ZW5jeSA+PQorCQkgICAgZGF0YS0+ZnJlcV90YWJsZVt2YWxpZF9zdGF0ZXMt
MV0uZnJlcXVlbmN5IC8gMTAwMCkKKwkJCWNvbnRpbnVlOworCisJCWRhdGEtPmZyZXFfdGFibGVb
dmFsaWRfc3RhdGVzXS5pbmRleCA9IGk7CisJCWRhdGEtPmZyZXFfdGFibGVbdmFsaWRfc3RhdGVz
XS5mcmVxdWVuY3kgPQorCQkgICAgcGVyZi0+c3RhdGVzW2ldLmNvcmVfZnJlcXVlbmN5ICogMTAw
MDsKKwkJdmFsaWRfc3RhdGVzKys7CisJfQorCWRhdGEtPmZyZXFfdGFibGVbdmFsaWRfc3RhdGVz
XS5mcmVxdWVuY3kgPSBDUFVGUkVRX1RBQkxFX0VORDsKKwlwZXJmLT5zdGF0ZSA9IDA7CisKKwly
ZXN1bHQgPSBjcHVmcmVxX2ZyZXF1ZW5jeV90YWJsZV9jcHVpbmZvKHBvbGljeSwgZGF0YS0+ZnJl
cV90YWJsZSk7CisJaWYgKHJlc3VsdCkKKwkJZ290byBlcnJfZnJlcWZyZWU7CisKKwlzZmlfY3B1
ZnJlcV9kcml2ZXIuZ2V0ID0gZ2V0X2N1cl9mcmVxX29uX2NwdTsKKwlwb2xpY3ktPmN1ciA9IGdl
dF9jdXJfZnJlcV9vbl9jcHUoY3B1KTsKKworCisJLyogQ2hlY2sgZm9yIEFQRVJGL01QRVJGIHN1
cHBvcnQgaW4gaGFyZHdhcmUgKi8KKwlpZiAoY3B1X2hhcyhjLCBYODZfRkVBVFVSRV9BUEVSRk1Q
RVJGKSkKKwkJc2ZpX2NwdWZyZXFfZHJpdmVyLmdldGF2ZyA9IGNwdWZyZXFfZ2V0X21lYXN1cmVk
X3BlcmY7CisKKwlwcl9kZWJ1ZygiQ1BVJXUgLSBTRkkgcGVyZm9ybWFuY2UgbWFuYWdlbWVudCBh
Y3RpdmF0ZWQuXG4iLCBjcHUpOworCWZvciAoaSA9IDA7IGkgPCBwZXJmLT5zdGF0ZV9jb3VudDsg
aSsrKQorCQlwcl9kZWJ1ZygiICAgICAlY1AlZDogJWQgTUh6LCAlZCB1U1xuIiwKKwkJCShpID09
IHBlcmYtPnN0YXRlID8gJyonIDogJyAnKSwgaSwKKwkJCSh1MzIpIHBlcmYtPnN0YXRlc1tpXS5j
b3JlX2ZyZXF1ZW5jeSwKKwkJCSh1MzIpIHBlcmYtPnN0YXRlc1tpXS50cmFuc2l0aW9uX2xhdGVu
Y3kpOworCisJY3B1ZnJlcV9mcmVxdWVuY3lfdGFibGVfZ2V0X2F0dHIoZGF0YS0+ZnJlcV90YWJs
ZSwgcG9saWN5LT5jcHUpOworCisJLyoKKwkgKiB0aGUgZmlyc3QgY2FsbCB0byAtPnRhcmdldCgp
IHNob3VsZCByZXN1bHQgaW4gdXMgYWN0dWFsbHkKKwkgKiB3cml0aW5nIHNvbWV0aGluZyB0byB0
aGUgYXBwcm9wcmlhdGUgcmVnaXN0ZXJzLgorCSAqLworCWRhdGEtPnJlc3VtZSA9IDE7CisKKwly
ZXR1cm4gcmVzdWx0OworCitlcnJfZnJlcWZyZWU6CisJa2ZyZWUoZGF0YS0+ZnJlcV90YWJsZSk7
CitlcnJfdW5yZWc6CisJc2ZpX3Byb2Nlc3Nvcl91bnJlZ2lzdGVyX3BlcmZvcm1hbmNlKHBlcmYs
IGNwdSk7CitlcnJfZnJlZToKKwlrZnJlZShkYXRhKTsKKwlwZXJfY3B1KGRydl9kYXRhLCBjcHUp
ID0gTlVMTDsKKworCXJldHVybiByZXN1bHQ7Cit9CisKK3N0YXRpYyBpbnQgc2ZpX2NwdWZyZXFf
Y3B1X2V4aXQoc3RydWN0IGNwdWZyZXFfcG9saWN5ICpwb2xpY3kpCit7CisJc3RydWN0IHNmaV9j
cHVmcmVxX2RhdGEgKmRhdGEgPSBwZXJfY3B1KGRydl9kYXRhLCBwb2xpY3ktPmNwdSk7CisKKwlw
cl9kZWJ1Zygic2ZpX2NwdWZyZXFfY3B1X2V4aXRcbiIpOworCisJaWYgKGRhdGEpIHsKKwkJY3B1
ZnJlcV9mcmVxdWVuY3lfdGFibGVfcHV0X2F0dHIocG9saWN5LT5jcHUpOworCQlwZXJfY3B1KGRy
dl9kYXRhLCBwb2xpY3ktPmNwdSkgPSBOVUxMOworCQlzZmlfcHJvY2Vzc29yX3VucmVnaXN0ZXJf
cGVyZm9ybWFuY2UoZGF0YS0+c2ZpX2RhdGEsCisJCQkJCQkJcG9saWN5LT5jcHUpOworCQlrZnJl
ZShkYXRhKTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCBzZmlfY3B1ZnJlcV9y
ZXN1bWUoc3RydWN0IGNwdWZyZXFfcG9saWN5ICpwb2xpY3kpCit7CisJc3RydWN0IHNmaV9jcHVm
cmVxX2RhdGEgKmRhdGEgPSBwZXJfY3B1KGRydl9kYXRhLCBwb2xpY3ktPmNwdSk7CisKKwlwcl9k
ZWJ1Zygic2ZpX2NwdWZyZXFfcmVzdW1lXG4iKTsKKworCWRhdGEtPnJlc3VtZSA9IDE7CisKKwly
ZXR1cm4gMDsKK30KKworc3RhdGljIHN0cnVjdCBmcmVxX2F0dHIgKnNmaV9jcHVmcmVxX2F0dHJb
XSA9IHsKKwkmY3B1ZnJlcV9mcmVxX2F0dHJfc2NhbGluZ19hdmFpbGFibGVfZnJlcXMsCisJTlVM
TCwKK307CisKK3N0YXRpYyBzdHJ1Y3QgY3B1ZnJlcV9kcml2ZXIgc2ZpX2NwdWZyZXFfZHJpdmVy
ID0geworCS52ZXJpZnkgPSBzZmlfY3B1ZnJlcV92ZXJpZnksCisJLnRhcmdldCA9IHNmaV9jcHVm
cmVxX3RhcmdldCwKKwkuaW5pdCA9IHNmaV9jcHVmcmVxX2NwdV9pbml0LAorCS5leGl0ID0gc2Zp
X2NwdWZyZXFfY3B1X2V4aXQsCisJLnJlc3VtZSA9IHNmaV9jcHVmcmVxX3Jlc3VtZSwKKwkubmFt
ZSA9ICJzZmktY3B1ZnJlcSIsCisJLm93bmVyID0gVEhJU19NT0RVTEUsCisJLmF0dHIgPSBzZmlf
Y3B1ZnJlcV9hdHRyLAorfTsKKworc3RhdGljIGludCBfX2luaXQgcGFyc2VfY3B1cyhzdHJ1Y3Qg
c2ZpX3RhYmxlX2hlYWRlciAqdGFibGUpCit7CisJc3RydWN0IHNmaV90YWJsZV9zaW1wbGUgKnNi
OworCXN0cnVjdCBzZmlfY3B1X3RhYmxlX2VudHJ5ICpwZW50cnk7CisJaW50IGk7CisKKwlzYiA9
IChzdHJ1Y3Qgc2ZpX3RhYmxlX3NpbXBsZSAqKXRhYmxlOworCisJc2ZpX2NwdV9udW0gPSBTRklf
R0VUX05VTV9FTlRSSUVTKHNiLCBzdHJ1Y3Qgc2ZpX2NwdV90YWJsZV9lbnRyeSk7CisKKwlwZW50
cnkgPSAoc3RydWN0IHNmaV9jcHVfdGFibGVfZW50cnkgKikgc2ItPnBlbnRyeTsKKwlmb3IgKGkg
PSAwOyBpIDwgc2ZpX2NwdV9udW07IGkrKykgeworCQlzZmlfY3B1X2FycmF5W2ldLmFwaWNfaWQg
PSBwZW50cnktPmFwaWNfaWQ7CisJCXByaW50ayhLRVJOX0lORk8gIkFQSUMgSUQ6ICVkXG4iLCBw
ZW50cnktPmFwaWNfaWQpOworCQlwZW50cnkrKzsKKwl9CisKKwlyZXR1cm4gMDsKKworfQorCisK
K3N0YXRpYyBpbnQgX19pbml0IGluaXRfc2ZpX3Byb2Nlc3Nvcl9saXN0KHZvaWQpCit7CisJc3Ry
dWN0IHNmaV9wcm9jZXNzb3IgKnByOworCWludCBpOworCWludCByZXN1bHQ7CisKKwkvKiBwYXJz
ZSB0aGUgY3B1cyBmcm9tIHRoZSBzZmkgdGFibGUgKi8KKwlyZXN1bHQgPSBzZmlfdGFibGVfcGFy
c2UoU0ZJX1NJR19DUFVTLCBOVUxMLCBOVUxMLCBwYXJzZV9jcHVzKTsKKworCWlmIChyZXN1bHQg
PCAwKQorCQlyZXR1cm4gcmVzdWx0OworCisJcHIgPSBremFsbG9jKHNmaV9jcHVfbnVtICogc2l6
ZW9mKHN0cnVjdCBzZmlfcHJvY2Vzc29yKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFwcikKKwkJcmV0
dXJuIC1FTk9NRU07CisKKwlmb3IgKGkgPSAwOyBpIDwgc2ZpX2NwdV9udW07IGkrKykgeworCQlw
ci0+aWQgPSBzZmlfY3B1X2FycmF5W2ldLmFwaWNfaWQ7CisJCXBlcl9jcHUoc2ZpX3Byb2Nlc3Nv
cnMsIHByLT5pZCkgPSBwcjsKKwkJcHIrKzsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGlj
IGludCBfX2luaXQgc2ZpX2NwdWZyZXFfaW5pdCh2b2lkKQoreworCWludCByZXQ7CisKKwlwcl9k
ZWJ1Zygic2ZpX2NwdWZyZXFfaW5pdFxuIik7CisKKwlyZXQgPSBpbml0X3NmaV9wcm9jZXNzb3Jf
bGlzdCgpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlyZXQgPSBzZmlfY3B1ZnJlcV9l
YXJseV9pbml0KCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKworCXJldHVybiBjcHVmcmVx
X3JlZ2lzdGVyX2RyaXZlcigmc2ZpX2NwdWZyZXFfZHJpdmVyKTsKK30KKworc3RhdGljIHZvaWQg
X19leGl0IHNmaV9jcHVmcmVxX2V4aXQodm9pZCkKK3sKKworCXN0cnVjdCBzZmlfcHJvY2Vzc29y
ICpwcjsKKworCXByX2RlYnVnKCJzZmlfY3B1ZnJlcV9leGl0XG4iKTsKKworCXByID0gcGVyX2Nw
dShzZmlfcHJvY2Vzc29ycywgMCk7CisJa2ZyZWUocHIpOworCisJY3B1ZnJlcV91bnJlZ2lzdGVy
X2RyaXZlcigmc2ZpX2NwdWZyZXFfZHJpdmVyKTsKKworCWZyZWVfcGVyY3B1KHNmaV9wZXJmX2Rh
dGEpOworCisJcmV0dXJuOworfQorbGF0ZV9pbml0Y2FsbChzZmlfY3B1ZnJlcV9pbml0KTsKK21v
ZHVsZV9leGl0KHNmaV9jcHVmcmVxX2V4aXQpOworCitNT0RVTEVfQUxJQVMoInNmaSIpOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9jcHVmcmVxL3NmaS1jcHVmcmVxLmggYi9kcml2ZXJzL2NwdWZyZXEv
c2ZpLWNwdWZyZXEuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi43ZTAxYzFl
Ci0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9jcHVmcmVxL3NmaS1jcHVmcmVxLmgKQEAgLTAs
MCArMSw2NSBAQAorLyoKKyAqIHNmaV9wcm9jZXNzb3IuaAorICogQ29weXJpZ2h0IChjKSAyMDEw
LCBJbnRlbCBDb3Jwb3JhdGlvbi4KKyAqCisgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBpdAorICogdW5kZXIgdGhl
IHRlcm1zIGFuZCBjb25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSwK
KyAqIHZlcnNpb24gMiwgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24uCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIGl0IHdp
bGwgYmUgdXNlZnVsLCBidXQgV0lUSE9VVAorICogQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4g
dGhlIGltcGxpZWQgd2FycmFudHkgb2YgTUVSQ0hBTlRBQklMSVRZIG9yCisgKiBGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgZm9yCisgKiBtb3JlIGRldGFpbHMuCisgKgorICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVk
IGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxvbmcgd2l0aAorICog
dGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24sIEluYy4sCisgKiA1MSBGcmFua2xpbiBTdCAtIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAy
MTEwLTEzMDEgVVNBLgorICoKKyAqLworCisjaWZuZGVmIF9fU0ZJX1BST0NFU1NPUl9IX18KKyNk
ZWZpbmUgX19TRklfUFJPQ0VTU09SX0hfXworCisjaW5jbHVkZSA8bGludXgvc2ZpLmg+CisjaW5j
bHVkZSA8bGludXgvY3B1aWRsZS5oPgorCitzdHJ1Y3Qgc2ZpX3Byb2Nlc3Nvcl9wb3dlciB7CisJ
c3RydWN0IGNwdWlkbGVfZGV2aWNlIGRldjsKKwl1MzIgZGVmYXVsdF9zdGF0ZTsKKwlpbnQgY291
bnQ7CisJc3RydWN0IGNwdWlkbGVfc3RhdGUgKnN0YXRlczsKKwlzdHJ1Y3Qgc2ZpX2NzdGF0ZV90
YWJsZV9lbnRyeSAqc2ZpX2NzdGF0ZXM7Cit9OworCitzdHJ1Y3Qgc2ZpX3Byb2Nlc3Nvcl9mbGFn
cyB7CisJdTggdmFsaWQ7CisJdTggcG93ZXI7Cit9OworCitzdHJ1Y3Qgc2ZpX3Byb2Nlc3NvciB7
CisJdTMyIGlkOworCXN0cnVjdCBzZmlfcHJvY2Vzc29yX2ZsYWdzIGZsYWdzOworCXN0cnVjdCBz
ZmlfcHJvY2Vzc29yX3Bvd2VyIHBvd2VyOworCXN0cnVjdCBzZmlfcHJvY2Vzc29yX3BlcmZvcm1h
bmNlICpwZXJmb3JtYW5jZTsKK307CisKKy8qIFBlcmZvcm1hbmNlIG1hbmFnZW1lbnQgKi8KK3N0
cnVjdCBzZmlfcHJvY2Vzc29yX3B4IHsKKwl1MzIgY29yZV9mcmVxdWVuY3k7CS8qIG1lZ2FoZXJ0
eiAqLworCXUzMiB0cmFuc2l0aW9uX2xhdGVuY3k7CS8qIG1pY3Jvc2Vjb25kcyAqLworCXUzMiBj
b250cm9sOwkvKiBjb250cm9sIHZhbHVlICovCit9OworCitzdHJ1Y3Qgc2ZpX3Byb2Nlc3Nvcl9w
ZXJmb3JtYW5jZSB7CisJdW5zaWduZWQgaW50IHN0YXRlOworCXVuc2lnbmVkIGludCBzdGF0ZV9j
b3VudDsKKwlzdHJ1Y3Qgc2ZpX3Byb2Nlc3Nvcl9weCAqc3RhdGVzOworfTsKKworLyogZm9yIGNv
bW11bmljYXRpb24gYmV0d2VlbiBtdWx0aXBsZSBwYXJ0cyBvZiB0aGUgcHJvY2Vzc29yIGtlcm5l
bCBtb2R1bGUgKi8KK0RFQ0xBUkVfUEVSX0NQVShzdHJ1Y3Qgc2ZpX3Byb2Nlc3NvciAqLCBzZmlf
cHJvY2Vzc29ycyk7CisKK2ludCBzZmlfcHJvY2Vzc29yX3Bvd2VyX2luaXQoc3RydWN0IHNmaV9w
cm9jZXNzb3IgKnByKTsKK2ludCBzZmlfcHJvY2Vzc29yX3Bvd2VyX2V4aXQoc3RydWN0IHNmaV9w
cm9jZXNzb3IgKnByKTsKKworI2VuZGlmIC8qX19TRklfUFJPQ0VTU09SX0hfXyovCi0tIAoxLjcu
MC40Cgo=

--_002_C9B248CF4BE2844B92616616440223E8049984BGSMSX101garcorpi_--
