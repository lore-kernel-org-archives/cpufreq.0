From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH 2/2] Longhaul - Remove duplicate tables
Date: Wed, 31 Jan 2007 23:50:49 +0100
Message-ID: <45C11D49.1050902@interia.pl>
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
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk


Now there is no need to depend on -1 in Nehemiah tables. After=20
previous change code is eliminating multipliers lower then 5.0=20
by minmult for Nehemiah A and B.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   12 +--
 arch/i386/kernel/cpu/cpufreq/longhaul.h |  153 +--------------------------=
---
 2 files changed, 11 insertions(+), 154 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -645,25 +645,23 @@ static int __init longhaul_cpu_init(struct cpufreq_po=
licy *policy)
=20
 	case 9:
 		longhaul_version =3D TYPE_POWERSAVER;
-		numscales=3D32;
+		numscales =3D 32;
+		memcpy(clock_ratio,
+		       nehemiah_clock_ratio,
+		       sizeof(nehemiah_clock_ratio));
+		memcpy(eblcr_table, nehemiah_eblcr, sizeof(nehemiah_eblcr));
 		switch (c->x86_mask) {
 		case 0 ... 1:
 			cpu_model =3D CPU_NEHEMIAH;
 			cpuname =3D "C3 'Nehemiah A' [C5N]";
-			memcpy (clock_ratio, nehemiah_a_clock_ratio, sizeof(nehemiah_a_clock_ra=
tio));
-			memcpy (eblcr_table, nehemiah_a_eblcr, sizeof(nehemiah_a_eblcr));
 			break;
 		case 2 ... 4:
 			cpu_model =3D CPU_NEHEMIAH;
 			cpuname =3D "C3 'Nehemiah B' [C5N]";
-			memcpy (clock_ratio, nehemiah_b_clock_ratio, sizeof(nehemiah_b_clock_ra=
tio));
-			memcpy (eblcr_table, nehemiah_b_eblcr, sizeof(nehemiah_b_eblcr));
 			break;
 		case 5 ... 15:
 			cpu_model =3D CPU_NEHEMIAH_C;
 			cpuname =3D "C3 'Nehemiah C' [C5N]";
-			memcpy (clock_ratio, nehemiah_c_clock_ratio, sizeof(nehemiah_c_clock_ra=
tio));
-			memcpy (eblcr_table, nehemiah_c_eblcr, sizeof(nehemiah_c_eblcr));
 			break;
 		}
 		break;
diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.h b/arch/i386/kernel/cpu=
/cpufreq/longhaul.h
index bc4682a..bb0a04b 100644
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.h
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.h
@@ -235,84 +235,14 @@ static int __initdata ezrat_eblcr[32] =3D {
 /*
  * VIA C3 Nehemiah */
=20
-static int __initdata nehemiah_a_clock_ratio[32] =3D {
+static int __initdata  nehemiah_clock_ratio[32] =3D {
 	100, /* 0000 -> 10.0x */
 	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 ->  RESERVED */
-	90,  /* 0011 ->  9.0x */
-	95,  /* 0100 ->  9.5x */
-	-1,  /* 0101 ->  RESERVED */
-	-1,  /* 0110 ->  RESERVED */
-	55,  /* 0111 ->  5.5x */
-	60,  /* 1000 ->  6.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	50,  /* 1011 ->  5.0x */
-	65,  /* 1100 ->  6.5x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	120, /* 1111 -> 12.0x */
-	100, /* 0000 -> 10.0x */
-	-1,  /* 0001 -> RESERVED */
-	120, /* 0010 -> 12.0x */
-	90,  /* 0011 ->  9.0x */
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
-	120, /* 1111 -> 12.0x */
-};
-
-static int __initdata  nehemiah_b_clock_ratio[32] =3D {
-	100, /* 0000 -> 10.0x */
-	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 ->  RESERVED */
-	90,  /* 0011 ->  9.0x */
-	95,  /* 0100 ->  9.5x */
-	-1,  /* 0101 ->  RESERVED */
-	-1,  /* 0110 ->  RESERVED */
-	55,  /* 0111 ->  5.5x */
-	60,  /* 1000 ->  6.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	50,  /* 1011 ->  5.0x */
-	65,  /* 1100 ->  6.5x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	120, /* 1111 -> 12.0x */
-	100, /* 0000 -> 10.0x */
-	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
-	90,  /* 0011 ->  9.0x */
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
-	120, /* 1111 -> 12.0x */
-};
-
-static int __initdata  nehemiah_c_clock_ratio[32] =3D {
-	100, /* 0000 -> 10.0x */
-	160, /* 0001 -> 16.0x */
-	40,  /* 0010 ->  RESERVED */
+	40,  /* 0010 ->  4.0x */
 	90,  /* 0011 ->  9.0x */
 	95,  /* 0100 ->  9.5x */
 	-1,  /* 0101 ->  RESERVED */
-	45,  /* 0110 ->  RESERVED */
+	45,  /* 0110 ->  4.5x */
 	55,  /* 0111 ->  5.5x */
 	60,  /* 1000 ->  6.0x */
 	70,  /* 1001 ->  7.0x */
@@ -340,84 +270,14 @@ static int __initdata  nehemiah_c_clock_ratio[32] =3D=
 {
 	120, /* 1111 -> 12.0x */
 };
=20
-static int __initdata nehemiah_a_eblcr[32] =3D {
-	50,  /* 0000 ->  5.0x */
-	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 ->  RESERVED */
-	100, /* 0011 -> 10.0x */
-	55,  /* 0100 ->  5.5x */
-	-1,  /* 0101 ->  RESERVED */
-	-1,  /* 0110 ->  RESERVED */
-	95,  /* 0111 ->  9.5x */
-	90,  /* 1000 ->  9.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	60,  /* 1011 ->  6.0x */
-	120, /* 1100 -> 12.0x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	65,  /* 1111 ->  6.5x */
-	90,  /* 0000 ->  9.0x */
-	-1,  /* 0001 -> RESERVED */
-	120, /* 0010 -> 12.0x */
-	100, /* 0011 -> 10.0x */
-	135, /* 0100 -> 13.5x */
-	115, /* 0101 -> 11.5x */
-	125, /* 0110 -> 12.5x */
-	105, /* 0111 -> 10.5x */
-	130, /* 1000 -> 13.0x */
-	150, /* 1001 -> 15.0x */
-	160, /* 1010 -> 16.0x */
-	140, /* 1011 -> 14.0x */
-	120, /* 1100 -> 12.0x */
-	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
-	145 /* 1111 -> 14.5x */
-   /* end of table  */
-};
-static int __initdata nehemiah_b_eblcr[32] =3D {
-	50,  /* 0000 ->  5.0x */
-	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 ->  RESERVED */
-	100, /* 0011 -> 10.0x */
-	55,  /* 0100 ->  5.5x */
-	-1,  /* 0101 ->  RESERVED */
-	-1,  /* 0110 ->  RESERVED */
-	95,  /* 0111 ->  9.5x */
-	90,  /* 1000 ->  9.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	60,  /* 1011 ->  6.0x */
-	120, /* 1100 -> 12.0x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	65,  /* 1111 ->  6.5x */
-	90,  /* 0000 ->  9.0x */
-	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
-	100, /* 0011 -> 10.0x */
-	135, /* 0100 -> 13.5x */
-	115, /* 0101 -> 11.5x */
-	125, /* 0110 -> 12.5x */
-	105, /* 0111 -> 10.5x */
-	130, /* 1000 -> 13.0x */
-	150, /* 1001 -> 15.0x */
-	160, /* 1010 -> 16.0x */
-	140, /* 1011 -> 14.0x */
-	120, /* 1100 -> 12.0x */
-	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
-	145 /* 1111 -> 14.5x */
-	   /* end of table  */
-};
-static int __initdata nehemiah_c_eblcr[32] =3D {
+static int __initdata nehemiah_eblcr[32] =3D {
 	50,  /* 0000 ->  5.0x */
 	160, /* 0001 -> 16.0x */
-	40,  /* 0010 ->  RESERVED */
+	40,  /* 0010 ->  4.0x */
 	100, /* 0011 -> 10.0x */
 	55,  /* 0100 ->  5.5x */
 	-1,  /* 0101 ->  RESERVED */
-	45,  /* 0110 ->  RESERVED */
+	45,  /* 0110 ->  4.5x */
 	95,  /* 0111 ->  9.5x */
 	90,  /* 1000 ->  9.0x */
 	70,  /* 1001 ->  7.0x */
@@ -443,7 +303,6 @@ static int __initdata nehemiah_c_eblcr[32] =3D {
 	155, /* 1101 -> 15.5x */
 	-1,  /* 1110 -> RESERVED (13.0x) */
 	145 /* 1111 -> 14.5x */
-	  /* end of table  */
 };
=20
 /*


----------------------------------------------------------------------
Jestes kierowca? To poczytaj! >>> http://link.interia.pl/f199e
