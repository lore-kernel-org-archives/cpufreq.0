From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Longhaul - fix 200MHz FSB
Date: Thu, 23 Nov 2006 08:50:27 +0100
Message-ID: <456552C3.1070400@interia.pl>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

On board of Epia SP1300 is 10x133Mhz VIA Nehemiah. It is reported=20
as 10x200MHz. This patch is fixing this issue.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

Dave Jones - is there any chance to put this patch and CN400=20
support in 2.6.19? CN400 support will be tested after monday. Looks=20
like SP13000 has "no C2/C3" issue too. It is working with=20
"ignore_latency", but northbridge support is always better.

---=20

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -410,7 +410,7 @@ static int __init longhaul_get_ranges(vo
 			maxmult=3Dlonghaul_get_cpu_mult();
=20
 			/* Starting with the 1.2GHz parts, theres a 200MHz bus. */
-			if ((cpu_khz/1000) > 1200)
+			if ((cpu_khz/maxmult) > 13400)
 				fsb =3D 200;
 			else
 				fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];

----------------------------------------------------------------------
Gotuj sie na Swieta z IKEA. Przygotowalismy ciekawe promocje. Kredyt,=20
ktory splacisz po zimie. Kuchnie, ktore podolaja przygotowaniu potraw.=20
Dowiedz sie wiecej na: http://link.interia.pl/f19d0
