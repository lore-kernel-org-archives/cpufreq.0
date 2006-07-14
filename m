From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Fix multipliers table
Date: Fri, 14 Jul 2006 19:36:05 +0200
Message-ID: <44B7D605.2060603@interia.pl>
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

This patch fix multiplier table. Some values are swaped
and 9.0*133MHz processor is incorrecly reported as=20
5.0*133MHz.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

--- linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c.orig	2006-07=
-14 19:22:01.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-14 1=
9:27:21.000000000 +0200
@@ -323,8 +323,10 @@ static int __init longhaul_get_ranges(vo
 {
 	unsigned long invalue;
 	unsigned int multipliers[32]=3D {
-		50,40,30,100,55,35,45,95,90,70,80,60,120,75,85,65,
-		-1,110,120,-1,135,115,125,105,130,150,160,140,-1,155,-1,145 };
+		 90,  30,  40, 100,  55,  35,  45,  95,
+		 50,  70,  80,  60, 120,  75,  85,  65,
+		 -1, 110, 120,  -1, 135, 115, 125, 105,
+		130, 150, 160, 140,  -1, 155,  -1, 145 };
 	unsigned int j, k =3D 0;
 	union msr_longhaul longhaul;
 	unsigned long lo, hi;


----------------------------------------------------------------------
Upal jakby mniejszy... http://link.interia.pl/f1975
