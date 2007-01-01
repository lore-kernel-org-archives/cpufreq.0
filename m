From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Always guess FSB
Date: Mon, 01 Jan 2007 23:49:34 +0100
Message-ID: <45998FFE.50306@interia.pl>
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


This is patch that solves Ebox mini PC issue and make=20
FSB code more specification compilant. At start guess_fsb=20
function is guessing 200MHz FSB too. It is better to=20
make it in this way because, thanks to this function, driver=20
will fail for bogus FSB values caused by bogus multiplier=20
value. For PowerSaver processors we can't depend on Max /=20
MinMHzFSB because these values are only used for=20
PowerSaver 2.0 and 3.0. Most processors on which Longhaul=20
is used are PowerSaver 1.0 only. I'm changing code for older=20
CPU's too, but not so much as previously, and this code was=20
already used for Ezra. Using MinMHzBR for Ezra-T is outside=20
spec. It is for voltage scaling purpose and don't have to=20
be equal to minmult (but it is). Same for Nehemiah (it=20
isn't for sure). Added mult - current multiplier value.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -318,12 +318,12 @@ static void longhaul_setstate(unsigned int clock_rati=
o_index)
=20
 #define ROUNDING	0xf
=20
-static int _guess(int guess)
+static int _guess(int guess, int mult)
 {
 	int target;
=20
-	target =3D ((maxmult/10)*guess);
-	if (maxmult%10 !=3D 0)
+	target =3D ((mult/10)*guess);
+	if (mult%10 !=3D 0)
 		target +=3D (guess/2);
 	target +=3D ROUNDING/2;
 	target &=3D ~ROUNDING;
@@ -331,17 +331,17 @@ static int _guess(int guess)
 }
=20
=20
-static int guess_fsb(void)
+static int guess_fsb(int mult)
 {
 	int speed =3D (cpu_khz/1000);
 	int i;
-	int speeds[3] =3D { 66, 100, 133 };
+	int speeds[] =3D { 66, 100, 133, 200 };
=20
 	speed +=3D ROUNDING/2;
 	speed &=3D ~ROUNDING;
=20
-	for (i=3D0; i<3; i++) {
-		if (_guess(speeds[i]) =3D=3D speed)
+	for (i=3D0; i<4; i++) {
+		if (_guess(speeds[i], mult) =3D=3D speed)
 			return speeds[i];
 	}
 	return 0;
@@ -361,6 +361,7 @@ static int __init longhaul_get_ranges(void)
 	unsigned long lo, hi;
 	unsigned int eblcr_fsb_table_v1[] =3D { 66, 133, 100, -1 };
 	unsigned int eblcr_fsb_table_v2[] =3D { 133, 100, -1, 66 };
+	int mult;
=20
 	switch (longhaul_version) {
 	case TYPE_LONGHAUL_V1:
@@ -368,30 +369,18 @@ static int __init longhaul_get_ranges(void)
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
+		maxmult =3D mult =3D longhaul_get_cpu_mult();
 		break;
=20
 	case TYPE_POWERSAVER:
 		/* Ezra-T */
 		if (cpu_model=3D=3DCPU_EZRA_T) {
+			minmult =3D 30;
 			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 			invalue =3D longhaul.bits.MaxMHzBR;
 			if (longhaul.bits.MaxMHzBR4)
 				invalue +=3D 16;
-			maxmult=3Dezra_t_multipliers[invalue];
-
-			invalue =3D longhaul.bits.MinMHzBR;
-			if (longhaul.bits.MinMHzBR4 =3D=3D 1)
-				minmult =3D 30;
-			else
-				minmult =3D ezra_t_multipliers[invalue];
-			fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
+			maxmult =3D mult =3D ezra_t_multipliers[invalue];
 			break;
 		}
=20
@@ -411,21 +400,16 @@ static int __init longhaul_get_ranges(void)
 			 *   But it works, so we don't grumble.
 			 */
 			minmult=3D40;
-			maxmult=3Dlonghaul_get_cpu_mult();
-
-			/* Starting with the 1.2GHz parts, theres a 200MHz bus. */
-			if ((cpu_khz/maxmult) > 13400)
-				fsb =3D 200;
-			else
-				fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
+			maxmult =3D mult =3D longhaul_get_cpu_mult();
 			break;
 		}
 	}
+	fsb =3D guess_fsb(mult);
=20
 	dprintk ("MinMult:%d.%dx MaxMult:%d.%dx\n",
 		 minmult/10, minmult%10, maxmult/10, maxmult%10);
=20
-	if (fsb =3D=3D -1) {
+	if (fsb =3D=3D 0) {
 		printk (KERN_INFO PFX "Invalid (reserved) FSB!\n");
 		return -EINVAL;
 	}


----------------------------------------------------------------------
Jestes kierowca? To poczytaj! >>> http://link.interia.pl/f199e
