From: =?UTF-8?b?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Subject: [PATCH] e_powersaver: This is C7 driver only
Date: Thu, 21 Jul 2011 23:52:44 +0100
Message-ID: <1311288764-1089-1-git-send-email-rafalbilski@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?b?UmFmYcWC?= Bilski <rafalbilski@interia.pl>

Enhanced Powersaver has been replaced by Adaptive Powersaver technology=
=2E Flag
"est" on VIA/Centaur Nano processors means that processor supports Adap=
tive
Powersaver.

Signed-off-by: Rafa=C5=82 Bilski <rafalbilski@interia.pl>
---
 drivers/cpufreq/e_powersaver.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_powersa=
ver.c
index 7638f5d..28600ae 100644
--- a/drivers/cpufreq/e_powersaver.c
+++ b/drivers/cpufreq/e_powersaver.c
@@ -237,10 +237,6 @@ static int eps_cpu_init(struct cpufreq_policy *pol=
icy)
 		brand =3D (((lo >> 4) ^ (lo >> 2))) & 0xff;
 		printk(KERN_CONT "Model D ");
 		break;
-	default:
-		printk(KERN_CONT "unknown processor\n");
-		return -ENODEV;
-		break;
 	}
=20
 	switch (brand) {
@@ -437,7 +433,8 @@ static int __init eps_init(void)
 	/* This driver will work only on Centaur C7 processors with
 	 * Enhanced SpeedStep/PowerSaver registers */
 	if (c->x86_vendor !=3D X86_VENDOR_CENTAUR
-	    || c->x86 !=3D 6 || c->x86_model < 10)
+	    || c->x86 !=3D 6
+	    || !(c->x86_model =3D=3D 10 || c->x86_model =3D=3D 13))
 		return -ENODEV;
 	if (!cpu_has(c, X86_FEATURE_EST))
 		return -ENODEV;
--=20
1.7.6


----------------------------------------------------------------
Znajdz samochod idealny dla siebie!
Szukaj >> http://linkint.pl/f29e2
