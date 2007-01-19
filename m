From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Remove "ignore_latency" option
Date: Fri, 19 Jan 2007 22:28:22 +0100
Message-ID: <45B137F6.6070006@interia.pl>
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


There is no need to have this option in Longhaul anymore.=20
It was for laptop with CLE266 chipset in times, when only=20
ACPI C3 was used to switch frequency. Now we have native=20
support not only for CLE266, but CN400 too. Would be good=20
to have support for PN266, but I can't find datasheet for=20
it.
Looks like BIOS for CPU's faster then 1GHz don't support=20
ACPI C2 nor C3.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -76,7 +76,6 @@ static u8 longhaul_flags;
=20
 /* Module parameters */
 static int scale_voltage;
-static int ignore_latency;
=20
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "longha=
ul", msg)
=20
@@ -678,8 +677,7 @@ static int __init longhaul_cpu_init(struct cpufreq_poli=
cy *policy)
 	/* Check ACPI support for C3 state */
 	if ((pr !=3D NULL) && (longhaul_version =3D=3D TYPE_POWERSAVER)) {
 		cx =3D &pr->power.states[ACPI_STATE_C3];
-		if (cx->address > 0 &&
-		   (cx->latency <=3D 1000 || ignore_latency !=3D 0) ) {
+		if (cx->address > 0 && cx->latency <=3D 1000) {
 			longhaul_flags |=3D USE_ACPI_C3;
 			goto print_support_type;
 		}
@@ -798,8 +796,6 @@ static void __exit longhaul_exit(void)
=20
 module_param (scale_voltage, int, 0644);
 MODULE_PARM_DESC(scale_voltage, "Scale voltage of processor");
-module_param(ignore_latency, int, 0644);
-MODULE_PARM_DESC(ignore_latency, "Skip ACPI C3 latency test");
=20
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Longhaul driver for VIA Cyrix processors.");


----------------------------------------------------------------------
Fergie i jej biodra.... - zobacz >>  http://link.interia.pl/f19ed
