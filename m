From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Enhanced PowerSaver driver
Date: Mon, 05 Feb 2007 19:57:25 +0100
Message-ID: <45C77E15.9040204@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk


This is driver for Enhanced Powersaver which is present in VIA C7=20
processors. Beta tested by Jorgen (jorgen (at) greven dot dk).=20
Thanks! Based on documentation provided by Dave Jones (Thanks!)=20
and C7 Eden datasheet available from www.via.com.tw. Looks like all=20
these C7 Eden CPU's don't have P-states in BIOS. I know that 2=20
p-states is low, but Jorgen finds it usefull anyway because board=20
is passive cooled.
There are 3 different types of C7 processors (called brands):
0. C7-M - these processors can set any maultiplier between min and=20
max, any voltage between min and max.
1. C7 - only min and max states are supported. Voltage is different=20
for min and max states.
2. Eden - only min and max states are supported. Looks like this=20
brand can only change multiplier. Voltage seems to be the same for=20
min and max frequency.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
diff --git a/arch/i386/kernel/cpu/cpufreq/Kconfig b/arch/i386/kernel/cpu/cp=
ufreq/Kconfig
--- a/arch/i386/kernel/cpu/cpufreq/Kconfig
+++ b/arch/i386/kernel/cpu/cpufreq/Kconfig
@@ -217,6 +217,15 @@ config X86_LONGHAUL
=20
 	  If in doubt, say N.
=20
+config X86_E_POWERSAVER
+	tristate "VIA C7 Enhanced PowerSaver (EXPERIMENTAL)"
+	select CPU_FREQ_TABLE
+	depends on EXPERIMENTAL
+	help
+	  This adds the CPUFreq driver for VIA C7 processors.
+
+	  If in doubt, say N.
+
 comment "shared options"
=20
 config X86_ACPI_CPUFREQ_PROC_INTF
diff --git a/arch/i386/kernel/cpu/cpufreq/Makefile b/arch/i386/kernel/cpu/c=
pufreq/Makefile
--- a/arch/i386/kernel/cpu/cpufreq/Makefile
+++ b/arch/i386/kernel/cpu/cpufreq/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_X86_POWERNOW_K6)		+=3D powernow-k6.o
 obj-$(CONFIG_X86_POWERNOW_K7)		+=3D powernow-k7.o
 obj-$(CONFIG_X86_POWERNOW_K8)		+=3D powernow-k8.o
 obj-$(CONFIG_X86_LONGHAUL)		+=3D longhaul.o
+obj-$(CONFIG_X86_E_POWERSAVER)		+=3D e_powersaver.o
 obj-$(CONFIG_ELAN_CPUFREQ)		+=3D elanfreq.o
 obj-$(CONFIG_SC520_CPUFREQ)		+=3D sc520_freq.o
 obj-$(CONFIG_X86_LONGRUN)		+=3D longrun.o =20
diff --git a/arch/i386/kernel/cpu/cpufreq/e_powersaver.c b/arch/i386/kernel=
/cpu/cpufreq/e_powersaver.c
new file mode 100644
--- /dev/null
+++ b/arch/i386/kernel/cpu/cpufreq/e_powersaver.c
@@ -0,0 +1,334 @@
+/*
+ *  Based on documentation provided by Dave Jones. Thanks!
+ * =20
+ *  Licensed under the terms of the GNU GPL License version 2.
+ *
+ *  BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/cpufreq.h>
+#include <linux/ioport.h>
+#include <linux/slab.h>
+
+#include <asm/msr.h>
+#include <asm/tsc.h>
+#include <asm/timex.h>
+#include <asm/io.h>
+#include <asm/delay.h>
+
+#define EPS_BRAND_C7M	0
+#define EPS_BRAND_C7	1
+#define EPS_BRAND_EDEN	2
+#define EPS_BRAND_C3	3
+
+struct eps_cpu_data {
+	u32 fsb;
+	struct cpufreq_frequency_table freq_table[];
+};
+
+static struct eps_cpu_data *eps_cpu[NR_CPUS];
+
+
+static unsigned int eps_get(unsigned int cpu)
+{
+	struct eps_cpu_data *centaur;
+	u32 lo, hi;
+
+	if (cpu)
+		return 0;
+	centaur =3D eps_cpu[cpu];
+	if (centaur =3D=3D NULL)
+		return 0;
+
+	/* Return current frequency */
+	rdmsr(MSR_IA32_PERF_STATUS, lo, hi);
+	return centaur->fsb * ((lo >> 8) & 0xff);
+}
+
+static int eps_set_state(struct eps_cpu_data *centaur,
+			 unsigned int cpu,
+			 u32 dest_state)
+{
+	struct cpufreq_freqs freqs;
+	u32 lo, hi;
+	int err =3D 0;
+	int i;
+
+	freqs.old =3D eps_get(cpu);
+	freqs.new =3D centaur->fsb * ((dest_state >> 8) & 0xff);
+	freqs.cpu =3D cpu;
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+
+	/* Wait while CPU is busy */
+	rdmsr(MSR_IA32_PERF_STATUS, lo, hi);
+	i =3D 0;
+	while (lo & ((1 << 16) | (1 << 17))) {
+		udelay(16);
+		rdmsr(MSR_IA32_PERF_STATUS, lo, hi);
+		i++;
+		if (unlikely(i > 64)) {
+			err =3D -ENODEV;
+			goto postchange;
+		}
+	}
+	/* Set new multiplier and voltage */
+	wrmsr(MSR_IA32_PERF_CTL, dest_state & 0xffff, 0);
+	/* Wait until transition end */
+	i =3D 0;
+	do {
+		udelay(16);
+		rdmsr(MSR_IA32_PERF_STATUS, lo, hi);
+		i++;
+		if (unlikely(i > 64)) {
+			err =3D -ENODEV;
+			goto postchange;
+		}
+	} while (lo & ((1 << 16) | (1 << 17)));
+
+	/* Return current frequency */
+postchange:
+	rdmsr(MSR_IA32_PERF_STATUS, lo, hi);
+	freqs.new =3D centaur->fsb * ((lo >> 8) & 0xff);
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	return err;
+}
+
+static int eps_target(struct cpufreq_policy *policy,
+			       unsigned int target_freq,
+			       unsigned int relation)
+{
+	struct eps_cpu_data *centaur;
+	unsigned int newstate =3D 0;
+	unsigned int cpu =3D policy->cpu;
+	unsigned int dest_state;
+	int ret;
+
+	if (unlikely(eps_cpu[cpu] =3D=3D NULL))
+		return -ENODEV;
+	centaur =3D eps_cpu[cpu];
+
+	if (unlikely(cpufreq_frequency_table_target(policy,
+			&eps_cpu[cpu]->freq_table[0],
+			target_freq,
+			relation,
+			&newstate))) {
+		return -EINVAL;
+	}
+
+	/* Make frequency transition */
+	dest_state =3D centaur->freq_table[newstate].index & 0xffff;
+	ret =3D eps_set_state(centaur, cpu, dest_state);
+	if (ret)
+		printk(KERN_ERR "eps: Timeout!\n");
+	return ret;
+}
+
+static int eps_verify(struct cpufreq_policy *policy)
+{
+	return cpufreq_frequency_table_verify(policy,
+			&eps_cpu[policy->cpu]->freq_table[0]);
+}
+
+static int eps_cpu_init(struct cpufreq_policy *policy)
+{
+	unsigned int i;
+	u32 lo, hi;
+	u64 val;
+	u8 current_multiplier, current_voltage;
+	u8 max_multiplier, max_voltage;
+	u8 min_multiplier, min_voltage;
+	u8 brand;
+	u32 fsb;
+	struct eps_cpu_data *centaur;
+	struct cpufreq_frequency_table *f_table;
+	int k, step, voltage;
+	int ret;
+	int states;
+
+	if (policy->cpu !=3D 0)
+		return -ENODEV;
+
+	/* Check brand */
+	printk("eps: Detected VIA ");
+	rdmsr(0x1153, lo, hi);
+	brand =3D (((lo >> 2) ^ lo) >> 18) & 3;
+	switch(brand) {
+	case EPS_BRAND_C7M:
+		printk("C7-M\n");
+		break;
+	case EPS_BRAND_C7:
+		printk("C7\n");
+		break;
+	case EPS_BRAND_EDEN:
+		printk("Eden\n");
+		break;
+	case EPS_BRAND_C3:
+		printk("C3\n");
+		return -ENODEV;
+		break;
+	}
+	/* Enable Enhanced PowerSaver */
+	rdmsrl(MSR_IA32_MISC_ENABLE, val);
+	if (!(val & 1 << 16)) {
+		val |=3D 1 << 16;
+		wrmsrl(MSR_IA32_MISC_ENABLE, val);
+		/* Can be locked at 0 */
+		rdmsrl(MSR_IA32_MISC_ENABLE, val);
+		if (!(val & 1 << 16)) {
+			printk("eps: Can't enable Enhanced PowerSaver\n");
+			return -ENODEV;
+		}
+	}
+
+	/* Print voltage and multiplier */
+	rdmsr(MSR_IA32_PERF_STATUS, lo, hi);
+	current_voltage =3D lo & 0xff;
+	printk("eps: Current voltage =3D %dmV\n", current_voltage * 16 + 700);
+	current_multiplier =3D (lo >> 8) & 0xff;
+	printk("eps: Current multiplier =3D %d\n", current_multiplier);
+
+	/* Print limits */
+	max_voltage =3D hi & 0xff;
+	printk("eps: Highest voltage =3D %dmV\n", max_voltage * 16 + 700);
+	max_multiplier =3D (hi >> 8) & 0xff;
+	printk("eps: Highest multiplier =3D %d\n", max_multiplier);
+	min_voltage =3D (hi >> 16) & 0xff;
+	printk("eps: Lowest voltage =3D %dmV\n", min_voltage * 16 + 700);
+	min_multiplier =3D (hi >> 24) & 0xff;
+	printk("eps: Lowest multiplier =3D %d\n", min_multiplier);
+
+	/* Sanity checks */
+	if (current_multiplier =3D=3D 0 || max_multiplier =3D=3D 0=20
+	    || min_multiplier =3D=3D 0)
+		return -EINVAL;
+	if (current_multiplier > max_multiplier
+	    || max_multiplier <=3D min_multiplier)
+		return -EINVAL;
+	if (current_voltage > 0x1c || max_voltage > 0x1c)
+		return -EINVAL;
+	if (max_voltage < min_voltage)
+		return -EINVAL;
+
+	/* Calc FSB speed */
+	fsb =3D cpu_khz / current_multiplier;
+	/* Calc number of p-states supported */
+	if (brand =3D=3D EPS_BRAND_C7M)
+		states =3D max_multiplier - min_multiplier + 1;
+	else
+		states =3D 2;
+
+	/* Allocate private data and frequency table for current cpu */
+	centaur =3D kzalloc(sizeof(struct eps_cpu_data)=20
+		    + (states + 1) * sizeof(struct cpufreq_frequency_table),
+		    GFP_KERNEL);
+	if (!centaur)
+		return -ENOMEM;
+	eps_cpu[0] =3D centaur;
+
+	/* Copy basic values */
+	centaur->fsb =3D fsb;
+
+	/* Fill frequency and MSR value table */
+	f_table =3D &centaur->freq_table[0];
+	if (brand =3D=3D EPS_BRAND_EDEN) {
+		f_table[0].frequency =3D fsb * min_multiplier;
+		f_table[0].index =3D (min_multiplier << 8) | min_voltage;
+		f_table[1].frequency =3D fsb * max_multiplier;
+		f_table[1].index =3D (max_multiplier << 8) | max_voltage;
+		f_table[2].frequency =3D CPUFREQ_TABLE_END;
+	} else {
+		k =3D 0;
+		step =3D ((max_voltage - min_voltage) * 256)
+			/ (max_multiplier - min_multiplier);
+		for (i =3D min_multiplier; i <=3D max_multiplier; i++) {
+			voltage =3D (k * step) / 256 + min_voltage;
+			f_table[k].frequency =3D fsb * i;
+			f_table[k].index =3D (i << 8) | voltage;
+			k++;
+		}
+		f_table[k].frequency =3D CPUFREQ_TABLE_END;
+	}
+
+	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
+	policy->cpuinfo.transition_latency =3D 140000; /* 844mV -> 700mV in ns */
+	policy->cur =3D fsb * current_multiplier;
+
+	ret =3D cpufreq_frequency_table_cpuinfo(policy, &centaur->freq_table[0]);
+	if (ret) {
+		kfree(centaur);
+		return ret;
+	}
+
+	cpufreq_frequency_table_get_attr(&centaur->freq_table[0], policy->cpu);
+	return 0;
+}
+
+static int eps_cpu_exit(struct cpufreq_policy *policy)
+{
+	unsigned int cpu =3D policy->cpu;
+	struct eps_cpu_data *centaur;
+	u32 lo, hi;
+
+	if (eps_cpu[cpu] =3D=3D NULL)
+		return -ENODEV;
+	centaur =3D eps_cpu[cpu];
+
+	/* Get max frequency */
+	rdmsr(MSR_IA32_PERF_STATUS, lo, hi);
+	/* Set max frequency */
+	eps_set_state(centaur, cpu, hi & 0xffff);
+	/* Bye */
+	cpufreq_frequency_table_put_attr(policy->cpu);
+	kfree(eps_cpu[cpu]);
+	eps_cpu[cpu] =3D NULL;
+	return 0;
+}
+
+static struct freq_attr* eps_attr[] =3D {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
+static struct cpufreq_driver eps_driver =3D {
+	.verify		=3D eps_verify,
+	.target		=3D eps_target,
+	.init		=3D eps_cpu_init,
+	.exit		=3D eps_cpu_exit,
+	.get		=3D eps_get,
+	.name		=3D "e_powersaver",
+	.owner		=3D THIS_MODULE,
+	.attr		=3D eps_attr,
+};
+
+static int __init eps_init(void)
+{
+	struct cpuinfo_x86 *c =3D cpu_data;
+
+	/* This driver will work only on Centaur C7 processors with=20
+	 * Enhanced SpeedStep/PowerSaver registers */
+	if (c->x86_vendor !=3D X86_VENDOR_CENTAUR
+	    || c->x86 !=3D 6 || c->x86_model !=3D 10)
+		return -ENODEV;
+	if (!cpu_has(c, X86_FEATURE_EST))
+		return -ENODEV;
+
+	if (cpufreq_register_driver(&eps_driver))
+		return -EINVAL;
+	return 0;
+}
+
+static void __exit eps_exit(void)
+{
+	cpufreq_unregister_driver(&eps_driver);
+}
+
+MODULE_AUTHOR("Rafa=B3 Bilski <rafalbilski@interia.pl>");
+MODULE_DESCRIPTION("Enhanced PowerSaver driver for VIA C7 CPU's.");
+MODULE_LICENSE("GPL");
+
+module_init(eps_init);
+module_exit(eps_exit);


----------------------------------------------------------------------
Oficjalne konto pocztowe europejskich internautow!=20
>>> http://link.interia.pl/f19e8
