From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Protect user from himself
Date: Mon, 03 Jul 2006 07:39:08 +0200
Message-ID: <44A8AD7C.5030402@interia.pl>
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

This patch depens on "Longhaul - Use hardware support".

Older CPU's require transition time >=3D1ms.
Print message for C7 user (this is based on real story).

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

--- linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c.orig	2006-07=
-03 06:43:54.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-03 0=
7:33:38.000000000 +0200
@@ -633,6 +633,13 @@ static int __init longhaul_cpu_init(stru
 		break;
 	};
=20
+#if (CONFIG_HZ > 250)
+	if (longhaul_version !=3D TYPE_POWERSAVER) {
+		printk (KERN_INFO PFX "Timer frequency to high. Aborting\n");
+		return -EINVAL;
+	}
+#endif
+
 	ret =3D longhaul_get_ranges();
 	if (ret !=3D 0)
 		return ret;
@@ -691,8 +698,9 @@ static int __init longhaul_init(void)
 	switch (c->x86_model) {
 	case 6 ... 9:
 		return cpufreq_register_driver(&longhaul_driver);
-	default:
-		printk (KERN_INFO PFX "Unknown VIA CPU. Contact davej@codemonkey.org.uk\=
n");
+	}
+	if (c->x86_model > 9) {
+		printk(KERN_INFO PFX "VIA C7 (or better) CPU. Use \"ACPI Processor P-Sta=
tes driver\".\n");
 	}
=20
 	return -ENODEV;

------------------------------------------------------------------------
Zobacz, gdzie mieszka Twoja dziewczyna!
http://map24.interia.pl
