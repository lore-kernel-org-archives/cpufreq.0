From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH 1/2] Longhaul - Introduce Nehemiah C
Date: Wed, 31 Jan 2007 23:42:47 +0100
Message-ID: <45C11B67.8050502@interia.pl>
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


Looks like some time ago I introduced a bug to Longhaul.=20
I had report that 9x133Mhz CPU is seen as 5x133MHz. So I =20
changed multipliers table. That was a mistake. According to=20
documentation table was correct. So only way to avoid 5 or 9=20
dilema is not use MaxMHzBR for PowerSaver 1.0. One code that=20
works on all processors. To do it I need also separate flag for=20
Nehemiah C (min =3D x4.0) and Nehemiah (min =3D x5.0).

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   73 ++++++++++++---------------=
----
 1 files changed, 28 insertions(+), 45 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -51,6 +51,7 @@
 #define	CPU_EZRA	3
 #define	CPU_EZRA_T	4
 #define	CPU_NEHEMIAH	5
+#define	CPU_NEHEMIAH_C	6
=20
 /* Flags */
 #define USE_ACPI_C3		(1 << 1)
@@ -348,67 +349,47 @@ static int guess_fsb(int mult)
=20
 static int __init longhaul_get_ranges(void)
 {
-	unsigned long invalue;
-	unsigned int ezra_t_multipliers[32]=3D {
-			90,  30,  40, 100,  55,  35,  45,  95,
-			50,  70,  80,  60, 120,  75,  85,  65,
-			-1, 110, 120,  -1, 135, 115, 125, 105,
-			130, 150, 160, 140,  -1, 155,  -1, 145 };
 	unsigned int j, k =3D 0;
-	union msr_longhaul longhaul;
-	int mult =3D 0;
+	int mult;
=20
+	/* Get current frequency */
+	mult =3D longhaul_get_cpu_mult();
+	if (mult =3D=3D -1) {
+		printk(KERN_INFO PFX "Invalid (reserved) multiplier!\n");
+		return -EINVAL;
+	}
+	fsb =3D guess_fsb(mult);
+	if (fsb =3D=3D 0) {
+		printk(KERN_INFO PFX "Invalid (reserved) FSB!\n");
+		return -EINVAL;
+	}
+	/* Get max multiplier - as we always did.
+	 * Longhaul MSR is usefull only when voltage scaling is enabled.
+	 * C3 is booting at max anyway. */
+	maxmult =3D mult;
+	/* Get min multiplier */
 	switch (longhaul_version) {
 	case TYPE_LONGHAUL_V1:
 	case TYPE_LONGHAUL_V2:
-		/* Ugh, Longhaul v1 didn't have the min/max MSRs.
-		   Assume min=3D3.0x & max =3D whatever we booted at. */
 		minmult =3D 30;
-		maxmult =3D mult =3D longhaul_get_cpu_mult();
 		break;
=20
 	case TYPE_POWERSAVER:
 		/* Ezra-T */
-		if (cpu_model=3D=3DCPU_EZRA_T) {
+		if (cpu_model =3D=3D CPU_EZRA_T)
 			minmult =3D 30;
-			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-			invalue =3D longhaul.bits.MaxMHzBR;
-			if (longhaul.bits.MaxMHzBR4)
-				invalue +=3D 16;
-			maxmult =3D mult =3D ezra_t_multipliers[invalue];
-			break;
-		}
-
 		/* Nehemiah */
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
-			maxmult =3D mult =3D longhaul_get_cpu_mult();
-			break;
-		}
+		else if (cpu_model =3D=3D CPU_NEHEMIAH)
+			minmult =3D 50;
+		/* Nehemiah C */
+		else if (cpu_model =3D=3D CPU_NEHEMIAH_C)
+			minmult =3D 40;
+		break;
 	}
-	fsb =3D guess_fsb(mult);
=20
 	dprintk ("MinMult:%d.%dx MaxMult:%d.%dx\n",
 		 minmult/10, minmult%10, maxmult/10, maxmult%10);
=20
-	if (fsb =3D=3D 0) {
-		printk (KERN_INFO PFX "Invalid (reserved) FSB!\n");
-		return -EINVAL;
-	}
-
 	highest_speed =3D calc_speed(maxmult);
 	lowest_speed =3D calc_speed(minmult);
 	dprintk ("FSB:%dMHz  Lowest speed: %s   Highest speed:%s\n", fsb,
@@ -663,21 +644,23 @@ static int __init longhaul_cpu_init(struct cpufreq_po=
licy *policy)
 		break;
=20
 	case 9:
-		cpu_model =3D CPU_NEHEMIAH;
 		longhaul_version =3D TYPE_POWERSAVER;
 		numscales=3D32;
 		switch (c->x86_mask) {
 		case 0 ... 1:
+			cpu_model =3D CPU_NEHEMIAH;
 			cpuname =3D "C3 'Nehemiah A' [C5N]";
 			memcpy (clock_ratio, nehemiah_a_clock_ratio, sizeof(nehemiah_a_clock_ra=
tio));
 			memcpy (eblcr_table, nehemiah_a_eblcr, sizeof(nehemiah_a_eblcr));
 			break;
 		case 2 ... 4:
+			cpu_model =3D CPU_NEHEMIAH;
 			cpuname =3D "C3 'Nehemiah B' [C5N]";
 			memcpy (clock_ratio, nehemiah_b_clock_ratio, sizeof(nehemiah_b_clock_ra=
tio));
 			memcpy (eblcr_table, nehemiah_b_eblcr, sizeof(nehemiah_b_eblcr));
 			break;
 		case 5 ... 15:
+			cpu_model =3D CPU_NEHEMIAH_C;
 			cpuname =3D "C3 'Nehemiah C' [C5N]";
 			memcpy (clock_ratio, nehemiah_c_clock_ratio, sizeof(nehemiah_c_clock_ra=
tio));
 			memcpy (eblcr_table, nehemiah_c_eblcr, sizeof(nehemiah_c_eblcr));


----------------------------------------------------------------------
Gdy nie ma dzieci... - zobacz >> http://link.interia.pl/f19eb
