From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq longhaul.c, 1.93.2.8,
	1.93.2.9
Date: Tue, 31 Aug 2004 10:32:53 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C250X-00021R-DU@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv7770/linux/arch/i386/kernel/cpufreq

Modified Files:
      Tag: LINUX_2_4
	longhaul.c 
Log Message:
backport 2.6 longhaul driver, with hope this will works.


Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.93.2.8
retrieving revision 1.93.2.9
diff -u -r1.93.2.8 -r1.93.2.9
--- longhaul.c	9 Jul 2004 22:36:34 -0000	1.93.2.8
+++ longhaul.c	31 Aug 2004 09:32:50 -0000	1.93.2.9
@@ -5,14 +5,19 @@
  *  Licensed under the terms of the GNU GPL License version 2.
  *  Based upon datasheets & sample CPUs kindly provided by VIA.
  *
- *  VIA have currently 2 different versions of Longhaul.
+ *  VIA have currently 3 different versions of Longhaul.
  *  Version 1 (Longhaul) uses the BCR2 MSR at 0x1147.
- *   It is present only in Samuel 1, Samuel 2 and Ezra.
- *  Version 2 (Powersaver) uses the POWERSAVER MSR at 0x110a.
- *   It is present in Ezra-T, Nehemiah and above.
- *   In addition to scaling multiplier, it can also scale voltage.
- *   There is provision for scaling FSB too, but this doesn't work
- *   too well in practice.
+ *   It is present only in Samuel 1 (C5A), Samuel 2 (C5B) stepping 0.
+ *  Version 2 of longhaul is the same as v1, but adds voltage scaling.
+ *   Present in Samuel 2 (steppings 1-7 only) (C5B), and Ezra (C5C)
+ *   voltage scaling support has currently been disabled in this driver
+ *   until we have code that gets it right.
+ *  Version 3 of longhaul got renamed to Powersaver and redesigned
+ *   to use the POWERSAVER MSR at 0x110a.
+ *   It is present in Ezra-T (C5M), Nehemiah (C5X) and above.
+ *   It's pretty much the same feature wise to longhaul v2, though
+ *   there is provision for scaling FSB too, but this doesn't work
+ *   too well in practice so we don't even try to use this.
  *
  *  BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*
  */
@@ -30,18 +35,27 @@
 
 #include "longhaul.h"
 
-#define DEBUG
-
 #define PFX "longhaul: "
 
+#define TYPE_LONGHAUL_V1	1
+#define TYPE_LONGHAUL_V2	2
+#define TYPE_POWERSAVER		3
+
+#define	CPU_SAMUEL	1
+#define	CPU_SAMUEL2	2
+#define	CPU_EZRA	3
+#define	CPU_EZRA_T	4
+#define	CPU_NEHEMIAH	5
+
+static int cpu_model;
+
 static unsigned int numscales=16, numvscales;
 static unsigned int fsb;
 static int minvid, maxvid;
-static int can_scale_voltage;
 static unsigned int minmult, maxmult;
+static int can_scale_voltage;
 static int vrmrev;
 
-
 /* Module parameters */
 static int dont_scale_voltage;
 static int debug;
@@ -70,9 +84,23 @@
 static unsigned int highest_speed, lowest_speed; /* kHz */
 static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
+static char speedbuffer[8];
 
+static char *print_speed(int speed)
+{
+	if (speed > 1000) {
+		if (speed%1000 == 0)
+			sprintf (speedbuffer, "%dGHz", speed/1000);
+		else
+			sprintf (speedbuffer, "%d.%dGHz", speed/1000, (speed%1000)/100);
+	} else
+		sprintf (speedbuffer, "%dMHz", speed);
 
-static unsigned int calc_speed(int mult, int fsb)
+	return speedbuffer;
+}
+
+
+static unsigned int calc_speed(int mult)
 {
 	int khz;
 	khz = (mult/10)*fsb;
@@ -89,7 +117,7 @@
 
 	rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
 	invalue = (lo & (1<<22|1<<23|1<<24|1<<25)) >>22;
-	if (longhaul_version==2 || longhaul_version==3) {
+	if (longhaul_version==TYPE_LONGHAUL_V2 || longhaul_version==TYPE_POWERSAVER) {
 		if (lo & (1<<27))
 			invalue+=16;
 	}
@@ -97,11 +125,46 @@
 }
 
 
+static void do_powersaver(union msr_longhaul *longhaul,
+			unsigned int clock_ratio_index)
+{
+	int version;
+
+	switch (cpu_model) {
+	case CPU_EZRA_T:
+		version = 3;
+		break;
+	case CPU_NEHEMIAH:
+		version = 0xf;
+		break;
+	default:
+		return;
+	}
+
+	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	longhaul->bits.SoftBusRatio = clock_ratio_index & 0xf;
+	longhaul->bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
+	longhaul->bits.EnableSoftBusRatio = 1;
+	longhaul->bits.RevisionKey = 0;
+	local_irq_disable();
+	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	local_irq_enable();
+	__hlt();
+
+	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	longhaul->bits.EnableSoftBusRatio = 0;
+	longhaul->bits.RevisionKey = version;
+	local_irq_disable();
+	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	local_irq_enable();
+}
+
+
 /**
  * longhaul_set_cpu_frequency()
  * @clock_ratio_index : bitpattern of the new multiplier.
  *
- * Sets a new clock ratio, and -if applicable- a new Front Side Bus
+ * Sets a new clock ratio.
  */
 
 static void longhaul_setstate(unsigned int clock_ratio_index)
@@ -110,79 +173,71 @@
 	struct cpufreq_freqs freqs;
 	union msr_longhaul longhaul;
 	union msr_bcr2 bcr2;
+	static unsigned int old_ratio=-1;
+
+	if (old_ratio == clock_ratio_index)
+		return;
+	old_ratio = clock_ratio_index;
 
 	mult = clock_ratio[clock_ratio_index];
 	if (mult == -1)
 		return;
 
-	speed = calc_speed (mult, fsb);
+	speed = calc_speed(mult);
 	if ((speed > highest_speed) || (speed < lowest_speed))
 		return;
 
-	freqs.old = calc_speed (longhaul_get_cpu_mult(), fsb);
+	freqs.old = calc_speed(longhaul_get_cpu_mult());
 	freqs.new = speed;
 	freqs.cpu = 0; /* longhaul.c is UP only driver */
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
-	dprintk (KERN_INFO PFX "FSB:%d Mult:%d.%dx\n", fsb, mult/10, mult%10);
+	dprintk (KERN_INFO PFX "Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
+			fsb, mult/10, mult%10, print_speed(speed/1000));
 
 	switch (longhaul_version) {
-	case 1:
+
+	/*
+	 * Longhaul v1. (Samuel[C5A] and Samuel2 stepping 0[C5B])
+	 * Software controlled multipliers only.
+	 *
+	 * *NB* Until we get voltage scaling working v1 & v2 are the same code.
+	 * Longhaul v2 appears in Samuel2 Steppings 1->7 [C5b] and Ezra [C5C]
+	 */
+	case TYPE_LONGHAUL_V1:
+	case TYPE_LONGHAUL_V2:
 		rdmsrl (MSR_VIA_BCR2, bcr2.val);
 		/* Enable software clock multiplier */
 		bcr2.bits.ESOFTBF = 1;
 		bcr2.bits.CLOCKMUL = clock_ratio_index;
+		local_irq_disable();
 		wrmsrl (MSR_VIA_BCR2, bcr2.val);
+		local_irq_enable();
 
 		__hlt();
 
 		/* Disable software clock multiplier */
 		rdmsrl (MSR_VIA_BCR2, bcr2.val);
 		bcr2.bits.ESOFTBF = 0;
+		local_irq_disable();
 		wrmsrl (MSR_VIA_BCR2, bcr2.val);
+		local_irq_enable();
 		break;
 
 	/*
-	 * Powersaver. (Ezra-T [C5M], Nehemiah [C5N])
-	 * We can scale voltage with this too, but that's currently
-	 * disabled until we come up with a decent 'match freq to voltage'
-	 * algorithm.
-	 * We also need to do the voltage/freq setting in order depending
-	 * on the direction of scaling (like we do in powernow-k7.c)
-	 * Ezra-T was alleged to do FSB scaling too, but it never worked in practice.
+	 * Longhaul v3 (aka Powersaver). (Ezra-T [C5M] & Nehemiah [C5N])
+ 	 * We can scale voltage with this too, but that's currently
+ 	 * disabled until we come up with a decent 'match freq to voltage'
+ 	 * algorithm.
+	 * When we add voltage scaling, we will also need to do the
+	 * voltage/freq setting in order depending on the direction
+	 * of scaling (like we do in powernow-k7.c)
+	 * Nehemiah can do FSB scaling too, but this has never been proven
+	 * to work in practice.
 	 */
-	case 2:
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-		longhaul.bits.SoftBusRatio = clock_ratio_index & 0xf;
-		longhaul.bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
-		longhaul.bits.EnableSoftBusRatio = 1;
-		/* We must program the revision key only with values we
-		 * know about, not blindly copy it from 0:3 */
-		longhaul.bits.RevisionKey = 3;	/* SoftVID & SoftBSEL */
-		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
-		__hlt();
-
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-		longhaul.bits.EnableSoftBusRatio = 0;
-		longhaul.bits.RevisionKey = 3;
-		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-		break;
-	case 3:
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-		longhaul.bits.SoftBusRatio = clock_ratio_index & 0xf;
-		longhaul.bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
-		longhaul.bits.EnableSoftBusRatio = 1;
-
-		longhaul.bits.RevisionKey = 0x0;
-
-		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
-		__hlt();
-
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-		longhaul.bits.EnableSoftBusRatio = 0;
-		longhaul.bits.RevisionKey = 0xf;
-		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+	case TYPE_POWERSAVER:
+		do_powersaver(&longhaul, clock_ratio_index);
 		break;
 	}
 
@@ -232,7 +287,6 @@
 
 static int __init longhaul_get_ranges(void)
 {
-	struct cpuinfo_x86 *c = cpu_data;
 	unsigned long invalue;
 	unsigned int multipliers[32]= {
 		50,30,40,100,55,35,45,95,90,70,80,60,120,75,85,65,
@@ -244,58 +298,64 @@
 	unsigned int eblcr_fsb_table_v2[] = { 133, 100, -1, 66 };
 
 	switch (longhaul_version) {
-	case 1:
+	case TYPE_LONGHAUL_V1:
+	case TYPE_LONGHAUL_V2:
 		/* Ugh, Longhaul v1 didn't have the min/max MSRs.
 		   Assume min=3.0x & max = whatever we booted at. */
 		minmult = 30;
 		maxmult = longhaul_get_cpu_mult();
 		rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
 		invalue = (lo & (1<<18|1<<19)) >>18;
-		if (c->x86_model==6)
+		if (cpu_model==CPU_SAMUEL || cpu_model==CPU_SAMUEL2)
 			fsb = eblcr_fsb_table_v1[invalue];
 		else
 			fsb = guess_fsb();
 		break;
-
-	case 2:
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-
-		invalue = longhaul.bits.MaxMHzBR;
-		if (longhaul.bits.MaxMHzBR4)
-			invalue += 16;
-		maxmult=multipliers[invalue];
-
-		invalue = longhaul.bits.MinMHzBR;
-		if (longhaul.bits.MinMHzBR4 == 1)
-			minmult = 30;
-		else
-			minmult = multipliers[invalue];
-
-		fsb = eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
-		break;
-
-	case 3:
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-
-		/*
-		 * TODO: This code works, but raises a lot of questions.
-		 * - Some Nehemiah's seem to have broken Min/MaxMHzBR's.
-		 *   We get around this by using a hardcoded multiplier of 5.0x
-		 *   for the minimimum speed, and the speed we booted up at for the max.
-		 *   This is done in longhaul_get_cpu_mult() by reading the EBLCR register.
-		 * - According to some VIA documentation EBLCR is only
-		 *   in pre-Nehemiah C3s. How this still works is a mystery.
-		 *   We're possibly using something undocumented and unsupported,
-		 *   But it works, so we don't grumble.
-		 */
-		minmult=50;
-		maxmult=longhaul_get_cpu_mult();
-
-		fsb = eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
-		break;
+	case TYPE_POWERSAVER:
+		/* Ezra-T */
+		if (cpu_model==CPU_EZRA_T) {
+			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+			invalue = longhaul.bits.MaxMHzBR;
+			if (longhaul.bits.MaxMHzBR4)
+				invalue += 16;
+			maxmult=multipliers[invalue];
+
+			invalue = longhaul.bits.MinMHzBR;
+			if (longhaul.bits.MinMHzBR4 == 1)
+				minmult = 30;
+			else
+				minmult = multipliers[invalue];
+			fsb = eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
+			break;
+		}
+		/* Nehemiah */
+		if (cpu_model==CPU_NEHEMIAH) {
+			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+
+			/*
+			 * TODO: This code works, but raises a lot of questions.
+			 * - Some Nehemiah's seem to have broken Min/MaxMHzBR's.
+			 *   We get around this by using a hardcoded multiplier of 4.0x
+			 *   for the minimimum speed, and the speed we booted up at for the max.
+			 *   This is done in longhaul_get_cpu_mult() by reading the EBLCR register.
+			 * - According to some VIA documentation EBLCR is only
+			 *   in pre-Nehemiah C3s. How this still works is a mystery.
+			 *   We're possibly using something undocumented and unsupported,
+			 *   But it works, so we don't grumble.
+			 */
+			minmult=40;
+			maxmult=longhaul_get_cpu_mult();
+
+			/* Starting with the 1.2GHz parts, theres a 200MHz bus. */
+			if ((cpu_khz/1000) > 1200)
+				fsb = 200;
+			else
+				fsb = eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
+			break;
+		}
 	}
 
-	dprintk (KERN_INFO PFX "MinMult=%d.%dx MaxMult=%d.%dx\n",
+	dprintk (KERN_INFO PFX "MinMult:%d.%dx MaxMult:%d.%dx\n",
 		 minmult/10, minmult%10, maxmult/10, maxmult%10);
 
 	if (fsb == -1) {
@@ -303,10 +363,11 @@
 		return -EINVAL;
 	}
 
-	highest_speed = calc_speed (maxmult, fsb);
-	lowest_speed = calc_speed (minmult,fsb);
-	dprintk (KERN_INFO PFX "FSB: %dMHz Lowestspeed=%dMHz Highestspeed=%dMHz\n",
-		 fsb, lowest_speed/1000, highest_speed/1000);
+	highest_speed = calc_speed(maxmult);
+	lowest_speed = calc_speed(minmult);
+	dprintk (KERN_INFO PFX "FSB:%dMHz  ", fsb);
+	dprintk ("Lowest speed:%s  ", print_speed(lowest_speed/1000));
+	dprintk ("Highest speed:%s\n", print_speed(highest_speed/1000));
 
 	if (lowest_speed == highest_speed) {
 		printk (KERN_INFO PFX "highestspeed == lowest, aborting.\n");
@@ -329,7 +390,7 @@
 			continue;
 		if (ratio > maxmult || ratio < minmult)
 			continue;
-		longhaul_table[k].frequency = calc_speed (ratio, fsb);
+		longhaul_table[k].frequency = calc_speed (ratio);
 		longhaul_table[k].index	= j;
 		k++;
 	}
@@ -405,17 +466,16 @@
 
 
 static int longhaul_target(struct cpufreq_policy *policy,
-			   unsigned int target_freq,
-			   unsigned int relation)
+			   unsigned int target_freq, unsigned int relation)
 {
 	unsigned int table_index = 0;
- 	unsigned int new_clock_ratio = 0;
+	unsigned int new_clock_ratio = 0;
 
 	if (cpufreq_frequency_table_target(policy, longhaul_table, target_freq, relation, &table_index))
 		return -EINVAL;
 
 	new_clock_ratio = longhaul_table[table_index].index & 0xFF;
- 
+
 	longhaul_setstate(new_clock_ratio);
 
 	return 0;
@@ -426,7 +486,7 @@
 {
 	if (cpu)
 		return 0;
-	return (calc_speed (longhaul_get_cpu_mult(), fsb));
+	return (calc_speed (longhaul_get_cpu_mult()));
 }
 #endif
 
@@ -438,26 +498,31 @@
 
 	switch (c->x86_model) {
 	case 6:
+		cpu_model = CPU_SAMUEL;
 		cpuname = "C3 'Samuel' [C5A]";
-		longhaul_version=1;
+		longhaul_version = TYPE_LONGHAUL_V1;
 		memcpy (clock_ratio, samuel1_clock_ratio, sizeof(samuel1_clock_ratio));
 		memcpy (eblcr_table, samuel1_eblcr, sizeof(samuel1_eblcr));
 		break;
 
-	case 7:		/* C5B / C5C */
-		longhaul_version=1;
+	case 7:
+		longhaul_version = TYPE_LONGHAUL_V1;
 		switch (c->x86_mask) {
 		case 0:
+			cpu_model = CPU_SAMUEL2;
 			cpuname = "C3 'Samuel 2' [C5B]";
 			/* Note, this is not a typo, early Samuel2's had Samuel1 ratios. */
 			memcpy (clock_ratio, samuel1_clock_ratio, sizeof(samuel1_clock_ratio));
 			memcpy (eblcr_table, samuel2_eblcr, sizeof(samuel2_eblcr));
 			break;
 		case 1 ... 15:
-			if (c->x86_mask < 8)
+			if (c->x86_mask < 8) {
+				cpu_model = CPU_SAMUEL2;
 				cpuname = "C3 'Samuel 2' [C5B]";
-			else
+			} else {
+				cpu_model = CPU_EZRA;
 				cpuname = "C3 'Ezra' [C5C]";
+			}
 			memcpy (clock_ratio, ezra_clock_ratio, sizeof(ezra_clock_ratio));
 			memcpy (eblcr_table, ezra_eblcr, sizeof(ezra_eblcr));
 			break;
@@ -465,15 +530,17 @@
 		break;
 
 	case 8:
+		cpu_model = CPU_EZRA_T;
 		cpuname = "C3 'Ezra-T' [C5M]";
-		longhaul_version=2;
+		longhaul_version = TYPE_POWERSAVER;
 		numscales=32;
 		memcpy (clock_ratio, ezrat_clock_ratio, sizeof(ezrat_clock_ratio));
 		memcpy (eblcr_table, ezrat_eblcr, sizeof(ezrat_eblcr));
 		break;
 
 	case 9:
-		longhaul_version=3;
+		cpu_model = CPU_NEHEMIAH;
+		longhaul_version = TYPE_POWERSAVER;
 		numscales=32;
 		switch (c->x86_mask) {
 		case 0 ... 1:
@@ -499,19 +566,28 @@
 		break;
 	}
 
-	printk (KERN_INFO PFX "VIA %s CPU detected. Longhaul v%d supported.\n",
-					cpuname, longhaul_version);
+	printk (KERN_INFO PFX "VIA %s CPU detected.  ", cpuname);
+	switch (longhaul_version) {
+	case TYPE_LONGHAUL_V1:
+	case TYPE_LONGHAUL_V2:
+		printk ("Longhaul v%d supported.\n", longhaul_version);
+		break;
+	case TYPE_POWERSAVER:
+		printk ("Powersaver supported.\n");
+		break;
+	};
 
 	ret = longhaul_get_ranges();
 	if (ret != 0)
 		return ret;
 
-	if ((longhaul_version==2) && (dont_scale_voltage==0))
+	if ((longhaul_version==TYPE_LONGHAUL_V2 || longhaul_version==TYPE_POWERSAVER) &&
+		 (dont_scale_voltage==0))
 		longhaul_setup_voltagescaling();
 
  	policy->policy = CPUFREQ_POLICY_PERFORMANCE;
  	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
-	policy->cur = calc_speed (longhaul_get_cpu_mult(), fsb);
+	policy->cur = calc_speed (longhaul_get_cpu_mult());
 
 	return cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
 }
@@ -523,7 +599,7 @@
 	.name		= "longhaul",
 };
 
-static int __init longhaul_init (void)
+static int __init longhaul_init(void)
 {
 	struct cpuinfo_x86 *c = cpu_data;
 
@@ -540,8 +616,17 @@
 	return -ENODEV;
 }
 
-static void __exit longhaul_exit (void)
+static void __exit longhaul_exit(void)
 {
+	int i=0;
+
+	for (i=0; i < numscales; i++) {
+		if (clock_ratio[i] == maxmult) {
+			longhaul_setstate(i);
+			break;
+		}
+	}
+
 	cpufreq_unregister_driver(&longhaul_driver);
 	kfree(longhaul_table);
 }
