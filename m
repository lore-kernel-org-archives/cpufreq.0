From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Use information from Longhaul
Date: Sun, 09 Jul 2006 11:53:49 +0200
Message-ID: <44B0D22D.2030805@interia.pl>
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

First. I lost very important line in do_powersaver. Again. Sorry.

Longhaul don't report minimum multiplier. It reports minimum frequency.
So not always minimum multiplier at minimum FSB is really minimum.
This is most important for Nehemiah witch allows FSB 66MHz, 100MHz and=20
133MHz. Ezra seems to support only 100MHz and 133MHz so in this case=20
minimum multiplier at min FSB reported is in fact minimum PLL multiplier.
So we are testing against min/max frequency. Minimum PLL multiplier is=20
from clock_ratio table. If processor will report multiplier less then=20
5.0 then reported multiplier will be added to clock_ratio table.

Looks like all VIA CPUs allow to read FSB frequency from EBL_CR_POWERON.
Only some have 66MHz reserved.

More precise speed calculations. This is bad when kernel first reports=20
999MHz and we are saying later that max is 997MHz.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

--- linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c.orig	2006-07=
-08 22:21:35.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-09 1=
1:14:17.000000000 +0200
@@ -53,11 +53,12 @@
=20
 static int cpu_model;
 static unsigned int numscales=3D16, numvscales;
-static unsigned int fsb;
+static unsigned int fsb, fsb_min;
 static int minvid, maxvid;
 static unsigned int minmult, maxmult;
 static int can_scale_voltage;
 static int vrmrev;
+static int old_speed;
 static struct acpi_processor *pr =3D NULL;
 static struct acpi_processor_cx *cx =3D NULL;
=20
@@ -98,12 +99,10 @@ static char *print_speed(int speed)
 #endif
=20
=20
-static unsigned int calc_speed(int mult)
+static unsigned int calc_speed(int mult, int fsb)
 {
 	int khz;
-	khz =3D (mult/10)*fsb;
-	if (mult%10)
-		khz +=3D fsb/2;
+	khz =3D (mult * fsb + 50) / 100;
 	khz *=3D 1000;
 	return khz;
 }
@@ -162,6 +161,7 @@ static void do_powersaver(int cx_address
 	longhaul.bits.RevisionKey =3D longhaul.bits.RevisionID;
 	longhaul.bits.SoftBusRatio =3D clock_ratio_index & 0xf;
 	longhaul.bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
+	longhaul.bits.EnableSoftBusRatio =3D 1;
=20
 	/* Sync to timer tick */
 	safe_halt();
@@ -193,23 +193,20 @@ static void longhaul_setstate(unsigned i
 {
 	int speed, mult;
 	struct cpufreq_freqs freqs;
-	static unsigned int old_ratio=3D-1;
 	unsigned long flags;
 	unsigned int pic1_mask, pic2_mask;
=20
-	if (old_ratio =3D=3D clock_ratio_index)
-		return;
-	old_ratio =3D clock_ratio_index;
-
 	mult =3D clock_ratio[clock_ratio_index];
 	if (mult =3D=3D -1)
 		return;
=20
-	speed =3D calc_speed(mult);
-	if ((speed > highest_speed) || (speed < lowest_speed))
+	speed =3D calc_speed(mult, fsb);
+	if ( (speed =3D=3D old_speed)
+		|| (speed > highest_speed)
+		|| (speed < lowest_speed) )
 		return;
=20
-	freqs.old =3D calc_speed(longhaul_get_cpu_mult());
+	freqs.old =3D old_speed;
 	freqs.new =3D speed;
 	freqs.cpu =3D 0; /* longhaul.c is UP only driver */
=20
@@ -275,46 +272,7 @@ static void longhaul_setstate(unsigned i
 	preempt_enable();
=20
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-}
-
-/*
- * Centaur decided to make life a little more tricky.
- * Only longhaul v1 is allowed to read EBLCR BSEL[0:1].
- * Samuel2 and above have to try and guess what the FSB is.
- * We do this by assuming we booted at maximum multiplier, and interpolate
- * between that value multiplied by possible FSBs and cpu_mhz which
- * was calculated at boot time. Really ugly, but no other way to do this.
- */
-
-#define ROUNDING	0xf
-
-static int _guess(int guess)
-{
-	int target;
-
-	target =3D ((maxmult/10)*guess);
-	if (maxmult%10 !=3D 0)
-		target +=3D (guess/2);
-	target +=3D ROUNDING/2;
-	target &=3D ~ROUNDING;
-	return target;
-}
-
-
-static int guess_fsb(void)
-{
-	int speed =3D (cpu_khz/1000);
-	int i;
-	int speeds[3] =3D { 66, 100, 133 };
-
-	speed +=3D ROUNDING/2;
-	speed &=3D ~ROUNDING;
-
-	for (i=3D0; i<3; i++) {
-		if (_guess(speeds[i]) =3D=3D speed)
-			return speeds[i];
-	}
-	return 0;
+	old_speed =3D speed;
 }
=20
=20
@@ -327,8 +285,8 @@ static int __init longhaul_get_ranges(vo
 	unsigned int j, k =3D 0;
 	union msr_longhaul longhaul;
 	unsigned long lo, hi;
-	unsigned int eblcr_fsb_table_v1[] =3D { 66, 133, 100, -1 };
-	unsigned int eblcr_fsb_table_v2[] =3D { 133, 100, -1, 66 };
+	unsigned int eblcr_fsb_table_v1[] =3D { 666, 1332, 999, -1 };
+	unsigned int eblcr_fsb_table_v2[] =3D { 1332, 999, 1998, 666 };
=20
 	switch (longhaul_version) {
 	case TYPE_LONGHAUL_V1:
@@ -339,73 +297,52 @@ static int __init longhaul_get_ranges(vo
 		maxmult =3D longhaul_get_cpu_mult();
 		rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
 		invalue =3D (lo & (1<<18|1<<19)) >>18;
-		if (cpu_model=3D=3DCPU_SAMUEL || cpu_model=3D=3DCPU_SAMUEL2)
-			fsb =3D eblcr_fsb_table_v1[invalue];
-		else
-			fsb =3D guess_fsb();
+		fsb_min =3D fsb =3D eblcr_fsb_table_v1[invalue];
+		printk (KERN_INFO PFX "CPU don't have the min/max MSRs.\n");
 		break;
=20
 	case TYPE_POWERSAVER:
-		/* Ezra-T */
-		if (cpu_model=3D=3DCPU_EZRA_T) {
-			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-			invalue =3D longhaul.bits.MaxMHzBR;
-			if (longhaul.bits.MaxMHzBR4)
-				invalue +=3D 16;
-			maxmult=3Dmultipliers[invalue];
-
-			invalue =3D longhaul.bits.MinMHzBR;
-			if (longhaul.bits.MinMHzBR4 =3D=3D 1)
-				minmult =3D 30;
-			else
-				minmult =3D multipliers[invalue];
-			fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
-			break;
-		}
+		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
=20
-		/* Nehemiah */
-		if (cpu_model=3D=3DCPU_NEHEMIAH) {
-			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-
-			/*
-			 * TODO: This code works, but raises a lot of questions.
-			 * - Some Nehemiah's seem to have broken Min/MaxMHzBR's.
-			 *   We get around this by using a hardcoded multiplier of 4.0x
-			 *   for the minimimum speed, and the speed we booted up at for the max.
-			 *   This is done in longhaul_get_cpu_mult() by reading the EBLCR regis=
ter.
-			 * - According to some VIA documentation EBLCR is only
-			 *   in pre-Nehemiah C3s. How this still works is a mystery.
-			 *   We're possibly using something undocumented and unsupported,
-			 *   But it works, so we don't grumble.
-			 */
-			minmult=3D40;
-			maxmult=3Dlonghaul_get_cpu_mult();
-
-			/* Starting with the 1.2GHz parts, theres a 200MHz bus. */
-			if ((cpu_khz/1000) > 1200)
-				fsb =3D 200;
-			else
-				fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
-			break;
-		}
-	}
+		invalue =3D longhaul.bits.MaxMHzBR;
+		if (longhaul.bits.MaxMHzBR4)
+			invalue +=3D 16;
+		maxmult =3D multipliers[invalue];
+
+		invalue =3D longhaul.bits.MinMHzBR;
+		if (longhaul.bits.MinMHzBR4 =3D=3D 1)
+			minmult =3D 30;
+		else
+			minmult =3D multipliers[invalue];
=20
-	dprintk ("MinMult:%d.%dx MaxMult:%d.%dx\n",
-		 minmult/10, minmult%10, maxmult/10, maxmult%10);
+		if (minmult <=3D 45) clock_ratio[6] =3D 45;
+		if (minmult <=3D 40) clock_ratio[2] =3D 40;
+		if (minmult <=3D 35) clock_ratio[5] =3D 35;
+		if (minmult =3D=3D 30) clock_ratio[1] =3D 30;
+
+		fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
+		fsb_min =3D eblcr_fsb_table_v2[longhaul.bits.MinMHzFSB];
+		break;
+	}
=20
 	if (fsb =3D=3D -1) {
 		printk (KERN_INFO PFX "Invalid (reserved) FSB!\n");
 		return -EINVAL;
 	}
=20
-	highest_speed =3D calc_speed(maxmult);
-	lowest_speed =3D calc_speed(minmult);
-	dprintk ("FSB:%dMHz  Lowest speed: %s   Highest speed:%s\n", fsb,
-		 print_speed(lowest_speed/1000),=20
-		 print_speed(highest_speed/1000));
+	highest_speed =3D calc_speed(maxmult, fsb);
+	lowest_speed =3D calc_speed(minmult, fsb_min);
+ 	printk(KERN_INFO PFX "Maximum frequency =3D %dMHz (%d.%d x %dMHz)\n",
+		 highest_speed/1000,
+		 maxmult/10, maxmult%10,
+		 fsb/10);
+ 	printk(KERN_INFO PFX "Minimum frequency =3D %dMHz (%d.%d x %dMHz)\n",
+		 lowest_speed/1000,
+		 minmult/10, minmult%10,
+		 fsb_min/10);
=20
 	if (lowest_speed =3D=3D highest_speed) {
-		printk (KERN_INFO PFX "highestspeed =3D=3D lowest, aborting.\n");
+		printk (KERN_INFO PFX "highest speed =3D=3D lowest, aborting.\n");
 		return -EINVAL;
 	}
 	if (lowest_speed > highest_speed) {
@@ -418,14 +355,15 @@ static int __init longhaul_get_ranges(vo
 	if(!longhaul_table)
 		return -ENOMEM;
=20
-	for (j=3D0; j < numscales; j++) {
-		unsigned int ratio;
+	for (j =3D 0; j < numscales; j++) {
+		unsigned int ratio, speed;
 		ratio =3D clock_ratio[j];
 		if (ratio =3D=3D -1)
 			continue;
-		if (ratio > maxmult || ratio < minmult)
+		speed =3D calc_speed(ratio, fsb);
+		if (speed > highest_speed || speed < lowest_speed)
 			continue;
-		longhaul_table[k].frequency =3D calc_speed(ratio);
+		longhaul_table[k].frequency =3D speed;
 		longhaul_table[k].index	=3D j;
 		k++;
 	}
@@ -521,7 +459,7 @@ static unsigned int longhaul_get(unsigne
 {
 	if (cpu)
 		return 0;
-	return calc_speed(longhaul_get_cpu_mult());
+	return calc_speed(longhaul_get_cpu_mult(), fsb);
 }
=20
 acpi_status longhaul_walk_callback(acpi_handle obj_handle,
@@ -652,7 +590,7 @@ static int __init longhaul_cpu_init(stru
=20
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency =3D 200000;	/* nsec */
-	policy->cur =3D calc_speed(longhaul_get_cpu_mult());
+	policy->cur =3D old_speed =3D calc_speed(longhaul_get_cpu_mult(), fsb);
=20
 	ret =3D cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
 	if (ret)

------------------------------------------------------------------------
Znajdz krotsza droge do pracy!
http://map24.interia.pl/ - interaktywny planer podrozy.
