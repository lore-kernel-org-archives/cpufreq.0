From: "Rudramuni, Vishwesh M" <vishwesh.m.rudramuni@intel.com>
Subject: RE: sfi based cpufreq driver for intel soc platforms
Date: Thu, 2 Feb 2012 03:25:17 +0000
Message-ID: <C9B248CF4BE2844B92616616440223E8049D43@BGSMSX101.gar.corp.intel.com>
References: <C9B248CF4BE2844B92616616440223E8049984@BGSMSX101.gar.corp.intel.com>
 <20120201145133.GA15100@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_C9B248CF4BE2844B92616616440223E8049D43BGSMSX101garcorpi_"
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120201145133.GA15100@redhat.com>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "davej@redhat.com" <davej@redhat.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Seshadri, Harinarayanan" <harinarayanan.seshadri@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Brown, Len" <len.brown@intel.com>

--_002_C9B248CF4BE2844B92616616440223E8049D43BGSMSX101garcorpi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> This should be
>=20
> +obj-$(CONFIG_X86_SFI_CPUFREQ)              +=3D sfi-cpufreq.o mperf.o
>=20
> I assume ?
>=20
Yes Agree. Resending the patch.

From 507b896942045c0df3073960922c9d5d88b8fa2c Mon Sep 17 00:00:00 2001
From: Vishwesh M Rudramuni <vishwesh.m.rudramuni@intel.com>
Date: Thu, 2 Feb 2012 16:07:31 +0530
Subject: [PATCH] [CPUFREQ] sfi based p-state driver

This is the sfi p-state driver for all the intel soc platforms.
This is based on the acpi p-state driver.This patch is generated
against linux 3.2.2.

Signed-off-by: Vishwesh M Rudramuni <vishwesh.m.rudramuni@intel.com>
Acked-by: Len Brown <len.brown@intel.com>
Reviewed-by: Hari Seshadri <harinarayanan.seshadri@intel.com>
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
+obj-$(CONFIG_X86_SFI_CPUFREQ)		+=3D sfi-cpufreq.o mperf.o
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


--_002_C9B248CF4BE2844B92616616440223E8049D43BGSMSX101garcorpi_
Content-Type: application/octet-stream;
	name="0001-CPUFREQ-sfi-based-p-state-driver.patch"
Content-Description: 0001-CPUFREQ-sfi-based-p-state-driver.patch
Content-Disposition: attachment;
	filename="0001-CPUFREQ-sfi-based-p-state-driver.patch"; size=18246;
	creation-date="Wed, 01 Feb 2012 10:37:41 GMT";
	modification-date="Thu, 02 Feb 2012 03:13:59 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1MDdiODk2OTQyMDQ1YzBkZjMwNzM5NjA5MjJjOWQ1ZDg4YjhmYTJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXNod2VzaCBNIFJ1ZHJhbXVuaSA8dmlzaHdlc2gubS5ydWRy
YW11bmlAaW50ZWwuY29tPgpEYXRlOiBUaHUsIDIgRmViIDIwMTIgMTY6MDc6MzEgKzA1MzAKU3Vi
amVjdDogW1BBVENIXSBbQ1BVRlJFUV0gc2ZpIGJhc2VkIHAtc3RhdGUgZHJpdmVyCgpUaGlzIGlz
IHRoZSBzZmkgcC1zdGF0ZSBkcml2ZXIgZm9yIGFsbCB0aGUgaW50ZWwgc29jIHBsYXRmb3Jtcy4K
VGhpcyBpcyBiYXNlZCBvbiB0aGUgYWNwaSBwLXN0YXRlIGRyaXZlci5UaGlzIHBhdGNoIGlzIGdl
bmVyYXRlZAphZ2FpbnN0IGxpbnV4IDMuMi4yLgoKU2lnbmVkLW9mZi1ieTogVmlzaHdlc2ggTSBS
dWRyYW11bmkgPHZpc2h3ZXNoLm0ucnVkcmFtdW5pQGludGVsLmNvbT4KQWNrZWQtYnk6IExlbiBC
cm93biA8bGVuLmJyb3duQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcmkgU2VzaGFkcmkgPGhh
cmluYXJheWFuYW4uc2VzaGFkcmlAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogUmFqZWV2IEQgTXVy
YWxpZGhhciA8cmFqZWV2LmQubXVyYWxpZGhhckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9jcHVm
cmVxL0tjb25maWcueDg2ICAgfCAgIDE1ICsrCiBkcml2ZXJzL2NwdWZyZXEvTWFrZWZpbGUgICAg
ICB8ICAgIDEgKwogZHJpdmVycy9jcHVmcmVxL3NmaS1jcHVmcmVxLmMgfCAgNTI5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2NwdWZyZXEvc2ZpLWNw
dWZyZXEuaCB8ICAgNjUgKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNjEwIGluc2VydGlvbnMoKyks
IDAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jcHVmcmVxL3NmaS1j
cHVmcmVxLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2NwdWZyZXEvc2ZpLWNwdWZyZXEu
aAoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1ZnJlcS9LY29uZmlnLng4NiBiL2RyaXZlcnMvY3B1
ZnJlcS9LY29uZmlnLng4NgppbmRleCA3OGZmN2VlLi43YzUzNTkxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2NwdWZyZXEvS2NvbmZpZy54ODYKKysrIGIvZHJpdmVycy9jcHVmcmVxL0tjb25maWcueDg2
CkBAIC0zMiw2ICszMiwyMSBAQCBjb25maWcgWDg2X0FDUElfQ1BVRlJFUQogCiAJICBJZiBpbiBk
b3VidCwgc2F5IE4uCiAKK2NvbmZpZyBYODZfU0ZJX0NQVUZSRVEKKyAgICAgICAgdHJpc3RhdGUg
IlNGSSBQcm9jZXNzb3IgUC1TdGF0ZXMgZHJpdmVyIgorICAgICAgICBzZWxlY3QgQ1BVX0ZSRVFf
VEFCTEUKKyAgICAgICAgaGVscAorCVRoaXMgZHJpdmVyIGFkZHMgYSBDUFVGcmVxIGRyaXZlciB3
aGljaCB1dGlsaXplcyB0aGUgU0ZJCisJUHJvY2Vzc29yIFBlcmZvcm1hbmNlIFN0YXRlcy4KKwlU
aGlzIGRyaXZlciBhbHNvIHN1cHBvcnRzIEludGVsIEVuaGFuY2VkIFNwZWVkc3RlcC4KKworCVRv
IGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZQorCW1v
ZHVsZSB3aWxsIGJlIGNhbGxlZCBzZmktY3B1ZnJlcS4KKworCUZvciBkZXRhaWxzLCB0YWtlIGEg
bG9vayBhdCA8ZmlsZTpEb2N1bWVudGF0aW9uL2NwdS1mcmVxLz4uCisKKwlJZiBpbiBkb3VidCwg
c2F5IE4uCisKIGNvbmZpZyBFTEFOX0NQVUZSRVEKIAl0cmlzdGF0ZSAiQU1EIEVsYW4gU0M0MDAg
YW5kIFNDNDEwIgogCXNlbGVjdCBDUFVfRlJFUV9UQUJMRQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
cHVmcmVxL01ha2VmaWxlIGIvZHJpdmVycy9jcHVmcmVxL01ha2VmaWxlCmluZGV4IGE0OGJjMDIu
LjVhYzg5ODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3B1ZnJlcS9NYWtlZmlsZQorKysgYi9kcml2
ZXJzL2NwdWZyZXEvTWFrZWZpbGUKQEAgLTIxLDYgKzIxLDcgQEAgb2JqLSQoQ09ORklHX0NQVV9G
UkVRX1RBQkxFKQkJKz0gZnJlcV90YWJsZS5vCiAKIG9iai0kKENPTkZJR19YODZfUE9XRVJOT1df
SzgpCQkrPSBwb3dlcm5vdy1rOC5vIG1wZXJmLm8KIG9iai0kKENPTkZJR19YODZfQUNQSV9DUFVG
UkVRKQkJKz0gYWNwaS1jcHVmcmVxLm8gbXBlcmYubworb2JqLSQoQ09ORklHX1g4Nl9TRklfQ1BV
RlJFUSkJCSs9IHNmaS1jcHVmcmVxLm8gbXBlcmYubwogb2JqLSQoQ09ORklHX1g4Nl9QQ0NfQ1BV
RlJFUSkJCSs9IHBjYy1jcHVmcmVxLm8KIG9iai0kKENPTkZJR19YODZfUE9XRVJOT1dfSzYpCQkr
PSBwb3dlcm5vdy1rNi5vCiBvYmotJChDT05GSUdfWDg2X1BPV0VSTk9XX0s3KQkJKz0gcG93ZXJu
b3ctazcubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVmcmVxL3NmaS1jcHVmcmVxLmMgYi9kcml2
ZXJzL2NwdWZyZXEvc2ZpLWNwdWZyZXEuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwLi41OTFkNDFlCi0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9jcHVmcmVxL3NmaS1jcHVm
cmVxLmMKQEAgLTAsMCArMSw1MjkgQEAKKy8qCisgKiBzZmlfY3B1ZnJlcS5jIC0gc2ZpIFByb2Nl
c3NvciBQLVN0YXRlcyBEcml2ZXIKKyAqCisgKiAoQykgMjAxMC0yMDExIEludGVsIENvcnBvcmF0
aW9uCisgKgorICogfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGZy
ZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyAqICBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1
Ymxpc2hlZCBieQorICogIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJz
aW9uIDIgb2YgdGhlIExpY2Vuc2UuCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRl
ZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLCBidXQKKyAqICBXSVRIT1VUIEFO
WSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiAgTUVS
Q0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRo
ZSBHTlUKKyAqICBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisgKiAg
WW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgYWxvbmcKKyAqICB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorICogIDU5IFRlbXBsZSBQbGFjZSwg
U3VpdGUgMzMwLCBCb3N0b24sIE1BIDAyMTExLTEzMDcgVVNBLgorICoKKyAqIH5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+CisgKiBBdXRob3I6IFZpc2h3ZXNoIE0gUnVkcmFtdW5pCisgKiBDb250YWN0IGluZm9y
bWF0aW9uOiBWaXNod2VzaCBSdWRyYW11bmkgPHZpc2h3ZXNoLm0ucnVkcmFtdW5pQGludGVsLmNv
bT4KKyAqLworCisvKgorICogVGhpcyBzZmkgUHJvY2Vzc29yIFAtU3RhdGVzIERyaXZlciByZS11
c2VzIG1vc3QgcGFydCBvZiB0aGUgY29kZSBhdmFpbGFibGUKKyAqIGluIGFjcGkgY3B1ZnJlcSBk
cml2ZXIuCisgKi8KKworI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgorI2luY2x1ZGUgPGxpbnV4
L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KKyNpbmNsdWRlIDxsaW51eC9zbXAu
aD4KKyNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgorI2luY2x1ZGUgPGxpbnV4L2NwdWZyZXEuaD4K
KyNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKyNp
bmNsdWRlIDxsaW51eC9kZWxheS5oPgorI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KKyNpbmNs
dWRlIDxsaW51eC9zZmkuaD4KKyNpbmNsdWRlIDxsaW51eC9pby5oPgorCisjaW5jbHVkZSA8YXNt
L21zci5oPgorI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KKyNpbmNsdWRlIDxhc20vY3B1ZmVh
dHVyZS5oPgorCisjaW5jbHVkZSAic2ZpLWNwdWZyZXEuaCIKKyNpbmNsdWRlICJtcGVyZi5oIgor
CitNT0RVTEVfQVVUSE9SKCJWaXNod2VzaCBSdWRyYW11bmkiKTsKK01PRFVMRV9ERVNDUklQVElP
TigiU0ZJIFByb2Nlc3NvciBQLVN0YXRlcyBEcml2ZXIiKTsKK01PRFVMRV9MSUNFTlNFKCJHUEwi
KTsKKworREVGSU5FX1BFUl9DUFUoc3RydWN0IHNmaV9wcm9jZXNzb3IgKiwgc2ZpX3Byb2Nlc3Nv
cnMpOworCitzdGF0aWMgREVGSU5FX01VVEVYKHBlcmZvcm1hbmNlX211dGV4KTsKK3N0YXRpYyBp
bnQgc2ZpX2NwdWZyZXFfbnVtOworc3RhdGljIHUzMiBzZmlfY3B1X251bTsKKworI2RlZmluZQkJ
U0ZJX0ZSRVFfTUFYICAgICAgICAgICAgMzIKKyNkZWZpbmUJCUlOVEVMX01TUl9SQU5HRQkJKDB4
ZmZmZikKKyNkZWZpbmUJCVNGSV9DUFVfTUFYCQk4CisKKworc3RydWN0IHNmaV9jcHVmcmVxX2Rh
dGEgeworCXN0cnVjdCBzZmlfcHJvY2Vzc29yX3BlcmZvcm1hbmNlICpzZmlfZGF0YTsKKwlzdHJ1
Y3QgY3B1ZnJlcV9mcmVxdWVuY3lfdGFibGUgKmZyZXFfdGFibGU7CisJdW5zaWduZWQgaW50IG1h
eF9mcmVxOworCXVuc2lnbmVkIGludCByZXN1bWU7Cit9OworCitzdGF0aWMgREVGSU5FX1BFUl9D
UFUoc3RydWN0IHNmaV9jcHVmcmVxX2RhdGEgKiwgZHJ2X2RhdGEpOworc3RydWN0IHNmaV9mcmVx
X3RhYmxlX2VudHJ5IHNmaV9jcHVmcmVxX2FycmF5W1NGSV9GUkVRX01BWF07CitzdGF0aWMgc3Ry
dWN0IHNmaV9jcHVfdGFibGVfZW50cnkgc2ZpX2NwdV9hcnJheVtTRklfQ1BVX01BWF07CisKKy8q
IHNmaV9wZXJmX2RhdGEgaXMgYSBwb2ludGVyIHRvIHBlcmNwdSBkYXRhLiAqLworc3RhdGljIHN0
cnVjdCBzZmlfcHJvY2Vzc29yX3BlcmZvcm1hbmNlICpzZmlfcGVyZl9kYXRhOworCitzdGF0aWMg
c3RydWN0IGNwdWZyZXFfZHJpdmVyIHNmaV9jcHVmcmVxX2RyaXZlcjsKKworc3RhdGljIGludCBw
YXJzZV9mcmVxKHN0cnVjdCBzZmlfdGFibGVfaGVhZGVyICp0YWJsZSkKK3sKKwlzdHJ1Y3Qgc2Zp
X3RhYmxlX3NpbXBsZSAqc2I7CisJc3RydWN0IHNmaV9mcmVxX3RhYmxlX2VudHJ5ICpwZW50cnk7
CisJaW50IHRvdGFsbGVuOworCisJc2IgPSAoc3RydWN0IHNmaV90YWJsZV9zaW1wbGUgKil0YWJs
ZTsKKwlpZiAoIXNiKSB7CisJCXByaW50ayhLRVJOX1dBUk5JTkcgIlNGSTogVW5hYmxlIHRvIG1h
cCBGUkVRXG4iKTsKKwkJcmV0dXJuIC1FTk9ERVY7CisJfQorCisJaWYgKCFzZmlfY3B1ZnJlcV9u
dW0pIHsKKwkJc2ZpX2NwdWZyZXFfbnVtID0gU0ZJX0dFVF9OVU1fRU5UUklFUyhzYiwKKwkJCSBz
dHJ1Y3Qgc2ZpX2ZyZXFfdGFibGVfZW50cnkpOworCQlwZW50cnkgPSAoc3RydWN0IHNmaV9mcmVx
X3RhYmxlX2VudHJ5ICopc2ItPnBlbnRyeTsKKwkJdG90YWxsZW4gPSBzZmlfY3B1ZnJlcV9udW0g
KiBzaXplb2YoKnBlbnRyeSk7CisJCW1lbWNweShzZmlfY3B1ZnJlcV9hcnJheSwgcGVudHJ5LCB0
b3RhbGxlbik7CisJfQorCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgc2ZpX3Byb2Nlc3Nv
cl9nZXRfcGVyZm9ybWFuY2Vfc3RhdGVzKHN0cnVjdCBzZmlfcHJvY2Vzc29yICpwcikKK3sKKwlp
bnQgcmVzdWx0ID0gMDsKKwlpbnQgaTsKKworCXByLT5wZXJmb3JtYW5jZS0+c3RhdGVfY291bnQg
PSBzZmlfY3B1ZnJlcV9udW07CisJcHItPnBlcmZvcm1hbmNlLT5zdGF0ZXMgPQorCSAgICBrbWFs
bG9jKHNpemVvZihzdHJ1Y3Qgc2ZpX3Byb2Nlc3Nvcl9weCkgKiBzZmlfY3B1ZnJlcV9udW0sCisJ
CSAgICBHRlBfS0VSTkVMKTsKKwlpZiAoIXByLT5wZXJmb3JtYW5jZS0+c3RhdGVzKQorCQlyZXN1
bHQgPSAtRU5PTUVNOworCisJcHJpbnRrKEtFUk5fSU5GTyAiTnVtIHAtc3RhdGVzICVkXG4iLCBz
ZmlfY3B1ZnJlcV9udW0pOworCisJLyogUG9wdWxhdGUgdGhlIFAtc3RhdGVzIGluZm8gZnJvbSB0
aGUgU0ZJIHRhYmxlIGhlcmUgKi8KKwlmb3IgKGkgPSAwOyBpIDwgc2ZpX2NwdWZyZXFfbnVtOyBp
KyspIHsKKwkJcHItPnBlcmZvcm1hbmNlLT5zdGF0ZXNbaV0uY29yZV9mcmVxdWVuY3kgPSBcCisJ
CQlzZmlfY3B1ZnJlcV9hcnJheVtpXS5mcmVxX21oejsKKwkJcHItPnBlcmZvcm1hbmNlLT5zdGF0
ZXNbaV0udHJhbnNpdGlvbl9sYXRlbmN5ID0gXAorCQkJc2ZpX2NwdWZyZXFfYXJyYXlbaV0ubGF0
ZW5jeTsKKwkJcHItPnBlcmZvcm1hbmNlLT5zdGF0ZXNbaV0uY29udHJvbCA9IFwKKwkJCXNmaV9j
cHVmcmVxX2FycmF5W2ldLmN0cmxfdmFsOworCQlwcmludGsoS0VSTl9JTkZPICJTdGF0ZSBbJWRd
OiBjb3JlX2ZyZXF1ZW5jeVslZF0gdHJhbnNpdGlvbl9sYXRlbmN5WyVkXSBjb250cm9sWzB4JXhd
XG4iLAorCQkJaSwKKwkJCSh1MzIpIHByLT5wZXJmb3JtYW5jZS0+c3RhdGVzW2ldLmNvcmVfZnJl
cXVlbmN5LAorCQkJKHUzMikgcHItPnBlcmZvcm1hbmNlLT5zdGF0ZXNbaV0udHJhbnNpdGlvbl9s
YXRlbmN5LAorCQkJKHUzMikgcHItPnBlcmZvcm1hbmNlLT5zdGF0ZXNbaV0uY29udHJvbCk7CisJ
fQorCisJcmV0dXJuIHJlc3VsdDsKK30KKworc3RhdGljIGludCBzZmlfcHJvY2Vzc29yX3JlZ2lz
dGVyX3BlcmZvcm1hbmNlKHN0cnVjdCBzZmlfcHJvY2Vzc29yX3BlcmZvcm1hbmNlCisJCQkJICAg
ICpwZXJmb3JtYW5jZSwgdW5zaWduZWQgaW50IGNwdSkKK3sKKwlzdHJ1Y3Qgc2ZpX3Byb2Nlc3Nv
ciAqcHI7CisKKwltdXRleF9sb2NrKCZwZXJmb3JtYW5jZV9tdXRleCk7CisKKwlwciA9IHBlcl9j
cHUoc2ZpX3Byb2Nlc3NvcnMsIGNwdSk7CisJaWYgKCFwcikgeworCQltdXRleF91bmxvY2soJnBl
cmZvcm1hbmNlX211dGV4KTsKKwkJcmV0dXJuIC1FTk9ERVY7CisJfQorCisJaWYgKHByLT5wZXJm
b3JtYW5jZSkgeworCQltdXRleF91bmxvY2soJnBlcmZvcm1hbmNlX211dGV4KTsKKwkJcmV0dXJu
IC1FQlVTWTsKKwl9CisKKwlXQVJOX09OKCFwZXJmb3JtYW5jZSk7CisKKwlwci0+cGVyZm9ybWFu
Y2UgPSBwZXJmb3JtYW5jZTsKKworCS8qIHBhcnNlIHRoZSBmcmVxIHRhYmxlIGZyb20gc2ZpICov
CisJc2ZpX2NwdWZyZXFfbnVtID0gMDsKKwlzZmlfdGFibGVfcGFyc2UoU0ZJX1NJR19GUkVRLCBO
VUxMLCBOVUxMLCBwYXJzZV9mcmVxKTsKKworCXNmaV9wcm9jZXNzb3JfZ2V0X3BlcmZvcm1hbmNl
X3N0YXRlcyhwcik7CisKKwltdXRleF91bmxvY2soJnBlcmZvcm1hbmNlX211dGV4KTsKKwlyZXR1
cm4gMDsKK30KKwordm9pZCBzZmlfcHJvY2Vzc29yX3VucmVnaXN0ZXJfcGVyZm9ybWFuY2Uoc3Ry
dWN0IHNmaV9wcm9jZXNzb3JfcGVyZm9ybWFuY2UKKwkJCQkgICAgICAqcGVyZm9ybWFuY2UsIHVu
c2lnbmVkIGludCBjcHUpCit7CisJc3RydWN0IHNmaV9wcm9jZXNzb3IgKnByOworCisKKwltdXRl
eF9sb2NrKCZwZXJmb3JtYW5jZV9tdXRleCk7CisKKwlwciA9IHBlcl9jcHUoc2ZpX3Byb2Nlc3Nv
cnMsIGNwdSk7CisJaWYgKCFwcikgeworCQltdXRleF91bmxvY2soJnBlcmZvcm1hbmNlX211dGV4
KTsKKwkJcmV0dXJuOworCX0KKworCWlmIChwci0+cGVyZm9ybWFuY2UpCisJCWtmcmVlKHByLT5w
ZXJmb3JtYW5jZS0+c3RhdGVzKTsKKwlwci0+cGVyZm9ybWFuY2UgPSBOVUxMOworCisJbXV0ZXhf
dW5sb2NrKCZwZXJmb3JtYW5jZV9tdXRleCk7CisKKwlyZXR1cm47Cit9CisKK3N0YXRpYyB1bnNp
Z25lZCBpbnQgZ2V0X2N1cl9mcmVxX29uX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQoreworCXN0cnVj
dCBzZmlfY3B1ZnJlcV9kYXRhICpkYXRhID0gcGVyX2NwdShkcnZfZGF0YSwgY3B1KTsKKwl1bnNp
Z25lZCBpbnQgY2FjaGVkX2ZyZXE7CisKKwlwcl9kZWJ1ZygiZ2V0X2N1cl9mcmVxX29uX2NwdSAo
JWQpXG4iLCBjcHUpOworCisJaWYgKHVubGlrZWx5KGRhdGEgPT0gTlVMTCB8fAorCQlkYXRhLT5z
ZmlfZGF0YSA9PSBOVUxMIHx8IGRhdGEtPmZyZXFfdGFibGUgPT0gTlVMTCkpIHsKKwkJcmV0dXJu
IDA7CisJfQorCisJY2FjaGVkX2ZyZXEgPSBkYXRhLT5mcmVxX3RhYmxlW2RhdGEtPnNmaV9kYXRh
LT5zdGF0ZV0uZnJlcXVlbmN5OworCisJcmV0dXJuIGNhY2hlZF9mcmVxOworfQorCitzdGF0aWMg
aW50IHNmaV9jcHVmcmVxX3RhcmdldChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSwKKwkJ
CSAgICAgICB1bnNpZ25lZCBpbnQgdGFyZ2V0X2ZyZXEsIHVuc2lnbmVkIGludCByZWxhdGlvbikK
K3sKKwlzdHJ1Y3Qgc2ZpX2NwdWZyZXFfZGF0YSAqZGF0YSA9IHBlcl9jcHUoZHJ2X2RhdGEsIHBv
bGljeS0+Y3B1KTsKKwlzdHJ1Y3Qgc2ZpX3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZSAqcGVyZjsKKwlz
dHJ1Y3QgY3B1ZnJlcV9mcmVxcyBmcmVxczsKKwl1bnNpZ25lZCBpbnQgbmV4dF9zdGF0ZSA9IDA7
IC8qIEluZGV4IGludG8gZnJlcV90YWJsZSAqLworCXVuc2lnbmVkIGludCBuZXh0X3BlcmZfc3Rh
dGUgPSAwOyAvKiBJbmRleCBpbnRvIHBlcmYgdGFibGUgKi8KKwlpbnQgcmVzdWx0ID0gMDsKKwl1
MzIgbG8sIGhpOworCisJcHJfZGVidWcoInNmaV9jcHVmcmVxX3RhcmdldCAlZCAoJWQpXG4iLCB0
YXJnZXRfZnJlcSwgcG9saWN5LT5jcHUpOworCisJaWYgKHVubGlrZWx5KGRhdGEgPT0gTlVMTCB8
fAorCSAgICAgZGF0YS0+c2ZpX2RhdGEgPT0gTlVMTCB8fCBkYXRhLT5mcmVxX3RhYmxlID09IE5V
TEwpKSB7CisJCXJldHVybiAtRU5PREVWOworCX0KKworCXBlcmYgPSBkYXRhLT5zZmlfZGF0YTsK
KwlyZXN1bHQgPSBjcHVmcmVxX2ZyZXF1ZW5jeV90YWJsZV90YXJnZXQocG9saWN5LAorCQkJCQkJ
ZGF0YS0+ZnJlcV90YWJsZSwKKwkJCQkJCXRhcmdldF9mcmVxLAorCQkJCQkJcmVsYXRpb24sICZu
ZXh0X3N0YXRlKTsKKwlpZiAodW5saWtlbHkocmVzdWx0KSkKKwkJcmV0dXJuIC1FTk9ERVY7CisK
KwluZXh0X3BlcmZfc3RhdGUgPSBkYXRhLT5mcmVxX3RhYmxlW25leHRfc3RhdGVdLmluZGV4Owor
CWlmIChwZXJmLT5zdGF0ZSA9PSBuZXh0X3BlcmZfc3RhdGUpIHsKKwkJaWYgKHVubGlrZWx5KGRh
dGEtPnJlc3VtZSkpIHsKKwkJCXByX2RlYnVnKCJDYWxsZWQgYWZ0ZXIgcmVzdW1lLCByZXNldHRp
bmcgdG8gUCVkXG4iLAorCQkJCW5leHRfcGVyZl9zdGF0ZSk7CisJCQlkYXRhLT5yZXN1bWUgPSAw
OworCQl9IGVsc2UgeworCQkJcHJfZGVidWcoIkFscmVhZHkgYXQgdGFyZ2V0IHN0YXRlIChQJWQp
XG4iLAorCQkJCW5leHRfcGVyZl9zdGF0ZSk7CisJCQlyZXR1cm4gMDsKKwkJfQorCX0KKworCWZy
ZXFzLm9sZCA9IHBlcmYtPnN0YXRlc1twZXJmLT5zdGF0ZV0uY29yZV9mcmVxdWVuY3kgKiAxMDAw
OworCWZyZXFzLm5ldyA9IGRhdGEtPmZyZXFfdGFibGVbbmV4dF9zdGF0ZV0uZnJlcXVlbmN5Owor
CWZyZXFzLmNwdSA9IHBvbGljeS0+Y3B1OworCisJY3B1ZnJlcV9ub3RpZnlfdHJhbnNpdGlvbigm
ZnJlcXMsIENQVUZSRVFfUFJFQ0hBTkdFKTsKKworCXJkbXNyX29uX2NwdShwb2xpY3ktPmNwdSwg
TVNSX0lBMzJfUEVSRl9DVEwsICZsbywgJmhpKTsKKwlsbyA9IChsbyAmIH5JTlRFTF9NU1JfUkFO
R0UpIHwKKwkJKCh1MzIpIHBlcmYtPnN0YXRlc1tuZXh0X3BlcmZfc3RhdGVdLmNvbnRyb2wgJiBJ
TlRFTF9NU1JfUkFOR0UpOworCXdybXNyX29uX2NwdShwb2xpY3ktPmNwdSwgTVNSX0lBMzJfUEVS
Rl9DVEwsIGxvLCBoaSk7CisKKworCWNwdWZyZXFfbm90aWZ5X3RyYW5zaXRpb24oJmZyZXFzLCBD
UFVGUkVRX1BPU1RDSEFOR0UpOworCXBlcmYtPnN0YXRlID0gbmV4dF9wZXJmX3N0YXRlOworCisJ
cmV0dXJuIHJlc3VsdDsKK30KKworc3RhdGljIGludCBzZmlfY3B1ZnJlcV92ZXJpZnkoc3RydWN0
IGNwdWZyZXFfcG9saWN5ICpwb2xpY3kpCit7CisJc3RydWN0IHNmaV9jcHVmcmVxX2RhdGEgKmRh
dGEgPSBwZXJfY3B1KGRydl9kYXRhLCBwb2xpY3ktPmNwdSk7CisKKwlwcl9kZWJ1Zygic2ZpX2Nw
dWZyZXFfdmVyaWZ5XG4iKTsKKworCXJldHVybiBjcHVmcmVxX2ZyZXF1ZW5jeV90YWJsZV92ZXJp
ZnkocG9saWN5LCBkYXRhLT5mcmVxX3RhYmxlKTsKK30KKworLyoKKyAqIHNmaV9jcHVmcmVxX2Vh
cmx5X2luaXQgLSBpbml0aWFsaXplIFNGSSBQLVN0YXRlcyBsaWJyYXJ5CisgKgorICogSW5pdGlh
bGl6ZSB0aGUgU0ZJIFAtU3RhdGVzIGxpYnJhcnkgKGRyaXZlcnMvc2ZpL3Byb2Nlc3Nvcl9wZXJm
bGliLmMpCisgKiBpbiBvcmRlciB0byBjb3BlIHdpdGggdGhlIGNvcnJlY3QgZnJlcXVlbmN5IGFu
ZCB2b2x0YWdlIHBhaXJpbmdzLgorICovCitzdGF0aWMgaW50IF9faW5pdCBzZmlfY3B1ZnJlcV9l
YXJseV9pbml0KHZvaWQpCit7CisJc2ZpX3BlcmZfZGF0YSA9IGFsbG9jX3BlcmNwdShzdHJ1Y3Qg
c2ZpX3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZSk7CisJaWYgKCFzZmlfcGVyZl9kYXRhKSB7CisJCXBy
X2RlYnVnKCJNZW1vcnkgYWxsb2NhdGlvbiBlcnJvciBmb3Igc2ZpX3BlcmZfZGF0YS5cbiIpOwor
CQlyZXR1cm4gLUVOT01FTTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworCitzdGF0aWMgaW50IHNm
aV9jcHVmcmVxX2NwdV9pbml0KHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5KQoreworCXVu
c2lnbmVkIGludCBpOworCXVuc2lnbmVkIGludCB2YWxpZF9zdGF0ZXMgPSAwOworCXVuc2lnbmVk
IGludCBjcHUgPSBwb2xpY3ktPmNwdTsKKwlzdHJ1Y3Qgc2ZpX2NwdWZyZXFfZGF0YSAqZGF0YTsK
Kwl1bnNpZ25lZCBpbnQgcmVzdWx0ID0gMDsKKwlzdHJ1Y3QgY3B1aW5mb194ODYgKmMgPSAmY3B1
X2RhdGEocG9saWN5LT5jcHUpOworCXN0cnVjdCBzZmlfcHJvY2Vzc29yX3BlcmZvcm1hbmNlICpw
ZXJmOworCisJcHJfZGVidWcoInNmaV9jcHVmcmVxX2NwdV9pbml0IENQVTolZFxuIiwgcG9saWN5
LT5jcHUpOworCisJZGF0YSA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBzZmlfY3B1ZnJlcV9kYXRh
KSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFkYXRhKQorCQlyZXR1cm4gLUVOT01FTTsKKworCWRhdGEt
PnNmaV9kYXRhID0gcGVyX2NwdV9wdHIoc2ZpX3BlcmZfZGF0YSwgY3B1KTsKKwlwZXJfY3B1KGRy
dl9kYXRhLCBjcHUpID0gZGF0YTsKKworCXNmaV9jcHVmcmVxX2RyaXZlci5mbGFncyB8PSBDUFVG
UkVRX0NPTlNUX0xPT1BTOworCisKKwlyZXN1bHQgPSBzZmlfcHJvY2Vzc29yX3JlZ2lzdGVyX3Bl
cmZvcm1hbmNlKGRhdGEtPnNmaV9kYXRhLCBjcHUpOworCWlmIChyZXN1bHQpCisJCWdvdG8gZXJy
X2ZyZWU7CisKKwlwZXJmID0gZGF0YS0+c2ZpX2RhdGE7CisJcG9saWN5LT5zaGFyZWRfdHlwZSA9
IENQVUZSRVFfU0hBUkVEX1RZUEVfSFc7CisKKwljcHVtYXNrX3NldF9jcHUocG9saWN5LT5jcHUs
IHBvbGljeS0+Y3B1cyk7CisJY3B1bWFza19zZXRfY3B1KHBvbGljeS0+Y3B1LCBwb2xpY3ktPnJl
bGF0ZWRfY3B1cyk7CisKKwkvKiBjYXBhYmlsaXR5IGNoZWNrICovCisJaWYgKHBlcmYtPnN0YXRl
X2NvdW50IDw9IDEpIHsKKwkJcHJfZGVidWcoIk5vIFAtU3RhdGVzXG4iKTsKKwkJcmVzdWx0ID0g
LUVOT0RFVjsKKwkJZ290byBlcnJfdW5yZWc7CisJfQorCisJZGF0YS0+ZnJlcV90YWJsZSA9IGt6
YWxsb2Moc2l6ZW9mKHN0cnVjdCBjcHVmcmVxX2ZyZXF1ZW5jeV90YWJsZSkgKgorCQkgICAgKHBl
cmYtPnN0YXRlX2NvdW50KzEpLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWRhdGEtPmZyZXFfdGFibGUp
IHsKKwkJcmVzdWx0ID0gLUVOT01FTTsKKwkJZ290byBlcnJfdW5yZWc7CisJfQorCisJLyogZGV0
ZWN0IHRyYW5zaXRpb24gbGF0ZW5jeSAqLworCXBvbGljeS0+Y3B1aW5mby50cmFuc2l0aW9uX2xh
dGVuY3kgPSAwOworCWZvciAoaSA9IDA7IGkgPCBwZXJmLT5zdGF0ZV9jb3VudDsgaSsrKSB7CisJ
CWlmICgocGVyZi0+c3RhdGVzW2ldLnRyYW5zaXRpb25fbGF0ZW5jeSAqIDEwMDApID4KKwkJICAg
IHBvbGljeS0+Y3B1aW5mby50cmFuc2l0aW9uX2xhdGVuY3kpCisJCQlwb2xpY3ktPmNwdWluZm8u
dHJhbnNpdGlvbl9sYXRlbmN5ID0KKwkJCSAgICBwZXJmLT5zdGF0ZXNbaV0udHJhbnNpdGlvbl9s
YXRlbmN5ICogMTAwMDsKKwl9CisKKwlkYXRhLT5tYXhfZnJlcSA9IHBlcmYtPnN0YXRlc1swXS5j
b3JlX2ZyZXF1ZW5jeSAqIDEwMDA7CisJLyogdGFibGUgaW5pdCAqLworCWZvciAoaSA9IDA7IGkg
PCBwZXJmLT5zdGF0ZV9jb3VudDsgaSsrKSB7CisJCWlmIChpID4gMCAmJiBwZXJmLT5zdGF0ZXNb
aV0uY29yZV9mcmVxdWVuY3kgPj0KKwkJICAgIGRhdGEtPmZyZXFfdGFibGVbdmFsaWRfc3RhdGVz
LTFdLmZyZXF1ZW5jeSAvIDEwMDApCisJCQljb250aW51ZTsKKworCQlkYXRhLT5mcmVxX3RhYmxl
W3ZhbGlkX3N0YXRlc10uaW5kZXggPSBpOworCQlkYXRhLT5mcmVxX3RhYmxlW3ZhbGlkX3N0YXRl
c10uZnJlcXVlbmN5ID0KKwkJICAgIHBlcmYtPnN0YXRlc1tpXS5jb3JlX2ZyZXF1ZW5jeSAqIDEw
MDA7CisJCXZhbGlkX3N0YXRlcysrOworCX0KKwlkYXRhLT5mcmVxX3RhYmxlW3ZhbGlkX3N0YXRl
c10uZnJlcXVlbmN5ID0gQ1BVRlJFUV9UQUJMRV9FTkQ7CisJcGVyZi0+c3RhdGUgPSAwOworCisJ
cmVzdWx0ID0gY3B1ZnJlcV9mcmVxdWVuY3lfdGFibGVfY3B1aW5mbyhwb2xpY3ksIGRhdGEtPmZy
ZXFfdGFibGUpOworCWlmIChyZXN1bHQpCisJCWdvdG8gZXJyX2ZyZXFmcmVlOworCisJc2ZpX2Nw
dWZyZXFfZHJpdmVyLmdldCA9IGdldF9jdXJfZnJlcV9vbl9jcHU7CisJcG9saWN5LT5jdXIgPSBn
ZXRfY3VyX2ZyZXFfb25fY3B1KGNwdSk7CisKKworCS8qIENoZWNrIGZvciBBUEVSRi9NUEVSRiBz
dXBwb3J0IGluIGhhcmR3YXJlICovCisJaWYgKGNwdV9oYXMoYywgWDg2X0ZFQVRVUkVfQVBFUkZN
UEVSRikpCisJCXNmaV9jcHVmcmVxX2RyaXZlci5nZXRhdmcgPSBjcHVmcmVxX2dldF9tZWFzdXJl
ZF9wZXJmOworCisJcHJfZGVidWcoIkNQVSV1IC0gU0ZJIHBlcmZvcm1hbmNlIG1hbmFnZW1lbnQg
YWN0aXZhdGVkLlxuIiwgY3B1KTsKKwlmb3IgKGkgPSAwOyBpIDwgcGVyZi0+c3RhdGVfY291bnQ7
IGkrKykKKwkJcHJfZGVidWcoIiAgICAgJWNQJWQ6ICVkIE1IeiwgJWQgdVNcbiIsCisJCQkoaSA9
PSBwZXJmLT5zdGF0ZSA/ICcqJyA6ICcgJyksIGksCisJCQkodTMyKSBwZXJmLT5zdGF0ZXNbaV0u
Y29yZV9mcmVxdWVuY3ksCisJCQkodTMyKSBwZXJmLT5zdGF0ZXNbaV0udHJhbnNpdGlvbl9sYXRl
bmN5KTsKKworCWNwdWZyZXFfZnJlcXVlbmN5X3RhYmxlX2dldF9hdHRyKGRhdGEtPmZyZXFfdGFi
bGUsIHBvbGljeS0+Y3B1KTsKKworCS8qCisJICogdGhlIGZpcnN0IGNhbGwgdG8gLT50YXJnZXQo
KSBzaG91bGQgcmVzdWx0IGluIHVzIGFjdHVhbGx5CisJICogd3JpdGluZyBzb21ldGhpbmcgdG8g
dGhlIGFwcHJvcHJpYXRlIHJlZ2lzdGVycy4KKwkgKi8KKwlkYXRhLT5yZXN1bWUgPSAxOworCisJ
cmV0dXJuIHJlc3VsdDsKKworZXJyX2ZyZXFmcmVlOgorCWtmcmVlKGRhdGEtPmZyZXFfdGFibGUp
OworZXJyX3VucmVnOgorCXNmaV9wcm9jZXNzb3JfdW5yZWdpc3Rlcl9wZXJmb3JtYW5jZShwZXJm
LCBjcHUpOworZXJyX2ZyZWU6CisJa2ZyZWUoZGF0YSk7CisJcGVyX2NwdShkcnZfZGF0YSwgY3B1
KSA9IE5VTEw7CisKKwlyZXR1cm4gcmVzdWx0OworfQorCitzdGF0aWMgaW50IHNmaV9jcHVmcmVx
X2NwdV9leGl0KHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5KQoreworCXN0cnVjdCBzZmlf
Y3B1ZnJlcV9kYXRhICpkYXRhID0gcGVyX2NwdShkcnZfZGF0YSwgcG9saWN5LT5jcHUpOworCisJ
cHJfZGVidWcoInNmaV9jcHVmcmVxX2NwdV9leGl0XG4iKTsKKworCWlmIChkYXRhKSB7CisJCWNw
dWZyZXFfZnJlcXVlbmN5X3RhYmxlX3B1dF9hdHRyKHBvbGljeS0+Y3B1KTsKKwkJcGVyX2NwdShk
cnZfZGF0YSwgcG9saWN5LT5jcHUpID0gTlVMTDsKKwkJc2ZpX3Byb2Nlc3Nvcl91bnJlZ2lzdGVy
X3BlcmZvcm1hbmNlKGRhdGEtPnNmaV9kYXRhLAorCQkJCQkJCXBvbGljeS0+Y3B1KTsKKwkJa2Zy
ZWUoZGF0YSk7CisJfQorCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgc2ZpX2NwdWZyZXFf
cmVzdW1lKHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5KQoreworCXN0cnVjdCBzZmlfY3B1
ZnJlcV9kYXRhICpkYXRhID0gcGVyX2NwdShkcnZfZGF0YSwgcG9saWN5LT5jcHUpOworCisJcHJf
ZGVidWcoInNmaV9jcHVmcmVxX3Jlc3VtZVxuIik7CisKKwlkYXRhLT5yZXN1bWUgPSAxOworCisJ
cmV0dXJuIDA7Cit9CisKK3N0YXRpYyBzdHJ1Y3QgZnJlcV9hdHRyICpzZmlfY3B1ZnJlcV9hdHRy
W10gPSB7CisJJmNwdWZyZXFfZnJlcV9hdHRyX3NjYWxpbmdfYXZhaWxhYmxlX2ZyZXFzLAorCU5V
TEwsCit9OworCitzdGF0aWMgc3RydWN0IGNwdWZyZXFfZHJpdmVyIHNmaV9jcHVmcmVxX2RyaXZl
ciA9IHsKKwkudmVyaWZ5ID0gc2ZpX2NwdWZyZXFfdmVyaWZ5LAorCS50YXJnZXQgPSBzZmlfY3B1
ZnJlcV90YXJnZXQsCisJLmluaXQgPSBzZmlfY3B1ZnJlcV9jcHVfaW5pdCwKKwkuZXhpdCA9IHNm
aV9jcHVmcmVxX2NwdV9leGl0LAorCS5yZXN1bWUgPSBzZmlfY3B1ZnJlcV9yZXN1bWUsCisJLm5h
bWUgPSAic2ZpLWNwdWZyZXEiLAorCS5vd25lciA9IFRISVNfTU9EVUxFLAorCS5hdHRyID0gc2Zp
X2NwdWZyZXFfYXR0ciwKK307CisKK3N0YXRpYyBpbnQgX19pbml0IHBhcnNlX2NwdXMoc3RydWN0
IHNmaV90YWJsZV9oZWFkZXIgKnRhYmxlKQoreworCXN0cnVjdCBzZmlfdGFibGVfc2ltcGxlICpz
YjsKKwlzdHJ1Y3Qgc2ZpX2NwdV90YWJsZV9lbnRyeSAqcGVudHJ5OworCWludCBpOworCisJc2Ig
PSAoc3RydWN0IHNmaV90YWJsZV9zaW1wbGUgKil0YWJsZTsKKworCXNmaV9jcHVfbnVtID0gU0ZJ
X0dFVF9OVU1fRU5UUklFUyhzYiwgc3RydWN0IHNmaV9jcHVfdGFibGVfZW50cnkpOworCisJcGVu
dHJ5ID0gKHN0cnVjdCBzZmlfY3B1X3RhYmxlX2VudHJ5ICopIHNiLT5wZW50cnk7CisJZm9yIChp
ID0gMDsgaSA8IHNmaV9jcHVfbnVtOyBpKyspIHsKKwkJc2ZpX2NwdV9hcnJheVtpXS5hcGljX2lk
ID0gcGVudHJ5LT5hcGljX2lkOworCQlwcmludGsoS0VSTl9JTkZPICJBUElDIElEOiAlZFxuIiwg
cGVudHJ5LT5hcGljX2lkKTsKKwkJcGVudHJ5Kys7CisJfQorCisJcmV0dXJuIDA7CisKK30KKwor
CitzdGF0aWMgaW50IF9faW5pdCBpbml0X3NmaV9wcm9jZXNzb3JfbGlzdCh2b2lkKQoreworCXN0
cnVjdCBzZmlfcHJvY2Vzc29yICpwcjsKKwlpbnQgaTsKKwlpbnQgcmVzdWx0OworCisJLyogcGFy
c2UgdGhlIGNwdXMgZnJvbSB0aGUgc2ZpIHRhYmxlICovCisJcmVzdWx0ID0gc2ZpX3RhYmxlX3Bh
cnNlKFNGSV9TSUdfQ1BVUywgTlVMTCwgTlVMTCwgcGFyc2VfY3B1cyk7CisKKwlpZiAocmVzdWx0
IDwgMCkKKwkJcmV0dXJuIHJlc3VsdDsKKworCXByID0ga3phbGxvYyhzZmlfY3B1X251bSAqIHNp
emVvZihzdHJ1Y3Qgc2ZpX3Byb2Nlc3NvciksIEdGUF9LRVJORUwpOworCWlmICghcHIpCisJCXJl
dHVybiAtRU5PTUVNOworCisJZm9yIChpID0gMDsgaSA8IHNmaV9jcHVfbnVtOyBpKyspIHsKKwkJ
cHItPmlkID0gc2ZpX2NwdV9hcnJheVtpXS5hcGljX2lkOworCQlwZXJfY3B1KHNmaV9wcm9jZXNz
b3JzLCBwci0+aWQpID0gcHI7CisJCXByKys7CisJfQorCisJcmV0dXJuIDA7Cit9CisKK3N0YXRp
YyBpbnQgX19pbml0IHNmaV9jcHVmcmVxX2luaXQodm9pZCkKK3sKKwlpbnQgcmV0OworCisJcHJf
ZGVidWcoInNmaV9jcHVmcmVxX2luaXRcbiIpOworCisJcmV0ID0gaW5pdF9zZmlfcHJvY2Vzc29y
X2xpc3QoKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJcmV0ID0gc2ZpX2NwdWZyZXFf
ZWFybHlfaW5pdCgpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlyZXR1cm4gY3B1ZnJl
cV9yZWdpc3Rlcl9kcml2ZXIoJnNmaV9jcHVmcmVxX2RyaXZlcik7Cit9CisKK3N0YXRpYyB2b2lk
IF9fZXhpdCBzZmlfY3B1ZnJlcV9leGl0KHZvaWQpCit7CisKKwlzdHJ1Y3Qgc2ZpX3Byb2Nlc3Nv
ciAqcHI7CisKKwlwcl9kZWJ1Zygic2ZpX2NwdWZyZXFfZXhpdFxuIik7CisKKwlwciA9IHBlcl9j
cHUoc2ZpX3Byb2Nlc3NvcnMsIDApOworCWtmcmVlKHByKTsKKworCWNwdWZyZXFfdW5yZWdpc3Rl
cl9kcml2ZXIoJnNmaV9jcHVmcmVxX2RyaXZlcik7CisKKwlmcmVlX3BlcmNwdShzZmlfcGVyZl9k
YXRhKTsKKworCXJldHVybjsKK30KK2xhdGVfaW5pdGNhbGwoc2ZpX2NwdWZyZXFfaW5pdCk7Citt
b2R1bGVfZXhpdChzZmlfY3B1ZnJlcV9leGl0KTsKKworTU9EVUxFX0FMSUFTKCJzZmkiKTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY3B1ZnJlcS9zZmktY3B1ZnJlcS5oIGIvZHJpdmVycy9jcHVmcmVx
L3NmaS1jcHVmcmVxLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uN2UwMWMx
ZQotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvY3B1ZnJlcS9zZmktY3B1ZnJlcS5oCkBAIC0w
LDAgKzEsNjUgQEAKKy8qCisgKiBzZmlfcHJvY2Vzc29yLmgKKyAqIENvcHlyaWdodCAoYykgMjAx
MCwgSW50ZWwgQ29ycG9yYXRpb24uCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkgaXQKKyAqIHVuZGVyIHRo
ZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Us
CisgKiB2ZXJzaW9uIDIsIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uLgorICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSBpdCB3
aWxsIGJlIHVzZWZ1bCwgYnV0IFdJVEhPVVQKKyAqIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVu
IHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mIE1FUkNIQU5UQUJJTElUWSBvcgorICogRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGZvcgorICogbW9yZSBkZXRhaWxzLgorICoKKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nIHdpdGgKKyAq
IHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uLCBJbmMuLAorICogNTEgRnJhbmtsaW4gU3QgLSBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAw
MjExMC0xMzAxIFVTQS4KKyAqCisgKi8KKworI2lmbmRlZiBfX1NGSV9QUk9DRVNTT1JfSF9fCisj
ZGVmaW5lIF9fU0ZJX1BST0NFU1NPUl9IX18KKworI2luY2x1ZGUgPGxpbnV4L3NmaS5oPgorI2lu
Y2x1ZGUgPGxpbnV4L2NwdWlkbGUuaD4KKworc3RydWN0IHNmaV9wcm9jZXNzb3JfcG93ZXIgewor
CXN0cnVjdCBjcHVpZGxlX2RldmljZSBkZXY7CisJdTMyIGRlZmF1bHRfc3RhdGU7CisJaW50IGNv
dW50OworCXN0cnVjdCBjcHVpZGxlX3N0YXRlICpzdGF0ZXM7CisJc3RydWN0IHNmaV9jc3RhdGVf
dGFibGVfZW50cnkgKnNmaV9jc3RhdGVzOworfTsKKworc3RydWN0IHNmaV9wcm9jZXNzb3JfZmxh
Z3MgeworCXU4IHZhbGlkOworCXU4IHBvd2VyOworfTsKKworc3RydWN0IHNmaV9wcm9jZXNzb3Ig
eworCXUzMiBpZDsKKwlzdHJ1Y3Qgc2ZpX3Byb2Nlc3Nvcl9mbGFncyBmbGFnczsKKwlzdHJ1Y3Qg
c2ZpX3Byb2Nlc3Nvcl9wb3dlciBwb3dlcjsKKwlzdHJ1Y3Qgc2ZpX3Byb2Nlc3Nvcl9wZXJmb3Jt
YW5jZSAqcGVyZm9ybWFuY2U7Cit9OworCisvKiBQZXJmb3JtYW5jZSBtYW5hZ2VtZW50ICovCitz
dHJ1Y3Qgc2ZpX3Byb2Nlc3Nvcl9weCB7CisJdTMyIGNvcmVfZnJlcXVlbmN5OwkvKiBtZWdhaGVy
dHogKi8KKwl1MzIgdHJhbnNpdGlvbl9sYXRlbmN5OwkvKiBtaWNyb3NlY29uZHMgKi8KKwl1MzIg
Y29udHJvbDsJLyogY29udHJvbCB2YWx1ZSAqLworfTsKKworc3RydWN0IHNmaV9wcm9jZXNzb3Jf
cGVyZm9ybWFuY2UgeworCXVuc2lnbmVkIGludCBzdGF0ZTsKKwl1bnNpZ25lZCBpbnQgc3RhdGVf
Y291bnQ7CisJc3RydWN0IHNmaV9wcm9jZXNzb3JfcHggKnN0YXRlczsKK307CisKKy8qIGZvciBj
b21tdW5pY2F0aW9uIGJldHdlZW4gbXVsdGlwbGUgcGFydHMgb2YgdGhlIHByb2Nlc3NvciBrZXJu
ZWwgbW9kdWxlICovCitERUNMQVJFX1BFUl9DUFUoc3RydWN0IHNmaV9wcm9jZXNzb3IgKiwgc2Zp
X3Byb2Nlc3NvcnMpOworCitpbnQgc2ZpX3Byb2Nlc3Nvcl9wb3dlcl9pbml0KHN0cnVjdCBzZmlf
cHJvY2Vzc29yICpwcik7CitpbnQgc2ZpX3Byb2Nlc3Nvcl9wb3dlcl9leGl0KHN0cnVjdCBzZmlf
cHJvY2Vzc29yICpwcik7CisKKyNlbmRpZiAvKl9fU0ZJX1BST0NFU1NPUl9IX18qLwotLSAKMS43
LjAuNAoK

--_002_C9B248CF4BE2844B92616616440223E8049D43BGSMSX101garcorpi_--
