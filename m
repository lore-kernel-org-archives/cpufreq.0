From: Rafal Bilski <rafalbilski@interia.pl>
Subject: [PATCH] e_powersaver: Add sanity checks to code provided by VIA
Date: Thu, 14 Jul 2011 22:58:42 +0100
Message-ID: <1310680722-3974-1-git-send-email-rafalbilski@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, Rafal Bilski <rafalbilski@interia.pl>

Patch from VIA is forcing "e_powersaver" to accept any processor >=A, 
but code supports only A and D.
Patch from VIA is forcing "e_powersaver" to support new brand, but code 
was intended for 2 bits only.
Looks like model D is using 8 bits for brand. Compensate.

Thanks to Axel Lin for pointing it out!

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 drivers/cpufreq/e_powersaver.c |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_powersaver.c
index 35a257d..7883ffa 100644
--- a/drivers/cpufreq/e_powersaver.c
+++ b/drivers/cpufreq/e_powersaver.c
@@ -179,9 +179,13 @@ static int eps_cpu_init(struct cpufreq_policy *policy)
 		break;
 	case 13:
 		rdmsr(0x1154, lo, hi);
-		brand = (((lo >> 4) ^ (lo >> 2))) & 0x000000ff;
+		brand = (((lo >> 4) ^ (lo >> 2))) & 0xff;
 		printk(KERN_CONT "Model D ");
 		break;
+	default:
+		printk(KERN_CONT "unknown processor\n");
+		return -ENODEV;
+		break;
 	}
 
 	switch (brand) {
@@ -194,14 +198,19 @@ static int eps_cpu_init(struct cpufreq_policy *policy)
 	case EPS_BRAND_EDEN:
 		printk(KERN_CONT "Eden\n");
 		break;
+	case EPS_BRAND_C3:
+		printk(KERN_CONT "C3\n");
+		return -ENODEV;
+		break;
 	case EPS_BRAND_C7D:
 		printk(KERN_CONT "C7-D\n");
 		break;
-	case EPS_BRAND_C3:
-		printk(KERN_CONT "C3\n");
+	default:
+		printk(KERN_CONT "unsupported brand\n");
 		return -ENODEV;
 		break;
 	}
+
 	/* Enable Enhanced PowerSaver */
 	rdmsrl(MSR_IA32_MISC_ENABLE, val);
 	if (!(val & MSR_IA32_MISC_ENABLE_ENHANCED_SPEEDSTEP)) {
-- 
1.7.6


----------------------------------------------------------------
Znajdz samochod idealny dla siebie!
Szukaj >> http://linkint.pl/f29e2
