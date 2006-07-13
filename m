From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Test
Date: Thu, 13 Jul 2006 20:57:18 +0200
Message-ID: <44B6978E.5040805@interia.pl>
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

Test checking if ACPI C3 is really working in user computer.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

diff -uprN -X linux-2.6.17-git20-vanilla/Documentation/dontdiff linux-2.6.1=
7-git20-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.c linux-2.6.17-git20/=
arch/i386/kernel/cpu/cpufreq/longhaul.c
--- linux-2.6.17-git20-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006=
-07-13 07:39:41.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-13 2=
0:36:22.000000000 +0200
@@ -543,6 +543,7 @@ static int __init longhaul_cpu_init(stru
 	struct cpuinfo_x86 *c =3D cpu_data;
 	char *cpuname=3DNULL;
 	int ret;
+	unsigned int i, min, min_index, max, max_index;
=20
 	/* Check ACPI support for C3 state */
 	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT, ACPI_UINT32_MA=
X,
@@ -642,6 +643,30 @@ static int __init longhaul_cpu_init(stru
 		 (dont_scale_voltage=3D=3D0))
 		longhaul_setup_voltagescaling();
=20
+	/* Check if longhaul really works */
+	/* Find min and max frequencies */
+	i =3D max =3D max_index =3D min_index =3D 0;
+	min =3D ~0;
+	while (longhaul_table[i].frequency !=3D CPUFREQ_TABLE_END) {
+		if (longhaul_table[i].frequency < min) {
+			min =3D longhaul_table[i].frequency;
+			min_index =3D longhaul_table[i].index;
+		} else if (longhaul_table[i].frequency > max) {
+			max =3D longhaul_table[i].frequency;
+			max_index =3D longhaul_table[i].index;
+		}
+		i++;
+	}
+	/* Change to min */
+	longhaul_setstate(min_index);
+	/* Check */
+	if ( calc_speed(longhaul_get_cpu_mult()) !=3D min ) goto err_test;
+	/* Change to max */
+	longhaul_setstate(max_index);
+	/* Check */
+	if ( calc_speed(longhaul_get_cpu_mult()) !=3D max ) goto err_test;
+
+	/* Seems to be working. Add longhaul driver to cpufreq core */
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency =3D 200000;	/* nsec */
 	policy->cur =3D calc_speed(longhaul_get_cpu_mult());
@@ -657,6 +682,11 @@ static int __init longhaul_cpu_init(stru
 err_acpi:
 	printk(KERN_ERR PFX "No ACPI support for CPU frequency changes.\n");
 	return -ENODEV;
+
+err_test:
+	printk(KERN_ERR PFX "Test failed. Aborting.\n");
+	kfree(longhaul_table);
+	return -ENODEV;
 }
=20
 static int __devexit longhaul_cpu_exit(struct cpufreq_policy *policy)

----------------------------------------------------------------------
Upal jakby mniejszy... http://link.interia.pl/f1975
