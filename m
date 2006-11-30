From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - fix 200MHz FSB
Date: Thu, 30 Nov 2006 03:36:44 +0100
Message-ID: <456E43BC.7090806@interia.pl>
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

On board of Epia SP13000 is 10x133Mhz VIA Nehemiah. It is reported=20
as 10x200MHz. This patch is fixing this issue.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---=20

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -410,7 +410,7 @@ static int __init longhaul_get_ranges(vo
			maxmult=3Dlonghaul_get_cpu_mult();

			/* Starting with the 1.2GHz parts, theres a 200MHz bus. */
-			if ((cpu_khz/1000) > 1200)
+			if ((cpu_khz/maxmult) > 13400)
				fsb =3D 200;
			else
				fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];


----------------------------------------------------------------------
PS. >>> http://link.interia.pl/f19a6
