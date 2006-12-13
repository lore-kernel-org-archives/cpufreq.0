From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Don't use regs to obtain FSB frequency
Date: Wed, 13 Dec 2006 23:28:20 +0100
Message-ID: <45807E84.5040308@interia.pl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

Current code has a problem with FSB on "PowerSaver 1.0"=20
CPU. FSB is incorrecly guessed (again) for mini PC by Ebox.=20
There is 8x100MHz CPU with "Nehemiah" core. It is reported=20
as 8x133MHz. Apparently Longhaul MSR isn't reliable source=20
of information if it is RevisionID =3D=3D 0 for anything else=20
then max multiplier. We can't read 200MHz FSB from it nor=20
from EBLCR_POWER_ON too. This driver is working only with=20
multipliers. FSB frequency is only needed to calculate CPU=20
f for Cpufreq core. At boot kernel is calculating processor=20
frequency. We know the multiplier. In this way we have bus=20
frequency with kHz precision.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---=20

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -54,7 +54,7 @@

static int cpu_model;
static unsigned int numscales=3D16;
-static unsigned int fsb;
+static unsigned int fsb_kHz;

static struct mV_pos *vrm_mV_table;
static unsigned char *mV_vrm_table;
@@ -109,15 +109,14 @@ static char *print_speed(int speed)
static unsigned int calc_speed(int mult)
{
	int khz;
-	khz =3D (mult/10)*fsb;
+	khz =3D (mult/10)*fsb_kHz;
	if (mult%10)
-		khz +=3D fsb/2;
-	khz *=3D 1000;
+		khz +=3D fsb_kHz/2;
	return khz;
}


-static int longhaul_get_cpu_mult(void)
+static int get_cpu_mult_eblcr(void)
{
	unsigned long invalue=3D0,lo, hi;

@@ -226,14 +225,14 @@ static void longhaul_setstate(unsigned i
	if ((speed > highest_speed) || (speed < lowest_speed))
		return;

-	freqs.old =3D calc_speed(longhaul_get_cpu_mult());
+	freqs.old =3D calc_speed(get_cpu_mult_eblcr());
	freqs.new =3D speed;
	freqs.cpu =3D 0; /* longhaul.c is UP only driver */

	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);

	dprintk ("Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
-			fsb, mult/10, mult%10, print_speed(speed/1000));
+			fsb_kHz/1000, mult/10, mult%10, print_speed(speed/1000));

	preempt_disable();
	local_irq_save(flags);
@@ -303,60 +302,16 @@ static void longhaul_setstate(unsigned i
	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
}

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
-}
-
-
static int __init longhaul_get_ranges(void)
{
	unsigned long invalue;
-	unsigned int ezra_t_multipliers[32]=3D {
+	unsigned int longhaul_multipliers[32]=3D {
			90,  30,  40, 100,  55,  35,  45,  95,
			50,  70,  80,  60, 120,  75,  85,  65,
			-1, 110, 120,  -1, 135, 115, 125, 105,
			130, 150, 160, 140,  -1, 155,  -1, 145 };
	unsigned int j, k =3D 0;
	union msr_longhaul longhaul;
-	unsigned long lo, hi;
-	unsigned int eblcr_fsb_table_v1[] =3D { 66, 133, 100, -1 };
-	unsigned int eblcr_fsb_table_v2[] =3D { 133, 100, -1, 66 };

	switch (longhaul_version) {
	case TYPE_LONGHAUL_V1:
@@ -364,71 +319,43 @@ static int __init longhaul_get_ranges(vo
		/* Ugh, Longhaul v1 didn't have the min/max MSRs.
		   Assume min=3D3.0x & max =3D whatever we booted at. */
		minmult =3D 30;
-		maxmult =3D longhaul_get_cpu_mult();
-		rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
-		invalue =3D (lo & (1<<18|1<<19)) >>18;
-		if (cpu_model=3D=3DCPU_SAMUEL || cpu_model=3D=3DCPU_SAMUEL2)
-			fsb =3D eblcr_fsb_table_v1[invalue];
-		else
-			fsb =3D guess_fsb();
+		maxmult =3D get_cpu_mult_eblcr();
		break;

	case TYPE_POWERSAVER:
-		/* Ezra-T */
-		if (cpu_model=3D=3DCPU_EZRA_T) {
-			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-			invalue =3D longhaul.bits.MaxMHzBR;
-			if (longhaul.bits.MaxMHzBR4)
-				invalue +=3D 16;
-			maxmult=3Dezra_t_multipliers[invalue];
-
+		rdmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+		invalue =3D longhaul.bits.MaxMHzBR;
+		if (longhaul.bits.MaxMHzBR4)
+			invalue +=3D 16;
+		maxmult =3D longhaul_multipliers[invalue];
+		/* Ezra-T
+		 * PowerSaver 2.0 - bus ratio and voltage scaling
+		 * Valid: MinMHzBR, MaxMHzBR, MinMHzFSB, MaxMHzFSB,
+		 * 	  MinVID, MaxVID, VRMRev */
+		if (longhaul.bits.RevisionID > 0) {
			invalue =3D longhaul.bits.MinMHzBR;
			if (longhaul.bits.MinMHzBR4 =3D=3D 1)
				minmult =3D 30;
			else
-				minmult =3D ezra_t_multipliers[invalue];
-			fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
-			break;
-		}
-
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
-			if ((cpu_khz/maxmult) > 13400)
-				fsb =3D 200;
-			else
-				fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
-			break;
+				minmult =3D longhaul_multipliers[invalue];
+		/* Nehemiah
+		 * PowerSaver 1.0 - bus ratio scaling
+		 * Valid: MaxMHzBR */
+		} else {
+			minmult =3D 40;
		}
+		break;
	}
+	/* Kernel already knows true FSB speed */
+	fsb_kHz =3D (cpu_khz * 10) / maxmult;

	dprintk ("MinMult:%d.%dx MaxMult:%d.%dx\n",
		 minmult/10, minmult%10, maxmult/10, maxmult%10);

-	if (fsb =3D=3D -1) {
-		printk (KERN_INFO PFX "Invalid (reserved) FSB!\n");
-		return -EINVAL;
-	}
-
	highest_speed =3D calc_speed(maxmult);
	lowest_speed =3D calc_speed(minmult);
-	dprintk ("FSB:%dMHz  Lowest speed: %s   Highest speed:%s\n", fsb,
+	dprintk ("FSB:%dMHz  Lowest speed: %s   Highest speed:%s\n",
+		 fsb_kHz / 1000,
		 print_speed(lowest_speed/1000),=20
		 print_speed(highest_speed/1000));

@@ -475,7 +402,7 @@ static void __init longhaul_setup_voltag
	unsigned int j, speed, pos, kHz_step, numvscales;

	rdmsrl(MSR_VIA_LONGHAUL, longhaul.val);
-	if (!(longhaul.bits.RevisionID & 1)) {
+	if (longhaul.bits.RevisionID !=3D 1) {
		printk(KERN_INFO PFX "Voltage scaling not supported by CPU.\n");
		return;
	}
@@ -553,7 +480,7 @@ static unsigned int longhaul_get(unsigne
{
	if (cpu)
		return 0;
-	return calc_speed(longhaul_get_cpu_mult());
+	return calc_speed(get_cpu_mult_eblcr());
}

static acpi_status longhaul_walk_callback(acpi_handle obj_handle,
@@ -728,7 +655,7 @@ print_support_type:

	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
	policy->cpuinfo.transition_latency =3D 200000;	/* nsec */
-	policy->cur =3D calc_speed(longhaul_get_cpu_mult());
+	policy->cur =3D calc_speed(get_cpu_mult_eblcr());

	ret =3D cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
	if (ret)
