From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Remove duplicate multipliers
Date: Mon, 28 May 2007 21:58:09 +0200
Message-ID: <465B3451.30702@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk


Remove duplicate multipliers in clock_ratio table. On 1,4GHz
Nehemiah two frequencies are present twice in table. It isn't
fatal, but with voltage scaling enabled each will be set twice.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.h |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.h b/arch/i386/kernel/cpu=
/cpufreq/longhaul.h
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.h
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.h
@@ -180,7 +180,7 @@ static const int __initdata ezrat_clock_ratio[32] =3D {
=20
 	-1,  /* 0000 -> RESERVED (10.0x) */
 	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
+	-1, /* 0010 -> 12.0x */
 	-1,  /* 0011 -> RESERVED (9.0x)*/
 	105, /* 0100 -> 10.5x */
 	115, /* 0101 -> 11.5x */
@@ -237,7 +237,7 @@ static const int __initdata ezrat_eblcr[32] =3D {
=20
 static const int __initdata  nehemiah_clock_ratio[32] =3D {
 	100, /* 0000 -> 10.0x */
-	160, /* 0001 -> 16.0x */
+	-1, /* 0001 -> 16.0x */
 	40,  /* 0010 ->  4.0x */
 	90,  /* 0011 ->  9.0x */
 	95,  /* 0100 ->  9.5x */
@@ -252,10 +252,10 @@ static const int __initdata  nehemiah_clock_ratio[32]=
 =3D {
 	75,  /* 1101 ->  7.5x */
 	85,  /* 1110 ->  8.5x */
 	120, /* 1111 -> 12.0x */
-	100, /* 0000 -> 10.0x */
+	-1, /* 0000 -> 10.0x */
 	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
-	90,  /* 0011 ->  9.0x */
+	-1, /* 0010 -> 12.0x */
+	-1,  /* 0011 ->  9.0x */
 	105, /* 0100 -> 10.5x */
 	115, /* 0101 -> 11.5x */
 	125, /* 0110 -> 12.5x */
@@ -267,7 +267,7 @@ static const int __initdata  nehemiah_clock_ratio[32] =
=3D {
 	145, /* 1100 -> 14.5x */
 	155, /* 1101 -> 15.5x */
 	-1,  /* 1110 -> RESERVED (13.0x) */
-	120, /* 1111 -> 12.0x */
+	-1, /* 1111 -> 12.0x */
 };
=20
 static const int __initdata nehemiah_eblcr[32] =3D {
--=20



----------------------------------------------------------------------
Dziecko - instrukcja obs=B3ugi
>>> http://link.interia.pl/f1a51
