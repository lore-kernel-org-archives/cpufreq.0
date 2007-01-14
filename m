From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Fix guess_fsb function
Date: Sun, 14 Jan 2007 15:01:44 +0100
Message-ID: <45AA37C8.6000700@interia.pl>
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


This is bug reported by John-Marc Chandonia:
> Detected 1002.292 MHz processor.
> longhaul: VIA C3 'Nehemiah B' [C5N] CPU detected.  Powersaver supported.
> longhaul: Using throttling support.
> longhaul: Invalid (reserved) FSB!
FSB is correcly guessed for 999.554 MHz CPU.
To fix this error:
- ROUNDING should be range, not mask - at it's current value it is +7 -8,
- more precise calculations inside guess_fsb - 7.5x133MHz is 1000MHz now.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>
---
diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -322,11 +322,9 @@ static int _guess(int guess, int mult)
 {
 	int target;
=20
-	target =3D ((mult/10)*guess);
-	if (mult%10 !=3D 0)
-		target +=3D (guess/2);
-	target +=3D ROUNDING/2;
-	target &=3D ~ROUNDING;
+	target =3D mult * guess;
+	target +=3D 50;
+	target /=3D 100;
 	return target;
 }
=20
@@ -335,14 +333,14 @@ static int guess_fsb(int mult)
 {
 	int speed =3D (cpu_khz/1000);
 	int i;
-	int speeds[] =3D { 66, 100, 133, 200 };
-
-	speed +=3D ROUNDING/2;
-	speed &=3D ~ROUNDING;
+	int speeds[] =3D { 666, 1000, 1333, 2000 };
+	int f_max, f_min;
=20
 	for (i=3D0; i<4; i++) {
-		if (_guess(speeds[i], mult) =3D=3D speed)
-			return speeds[i];
+		f_max =3D _guess(speeds[i], mult) + (ROUNDING/2);
+		f_min =3D f_max - ROUNDING;
+		if ((speed <=3D f_max) && (speed >=3D f_min))
+			return (speeds[i]/10);
 	}
 	return 0;
 }


----------------------------------------------------------------------
Jak to sie robi po francusku? Zobacz >> http://link.interia.pl/f19e0
