From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq longhaul.c, 1.93.2.2,
	1.93.2.3 longhaul.h, 1.1.2.1, 1.1.2.2
Date: Tue, 09 Dec 2003 08:58:36 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1ATdhU-0006ml-Pq@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv26079

Modified Files:
      Tag: LINUX_2_4
	longhaul.c longhaul.h 
Log Message:
Update longhaul driver to match current dj bk tree.


Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.93.2.2
retrieving revision 1.93.2.3
diff -u -r1.93.2.2 -r1.93.2.3
--- longhaul.c	30 Sep 2003 12:30:04 -0000	1.93.2.2
+++ longhaul.c	9 Dec 2003 08:58:33 -0000	1.93.2.3
@@ -5,17 +5,14 @@
  *  Licensed under the terms of the GNU GPL License version 2.
  *  Based upon datasheets & sample CPUs kindly provided by VIA.
  *
- *  VIA have currently 3 different versions of Longhaul.
- *
- *  +---------------------+----------+---------------------------------+
- *  | Marketing name      | Codename | longhaul version / features.    |
- *  +---------------------+----------+---------------------------------+
- *  |  Samuel/CyrixIII    | C5A      | v1 : multipliers only           |
- *  |  Samuel2/C3         | C3E/C5B  | v1 : multiplier only            |
- *  |  Ezra               | C5C      | v2 : multipliers & voltage      |
- *  |  Ezra-T             | C5M      | v3 : multipliers, voltage & FSB |
- *  |  Nehemiah           | C5N      | v3 : multipliers, voltage & FSB |
- *  +---------------------+----------+---------------------------------+
+ *  VIA have currently 2 different versions of Longhaul.
+ *  Version 1 (Longhaul) uses the BCR2 MSR at 0x1147.
+ *   It is present only in Samuel 1, Samuel 2 and Ezra.
+ *  Version 2 (Powersaver) uses the POWERSAVER MSR at 0x110a.
+ *   It is present in Ezra-T, Nehemiah and above.
+ *   In addition to scaling multiplier, it can also scale voltage.
+ *   There is provision for scaling FSB too, but this doesn't work
+ *   too well in practice.
  *
  *  BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*
  */
@@ -66,7 +63,11 @@
 
 static unsigned int calc_speed (int mult, int fsb)
 {
-	return ((mult/10)*fsb) + ((mult%10)*(fsb/2));
+	int mhz;
+	mhz = (mult/10)*fsb;
+	if (mult%10)
+		mhz += fsb/2;
+	return mhz;
 }
 
 
@@ -76,7 +77,7 @@
 
 	rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
 	invalue = (lo & (1<<22|1<<23|1<<24|1<<25)) >>22;
-	if (longhaul_version==3) {
+	if (longhaul_version==2) {
 		if (lo & (1<<27))
 			invalue+=16;
 	}
@@ -132,32 +133,15 @@
 		break;
 
 	/*
-	 * Longhaul v2. (Ezra [C5C])
+	 * Powersaver. (Ezra-T [C5M], Nehemiah [C5N])
 	 * We can scale voltage with this too, but that's currently
 	 * disabled until we come up with a decent 'match freq to voltage'
 	 * algorithm.
 	 * We also need to do the voltage/freq setting in order depending
 	 * on the direction of scaling (like we do in powernow-k7.c)
-	 */
-	case 2:
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-		longhaul.bits.SoftBusRatio = clock_ratio_index & 0xf;
-		longhaul.bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
-		longhaul.bits.EnableSoftBusRatio = 1;
-		/* We must program the revision key only with values we
-		 * know about, not blindly copy it from 0:3 */
-		longhaul.bits.RevisionKey = 1;
-		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-		__hlt();
-
-		break;
-
-	/*
-	 * Longhaul v3. (Ezra-T [C5M], Nehemiah [C5N])
-	 * This can also do voltage scaling, but see above.
 	 * Ezra-T was alleged to do FSB scaling too, but it never worked in practice.
 	 */
-	case 3:
+	case 2:
 		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 		longhaul.bits.SoftBusRatio = clock_ratio_index & 0xf;
 		longhaul.bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
@@ -186,6 +170,9 @@
  * between that value multiplied by possible FSBs and cpu_mhz which
  * was calculated at boot time. Really ugly, but no other way to do this.
  */
+
+#define ROUNDING	0xf
+
 static int _guess (int guess, int maxmult)
 {
 	int target;
@@ -193,16 +180,20 @@
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
 
+	speed += ROUNDING/2;
+	speed &= ~ROUNDING;
+
 	for (i=0; i<3; i++) {
 		if (_guess(speeds[i],maxmult) == speed)
 			return speeds[i];
@@ -214,6 +205,7 @@
 
 static int __init longhaul_get_ranges (void)
 {
+	struct cpuinfo_x86 *c = cpu_data;
 	unsigned long invalue;
 	unsigned int minmult=0, maxmult=0;
 	unsigned int multipliers[32]= {
@@ -232,10 +224,13 @@
 		maxmult = longhaul_get_cpu_mult();
 		rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
 		invalue = (lo & (1<<18|1<<19)) >>18;
-		fsb = eblcr_fsb_table[invalue];
+		if (c->x86_model==6)
+			fsb = eblcr_fsb_table[invalue];
+		else
+			fsb = guess_fsb(maxmult);
 		break;
 
-	case 2 ... 3:
+	case 2:
 		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 
 		invalue = longhaul.bits.MaxMHzBR;
@@ -373,40 +368,46 @@
 	case 6:
 		cpuname = "C3 'Samuel' [C5A]";
 		longhaul_version=1;
-		memcpy (clock_ratio, longhaul1_clock_ratio, sizeof(longhaul1_clock_ratio));
+		memcpy (clock_ratio, samuel1_clock_ratio, sizeof(samuel1_clock_ratio));
 		memcpy (eblcr_table, samuel1_eblcr, sizeof(samuel1_eblcr));
 		break;
 
 	case 7:		/* C5B / C5C */
+		longhaul_version=1;
 		switch (c->x86_mask) {
 		case 0:
 			cpuname = "C3 'Samuel 2' [C5B]";
-			longhaul_version=1;
-			memcpy (clock_ratio, longhaul1_clock_ratio, sizeof(longhaul1_clock_ratio));
+			/* Note, this is not a typo, early Samuel2's had Samuel1 ratios. */
+			memcpy (clock_ratio, samuel1_clock_ratio, sizeof(samuel1_clock_ratio));
 			memcpy (eblcr_table, samuel2_eblcr, sizeof(samuel2_eblcr));
 			break;
 		case 1 ... 15:
-			cpuname = "C3 'Ezra' [C5C]";
-			longhaul_version=2;
-			memcpy (clock_ratio, longhaul2_clock_ratio, sizeof(longhaul2_clock_ratio));
+			if (c->x86_mask < 8)
+				cpuname = "C3 'Samuel 2' [C5B]";
+			else
+				cpuname = "C3 'Ezra' [C5C]";
+			memcpy (clock_ratio, ezra_clock_ratio, sizeof(ezra_clock_ratio));
 			memcpy (eblcr_table, ezra_eblcr, sizeof(ezra_eblcr));
 			break;
 		}
 		break;
 
 	case 8:
-		cpuname = "C3 'Ezra-T [C5M]";
-		longhaul_version=3;
+		cpuname = "C3 'Ezra-T' [C5M]";
+		longhaul_version=2;
 		numscales=32;
-		memcpy (clock_ratio, longhaul3_clock_ratio, sizeof(longhaul3_clock_ratio));
-		memcpy (eblcr_table, c5m_eblcr, sizeof(c5m_eblcr));
+		memcpy (clock_ratio, ezrat_clock_ratio, sizeof(ezrat_clock_ratio));
+		memcpy (eblcr_table, ezrat_eblcr, sizeof(ezrat_eblcr));
 		break;
-	/*
+
 	case 9:
 		cpuname = "C3 'Nehemiah' [C5N]";
-		longhaul_version=3;
+		longhaul_version=2;
 		numscales=32;
-	*/
+		memcpy (clock_ratio, nehemiah_clock_ratio, sizeof(nehemiah_clock_ratio));
+		memcpy (eblcr_table, nehemiah_eblcr, sizeof(nehemiah_eblcr));
+		break;
+
 	default:
 		cpuname = "Unknown";
 		break;
@@ -415,14 +416,14 @@
 	printk (KERN_INFO PFX "VIA %s CPU detected. Longhaul v%d supported.\n",
 					cpuname, longhaul_version);
 
-	if ((longhaul_version==2 || longhaul_version==3) && (dont_scale_voltage==0))
+	if ((longhaul_version==2) && (dont_scale_voltage==0))
 		longhaul_setup_voltagescaling();
 
 	ret = longhaul_get_ranges();
 	if (ret != 0)
 		return ret;
 
- 	policy->policy = CPUFREQ_POLICY_PERFORMANCE;
+ 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
  	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = calc_speed (longhaul_get_cpu_mult(), fsb);
 
@@ -444,12 +445,8 @@
 		return -ENODEV;
 
 	switch (c->x86_model) {
-	case 6 ... 7:
+	case 6 ... 8:
 		return cpufreq_register_driver(&longhaul_driver);
-	case 8:
-		printk (KERN_INFO PFX "Ezra-T unsupported: Waiting on updated docs "
-						"from VIA before this is usable.\n");
-		break;
 	case 9:
 		printk (KERN_INFO PFX "Nehemiah unsupported: Waiting on working silicon "
 						"from VIA before this is usable.\n");

Index: longhaul.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.h,v
retrieving revision 1.1.2.1
retrieving revision 1.1.2.2
diff -u -r1.1.2.1 -r1.1.2.2
--- longhaul.h	30 Sep 2003 11:52:08 -0000	1.1.2.1
+++ longhaul.h	9 Dec 2003 08:58:33 -0000	1.1.2.2
@@ -56,7 +56,7 @@
 /*
  * VIA C3 Samuel 1  & Samuel 2 (stepping 0)
  */
-static int __initdata longhaul1_clock_ratio[16] = {
+static int __initdata samuel1_clock_ratio[16] = {
 	-1, /* 0000 -> RESERVED */
 	30, /* 0001 ->  3.0x */
 	40, /* 0010 ->  4.0x */
@@ -95,27 +95,8 @@
 };
 
 /*
- * VIA C3 Samuel2 Stepping 1->15 & VIA C3 Ezra
+ * VIA C3 Samuel2 Stepping 1->15
  */
-static int __initdata longhaul2_clock_ratio[16] = {
-	100, /* 0000 -> 10.0x */
-	30,  /* 0001 ->  3.0x */
-	40,  /* 0010 ->  4.0x */
-	90,  /* 0011 ->  9.0x */
-	95,  /* 0100 ->  9.5x */
-	35,  /* 0101 ->  3.5x */
-	45,  /* 0110 ->  4.5x */
-	55,  /* 0111 ->  5.5x */
-	60,  /* 1000 ->  6.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	50,  /* 1011 ->  5.0x */
-	65,  /* 1100 ->  6.5x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	120, /* 1111 -> 12.0x */
-};
-
 static int __initdata samuel2_eblcr[16] = {
 	50,  /* 0000 ->  5.0x */
 	30,  /* 0001 ->  3.0x */
@@ -135,6 +116,28 @@
 	65,  /* 1111 ->  6.5x */
 };
 
+/*
+ * VIA C3 Ezra
+ */
+static int __initdata ezra_clock_ratio[16] = {
+	100, /* 0000 -> 10.0x */
+	30,  /* 0001 ->  3.0x */
+	40,  /* 0010 ->  4.0x */
+	90,  /* 0011 ->  9.0x */
+	95,  /* 0100 ->  9.5x */
+	35,  /* 0101 ->  3.5x */
+	45,  /* 0110 ->  4.5x */
+	55,  /* 0111 ->  5.5x */
+	60,  /* 1000 ->  6.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	50,  /* 1011 ->  5.0x */
+	65,  /* 1100 ->  6.5x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	120, /* 1111 -> 12.0x */
+};
+
 static int __initdata ezra_eblcr[16] = {
 	50,  /* 0000 ->  5.0x */
 	30,  /* 0001 ->  3.0x */
@@ -157,7 +160,7 @@
 /*
  * VIA C3 (Ezra-T) [C5M].
  */
-static int __initdata longhaul3_clock_ratio[32] = {
+static int __initdata ezrat_clock_ratio[32] = {
 	100, /* 0000 -> 10.0x */
 	30,  /* 0001 ->  3.0x */
 	40,  /* 0010 ->  4.0x */
@@ -193,7 +196,7 @@
 	-1,  /* 1111 -> RESERVED (12.0x) */
 };
 
-static int __initdata c5m_eblcr[32] = {
+static int __initdata ezrat_eblcr[32] = {
 	50,  /* 0000 ->  5.0x */
 	30,  /* 0001 ->  3.0x */
 	40,  /* 0010 ->  4.0x */
@@ -229,7 +232,79 @@
 	145, /* 1111 -> 14.5x */
 };
 
+/*
+ * VIA C3 Nehemiah */
+static int __initdata nehemiah_clock_ratio[32] = {
+	100, /* 0000 -> 10.0x */
+	160, /* 0001 -> 16.0x */
+	-1,  /* 0010 -> RESERVED */
+	90,  /* 0011 ->  9.0x */
+	95,  /* 0100 ->  9.5x */
+	-1,  /* 0101 -> RESERVED */
+	-1,  /* 0110 -> RESERVED */
+	55,  /* 0111 ->  5.5x */
+	60,  /* 1000 ->  6.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	50,  /* 1011 ->  5.0x */
+	65,  /* 1100 ->  6.5x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	120, /* 1111 ->  12.0x */
+
+	100, /* 0000 -> 10.0x */
+	110, /* 0001 -> 11.0x */
+	120, /* 0010 -> 12.0x */
+	90,  /* 0011 ->  9.0x */
+	105, /* 0100 -> 10.5x */
+	115, /* 0101 -> 11.5x */
+	125, /* 0110 -> 12.5x */
+	135, /* 0111 -> 13.5x */
+	140, /* 1000 -> 14.0x */
+	150, /* 1001 -> 15.0x */
+	160, /* 1010 -> 16.0x */
+	130, /* 1011 -> 13.0x */
+	145, /* 1100 -> 14.5x */
+	155, /* 1101 -> 15.5x */
+	-1,  /* 1110 -> RESERVED */
+	120, /* 1111 -> 12.0x */
+};
 
+static int __initdata nehemiah_eblcr[32] = {
+	50,  /* 0000 ->  5.0x */
+	160, /* 0001 -> 16.0x */
+	-1,  /* 0010 -> RESERVED */
+	100, /* 0011 -> 10.0x */
+	55,  /* 0100 ->  5.5x */
+	-1,  /* 0101 -> RESERVED */
+	-1,  /* 0110 -> RESERVED */
+	95,  /* 0111 ->  9.5x */
+	90,  /* 1000 ->  9.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	60,  /* 1011 ->  6.0x */
+	120, /* 1100 -> 12.0x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	65,  /* 1111 ->  6.5x */
+
+	90,  /* 0000 ->  9.0x */
+	110, /* 0001 -> 11.0x */
+	120, /* 0010 -> 12.0x */
+	100, /* 0011 -> 10.0x */
+	135, /* 0100 -> 13.5x */
+	115, /* 0101 -> 11.5x */
+	125, /* 0110 -> 12.5x */
+	105, /* 0111 -> 10.5x */
+	130, /* 1000 -> 13.0x */
+	150, /* 1001 -> 15.0x */
+	160, /* 1010 -> 16.0x */
+	140, /* 1011 -> 14.0x */
+	120, /* 1100 -> 12.0x */
+	155, /* 1101 -> 15.5x */
+	-1,  /* 1110 -> RESERVED */
+	-1,  /* 1111 -> RESERVED */
+};
 /* 
  * Voltage scales. Div/Mod by 1000 to get actual voltage.
  * Which scale to use depends on the VRM type in use.
