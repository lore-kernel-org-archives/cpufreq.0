From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH 1/3] cpufreq: exynos: Remove error return even if no soc found
Date: Wed,  6 Feb 2013 11:39:20 -0800
Message-ID: <1360179562-19950-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
        bh=/+fuHBPIvIZvO9C8uCcuWr8+7CJGG80PNJ/GdY132EQ=;
        b=wZH/6Q1ipxeGm0R+mmGlc+aqSgn6aNoFEIkTZVGYQnWF4OOfCGWNKgtDs8Jqm4iDqP
         gVPIjiZ4HzN6Qk7wfwetG3T8SiS5IpVMUO4wC06YjYNL1/0vjNnnHmKLDynumeVK7W18
         amiGDn56VPLdv1TeSYHMLnjaoNxVoDtSp3svYRDau9lEZbmn1+KRI5pafY97EJWIpte+
         WFUFquMOFqA230mfb3O8Ktya10oj/h84AtvYLSGVqdsUs0XIpc/RLoDze1sz9tmunfej
         kFt/3Ny4UM0NygtWtbApdIqaTg/suZjbLOFqQo+m6uO8bo4bsmNEx+KDyZjRJnsxqqVZ
         N6cw==
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org

This change is needed for adding different type of cpufreq driver
and support single binary image.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 7012ea8..9d3690a 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -272,7 +272,7 @@ static int __init exynos_cpufreq_init(void)
 	else if (soc_is_exynos5250())
 		ret = exynos5250_cpufreq_init(exynos_info);
 	else
-		pr_err("%s: CPU type not found\n", __func__);
+		return 0;
 
 	if (ret)
 		goto err_vdd_arm;
-- 
1.7.10.4
