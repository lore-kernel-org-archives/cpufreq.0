From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq Kconfig, 1.11, 1.12 acpi.c,
	1.10, 1.11 longhaul.c, 1.94, 1.95 p4-clockmod.c, 1.44,
	1.45 powernow-k7.c, 1.46, 1.47 powernow-k8.c, 1.2,
	1.3 speedstep-lib.c, 1.2, 1.3 speedstep-lib.h, 1.1,
	1.2 speedstep-smi.c, 1.3, 1.4
Date: Tue, 20 Jan 2004 17:03:37 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AizHt-0007sE-8u@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv30228/linux/arch/i386/kernel/cpufreq

Modified Files:
	Kconfig acpi.c longhaul.c p4-clockmod.c powernow-k7.c 
	powernow-k8.c speedstep-lib.c speedstep-lib.h speedstep-smi.c 
Log Message:
Merge with latest davej cpufreq bk tree.

Index: Kconfig
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/Kconfig,v
retrieving revision 1.11
retrieving revision 1.12
diff -u -r1.11 -r1.12
--- Kconfig	5 Nov 2003 18:27:42 -0000	1.11
+++ Kconfig	20 Jan 2004 17:03:31 -0000	1.12
@@ -110,26 +110,26 @@
 	 If in doubt, say N.
 
 config X86_SPEEDSTEP_PIIX4
-	tristate "Intel Speedstep (PIIX4)"
-	depends on CPU_FREQ_TABLE
+	tristate "Intel Speedstep on PIIX4 chipsets (ioport interface)"
+	depends on CPU_FREQ_TABLE && EXPERIMENTAL
 	help
 	  This adds the CPUFreq driver for certain mobile Intel Pentium III
 	  (Coppermine), all mobile Intel Pentium III-M (Tualatin) and all
-	  mobile Intel Pentium 4 P4-Ms, with an Intel PIIX4 (440BX/440MX)
-	  southbridge.
+	  mobile Intel Pentium 4 P4-Ms on systems which have an Intel
+	  PIIX4 (440BX/440MX) southbridge.
 
 	  For details, take a look at linux/Documentation/cpu-freq. 
 
 	  If in doubt, say N.
 
 config X86_SPEEDSTEP_ICH
-	tristate "Intel Speedstep"
+	tristate "Intel Speedstep on ICH-M chipsets (ioport interface)"
 	depends on CPU_FREQ_TABLE
 	help
 	  This adds the CPUFreq driver for certain mobile Intel Pentium III
 	  (Coppermine), all mobile Intel Pentium III-M (Tualatin) and all
-	  mobile Intel Pentium 4 P4-Ms, with an Intel ICH2, ICH3,
-	  or ICH4 southbridge.
+	  mobile Intel Pentium 4 P4-Ms on systems which have an Intel ICH2,
+	  ICH3 or ICH4 southbridge.
 
 	  For details, take a look at linux/Documentation/cpu-freq. 
 
@@ -160,8 +160,8 @@
 
 config X86_SPEEDSTEP_LIB
        tristate
-       depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_PIIX4 || X86_SPEEDSTEP_SMI)
-       default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_PIIX4 || X86_SPEEDSTEP_SMI)
+       depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD || X86_SPEEDSTEP_PIIX4)
+       default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD || X86_SPEEDSTEP_PIIX4)
 
 config X86_P4_CLOCKMOD
 	tristate "Intel Pentium 4 clock modulation"
@@ -170,7 +170,7 @@
 	  This adds the CPUFreq driver for Intel Pentium 4 / XEON
 	  processors.
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at linux/Documentation/cpu-freq.
 
 	  If in doubt, say N.
 

Index: acpi.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/acpi.c,v
retrieving revision 1.10
retrieving revision 1.11
diff -u -r1.10 -r1.11
--- acpi.c	5 Nov 2003 18:27:42 -0000	1.10
+++ acpi.c	20 Jan 2004 17:03:31 -0000	1.11
@@ -578,8 +578,8 @@
 	/* detect transition latency */
 	policy->cpuinfo.transition_latency = 0;
 	for (i=0;i<perf->state_count;i++) {
-		if (perf->states[i].transition_latency > policy->cpuinfo.transition_latency)
-			policy->cpuinfo.transition_latency = perf->states[i].transition_latency;
+		if ((perf->states[i].transition_latency * 1000) > policy->cpuinfo.transition_latency)
+			policy->cpuinfo.transition_latency = perf->states[i].transition_latency * 1000;
 	}
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cur = perf->states[pr->limit.state.px].core_frequency * 1000;

Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.94
retrieving revision 1.95
diff -u -r1.94 -r1.95
--- longhaul.c	5 Nov 2003 18:27:42 -0000	1.94
+++ longhaul.c	20 Jan 2004 17:03:31 -0000	1.95
@@ -170,6 +170,9 @@
  * between that value multiplied by possible FSBs and cpu_mhz which
  * was calculated at boot time. Really ugly, but no other way to do this.
  */
+
+#define ROUNDING	0xf
+
 static int _guess (int guess, int maxmult)
 {
 	int target;
@@ -177,15 +180,19 @@
 	target = ((maxmult/10)*guess);
 	if (maxmult%10 != 0)
 		target += (guess/2);
-	target &= ~0xf;
+	target += ROUNDING/2;
+	target &= ~ROUNDING;
 	return target;
 }
 
 static int guess_fsb(int maxmult)
 {
-	int speed = (cpu_khz/1000) & ~0xf;
+	int speed = (cpu_khz/1000);
 	int i;
 	int speeds[3] = { 66, 100, 133 };
+
+	speed += ROUNDING/2;
+	speed &= ~ROUNDING;
 
 	for (i=0; i<3; i++) {
 		if (_guess(speeds[i],maxmult) == speed)

Index: p4-clockmod.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/p4-clockmod.c,v
retrieving revision 1.44
retrieving revision 1.45
diff -u -r1.44 -r1.45
--- p4-clockmod.c	5 Nov 2003 18:27:42 -0000	1.44
+++ p4-clockmod.c	20 Jan 2004 17:03:31 -0000	1.45
@@ -33,6 +33,8 @@
 #include <asm/msr.h>
 #include <asm/timex.h>
 
+#include "speedstep-lib.h"
+
 #define PFX	"cpufreq: "
 
 /*
@@ -48,8 +50,7 @@
 
 
 static int has_N44_O17_errata[NR_CPUS];
-static int stock_freq;
-
+static unsigned int stock_freq;
 
 static int cpufreq_p4_setdc(unsigned int cpu, unsigned int newstate)
 {
@@ -176,6 +177,33 @@
 }
 
 
+static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
+{
+	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
+		/* Pentium M */
+		printk(KERN_DEBUG PFX "Warning: Pentium M detected. The speedstep_centrino module\n");
+		printk(KERN_DEBUG PFX "offers voltage scaling in addition of frequency scaling. You\n");
+		printk(KERN_DEBUG PFX "should use that instead of p4-clockmod, if possible.\n");
+		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
+	}
+
+	if (c->x86 != 0xF) {
+		printk(KERN_DEBUG PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
+		return 0;
+	}
+
+	if (speedstep_detect_processor() == SPEEDSTEP_PROCESSOR_P4M) {
+		printk(KERN_DEBUG PFX "Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq \n");
+		printk(KERN_DEBUG PFX "modules offers voltage scaling in addition of frequency scaling. You\n");
+		printk(KERN_DEBUG PFX "should use either one instead of p4-clockmod, if possible.\n");
+		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_P4M);
+	}
+
+	return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_P4D);
+}
+
+ 
+
 static int cpufreq_p4_cpu_init(struct cpufreq_policy *policy)
 {
 	struct cpuinfo_x86 *c = &cpu_data[policy->cpu];
@@ -192,15 +220,10 @@
 		has_N44_O17_errata[policy->cpu] = 1;
 	}
 	
-	/* get frequency */
-	if (!stock_freq) {
-		if (cpu_khz)
-			stock_freq = cpu_khz;
-		else {
-			printk(KERN_INFO PFX "unknown core frequency - please use module parameter 'stock_freq'\n");
-			return -EINVAL;
-		}
-	}
+	/* get max frequency */
+	stock_freq = cpufreq_p4_get_frequency(c);
+	if (!stock_freq)
+		return -EINVAL;
 
 	/* table init */
 	for (i=1; (p4clockmod_table[i].frequency != CPUFREQ_TABLE_END); i++) {
@@ -213,7 +236,7 @@
 	
 	/* cpuinfo and default policy values */
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = 1000;
+	policy->cpuinfo.transition_latency = 1000000; /* assumed */
 	policy->cur = stock_freq;
 
 	return cpufreq_frequency_table_cpuinfo(policy, &p4clockmod_table[0]);
@@ -269,12 +292,10 @@
 }
 
 
-MODULE_PARM(stock_freq, "i");
-
 MODULE_AUTHOR ("Zwane Mwaikambo <zwane@commfireservices.com>");
 MODULE_DESCRIPTION ("cpufreq driver for Pentium(TM) 4/Xeon(TM)");
 MODULE_LICENSE ("GPL");
 
-module_init(cpufreq_p4_init);
+late_initcall(cpufreq_p4_init);
 module_exit(cpufreq_p4_exit);
 

Index: powernow-k7.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.c,v
retrieving revision 1.46
retrieving revision 1.47
diff -u -r1.46 -r1.47
--- powernow-k7.c	5 Nov 2003 18:27:43 -0000	1.46
+++ powernow-k7.c	20 Jan 2004 17:03:31 -0000	1.47
@@ -91,18 +91,13 @@
 	struct cpuinfo_x86 *c = cpu_data;
 	unsigned int maxei, eax, ebx, ecx, edx;
 
-	if (c->x86_vendor != X86_VENDOR_AMD) {
-		printk (KERN_INFO PFX "AMD processor not detected.\n");
-		return 0;
-	}
-
-	if (c->x86 !=6) {
+	if ((c->x86_vendor != X86_VENDOR_AMD) || (c->x86 !=6)) {
+#ifdef MODULE
 		printk (KERN_INFO PFX "This module only works with AMD K7 CPUs\n");
+#endif
 		return 0;
 	}
 
-	printk (KERN_INFO PFX "AMD K7 CPU detected.\n");
-
 	if ((c->x86_model == 6) && (c->x86_mask == 0)) {
 		printk (KERN_INFO PFX "K7 660[A0] core detected, enabling errata workarounds\n");
 		have_a0 = 1;
@@ -337,7 +332,8 @@
 				}
 			}
 			printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
-			printk ("This is indicative of a broken BIOS. Email davej@redhat.com\n");
+			printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
+			printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
 			return -EINVAL;
 		}
 		p++;
@@ -386,7 +382,11 @@
 				minimum_speed, maximum_speed);
 
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = latency;
+
+	/* latency is in 10 ns (look for SGTC above) for each VID
+	 * and FID transition, so multiply that value with 20 */
+	policy->cpuinfo.transition_latency = latency * 20;
+
 	policy->cur = maximum_speed;
 
 	return cpufreq_frequency_table_cpuinfo(policy, powernow_table);

Index: powernow-k8.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.c,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- powernow-k8.c	5 Nov 2003 18:27:43 -0000	1.2
+++ powernow-k8.c	20 Jan 2004 17:03:31 -0000	1.3
@@ -687,11 +687,13 @@
 			if (ppst[j].vid < rvo) {	/* vid+rvo >= 0 */
 				printk(KERN_ERR BFX
 				       "0 vid exceeded with pstate %d\n", j);
+				kfree(ppst);
 				return -ENODEV;
 			}
 			if (ppst[j].vid < maxvid+rvo) { /* vid+rvo >= maxvid */
 				printk(KERN_ERR BFX
 				       "maxvid exceeded with pstate %d\n", j);
+				kfree(ppst);
 				return -ENODEV;
 			}
 		}
@@ -706,7 +708,7 @@
 
 		for (j = 0; j < numps; j++)
 			if ((ppst[j].fid==currfid) && (ppst[j].vid==currvid))
-				return (0);
+				return 0;
 
 		printk(KERN_ERR BFX "currfid/vid do not match PST, ignoring\n");
 		return 0;
@@ -935,10 +937,7 @@
 		return -ENODEV;
 	}
 
-#warning pol->policy is in undefined state here
-	res = find_match(&targ, &min, &max,
-			 pol->policy == CPUFREQ_POLICY_POWERSAVE ?
-			 SEARCH_DOWN : SEARCH_UP, 0, 0);
+	res = find_match(&targ, &min, &max, SEARCH_DOWN, 0, 0);
 	if (!res) {
 		pol->min = min * 1000;
 		pol->max = max * 1000;
@@ -957,9 +956,10 @@
 
 	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
-	/* Take a crude guess here. */
-	pol->cpuinfo.transition_latency = ((rvo + 8) * vstable * VST_UNITS_20US)
-	    + (3 * (1 << irt) * 10);
+	/* Take a crude guess here. 
+	 * That guess was in microseconds, so multply with 1000 */
+	pol->cpuinfo.transition_latency = (((rvo + 8) * vstable * VST_UNITS_20US)
+	    + (3 * (1 << irt) * 10)) * 1000;
 
 	if (query_current_values_with_pending_wait())
 		return -EIO;

Index: speedstep-lib.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- speedstep-lib.c	19 Aug 2003 13:38:33 -0000	1.2
+++ speedstep-lib.c	20 Jan 2004 17:03:31 -0000	1.3
@@ -104,22 +104,76 @@
 }
 
 
+static unsigned int pentiumM_get_frequency(void)
+{
+	u32     msr_lo, msr_tmp;
+
+	rdmsr(MSR_IA32_EBL_CR_POWERON, msr_lo, msr_tmp);
+	dprintk(KERN_DEBUG "speedstep-lib: PM - MSR_IA32_EBL_CR_POWERON: 0x%x 0x%x\n", msr_lo, msr_tmp);
+
+	/* see table B-2 of 24547212.pdf */
+	if (msr_lo & 0x00040000) {
+		printk(KERN_DEBUG "speedstep-lib: PM - invalid FSB: 0x%x 0x%x\n", msr_lo, msr_tmp);
+		return 0;
+	}
+
+	msr_tmp = (msr_lo >> 22) & 0x1f;
+	dprintk(KERN_DEBUG "speedstep-lib: bits 22-26 are 0x%x\n", msr_tmp);
+
+	return (msr_tmp * 100 * 10000);
+}
+
+
 static unsigned int pentium4_get_frequency(void)
 {
-	u32 msr_lo, msr_hi;
+	struct cpuinfo_x86 *c = &boot_cpu_data;
+	u32 msr_lo, msr_hi, mult;
+	unsigned int fsb = 0;
 
 	rdmsr(0x2c, msr_lo, msr_hi);
 
 	dprintk(KERN_DEBUG "speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, msr_hi);
 
-	msr_lo >>= 24;
-	return (msr_lo * 100000);
+	/* decode the FSB: see IA-32 Intel (C) Architecture Software 
+	 * Developer's Manual, Volume 3: System Prgramming Guide,
+	 * revision #12 in Table B-1: MSRs in the Pentium 4 and
+	 * Intel Xeon Processors, on page B-4 and B-5.
+	 */
+	if (c->x86_model < 2)
+		fsb = 100 * 1000;
+	else {
+		u8 fsb_code = (msr_lo >> 16) & 0x7;
+		switch (fsb_code) {
+		case 0:
+			fsb = 100 * 1000;
+			break;
+		case 1:
+			fsb = 13333 * 10;
+			break;
+		case 2:
+			fsb = 200 * 1000;
+			break;
+		}
+	}
+
+	if (!fsb)
+		printk(KERN_DEBUG "speedstep-lib: couldn't detect FSB speed. Please send an e-mail to <linux@brodo.de>\n");
+
+	/* Multiplier. */
+	mult = msr_lo >> 24;
+
+	dprintk(KERN_DEBUG "speedstep-lib: P4 - FSB %u kHz; Multiplier %u\n", fsb, mult);
+
+	return (fsb * mult);
 }
 
  
 unsigned int speedstep_get_processor_frequency(unsigned int processor)
 {
 	switch (processor) {
+	case SPEEDSTEP_PROCESSOR_PM:
+		return pentiumM_get_frequency();
+	case SPEEDSTEP_PROCESSOR_P4D:
 	case SPEEDSTEP_PROCESSOR_P4M:
 		return pentium4_get_frequency();
 	case SPEEDSTEP_PROCESSOR_PIII_T:

Index: speedstep-lib.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.h,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -r1.1 -r1.2
--- speedstep-lib.h	17 Jun 2003 13:21:21 -0000	1.1
+++ speedstep-lib.h	20 Jan 2004 17:03:31 -0000	1.2
@@ -15,7 +15,13 @@
 #define SPEEDSTEP_PROCESSOR_PIII_C_EARLY	0x00000001  /* Coppermine core */
 #define SPEEDSTEP_PROCESSOR_PIII_C		0x00000002  /* Coppermine core */
 #define SPEEDSTEP_PROCESSOR_PIII_T 		0x00000003  /* Tualatin core */
-#define SPEEDSTEP_PROCESSOR_P4M			0x00000004  /* P4-M with 100 MHz FSB */
+#define SPEEDSTEP_PROCESSOR_P4M			0x00000004  /* P4-M  */
+
+/* the following processors are not speedstep-capable and are not auto-detected
+ * in speedstep_detect_processor(). However, their speed can be detected using
+ * the speedstep_get_processor_frequency() call. */
+#define SPEEDSTEP_PROCESSOR_PM			0xFFFFFF03  /* Pentium M  */
+#define SPEEDSTEP_PROCESSOR_P4D			0xFFFFFF04  /* desktop P4  */
 
 /* speedstep states -- only two of them */
 

Index: speedstep-smi.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-smi.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -r1.3 -r1.4
--- speedstep-smi.c	5 Nov 2003 18:27:43 -0000	1.3
+++ speedstep-smi.c	20 Jan 2004 17:03:31 -0000	1.4
@@ -19,6 +19,7 @@
 #include <linux/cpufreq.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include <asm/ist.h>
 
 #include "speedstep-lib.h"
@@ -51,10 +52,14 @@
 #define SET_SPEEDSTEP_STATE 2
 #define GET_SPEEDSTEP_FREQS 4
 
+/* how often shall the SMI call be tried if it failed, e.g. because
+ * of DMA activity going on? */
+#define SMI_TRIES 5
+
 /* DEBUG
  *   Define it if you want verbose debug output, e.g. for bug reporting
  */
-#define SPEEDSTEP_DEBUG
+//#define SPEEDSTEP_DEBUG
 
 #ifdef SPEEDSTEP_DEBUG
 #define dprintk(msg...) printk(msg)
@@ -85,6 +90,9 @@
 
 /**
  * speedstep_smi_get_freqs - get SpeedStep preferred & current freq.
+ * Only available on later SpeedStep-enabled systems, returns false results or
+ * even hangs [cf. bugme.osdl.org # 1422] on earlier systems. Empirical testing
+ * shows that the latter occurs if !(ist_info.event & 0xFFFF).
  *
  */
 static int speedstep_smi_get_freqs (unsigned int *low, unsigned int *high)
@@ -93,6 +101,9 @@
 	u32 state=0;
 	u32 function = GET_SPEEDSTEP_FREQS;
 
+	if (!(ist_info.event & 0xFFFF))
+		return -ENODEV;
+
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 
 	__asm__ __volatile__("movl $0, %%edi\n"
@@ -134,10 +145,11 @@
  */
 static void speedstep_set_state (unsigned int state, unsigned int notify)
 {
-	unsigned int old_state, result, command, new_state;
+	unsigned int old_state, result = 0, command, new_state;
 	unsigned long flags;
 	struct cpufreq_freqs freqs;
 	unsigned int function=SET_SPEEDSTEP_STATE;
+	unsigned int retry = 0;
 
 	if (state > 0x1)
 		return;
@@ -157,20 +169,28 @@
 	local_irq_save(flags);
 
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
-	__asm__ __volatile__(
-		"movl $0, %%edi\n"
-		"out %%al, (%%dx)\n"
-		: "=b" (new_state), "=D" (result)
-		: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
-	);
+
+	do {
+		if (retry) {
+			dprintk(KERN_INFO "cpufreq: retry %u, previous result %u\n", retry, result);
+			mdelay(retry * 50);
+		}
+		retry++;
+		__asm__ __volatile__(
+			"movl $0, %%edi\n"
+			"out %%al, (%%dx)\n"
+			: "=b" (new_state), "=D" (result)
+			: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
+			);
+	} while ((new_state != state) && (retry <= SMI_TRIES));
 
 	/* enable IRQs */
 	local_irq_restore(flags);
 
 	if (new_state == state) {
-		dprintk(KERN_INFO "cpufreq: change to %u MHz succeded\n", (freqs.new / 1000));
+		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded after %u tries with result %u\n", (freqs.new / 1000), retry, result);
 	} else {
-		printk(KERN_ERR "cpufreq: change failed\n");
+		printk(KERN_ERR "cpufreq: change failed with new_state %u and result %u\n", new_state, result);
 	}
 
 	if (notify)
@@ -225,9 +245,10 @@
 		return -ENODEV;
 
 	result = speedstep_smi_ownership();
-
-	if (result)
+	if (result) {
 		dprintk(KERN_INFO "cpufreq: fails an aquiring ownership of a SMI interface.\n");
+		return -EINVAL;
+	}
 
 	/* detect low and high frequency */
 	result = speedstep_smi_get_freqs(&speedstep_freqs[SPEEDSTEP_LOW].frequency,
@@ -286,6 +307,7 @@
 	.target 	= speedstep_target,
 	.init		= speedstep_cpu_init,
 	.resume		= speedstep_resume,
+	.owner		= THIS_MODULE,
 };
 
 /**
