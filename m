From: Ian Campbell <icampbell@arcom.com>
Subject: [PATCH] CPUFreq Support for PXA255
Date: Thu, 14 Jul 2005 12:40:56 +0100
Message-ID: <1121341256.10537.12.camel@icampbell-debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi, 

Below is a patch adding cpufreq support for the PXA255 Xscale processor.
I'd appreciate review from you guys with a view to getting it merged
(after 2.6.13 I guess).

The driver was originally from Intrinsyc Software and spent some time in
the old -bkpxa tree. Since then I've tweaked it a little and have been
using it successfully for some time.

I'll also submit to the ARM kernel mailing list, since I know at least
one of the lists is subscriber only I didn't CC it now. When it comes to
merging would via the ARM or cpufreq maintainer be preferable?

Signed-off-by: Ian Campbell <icampbell@arcom.com>

Index: 2.6/arch/arm/Kconfig
===================================================================
--- 2.6.orig/arch/arm/Kconfig	2005-07-14 09:15:37.000000000 +0100
+++ 2.6/arch/arm/Kconfig	2005-07-14 09:18:06.000000000 +0100
@@ -516,7 +516,7 @@
 
 endmenu
 
-if (ARCH_SA1100 || ARCH_INTEGRATOR || ARCH_OMAP1)
+if (ARCH_SA1100 || ARCH_INTEGRATOR || ARCH_OMAP1 || ARCH_PXA)
 
 menu "CPU Frequency scaling"
 
@@ -543,6 +543,12 @@
 
 	  If in doubt, say Y.
 
+config CPU_FREQ_PXA
+	bool
+	select CPU_FREQ_TABLE
+	depends on CPU_FREQ && ARCH_PXA
+	default y
+
 endmenu
 
 endif
Index: 2.6/arch/arm/mach-pxa/Makefile
===================================================================
--- 2.6.orig/arch/arm/mach-pxa/Makefile	2005-07-14 09:15:37.000000000 +0100
+++ 2.6/arch/arm/mach-pxa/Makefile	2005-07-14 10:56:50.000000000 +0100
@@ -24,6 +24,7 @@
 
 # Misc features
 obj-$(CONFIG_PM) += pm.o sleep.o
+obj-$(CONFIG_CPU_FREQ) += cpu-pxa.o
 
 ifeq ($(CONFIG_PXA27x),y)
 obj-$(CONFIG_PM) += standby.o
Index: 2.6/arch/arm/mach-pxa/cpu-pxa.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ 2.6/arch/arm/mach-pxa/cpu-pxa.c	2005-07-14 10:57:04.000000000 +0100
@@ -0,0 +1,330 @@
+/*
+ *  linux/arch/arm/mach-pxa/cpu-pxa.c
+ *
+ *  Copyright (C) 2002,2003 Intrinsyc Software
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ *
+ * History:
+ *   31-Jul-2002 : Initial version [FB]
+ *   29-Jan-2003 : added PXA255 support [FB]
+ *   20-Apr-2003 : ported to v2.5 (Dustin McIntire, Sensoria Corp.)
+ *
+ * Note:
+ *   This driver may change the memory bus clock rate, but will not do any
+ *   platform specific access timing changes... for example if you have flash
+ *   memory connected to CS0, you will need to register a platform specific
+ *   notifier which will adjust the memory access strobes to maintain a
+ *   minimum strobe width.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/init.h>
+#include <linux/cpufreq.h>
+#include <linux/cpumask.h>
+#include <linux/moduleparam.h>
+
+#include <asm/hardware.h>
+
+#include <asm/arch/pxa-regs.h>
+
+#define DEBUG  0
+
+#ifdef DEBUG
+static unsigned int freq_debug = DEBUG;
+module_param(freq_debug, int, 0);
+MODULE_PARM_DESC(freq_debug, "Set the debug messages to on=1/off=0");
+#else
+#define freq_debug  0
+#endif
+
+typedef struct {
+	unsigned int khz;
+	unsigned int membus;
+	unsigned int cccr;
+	unsigned int div2;
+} pxa_freqs_t;
+
+/* Define the refresh period in mSec for the SDRAM and the number of rows */
+#define SDRAM_TREF          64		/* standard 64ms SDRAM */
+#define SDRAM_ROWS          8192	/* 64MB=8192 32MB=4096 */
+#define MDREFR_DRI(x)       ((x*SDRAM_TREF)/(SDRAM_ROWS*32))
+
+#define CCLKCFG_TURBO       0x1
+#define CCLKCFG_FCS         0x2
+#define PXA25x_MIN_FREQ     99532
+#define PXA25x_MAX_FREQ     398131
+#define MDREFR_DB2_MASK     (MDREFR_K2DB2 | MDREFR_K1DB2)
+#define MDREFR_DRI_MASK     0xFFF
+
+/* Use the run mode frequencies for the CPUFREQ_POLICY_PERFORMANCE policy */
+static pxa_freqs_t pxa255_run_freqs[] = {
+	/* CPU   MEMBUS  CCCR  DIV2 */
+	{99532,   99532, 0x121, 1},	/* run= 99, turbo= 99, PXbus=50,  SDRAM=50 */
+	{132710, 132710, 0x123, 1},	/* run=133, turbo=133, PXbus=66,  SDRAM=66 */
+	{199065,  99532, 0x141, 0},	/* run=199, turbo=199, PXbus=99,  SDRAM=99 */
+	{265421, 132710, 0x143, 1},	/* run=265, turbo=265, PXbus=133, SDRAM=66 */
+	{331776, 165888, 0x145, 1},	/* run=331, turbo=331, PXbus=166, SDRAM=83 */
+	{398131,  99532, 0x161, 0},	/* run=398, turbo=398, PXbus=196, SDRAM=99 */
+	{0,}
+};
+
+static struct cpufreq_frequency_table pxa255_run_freq_table[ARRAY_SIZE(pxa255_run_freqs) + 1];
+
+/* Use the turbo mode frequencies for the CPUFREQ_POLICY_POWERSAVE policy */
+static pxa_freqs_t pxa255_turbo_freqs[] = {
+	/* CPU   MEMBUS  CCCR  DIV2 */
+	{99532,  99532, 0x121, 1},	/* run=99,  turbo= 99, PXbus=50, SDRAM=50 */
+	{199065, 99532, 0x221, 0},	/* run=99,  turbo=199, PXbus=50, SDRAM=99 */
+	{298598, 99532, 0x321, 0},	/* run=99,  turbo=287, PXbus=50, SDRAM=99 */
+	{398131, 99532, 0x241, 0},	/* run=199, turbo=398, PXbus=99, SDRAM=99 */
+	{0,}
+};
+
+static struct cpufreq_frequency_table pxa255_turbo_freq_table[ARRAY_SIZE(pxa255_turbo_freqs) + 1];
+
+extern unsigned get_clk_frequency_khz(int info);
+
+static unsigned int max_frequency = PXA25x_MAX_FREQ;
+
+/*
+ * This option can be used if you have one of the 200MHz PXA255 parts by adding
+ * cpu_pxa.max_frequency=199065 to the kernel command line
+ */
+module_param(max_frequency, int, 0);
+MODULE_PARM_DESC(max_frequency, "Set the maximum cpu frequency");
+
+static void pxa_select_freq_table(struct cpufreq_policy *policy,
+				  pxa_freqs_t ** settings,
+				  struct cpufreq_frequency_table **table)
+{
+	if (strcmp(policy->governor->name, "performance") == 0) {
+		if (settings)
+			*settings = pxa255_run_freqs;
+		if (table)
+			*table = pxa255_run_freq_table;
+	} else {
+		if (settings)
+			*settings = pxa255_turbo_freqs;
+		if (table)
+			*table = pxa255_turbo_freq_table;
+	}
+}
+
+/* find a valid frequency point */
+static int pxa_verify_policy(struct cpufreq_policy *policy)
+{
+	int ret;
+	struct cpufreq_frequency_table *pxa_freqs_table;
+
+	pxa_select_freq_table(policy, NULL, &pxa_freqs_table);
+
+	ret = cpufreq_frequency_table_verify(policy, pxa_freqs_table);
+
+	if (freq_debug) {
+		printk("Verified CPU policy: %dKhz min to %dKhz max\n",
+		       policy->min, policy->max);
+	}
+
+	return ret;
+}
+
+static int pxa_set_target(struct cpufreq_policy *policy,
+			  unsigned int target_freq, unsigned int relation)
+{
+	int idx;
+	cpumask_t cpus_allowed;
+	int cpu = policy->cpu;
+	struct cpufreq_freqs freqs;
+	pxa_freqs_t *pxa_freq_settings;
+	struct cpufreq_frequency_table *pxa_freqs_table;
+	unsigned long flags;
+	unsigned int unused;
+	unsigned int preset_mdrefr, postset_mdrefr;
+	void *ramstart;
+
+	/*
+	 * Save this threads cpus_allowed mask.
+	 */
+	cpus_allowed = current->cpus_allowed;
+
+	/*
+	 * Bind to the specified CPU.  When this call returns,
+	 * we should be running on the right CPU.
+	 */
+	set_cpus_allowed(current, cpumask_of_cpu(cpu));
+	BUG_ON(cpu != smp_processor_id());
+
+	/* Get the current policy */
+	pxa_select_freq_table(policy, &pxa_freq_settings, &pxa_freqs_table);
+
+	/* Lookup the next frequency */
+	if (cpufreq_frequency_table_target(policy, pxa_freqs_table,
+					   target_freq, relation, &idx))
+		return -EINVAL;
+
+	freqs.old = get_clk_frequency_khz(0);
+	freqs.new = pxa_freq_settings[idx].khz;
+	freqs.cpu = policy->cpu;
+	if (freq_debug) {
+		printk(KERN_INFO
+		       "Changing CPU frequency to %d.%03d Mhz (SDRAM %d Mhz).\n",
+		       freqs.new / 1000, freqs.new % 1000,
+		       (pxa_freq_settings[idx].div2) ? 
+		       (pxa_freq_settings[idx].membus / 2000) :
+		       (pxa_freq_settings[idx].membus / 1000));
+	}
+
+	ramstart = phys_to_virt(0xa0000000);
+
+	/*
+	 * Tell everyone what we're about to do...
+	 * you should add a notify client with any platform specific
+	 * Vcc changing capability
+	 */
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+
+	/* Calculate the next MDREFR.  If we're slowing down the SDRAM clock
+	 * we need to preset the smaller DRI before the change.  If we're speeding
+	 * up we need to set the larger DRI value after the change.
+	 */
+	preset_mdrefr = postset_mdrefr = MDREFR;
+	if ((MDREFR & MDREFR_DRI_MASK) > MDREFR_DRI(pxa_freq_settings[idx].membus)) {
+		preset_mdrefr = (preset_mdrefr & ~MDREFR_DRI_MASK) |
+			MDREFR_DRI(pxa_freq_settings[idx].membus);
+	}
+	postset_mdrefr = (postset_mdrefr & ~MDREFR_DRI_MASK) |
+		MDREFR_DRI(pxa_freq_settings[idx].membus);
+
+	/* If we're dividing the memory clock by two for the SDRAM clock, this
+	 * must be set prior to the change.  Clearing the divide must be done
+	 * after the change.
+	 */
+	if (pxa_freq_settings[idx].div2) {
+		preset_mdrefr |= MDREFR_DB2_MASK;
+		postset_mdrefr |= MDREFR_DB2_MASK;
+	} else {
+		postset_mdrefr &= ~MDREFR_DB2_MASK;
+	}
+
+	local_irq_save(flags);
+
+	/* Set new the CCCR */
+	CCCR = pxa_freq_settings[idx].cccr;
+
+	__asm__ __volatile__("                              \
+        ldr r4, [%1] ;          /* load MDREFR */           \
+        b   2f ;                                            \
+        .align  5 ;                                         \
+1:                                                          \
+        str %4, [%1] ;          /* preset the MDREFR */     \
+        mcr p14, 0, %2, c6, c0, 0 ; /* set CCLKCFG[FCS] */  \
+        str %5, [%1] ;          /* postset the MDREFR */    \
+                                                            \
+        b   3f       ;                                      \
+2:      b   1b       ;                                      \
+3:      nop          ;                                      \
+        "
+	: "=&r"(unused)
+	: "r"(&MDREFR), "r"(CCLKCFG_TURBO | CCLKCFG_FCS),
+	  "r"(ramstart), "r"(preset_mdrefr),
+	  "r"(postset_mdrefr)
+	: "r4", "r5");
+	local_irq_restore(flags);
+
+	/*
+	 * Restore the CPUs allowed mask.
+	 */
+	set_cpus_allowed(current, cpus_allowed);
+
+	/*
+	 * Tell everyone what we've just done...
+	 * you should add a notify client with any platform specific
+	 * SDRAM refresh timer adjustments
+	 */
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+
+	return 0;
+}
+
+static unsigned int pxa_cpufreq_get(unsigned int cpu)
+{
+	return get_clk_frequency_khz(0);
+}
+
+static int pxa_cpufreq_init(struct cpufreq_policy *policy)
+{
+	cpumask_t cpus_allowed;
+	unsigned int cpu = policy->cpu;
+	int i;
+
+	cpus_allowed = current->cpus_allowed;
+
+	set_cpus_allowed(current, cpumask_of_cpu(cpu));
+	BUG_ON(cpu != smp_processor_id());
+
+	/* set default policy and cpuinfo */
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
+	policy->cpuinfo.max_freq = max_frequency;
+	policy->cpuinfo.min_freq = PXA25x_MIN_FREQ;
+	policy->cpuinfo.transition_latency = 1000;	/* FIXME: 1 ms, assumed */
+	policy->cur = get_clk_frequency_khz(0);		/* current freq */
+	policy->min = policy->max = policy->cur;
+
+	/* Generate the run cpufreq_frequency_table struct */
+	for (i = 0; i < ARRAY_SIZE(pxa255_run_freqs); i++) {
+		pxa255_run_freq_table[i].frequency = pxa255_run_freqs[i].khz;
+		pxa255_run_freq_table[i].index = i;
+	}
+	pxa255_run_freq_table[i].frequency = CPUFREQ_TABLE_END;
+	/* Generate the turbo cpufreq_frequency_table struct */
+	for (i = 0; i < ARRAY_SIZE(pxa255_turbo_freqs); i++) {
+		pxa255_turbo_freq_table[i].frequency = pxa255_turbo_freqs[i].khz;
+		pxa255_turbo_freq_table[i].index = i;
+	}
+	pxa255_turbo_freq_table[i].frequency = CPUFREQ_TABLE_END;
+
+	set_cpus_allowed(current, cpus_allowed);
+	printk(KERN_INFO "PXA CPU frequency change support initialized\n");
+
+	return 0;
+}
+
+static struct cpufreq_driver pxa_cpufreq_driver = {
+	.verify	= pxa_verify_policy,
+	.target	= pxa_set_target,
+	.init	= pxa_cpufreq_init,
+	.get	= pxa_cpufreq_get,
+	.name	= "PXA25x",
+};
+
+static int __init pxa_cpu_init(void)
+{
+	return cpufreq_register_driver(&pxa_cpufreq_driver);
+}
+
+static void __exit pxa_cpu_exit(void)
+{
+	cpufreq_unregister_driver(&pxa_cpufreq_driver);
+}
+
+MODULE_AUTHOR("Intrinsyc Software Inc.");
+MODULE_DESCRIPTION("CPU frequency changing driver for the PXA architecture");
+MODULE_LICENSE("GPL");
+module_init(pxa_cpu_init);
+module_exit(pxa_cpu_exit);
Index: 2.6/Documentation/cpu-freq/user-guide.txt
===================================================================
--- 2.6.orig/Documentation/cpu-freq/user-guide.txt	2005-07-14 09:15:37.000000000 +0100
+++ 2.6/Documentation/cpu-freq/user-guide.txt	2005-07-14 09:18:06.000000000 +0100
@@ -18,7 +18,7 @@
 Contents:
 ---------
 1. Supported Architectures and Processors
-1.1 ARM
+1.1 ARM, PXA
 1.2 x86
 1.3 sparc64
 1.4 ppc
@@ -37,14 +37,15 @@
 1. Supported Architectures and Processors
 =========================================
 
-1.1 ARM
--------
+1.1 ARM, PXA
+------------
 
 The following ARM processors are supported by cpufreq:
 
 ARM Integrator
 ARM-SA1100
 ARM-SA1110
+Intel PXA
 
 
 1.2 x86
Index: 2.6/drivers/cpufreq/Kconfig
===================================================================
--- 2.6.orig/drivers/cpufreq/Kconfig	2005-07-14 09:15:37.000000000 +0100
+++ 2.6/drivers/cpufreq/Kconfig	2005-07-14 09:18:06.000000000 +0100
@@ -52,7 +52,7 @@
 
 choice
 	prompt "Default CPUFreq governor"
-	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110
+	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110 || CPU_FREQ_PXA
 	default CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 	help
 	  This option sets which CPUFreq governor shall be loaded at


-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.  Email to and from Arcom is automatically monitored for operational and lawful business reasons.

This message has been virus scanned by MessageLabs.
