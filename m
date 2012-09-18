From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] cpufreq: OMAP: Check IS_ERR() instead of NULL for
 omap_device_get_by_hwmod_name
Date: Tue, 18 Sep 2012 09:45:47 +0800
Message-ID: <1347932747.6562.3.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:content-type:x-mailer
         :content-transfer-encoding:mime-version;
        bh=FLOVfzhkJkhmdRIgSWcElgiujCAmD/ho7S13I52d2PM=;
        b=HqBDqsqgRimXuK3IMsW9oh/wKdaQ2HK0/krxJytnDZ+CoLWds1itUdpgBdWogWgbv2
         RPyM/a+HJ0ImsuFKvxYm34ksQTFEWNKKdW3nqrk3gg5F2U2OBbblb8pncTOq/+jbaiNm
         6DIlxKKyw9WfpSdS17r++vL2KXpZGtW957Oe/ydMDbVMQ2SFOYWASo3bb3furxV1au4t
         2njem4FzXMGRKCYFZ+EMniD5SSq5VdEeCKr/awh0iJANEwEP3R8yYJtUyXPgavMubmz0
         bQb3MjR3bb/VeYJJcMjn4tXw33Ns+iJJ8yXuxBIKqSBKX/ROa5I8WsFGZmQaeeFw3d8i
         ucAA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Kevin Hilman <khilman@ti.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-omap@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

omap_device_get_by_hwmod_name() returns ERR_PTR on error.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/cpufreq/omap-cpufreq.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
index 6e22f44..65f8e9a 100644
--- a/drivers/cpufreq/omap-cpufreq.c
+++ b/drivers/cpufreq/omap-cpufreq.c
@@ -266,9 +266,9 @@ static int __init omap_cpufreq_init(void)
 	}
 
 	mpu_dev = omap_device_get_by_hwmod_name("mpu");
-	if (!mpu_dev) {
+	if (IS_ERR(mpu_dev)) {
 		pr_warning("%s: unable to get the mpu device\n", __func__);
-		return -EINVAL;
+		return PTR_ERR(mpu_dev);
 	}
 
 	mpu_reg = regulator_get(mpu_dev, "vcc");
-- 
1.7.9.5



