From: Sean Young <sean@mess.org>
Subject: [PATCH] AMD Elan SC520 cpufreq driver
Date: Tue, 29 Mar 2005 23:36:58 +0200
Message-ID: <20050329213658.GA12868@levin.pad.mess.org>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@ZenII.linux.org.uk

Here is a cpufreq driver for the AMD Elan SC520, diff against
2.6.12-rc1.

Signed-off-by: Sean Young <sean@mess.org>


Sean


diff -uprN linux-2.6.9/Documentation/cpu-freq/user-guide.txt /home/sean/tiger/linux-2.6.9/Documentation/cpu-freq/user-guide.txt
--- linux-2.6.9/Documentation/cpu-freq/user-guide.txt	2005-03-29 23:20:38.380542376 +0200
+++ /home/sean/tiger/linux-2.6.9/Documentation/cpu-freq/user-guide.txt	2005-03-20 14:58:55.740062792 +0100
@@ -53,6 +53,7 @@ ARM-SA1110
 The following processors for the x86 architecture are supported by cpufreq:
 
 AMD Elan - SC400, SC410
+AMD Elan - SC520
 AMD mobile K6-2+
 AMD mobile K6-3+
 AMD mobile Duron
diff -uprN linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Kconfig /home/sean/tiger/linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Kconfig	2005-03-29 23:22:01.349929112 +0200
+++ /home/sean/tiger/linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Kconfig	2005-03-29 23:30:30.027598352 +0200
@@ -23,7 +23,7 @@ config X86_ACPI_CPUFREQ
 	  If in doubt, say N.
 
 config ELAN_CPUFREQ
-	tristate "AMD Elan"
+	tristate "AMD Elan SC400 and SC410"
 	select CPU_FREQ_TABLE
 	depends on X86_ELAN
 	---help---
@@ -38,6 +38,18 @@ config ELAN_CPUFREQ
 
 	  If in doubt, say N.
 
+config SC520_CPUFREQ
+	tristate "AMD Elan SC520"
+	select CPU_FREQ_TABLE 
+	depends on X86_ELAN
+	---help---
+	  This adds the CPUFreq driver for AMD Elan SC520 processor.
+
+	  For details, take a look at <file:Documentation/cpu-freq/>.
+
+	  If in doubt, say N.
+
+
 config X86_POWERNOW_K6
 	tristate "AMD Mobile K6-2/K6-3 PowerNow!"
 	select CPU_FREQ_TABLE
diff -uprN linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Makefile /home/sean/tiger/linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Makefile
--- linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Makefile	2005-03-29 23:20:38.871467744 +0200
+++ /home/sean/tiger/linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Makefile	2005-03-19 19:27:16.847151960 +0100
@@ -3,6 +3,7 @@ obj-$(CONFIG_X86_POWERNOW_K7)		+= powern
 obj-$(CONFIG_X86_POWERNOW_K8)		+= powernow-k8.o
 obj-$(CONFIG_X86_LONGHAUL)		+= longhaul.o
 obj-$(CONFIG_ELAN_CPUFREQ)		+= elanfreq.o
+obj-$(CONFIG_SC520_CPUFREQ)		+= sc520_freq.o
 obj-$(CONFIG_X86_LONGRUN)		+= longrun.o  
 obj-$(CONFIG_X86_GX_SUSPMOD)		+= gx-suspmod.o
 obj-$(CONFIG_X86_SPEEDSTEP_ICH)		+= speedstep-ich.o
diff -uprN linux-2.6.9/arch/i386/kernel/cpu/cpufreq/sc520_freq.c /home/sean/tiger/linux-2.6.9/arch/i386/kernel/cpu/cpufreq/sc520_freq.c
--- linux-2.6.9/arch/i386/kernel/cpu/cpufreq/sc520_freq.c	1970-01-01 01:00:00.000000000 +0100
+++ /home/sean/tiger/linux-2.6.9/arch/i386/kernel/cpu/cpufreq/sc520_freq.c	2005-03-29 20:59:06.861449496 +0200
@@ -0,0 +1,186 @@
+/*
+ * 	sc520_freq.c: cpufreq driver for the AMD Elan SC520
+ *
+ * 	Copyright (C) 2005 Sean Young <sean@mess.org>
+ *
+ *	This program is free software; you can redistribute it and/or
+ *	modify it under the terms of the GNU General Public License
+ *	as published by the Free Software Foundation; either version
+ *	2 of the License, or (at your option) any later version. 
+ *
+ *	Based on elanfreq.c
+ *
+ *	2005-03-30: - initial revision 
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/cpufreq.h>
+
+#include <asm/msr.h>
+#include <asm/timex.h>
+#include <asm/io.h>
+
+#define MMCR_BASE       0xfffef000      /* The default base address */
+#define OFFS_CPUCTL   	0x2   /* CPU Control Register */
+
+static __u8 __iomem *cpuctl;
+
+static struct cpufreq_frequency_table sc520_freq_table[] = {
+	{0x01,	100000},
+	{0x02,	133000},
+	{0,	CPUFREQ_TABLE_END},
+};
+
+static unsigned int sc520_freq_get_cpu_frequency(unsigned int cpu)
+{
+	u8 clockspeed_reg = *cpuctl;
+
+	switch (clockspeed_reg & 0x03) {
+	default:
+		printk(KERN_ERR "sc520_freq: error: cpuctl register has unexpected value %02x\n", clockspeed_reg);
+	case 0x01:
+		return 100000;
+	case 0x02:
+		return 133000;
+	}
+}
+
+static void sc520_freq_set_cpu_state (unsigned int state) 
+{
+
+	struct cpufreq_freqs    freqs;
+	u8 clockspeed_reg;
+
+	freqs.old = sc520_freq_get_cpu_frequency(0);
+	freqs.new = sc520_freq_table[state].frequency;
+	freqs.cpu = 0; /* AMD Elan is UP */
+	
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+
+	printk(KERN_INFO "sc520_freq: attempting to set frequency to %i kHz\n",
+			sc520_freq_table[state].frequency);
+
+	local_irq_disable();
+
+	clockspeed_reg = *cpuctl & ~0x03;
+	*cpuctl = sc520_freq_table[state].index | clockspeed_reg;
+
+	local_irq_enable();
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+};
+
+static int sc520_freq_verify (struct cpufreq_policy *policy)
+{
+	return cpufreq_frequency_table_verify(policy, &sc520_freq_table[0]);
+}
+
+static int sc520_freq_target (struct cpufreq_policy *policy, 
+			    unsigned int target_freq, 
+			    unsigned int relation)
+{
+	unsigned int newstate = 0;
+
+	if (cpufreq_frequency_table_target(policy, sc520_freq_table, target_freq, relation, &newstate))
+		return -EINVAL;
+
+	sc520_freq_set_cpu_state(newstate);
+
+	return 0;
+}
+
+
+/*
+ *	Module init and exit code
+ */
+
+static int sc520_freq_cpu_init(struct cpufreq_policy *policy)
+{
+	struct cpuinfo_x86 *c = cpu_data;
+	int result;
+
+	/* capability check */
+	if (c->x86_vendor != X86_VENDOR_AMD ||
+	    c->x86 != 4 || c->x86_model != 9)
+		return -ENODEV;
+
+	/* cpuinfo and default policy values */
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
+	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
+	policy->cur = sc520_freq_get_cpu_frequency(0);
+
+	result = cpufreq_frequency_table_cpuinfo(policy, sc520_freq_table);
+	if (result)
+		return (result);
+
+        cpufreq_frequency_table_get_attr(sc520_freq_table, policy->cpu);
+
+	return 0;
+}
+
+
+static int sc520_freq_cpu_exit(struct cpufreq_policy *policy)
+{
+	cpufreq_frequency_table_put_attr(policy->cpu);
+	return 0;
+}
+
+
+static struct freq_attr* sc520_freq_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
+
+static struct cpufreq_driver sc520_freq_driver = {
+	.get	 	= sc520_freq_get_cpu_frequency,
+	.verify 	= sc520_freq_verify,
+	.target 	= sc520_freq_target,
+	.init		= sc520_freq_cpu_init,
+	.exit		= sc520_freq_cpu_exit,
+	.name		= "sc520_freq",
+	.owner		= THIS_MODULE,
+	.attr		= sc520_freq_attr,
+};
+
+
+static int __init sc520_freq_init(void) 
+{	
+	struct cpuinfo_x86 *c = cpu_data;
+
+	/* Test if we have the right hardware */
+	if (c->x86_vendor != X86_VENDOR_AMD ||
+		c->x86 != 4 || c->x86_model != 9) {
+		printk(KERN_INFO "sc520_freq: error: no Elan SC520 processor found!\n");
+                return -ENODEV;
+	}
+	cpuctl = ioremap((unsigned long)(MMCR_BASE + OFFS_CPUCTL), 1);
+	if(!cpuctl) {
+		printk(KERN_ERR "sc520_freq: error: failed to remap memory\n");
+		return -ENOMEM;
+	}
+
+	
+	return cpufreq_register_driver(&sc520_freq_driver);
+}
+
+
+static void __exit sc520_freq_exit(void) 
+{
+	cpufreq_unregister_driver(&sc520_freq_driver);
+	iounmap(cpuctl);
+}
+
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sean Young <sean@mess.org>");
+MODULE_DESCRIPTION("cpufreq driver for AMD's Elan sc520 CPU");
+
+module_init(sc520_freq_init);
+module_exit(sc520_freq_exit);
+
