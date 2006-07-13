From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Typo fix
Date: Thu, 13 Jul 2006 19:26:10 +0200
Message-ID: <44B68232.40503@interia.pl>
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

Please add this too.
This is changing "always true" test to something usefull.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

diff -uprN -X linux-2.6.17-git20-vanilla/Documentation/dontdiff linux-2.6.1=
7-git20-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.c linux-2.6.17-git20/=
arch/i386/kernel/cpu/cpufreq/longhaul.c
--- linux-2.6.17-git20-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006=
-07-13 07:39:41.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-13 0=
7:38:35.000000000 +0200
@@ -550,7 +550,7 @@ static int __init longhaul_cpu_init(stru
 	if (pr =3D=3D NULL) goto err_acpi;
=20
 	cx =3D &pr->power.states[ACPI_STATE_C3];
-	if (cx =3D=3D NULL || cx->latency > 1000) goto err_acpi;
+	if (cx->address =3D=3D 0 || cx->latency > 1000) goto err_acpi;
=20
 	/* Now check what we have on this motherboard */
 	switch (c->x86_model) {


--------------------------------------------------------------------
12 000 SMS-ow gratis! Promocja na http://link.interia.pl/f1971
