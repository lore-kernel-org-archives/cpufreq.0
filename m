From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - I missed that
Date: Fri, 07 Jul 2006 08:48:26 +0200
Message-ID: <44AE03BA.5040901@interia.pl>
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

This should be in "Use hardware support". Without this=20
longhaul will always fail when compiled into kernel.=20
I lost this when I was splitting patches. Sorry.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

--- linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c.orig	2006-07=
-07 08:35:32.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-07 0=
8:35:52.000000000 +0200
@@ -739,6 +739,6 @@ MODULE_AUTHOR ("Dave Jones <davej@codemo
 MODULE_DESCRIPTION ("Longhaul driver for VIA Cyrix processors.");
 MODULE_LICENSE ("GPL");
=20
-module_init(longhaul_init);
+late_initcall(longhaul_init);
 module_exit(longhaul_exit);


------------------------------------------------------------------------
Interaktywne mapy miast na http://map24.interia.pl/
