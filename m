From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq longhaul.c, 1.93,
	1.93.2.1 longhaul.h, 1.1, 1.1.2.1
Date: Tue, 30 Sep 2003 12:52:11 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E1A4J35-0006nr-5P@flint.arm.linux.org.uk>
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
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv26147

Modified Files:
      Tag: LINUX_2_4
	longhaul.c longhaul.h 
Log Message:
backport latest bk version of the longhaul driver.

Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.93
retrieving revision 1.93.2.1
diff -u -r1.93 -r1.93.2.1
--- longhaul.c	19 Aug 2003 13:38:32 -0000	1.93
+++ longhaul.c	30 Sep 2003 11:52:08 -0000	1.93.2.1
@@ -10,10 +10,11 @@
  *  +---------------------+----------+---------------------------------+
  *  | Marketing name      | Codename | longhaul version / features.    |
  *  +---------------------+----------+---------------------------------+
- *  |  Samuel/CyrixIII    |   C5A    | v1 : multipliers only           |
+ *  |  Samuel/CyrixIII    | C5A      | v1 : multipliers only           |
  *  |  Samuel2/C3         | C3E/C5B  | v1 : multiplier only            |
- *  |  Ezra               |   C5C    | v2 : multipliers & voltage      |
- *  |  Ezra-T             | C5M/C5N  | v3 : multipliers, voltage & FSB |
+ *  |  Ezra               | C5C      | v2 : multipliers & voltage      |
+ *  |  Ezra-T             | C5M      | v3 : multipliers, voltage & FSB |
+ *  |  Nehemiah           | C5N      | v3 : multipliers, voltage & FSB |
  *  +---------------------+----------+---------------------------------+
  *
  *  BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*
@@ -54,197 +55,6 @@
 
 #define __hlt()     __asm__ __volatile__("hlt": : :"memory")
 
-/*
- * Clock ratio tables.
- * The eblcr ones specify the ratio read from the CPU.
- * The clock_ratio ones specify what to write to the CPU.
- */
-
-/* VIA C3 Samuel 1  & Samuel 2 (stepping 0)*/
-static int __initdata longhaul1_clock_ratio[16] = {
-	-1, /* 0000 -> RESERVED */
-	30, /* 0001 ->  3.0x */
-	40, /* 0010 ->  4.0x */
-	-1, /* 0011 -> RESERVED */
-	-1, /* 0100 -> RESERVED */
-	35, /* 0101 ->  3.5x */
-	45, /* 0110 ->  4.5x */
-	55, /* 0111 ->  5.5x */
-	60, /* 1000 ->  6.0x */
-	70, /* 1001 ->  7.0x */
-	80, /* 1010 ->  8.0x */
-	50, /* 1011 ->  5.0x */
-	65, /* 1100 ->  6.5x */
-	75, /* 1101 ->  7.5x */
-	-1, /* 1110 -> RESERVED */
-	-1, /* 1111 -> RESERVED */
-};
-
-static int __initdata samuel1_eblcr[16] = {
-	50, /* 0000 -> RESERVED */
-	30, /* 0001 ->  3.0x */
-	40, /* 0010 ->  4.0x */
-	-1, /* 0011 -> RESERVED */
-	55, /* 0100 ->  5.5x */
-	35, /* 0101 ->  3.5x */
-	45, /* 0110 ->  4.5x */
-	-1, /* 0111 -> RESERVED */
-	-1, /* 1000 -> RESERVED */
-	70, /* 1001 ->  7.0x */
-	80, /* 1010 ->  8.0x */
-	60, /* 1011 ->  6.0x */
-	-1, /* 1100 -> RESERVED */
-	75, /* 1101 ->  7.5x */
-	-1, /* 1110 -> RESERVED */
-	65, /* 1111 ->  6.5x */
-};
-
-/* VIA C3 Samuel2 Stepping 1->15 & VIA C3 Ezra */
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
-static int __initdata samuel2_eblcr[16] = {
-	50,  /* 0000 ->  5.0x */
-	30,  /* 0001 ->  3.0x */
-	40,  /* 0010 ->  4.0x */
-	100, /* 0011 -> 10.0x */
-	55,  /* 0100 ->  5.5x */
-	35,  /* 0101 ->  3.5x */
-	45,  /* 0110 ->  4.5x */
-	110, /* 0111 -> 11.0x */
-	90,  /* 1000 ->  9.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	60,  /* 1011 ->  6.0x */
-	120, /* 1100 -> 12.0x */
-	75,  /* 1101 ->  7.5x */
-	130, /* 1110 -> 13.0x */
-	65,  /* 1111 ->  6.5x */
-};
-
-static int __initdata ezra_eblcr[16] = {
-	50,  /* 0000 ->  5.0x */
-	30,  /* 0001 ->  3.0x */
-	40,  /* 0010 ->  4.0x */
-	100, /* 0011 -> 10.0x */
-	55,  /* 0100 ->  5.5x */
-	35,  /* 0101 ->  3.5x */
-	45,  /* 0110 ->  4.5x */
-	95,  /* 0111 ->  9.5x */
-	90,  /* 1000 ->  9.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	60,  /* 1011 ->  6.0x */
-	120, /* 1100 -> 12.0x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	65,  /* 1111 ->  6.5x */
-};
-
-/* VIA C5M. */
-static int __initdata longhaul3_clock_ratio[32] = {
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
-	120, /* 1111 ->  12.0x */
-
-	-1,  /* 0000 -> RESERVED (10.0x) */
-	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
-	-1,  /* 0011 -> RESERVED (9.0x)*/
-	105, /* 0100 -> 10.5x */
-	115, /* 0101 -> 11.5x */
-	125, /* 0110 -> 12.5x */
-	135, /* 0111 -> 13.5x */
-	140, /* 1000 -> 14.0x */
-	150, /* 1001 -> 15.0x */
-	160, /* 1010 -> 16.0x */
-	130, /* 1011 -> 13.0x */
-	145, /* 1100 -> 14.5x */
-	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
-	-1,  /* 1111 -> RESERVED (12.0x) */
-};
-
-static int __initdata c5m_eblcr[32] = {
-	50,  /* 0000 ->  5.0x */
-	30,  /* 0001 ->  3.0x */
-	40,  /* 0010 ->  4.0x */
-	100, /* 0011 -> 10.0x */
-	55,  /* 0100 ->  5.5x */
-	35,  /* 0101 ->  3.5x */
-	45,  /* 0110 ->  4.5x */
-	95,  /* 0111 ->  9.5x */
-	90,  /* 1000 ->  9.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	60,  /* 1011 ->  6.0x */
-	120, /* 1100 -> 12.0x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	65,  /* 1111 ->  6.5x */
-
-	-1,  /* 0000 -> RESERVED (9.0x) */
-	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
-	-1,  /* 0011 -> RESERVED (10.0x)*/
-	135, /* 0100 -> 13.5x */
-	115, /* 0101 -> 11.5x */
-	125, /* 0110 -> 12.5x */
-	105, /* 0111 -> 10.5x */
-	130, /* 1000 -> 13.0x */
-	150, /* 1001 -> 15.0x */
-	160, /* 1010 -> 16.0x */
-	140, /* 1011 -> 14.0x */
-	-1,  /* 1100 -> RESERVED (12.0x) */
-	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
-	145, /* 1111 -> 14.5x */
-};
-
-/* Voltage scales. Div by 1000 to get actual voltage. */
-static int __initdata vrm85scales[32] = {
-	1250, 1200, 1150, 1100, 1050, 1800, 1750, 1700,
-	1650, 1600, 1550, 1500, 1450, 1400, 1350, 1300,
-	1275, 1225, 1175, 1125, 1075, 1825, 1775, 1725,
-	1675, 1625, 1575, 1525, 1475, 1425, 1375, 1325,
-};
-
-static int __initdata mobilevrmscales[32] = {
-	2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
-	1600, 1550, 1500, 1450, 1500, 1350, 1300, -1,
-	1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100,
-	1075, 1050, 1025, 1000, 975, 950, 925, -1,
-};
-
 /* Clock ratios multiplied by 10 */
 static int clock_ratio[32];
 static int eblcr_table[32];
@@ -254,18 +64,9 @@
 static struct cpufreq_frequency_table *longhaul_table;
 
 
-static int longhaul_get_cpu_fsb (void)
+static unsigned int calc_speed (int mult, int fsb)
 {
-	unsigned int eblcr_fsb_table[] = { 66, 133, 100, -1 };
-	unsigned long invalue=0,lo, hi;
-
-	if (fsb == 0) {
-		rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
-		invalue = (lo & (1<<18|1<<19)) >>18;
-		return eblcr_fsb_table[invalue];
-	} else {
-		return fsb;
-	}
+	return ((mult/10)*fsb) + ((mult%10)*(fsb/2));
 }
 
 
@@ -292,26 +93,27 @@
 
 static void longhaul_setstate (unsigned int clock_ratio_index)
 {
-	int vidindex, i;
+	int speed, mult;
 	struct cpufreq_freqs freqs;
 	union msr_longhaul longhaul;
 	union msr_bcr2 bcr2;
 
-	if (clock_ratio[clock_ratio_index] == -1)
+	mult = clock_ratio[clock_ratio_index];
+	if (mult == -1)
 		return;
 
-	if (((clock_ratio[clock_ratio_index] * fsb * 100) > highest_speed) ||
-	    ((clock_ratio[clock_ratio_index] * fsb * 100) < lowest_speed))
+	speed = calc_speed (mult, fsb);
+	if ((speed > highest_speed) || (speed < lowest_speed))
 		return;
 
-	freqs.old = longhaul_get_cpu_mult() * longhaul_get_cpu_fsb() * 100;
-	freqs.new = clock_ratio[clock_ratio_index] * fsb * 100;
+	freqs.old = calc_speed (longhaul_get_cpu_mult(), fsb);
+	freqs.new = speed;
 	freqs.cpu = 0; /* longhaul.c is UP only driver */
-	
+
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
-	dprintk (KERN_INFO PFX "FSB:%d Mult(x10):%d\n",
-				fsb * 100, clock_ratio[clock_ratio_index]);
+	dprintk (KERN_INFO PFX "FSB:%d Mult:%d.%dx\n", fsb,
+				mult/10, mult%10);
 
 	switch (longhaul_version) {
 	case 1:
@@ -329,6 +131,14 @@
 		wrmsrl (MSR_VIA_BCR2, bcr2.val);
 		break;
 
+	/*
+	 * Longhaul v2. (Ezra [C5C])
+	 * We can scale voltage with this too, but that's currently
+	 * disabled until we come up with a decent 'match freq to voltage'
+	 * algorithm.
+	 * We also need to do the voltage/freq setting in order depending
+	 * on the direction of scaling (like we do in powernow-k7.c)
+	 */
 	case 2:
 		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 		longhaul.bits.SoftBusRatio = clock_ratio_index & 0xf;
@@ -337,39 +147,16 @@
 		/* We must program the revision key only with values we
 		 * know about, not blindly copy it from 0:3 */
 		longhaul.bits.RevisionKey = 1;
-
-		if (can_scale_voltage) {
-			/* PB: TODO fix this up */
-			vidindex = (((highest_speed-lowest_speed) / (fsb/2)) -
-					((highest_speed-((clock_ratio[clock_ratio_index] * fsb * 100)/1000)) / (fsb/2)));
-			for (i=0;i<32;i++) {
-				dprintk (KERN_INFO "VID hunting. Looking for %d, found %d\n",
-						minvid+(vidindex*25), voltage_table[i]);
-				if (voltage_table[i]==(minvid + (vidindex * 25)))
-					break;
-			}
-			if (i==32)
-				goto bad_voltage;
-
-			dprintk (KERN_INFO PFX "Desired vid index=%d\n", i);
-#if 0
-			longhaul.bits.SoftVID = i;
-			longhaul.bits.EnableSoftVID = 1;
-#endif
-		}
-/* FIXME: Do voltage and freq seperatly like we do in powernow-k7 */
-bad_voltage:
 		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 		__hlt();
 
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-		longhaul.bits.EnableSoftBusRatio = 0;
-		if (can_scale_voltage)
-			longhaul.bits.EnableSoftVID = 0;
-		longhaul.bits.RevisionKey = 1;
-		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 		break;
 
+	/*
+	 * Longhaul v3. (Ezra-T [C5M], Nehemiah [C5N])
+	 * This can also do voltage scaling, but see above.
+	 * Ezra-T was alleged to do FSB scaling too, but it never worked in practice.
+	 */
 	case 3:
 		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 		longhaul.bits.SoftBusRatio = clock_ratio_index & 0xf;
@@ -378,7 +165,6 @@
 		/* We must program the revision key only with values we
 		 * know about, not blindly copy it from 0:3 */
 		longhaul.bits.RevisionKey = 3;	/* SoftVID & SoftBSEL */
-
 		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 		__hlt();
 
@@ -392,6 +178,39 @@
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 }
 
+/*
+ * Centaur decided to make life a little more tricky.
+ * Only longhaul v1 is allowed to read EBLCR BSEL[0:1].
+ * Samuel2 and above have to try and guess what the FSB is.
+ * We do this by assuming we booted at maximum multiplier, and interpolate
+ * between that value multiplied by possible FSBs and cpu_mhz which
+ * was calculated at boot time. Really ugly, but no other way to do this.
+ */
+static int _guess (int guess, int maxmult)
+{
+	int target;
+
+	target = ((maxmult/10)*guess);
+	if (maxmult%10 != 0)
+		target += (guess/2);
+	target &= ~0xf;
+	return target;
+}
+
+static int guess_fsb(int maxmult)
+{
+	int speed = (cpu_khz/1000) & ~0xf;
+	int i;
+	int speeds[3] = { 66, 100, 133 };
+
+	for (i=0; i<3; i++) {
+		if (_guess(speeds[i],maxmult) == speed)
+			return speeds[i];
+	}
+	return 0;
+}
+
+
 
 static int __init longhaul_get_ranges (void)
 {
@@ -402,6 +221,8 @@
 		-1,110,120,-1,135,115,125,105,130,150,160,140,-1,155,-1,145 };
 	unsigned int j, k = 0;
 	union msr_longhaul longhaul;
+	unsigned long lo, hi;
+	unsigned int eblcr_fsb_table[] = { 66, 133, 100, -1 };
 
 	switch (longhaul_version) {
 	case 1:
@@ -409,6 +230,9 @@
 		   Assume min=3.0x & max = whatever we booted at. */
 		minmult = 30;
 		maxmult = longhaul_get_cpu_mult();
+		rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
+		invalue = (lo & (1<<18|1<<19)) >>18;
+		fsb = eblcr_fsb_table[invalue];
 		break;
 
 	case 2 ... 3:
@@ -419,34 +243,35 @@
 			invalue += 16;
 		maxmult=multipliers[invalue];
 
-#if 0
 		invalue = longhaul.bits.MinMHzBR;
-		if (longhaul.bits.MinMHzBR4);
-			invalue += 16;
-		minmult = multipliers[invalue];
-#else
-		minmult = 30; /* as per spec */
-#endif
+		if (longhaul.bits.MinMHzBR4 == 1)
+			minmult = 30;
+		else
+			minmult = multipliers[invalue];
+
+		fsb = guess_fsb(maxmult);
 		break;
 	}
 
-	highest_speed = maxmult * fsb * 100;
-	lowest_speed = minmult * fsb * 100;
-	dprintk (KERN_INFO PFX "MinMult(x10)=%d MaxMult(x10)=%d\n",
-		 minmult, maxmult);
-	dprintk (KERN_INFO PFX "Lowestspeed=%d Highestspeed=%d\n",
-		 lowest_speed, highest_speed);
+	dprintk (KERN_INFO PFX "MinMult=%d.%dx MaxMult=%d.%dx\n",
+		 minmult/10, minmult%10, maxmult/10, maxmult%10);
+	highest_speed = calc_speed (maxmult, fsb);
+	lowest_speed = calc_speed (minmult,fsb);
+	dprintk (KERN_INFO PFX "FSB: %dMHz Lowestspeed=%dMHz Highestspeed=%dMHz\n",
+		 fsb, lowest_speed, highest_speed);
 
 	longhaul_table = kmalloc((numscales + 1) * sizeof(struct cpufreq_frequency_table), GFP_KERNEL);
 	if(!longhaul_table)
 		return -ENOMEM;
 
-	for (j=0; (j<numscales); j++) {
-		if (clock_ratio[j] == -1)
+	for (j=0; j < numscales; j++) {
+		unsigned int ratio;
+		ratio = clock_ratio[j];
+		if (ratio == -1)
 			continue;
-		if (((unsigned int)clock_ratio[j] > maxmult) || ((unsigned int)clock_ratio[j] < minmult))
+		if (ratio > maxmult || ratio < minmult)
 			continue;
-		longhaul_table[k].frequency= clock_ratio[j] * fsb * 100;
+		longhaul_table[k].frequency = calc_speed (ratio, fsb);
 		longhaul_table[k].index	= (j << 8);
 		k++;
 	}
@@ -541,10 +366,12 @@
 static int longhaul_cpu_init (struct cpufreq_policy *policy)
 {
 	struct cpuinfo_x86 *c = cpu_data;
+	char *cpuname=NULL;
 	int ret;
 
 	switch (c->x86_model) {
-	case 6:		/* VIA C3 Samuel C5A */
+	case 6:
+		cpuname = "C3 'Samuel' [C5A]";
 		longhaul_version=1;
 		memcpy (clock_ratio, longhaul1_clock_ratio, sizeof(longhaul1_clock_ratio));
 		memcpy (eblcr_table, samuel1_eblcr, sizeof(samuel1_eblcr));
@@ -553,11 +380,13 @@
 	case 7:		/* C5B / C5C */
 		switch (c->x86_mask) {
 		case 0:
+			cpuname = "C3 'Samuel 2' [C5B]";
 			longhaul_version=1;
 			memcpy (clock_ratio, longhaul1_clock_ratio, sizeof(longhaul1_clock_ratio));
 			memcpy (eblcr_table, samuel2_eblcr, sizeof(samuel2_eblcr));
 			break;
 		case 1 ... 15:
+			cpuname = "C3 'Ezra' [C5C]";
 			longhaul_version=2;
 			memcpy (clock_ratio, longhaul2_clock_ratio, sizeof(longhaul2_clock_ratio));
 			memcpy (eblcr_table, ezra_eblcr, sizeof(ezra_eblcr));
@@ -565,17 +394,26 @@
 		}
 		break;
 
-	case 8:		/* C5M/C5N */
-		return -ENODEV; // Waiting on updated docs from VIA before this is usable
+	case 8:
+		cpuname = "C3 'Ezra-T [C5M]";
 		longhaul_version=3;
 		numscales=32;
 		memcpy (clock_ratio, longhaul3_clock_ratio, sizeof(longhaul3_clock_ratio));
 		memcpy (eblcr_table, c5m_eblcr, sizeof(c5m_eblcr));
 		break;
+	/*
+	case 9:
+		cpuname = "C3 'Nehemiah' [C5N]";
+		longhaul_version=3;
+		numscales=32;
+	*/
+	default:
+		cpuname = "Unknown";
+		break;
 	}
 
-	printk (KERN_INFO PFX "VIA CPU detected. Longhaul version %d supported\n",
-					longhaul_version);
+	printk (KERN_INFO PFX "VIA %s CPU detected. Longhaul v%d supported.\n",
+					cpuname, longhaul_version);
 
 	if ((longhaul_version==2 || longhaul_version==3) && (dont_scale_voltage==0))
 		longhaul_setup_voltagescaling();
@@ -586,8 +424,7 @@
 
  	policy->policy = CPUFREQ_POLICY_PERFORMANCE;
  	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
-
-	policy->cur = (unsigned int) (longhaul_get_cpu_fsb() * longhaul_get_cpu_mult() * 100);
+	policy->cur = calc_speed (longhaul_get_cpu_mult(), fsb);
 
 	return cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
 }
@@ -604,14 +441,20 @@
 {
 	struct cpuinfo_x86 *c = cpu_data;
 
-	if ((c->x86_vendor != X86_VENDOR_CENTAUR) || (c->x86 !=6) )
+	if (c->x86_vendor != X86_VENDOR_CENTAUR || c->x86 != 6)
 		return -ENODEV;
 
 	switch (c->x86_model) {
 	case 6 ... 7:
 		return cpufreq_register_driver(&longhaul_driver);
 	case 8:
-		return -ENODEV;
+		printk (KERN_INFO PFX "Ezra-T unsupported: Waiting on updated docs "
+						"from VIA before this is usable.\n");
+		break;
+	case 9:
+		printk (KERN_INFO PFX "Nehemiah unsupported: Waiting on working silicon "
+						"from VIA before this is usable.\n");
+		break;
 	default:
 		printk (KERN_INFO PFX "Unknown VIA CPU. Contact davej@codemonkey.org.uk\n");
 	}

Index: longhaul.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.h,v
retrieving revision 1.1
retrieving revision 1.1.2.1
diff -u -r1.1 -r1.1.2.1
--- longhaul.h	19 Aug 2003 13:38:32 -0000	1.1
+++ longhaul.h	30 Sep 2003 11:52:08 -0000	1.1.2.1
@@ -47,3 +47,204 @@
 	unsigned long long val;
 };
 
+/*
+ * Clock ratio tables. Div/Mod by 10 to get ratio.
+ * The eblcr ones specify the ratio read from the CPU.
+ * The clock_ratio ones specify what to write to the CPU.
+ */
+
+/*
+ * VIA C3 Samuel 1  & Samuel 2 (stepping 0)
+ */
+static int __initdata longhaul1_clock_ratio[16] = {
+	-1, /* 0000 -> RESERVED */
+	30, /* 0001 ->  3.0x */
+	40, /* 0010 ->  4.0x */
+	-1, /* 0011 -> RESERVED */
+	-1, /* 0100 -> RESERVED */
+	35, /* 0101 ->  3.5x */
+	45, /* 0110 ->  4.5x */
+	55, /* 0111 ->  5.5x */
+	60, /* 1000 ->  6.0x */
+	70, /* 1001 ->  7.0x */
+	80, /* 1010 ->  8.0x */
+	50, /* 1011 ->  5.0x */
+	65, /* 1100 ->  6.5x */
+	75, /* 1101 ->  7.5x */
+	-1, /* 1110 -> RESERVED */
+	-1, /* 1111 -> RESERVED */
+};
+
+static int __initdata samuel1_eblcr[16] = {
+	50, /* 0000 -> RESERVED */
+	30, /* 0001 ->  3.0x */
+	40, /* 0010 ->  4.0x */
+	-1, /* 0011 -> RESERVED */
+	55, /* 0100 ->  5.5x */
+	35, /* 0101 ->  3.5x */
+	45, /* 0110 ->  4.5x */
+	-1, /* 0111 -> RESERVED */
+	-1, /* 1000 -> RESERVED */
+	70, /* 1001 ->  7.0x */
+	80, /* 1010 ->  8.0x */
+	60, /* 1011 ->  6.0x */
+	-1, /* 1100 -> RESERVED */
+	75, /* 1101 ->  7.5x */
+	-1, /* 1110 -> RESERVED */
+	65, /* 1111 ->  6.5x */
+};
+
+/*
+ * VIA C3 Samuel2 Stepping 1->15 & VIA C3 Ezra
+ */
+static int __initdata longhaul2_clock_ratio[16] = {
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
+static int __initdata samuel2_eblcr[16] = {
+	50,  /* 0000 ->  5.0x */
+	30,  /* 0001 ->  3.0x */
+	40,  /* 0010 ->  4.0x */
+	100, /* 0011 -> 10.0x */
+	55,  /* 0100 ->  5.5x */
+	35,  /* 0101 ->  3.5x */
+	45,  /* 0110 ->  4.5x */
+	110, /* 0111 -> 11.0x */
+	90,  /* 1000 ->  9.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	60,  /* 1011 ->  6.0x */
+	120, /* 1100 -> 12.0x */
+	75,  /* 1101 ->  7.5x */
+	130, /* 1110 -> 13.0x */
+	65,  /* 1111 ->  6.5x */
+};
+
+static int __initdata ezra_eblcr[16] = {
+	50,  /* 0000 ->  5.0x */
+	30,  /* 0001 ->  3.0x */
+	40,  /* 0010 ->  4.0x */
+	100, /* 0011 -> 10.0x */
+	55,  /* 0100 ->  5.5x */
+	35,  /* 0101 ->  3.5x */
+	45,  /* 0110 ->  4.5x */
+	95,  /* 0111 ->  9.5x */
+	90,  /* 1000 ->  9.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	60,  /* 1011 ->  6.0x */
+	120, /* 1100 -> 12.0x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	65,  /* 1111 ->  6.5x */
+};
+
+/*
+ * VIA C3 (Ezra-T) [C5M].
+ */
+static int __initdata longhaul3_clock_ratio[32] = {
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
+	120, /* 1111 ->  12.0x */
+
+	-1,  /* 0000 -> RESERVED (10.0x) */
+	110, /* 0001 -> 11.0x */
+	120, /* 0010 -> 12.0x */
+	-1,  /* 0011 -> RESERVED (9.0x)*/
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
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	-1,  /* 1111 -> RESERVED (12.0x) */
+};
+
+static int __initdata c5m_eblcr[32] = {
+	50,  /* 0000 ->  5.0x */
+	30,  /* 0001 ->  3.0x */
+	40,  /* 0010 ->  4.0x */
+	100, /* 0011 -> 10.0x */
+	55,  /* 0100 ->  5.5x */
+	35,  /* 0101 ->  3.5x */
+	45,  /* 0110 ->  4.5x */
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
+	-1,  /* 0000 -> RESERVED (9.0x) */
+	110, /* 0001 -> 11.0x */
+	120, /* 0010 -> 12.0x */
+	-1,  /* 0011 -> RESERVED (10.0x)*/
+	135, /* 0100 -> 13.5x */
+	115, /* 0101 -> 11.5x */
+	125, /* 0110 -> 12.5x */
+	105, /* 0111 -> 10.5x */
+	130, /* 1000 -> 13.0x */
+	150, /* 1001 -> 15.0x */
+	160, /* 1010 -> 16.0x */
+	140, /* 1011 -> 14.0x */
+	-1,  /* 1100 -> RESERVED (12.0x) */
+	155, /* 1101 -> 15.5x */
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	145, /* 1111 -> 14.5x */
+};
+
+
+/* 
+ * Voltage scales. Div/Mod by 1000 to get actual voltage.
+ * Which scale to use depends on the VRM type in use.
+ */
+static int __initdata vrm85scales[32] = {
+	1250, 1200, 1150, 1100, 1050, 1800, 1750, 1700,
+	1650, 1600, 1550, 1500, 1450, 1400, 1350, 1300,
+	1275, 1225, 1175, 1125, 1075, 1825, 1775, 1725,
+	1675, 1625, 1575, 1525, 1475, 1425, 1375, 1325,
+};
+
+static int __initdata mobilevrmscales[32] = {
+	2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
+	1600, 1550, 1500, 1450, 1500, 1350, 1300, -1,
+	1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100,
+	1075, 1050, 1025, 1000, 975, 950, 925, -1,
+};
+
