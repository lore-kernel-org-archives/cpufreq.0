From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Only for "Powersaver"
Date: Thu, 13 Jul 2006 07:57:49 +0200
Message-ID: <44B5E0DD.9090109@interia.pl>
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

Looks like ACPI C3 don't work with older VIA CPUs. Motherboard is=20
ACPI C3 capable, but after C3 frequency is same as before.
So this patch below will make "longhaul" fail for older CPU's.
There is nothing what I can do to fix this. Looks like CPU with=20
BCR2 MSR is changing frequency only on halt. Processor with=20
Longhaul MSR is changing frequency on halt or ACPI C3.
Btw typo fixes.

Thanks to David for bug report.

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
@@ -627,7 +627,9 @@ static int __init longhaul_cpu_init(stru
 	switch (longhaul_version) {
 	case TYPE_LONGHAUL_V1:
 	case TYPE_LONGHAUL_V2:
-		printk ("Longhaul v%d supported.\n", longhaul_version);
+//		printk ("Longhaul v%d supported.\n", longhaul_version);
+		printk(KERN_ERR PFX "Processor don't support ACPI. Aborting.\n");
+		return -ENODEV;
 		break;
 	case TYPE_POWERSAVER:
 		printk ("Powersaver supported.\n");
@@ -691,8 +693,8 @@ static int __init longhaul_init(void)
=20
 #ifdef CONFIG_SMP
 	if (num_online_cpus() > 1) {
-		return -ENODEV;
 		printk(KERN_ERR PFX "More than 1 CPU detected, longhaul disabled.\n");
+		return -ENODEV;
 	}
 #endif
 #ifdef CONFIG_X86_IO_APIC


--------------------------------------------------------------------
12 000 SMS-ow gratis! Promocja na http://link.interia.pl/f1971
