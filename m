From: Axel Lin <axel.lin@gmail.com>
Subject: [RFC][PATCH] cpufreq: e_powersaver: Fix checking brand for
 EPS_BRAND_C3
Date: Fri, 08 Jul 2011 16:37:23 +0800
Message-ID: <1310114243.2940.3.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:to:cc:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=nelqW437n6GGg7A4S7zztj29HyHAy59SK6n3xVnu5zc=;
        b=Oa0iCpA4ywV5ZWqsWbrqH8+pCzFJtn92EcNpFt+55ogQhAh3j++riYi6tOPREypUK9
         pL9dP6WEU0dMExgDdGOG2GvaqZJy05ahncfjNR7fcaZZIrSD0/zhmjurpmqRnSn0w/7H
         bEzaP69jtNqSX5iXTGiOQlxizSJXsoZ3WDIU8=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Rafal Bilski <rafalbilski@interia.pl>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

Do not return -ENODEV for EPS_BRAND_C3.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
I just found the code is suspect. 
I don't have this hardware handy.
Anyone can help to confirm and test if this patch works?
Axel

 drivers/cpufreq/e_powersaver.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_powersaver.c
index 35a257d..637f055 100644
--- a/drivers/cpufreq/e_powersaver.c
+++ b/drivers/cpufreq/e_powersaver.c
@@ -199,8 +199,9 @@ static int eps_cpu_init(struct cpufreq_policy *policy)
 		break;
 	case EPS_BRAND_C3:
 		printk(KERN_CONT "C3\n");
-		return -ENODEV;
 		break;
+	default:
+		return -ENODEV;
 	}
 	/* Enable Enhanced PowerSaver */
 	rdmsrl(MSR_IA32_MISC_ENABLE, val);
-- 
1.7.4.1



