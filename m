From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq longhaul.c, 1.93.2.7,
	1.93.2.8 longhaul.h, 1.1.2.2, 1.1.2.3
Date: Fri, 09 Jul 2004 23:36:38 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1Bj3yw-0000t1-8z@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv3255

Modified Files:
      Tag: LINUX_2_4
	longhaul.c longhaul.h 
Log Message:
Merge Dave Jones 2.6 driver.  Nehemiah should work now.


Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.93.2.7
retrieving revision 1.93.2.8
diff -u -r1.93.2.7 -r1.93.2.8
--- longhaul.c	13 Apr 2004 15:47:13 -0000	1.93.2.7
+++ longhaul.c	9 Jul 2004 22:36:34 -0000	1.93.2.8
@@ -32,23 +32,34 @@
 
 #define DEBUG
 
-#ifdef DEBUG
-#define dprintk(msg...) printk(msg)
-#else
-#define dprintk(msg...) do { } while(0)
-#endif
-
 #define PFX "longhaul: "
 
 static unsigned int numscales=16, numvscales;
+static unsigned int fsb;
 static int minvid, maxvid;
 static int can_scale_voltage;
+static unsigned int minmult, maxmult;
 static int vrmrev;
 
 
 /* Module parameters */
 static int dont_scale_voltage;
-static unsigned int fsb;
+static int debug;
+
+static void dprintk(const char *fmt, ...)
+{
+	char s[256];
+	va_list args;
+
+	if (debug == 0)
+		return;
+
+	va_start(args, fmt);
+	vsprintf(s, fmt, args);
+	printk(s);
+	va_end(args);
+}
+
 
 #define __hlt()     __asm__ __volatile__("hlt": : :"memory")
 
@@ -61,7 +72,7 @@
 static struct cpufreq_frequency_table *longhaul_table;
 
 
-static unsigned int calc_speed (int mult, int fsb)
+static unsigned int calc_speed(int mult, int fsb)
 {
 	int khz;
 	khz = (mult/10)*fsb;
@@ -72,13 +83,13 @@
 }
 
 
-static int longhaul_get_cpu_mult (void)
+static int longhaul_get_cpu_mult(void)
 {
 	unsigned long invalue=0,lo, hi;
 
 	rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
 	invalue = (lo & (1<<22|1<<23|1<<24|1<<25)) >>22;
-	if (longhaul_version==2) {
+	if (longhaul_version==2 || longhaul_version==3) {
 		if (lo & (1<<27))
 			invalue+=16;
 	}
@@ -93,7 +104,7 @@
  * Sets a new clock ratio, and -if applicable- a new Front Side Bus
  */
 
-static void longhaul_setstate (unsigned int clock_ratio_index)
+static void longhaul_setstate(unsigned int clock_ratio_index)
 {
 	int speed, mult;
 	struct cpufreq_freqs freqs;
@@ -114,8 +125,7 @@
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
-	dprintk (KERN_INFO PFX "FSB:%d Mult:%d.%dx\n", fsb,
-				mult/10, mult%10);
+	dprintk (KERN_INFO PFX "FSB:%d Mult:%d.%dx\n", fsb, mult/10, mult%10);
 
 	switch (longhaul_version) {
 	case 1:
@@ -158,6 +168,22 @@
 		longhaul.bits.RevisionKey = 3;
 		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 		break;
+	case 3:
+		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+		longhaul.bits.SoftBusRatio = clock_ratio_index & 0xf;
+		longhaul.bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
+		longhaul.bits.EnableSoftBusRatio = 1;
+
+		longhaul.bits.RevisionKey = 0x0;
+
+		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+		__hlt();
+
+		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+		longhaul.bits.EnableSoftBusRatio = 0;
+		longhaul.bits.RevisionKey = 0xf;
+		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+		break;
 	}
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
@@ -174,7 +200,7 @@
 
 #define ROUNDING	0xf
 
-static int _guess (int guess, int maxmult)
+static int _guess(int guess)
 {
 	int target;
 
@@ -187,7 +213,7 @@
 }
 
 
-static int guess_fsb(int maxmult)
+static int guess_fsb(void)
 {
 	int speed = (cpu_khz/1000);
 	int i;
@@ -197,25 +223,25 @@
 	speed &= ~ROUNDING;
 
 	for (i=0; i<3; i++) {
-		if (_guess(speeds[i],maxmult) == speed)
+		if (_guess(speeds[i]) == speed)
 			return speeds[i];
 	}
 	return 0;
 }
 
 
-static int __init longhaul_get_ranges (void)
+static int __init longhaul_get_ranges(void)
 {
 	struct cpuinfo_x86 *c = cpu_data;
 	unsigned long invalue;
-	unsigned int minmult=0, maxmult=0;
 	unsigned int multipliers[32]= {
 		50,30,40,100,55,35,45,95,90,70,80,60,120,75,85,65,
 		-1,110,120,-1,135,115,125,105,130,150,160,140,-1,155,-1,145 };
 	unsigned int j, k = 0;
 	union msr_longhaul longhaul;
 	unsigned long lo, hi;
-	unsigned int eblcr_fsb_table[] = { 66, 133, 100, -1 };
+	unsigned int eblcr_fsb_table_v1[] = { 66, 133, 100, -1 };
+	unsigned int eblcr_fsb_table_v2[] = { 133, 100, -1, 66 };
 
 	switch (longhaul_version) {
 	case 1:
@@ -226,16 +252,14 @@
 		rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
 		invalue = (lo & (1<<18|1<<19)) >>18;
 		if (c->x86_model==6)
-			fsb = eblcr_fsb_table[invalue];
+			fsb = eblcr_fsb_table_v1[invalue];
 		else
-			fsb = guess_fsb(maxmult);
+			fsb = guess_fsb();
 		break;
 
 	case 2:
 		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 
-		//TODO: Nehemiah may have borken MaxMHzBR.
-		// need to extrapolate from FSB.
 		invalue = longhaul.bits.MaxMHzBR;
 		if (longhaul.bits.MaxMHzBR4)
 			invalue += 16;
@@ -247,21 +271,38 @@
 		else
 			minmult = multipliers[invalue];
 
-		switch (longhaul.bits.MaxMHzFSB) {
-		case 0x0:	fsb=133;
-				break;
-		case 0x1:	fsb=100;
-				break;
-		case 0x2:	printk (KERN_INFO PFX "Invalid (reserved) FSB!\n");
-			return -EINVAL;
-		case 0x3:	fsb=66;
-				break;
-		}
+		fsb = eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
+		break;
+
+	case 3:
+		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+
+		/*
+		 * TODO: This code works, but raises a lot of questions.
+		 * - Some Nehemiah's seem to have broken Min/MaxMHzBR's.
+		 *   We get around this by using a hardcoded multiplier of 5.0x
+		 *   for the minimimum speed, and the speed we booted up at for the max.
+		 *   This is done in longhaul_get_cpu_mult() by reading the EBLCR register.
+		 * - According to some VIA documentation EBLCR is only
+		 *   in pre-Nehemiah C3s. How this still works is a mystery.
+		 *   We're possibly using something undocumented and unsupported,
+		 *   But it works, so we don't grumble.
+		 */
+		minmult=50;
+		maxmult=longhaul_get_cpu_mult();
+
+		fsb = eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
 		break;
 	}
 
 	dprintk (KERN_INFO PFX "MinMult=%d.%dx MaxMult=%d.%dx\n",
 		 minmult/10, minmult%10, maxmult/10, maxmult%10);
+
+	if (fsb == -1) {
+		printk (KERN_INFO PFX "Invalid (reserved) FSB!\n");
+		return -EINVAL;
+	}
+
 	highest_speed = calc_speed (maxmult, fsb);
 	lowest_speed = calc_speed (minmult,fsb);
 	dprintk (KERN_INFO PFX "FSB: %dMHz Lowestspeed=%dMHz Highestspeed=%dMHz\n",
@@ -363,9 +404,9 @@
 }
 
 
-static int longhaul_target (struct cpufreq_policy *policy,
-			    unsigned int target_freq,
-			    unsigned int relation)
+static int longhaul_target(struct cpufreq_policy *policy,
+			   unsigned int target_freq,
+			   unsigned int relation)
 {
 	unsigned int table_index = 0;
  	unsigned int new_clock_ratio = 0;
@@ -380,7 +421,16 @@
 	return 0;
 }
 
-static int longhaul_cpu_init (struct cpufreq_policy *policy)
+#if 0
+static unsigned int longhaul_get(unsigned int cpu)
+{
+	if (cpu)
+		return 0;
+	return (calc_speed (longhaul_get_cpu_mult(), fsb));
+}
+#endif
+
+static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 {
 	struct cpuinfo_x86 *c = cpu_data;
 	char *cpuname=NULL;
@@ -423,11 +473,25 @@
 		break;
 
 	case 9:
-		cpuname = "C3 'Nehemiah' [C5N]";
-		longhaul_version=2;
+		longhaul_version=3;
 		numscales=32;
-		memcpy (clock_ratio, nehemiah_clock_ratio, sizeof(nehemiah_clock_ratio));
-		memcpy (eblcr_table, nehemiah_eblcr, sizeof(nehemiah_eblcr));
+		switch (c->x86_mask) {
+		case 0 ... 1:
+			cpuname = "C3 'Nehemiah A' [C5N]";
+			memcpy (clock_ratio, nehemiah_a_clock_ratio, sizeof(nehemiah_a_clock_ratio));
+			memcpy (eblcr_table, nehemiah_a_eblcr, sizeof(nehemiah_a_eblcr));
+			break;
+		case 2 ... 4:
+			cpuname = "C3 'Nehemiah B' [C5N]";
+			memcpy (clock_ratio, nehemiah_b_clock_ratio, sizeof(nehemiah_b_clock_ratio));
+			memcpy (eblcr_table, nehemiah_b_eblcr, sizeof(nehemiah_b_eblcr));
+			break;
+		case 5 ... 15:
+			cpuname = "C3 'Nehemiah C' [C5N]";
+			memcpy (clock_ratio, nehemiah_c_clock_ratio, sizeof(nehemiah_c_clock_ratio));
+			memcpy (eblcr_table, nehemiah_c_eblcr, sizeof(nehemiah_c_eblcr));
+			break;
+		}
 		break;
 
 	default:
@@ -467,12 +531,8 @@
 		return -ENODEV;
 
 	switch (c->x86_model) {
-	case 6 ... 8:
+	case 6 ... 9:
 		return cpufreq_register_driver(&longhaul_driver);
-	case 9:
-		printk (KERN_INFO PFX "Nehemiah unsupported: Waiting on working silicon "
-						"from VIA before this is usable.\n");
-		break;
 	default:
 		printk (KERN_INFO PFX "Unknown VIA CPU. Contact davej@codemonkey.org.uk\n");
 	}
@@ -486,7 +546,10 @@
 	kfree(longhaul_table);
 }
 
-MODULE_PARM (dont_scale_voltage, "i");
+MODULE_PARM(dont_scale_voltage, "i");
+MODULE_PARM_DESC(dont_scale_voltage, "Don't scale voltage of processor");
+MODULE_PARM(debug, "i");
+MODULE_PARM_DESC(debug, "Dump debugging information.");
 
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Longhaul driver for VIA Cyrix processors.");

Index: longhaul.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.h,v
retrieving revision 1.1.2.2
retrieving revision 1.1.2.3
diff -u -r1.1.2.2 -r1.1.2.3
--- longhaul.h	9 Dec 2003 08:58:33 -0000	1.1.2.2
+++ longhaul.h	9 Jul 2004 22:36:34 -0000	1.1.2.3
@@ -234,14 +234,15 @@
 
 /*
  * VIA C3 Nehemiah */
-static int __initdata nehemiah_clock_ratio[32] = {
+ 
+static int __initdata nehemiah_a_clock_ratio[32] = {
 	100, /* 0000 -> 10.0x */
 	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 -> RESERVED */
+	-1,  /* 0010 ->  RESERVED */
 	90,  /* 0011 ->  9.0x */
 	95,  /* 0100 ->  9.5x */
-	-1,  /* 0101 -> RESERVED */
-	-1,  /* 0110 -> RESERVED */
+	-1,  /* 0101 ->  RESERVED */
+	-1,  /* 0110 ->  RESERVED */
 	55,  /* 0111 ->  5.5x */
 	60,  /* 1000 ->  6.0x */
 	70,  /* 1001 ->  7.0x */
@@ -250,8 +251,77 @@
 	65,  /* 1100 ->  6.5x */
 	75,  /* 1101 ->  7.5x */
 	85,  /* 1110 ->  8.5x */
-	120, /* 1111 ->  12.0x */
+	120, /* 1111 -> 12.0x */
+	100, /* 0000 -> 10.0x */
+	-1,  /* 0001 -> RESERVED */
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
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	120, /* 1111 -> 12.0x */
+};
+
+static int __initdata  nehemiah_b_clock_ratio[32] = {
+	100, /* 0000 -> 10.0x */
+	160, /* 0001 -> 16.0x */
+	-1,  /* 0010 ->  RESERVED */
+	90,  /* 0011 ->  9.0x */
+	95,  /* 0100 ->  9.5x */
+	-1,  /* 0101 ->  RESERVED */
+	-1,  /* 0110 ->  RESERVED */
+	55,  /* 0111 ->  5.5x */
+	60,  /* 1000 ->  6.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	50,  /* 1011 ->  5.0x */
+	65,  /* 1100 ->  6.5x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	120, /* 1111 -> 12.0x */
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
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	120, /* 1111 -> 12.0x */
+};
 
+static int __initdata  nehemiah_c_clock_ratio[32] = {
+	100, /* 0000 -> 10.0x */
+	160, /* 0001 -> 16.0x */
+	40,  /* 0010 ->  RESERVED */
+	90,  /* 0011 ->  9.0x */
+	95,  /* 0100 ->  9.5x */
+	-1,  /* 0101 ->  RESERVED */
+	45,  /* 0110 ->  RESERVED */
+	55,  /* 0111 ->  5.5x */
+	60,  /* 1000 ->  6.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	50,  /* 1011 ->  5.0x */
+	65,  /* 1100 ->  6.5x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	120, /* 1111 -> 12.0x */
 	100, /* 0000 -> 10.0x */
 	110, /* 0001 -> 11.0x */
 	120, /* 0010 -> 12.0x */
@@ -266,18 +336,53 @@
 	130, /* 1011 -> 13.0x */
 	145, /* 1100 -> 14.5x */
 	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED */
+	-1,  /* 1110 -> RESERVED (13.0x) */
 	120, /* 1111 -> 12.0x */
 };
 
-static int __initdata nehemiah_eblcr[32] = {
+static int __initdata nehemiah_a_eblcr[32] = {
 	50,  /* 0000 ->  5.0x */
 	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 -> RESERVED */
+	-1,  /* 0010 ->  RESERVED */
 	100, /* 0011 -> 10.0x */
 	55,  /* 0100 ->  5.5x */
-	-1,  /* 0101 -> RESERVED */
-	-1,  /* 0110 -> RESERVED */
+	-1,  /* 0101 ->  RESERVED */
+	-1,  /* 0110 ->  RESERVED */
+	95,  /* 0111 ->  9.5x */
+	90,  /* 1000 ->  9.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	60,  /* 1011 ->  6.0x */
+	120, /* 1100 -> 12.0x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	65,  /* 1111 ->  6.5x */
+	90,  /* 0000 ->  9.0x */
+	-1,  /* 0001 -> RESERVED */
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
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	145 /* 1111 -> 14.5x */
+   /* end of table  */
+};
+static int __initdata nehemiah_b_eblcr[32] = {
+	50,  /* 0000 ->  5.0x */
+	160, /* 0001 -> 16.0x */
+	-1,  /* 0010 ->  RESERVED */
+	100, /* 0011 -> 10.0x */
+	55,  /* 0100 ->  5.5x */
+	-1,  /* 0101 ->  RESERVED */
+	-1,  /* 0110 ->  RESERVED */
 	95,  /* 0111 ->  9.5x */
 	90,  /* 1000 ->  9.0x */
 	70,  /* 1001 ->  7.0x */
@@ -287,7 +392,6 @@
 	75,  /* 1101 ->  7.5x */
 	85,  /* 1110 ->  8.5x */
 	65,  /* 1111 ->  6.5x */
-
 	90,  /* 0000 ->  9.0x */
 	110, /* 0001 -> 11.0x */
 	120, /* 0010 -> 12.0x */
@@ -302,9 +406,46 @@
 	140, /* 1011 -> 14.0x */
 	120, /* 1100 -> 12.0x */
 	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED */
-	-1,  /* 1111 -> RESERVED */
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	145 /* 1111 -> 14.5x */
+	   /* end of table  */
 };
+static int __initdata nehemiah_c_eblcr[32] = {
+	50,  /* 0000 ->  5.0x */
+	160, /* 0001 -> 16.0x */
+	40,  /* 0010 ->  RESERVED */
+	100, /* 0011 -> 10.0x */
+	55,  /* 0100 ->  5.5x */
+	-1,  /* 0101 ->  RESERVED */
+	45,  /* 0110 ->  RESERVED */
+	95,  /* 0111 ->  9.5x */
+	90,  /* 1000 ->  9.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	60,  /* 1011 ->  6.0x */
+	120, /* 1100 -> 12.0x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	65,  /* 1111 ->  6.5x */
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
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	145 /* 1111 -> 14.5x */
+	  /* end of table  */
+};
+
 /* 
  * Voltage scales. Div/Mod by 1000 to get actual voltage.
  * Which scale to use depends on the VRM type in use.
