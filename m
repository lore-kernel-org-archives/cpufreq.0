From: Manish Badarkhe <badarkhe.manish@gmail.com>
Subject: [PATCH] cpufreq: fix false return check from "regulator_set_voltage"
Date: Wed,  9 Oct 2013 20:43:37 +0530
Message-ID: <1381331617-14703-1-git-send-email-badarkhe.manish@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=y/Ft4xg7BWvtqyR4SbjEYilZpiqxnEA9YQrH6K7ikgI=;
        b=cLE4eHI9pjVs2GSM8Q6Zq2J1aWIHwT2wU5XGtS6sryr3xCDLhtCJ8rcxBIn98P3VNx
         dS/nN7xEvFFklEgsIVAOjI6lPOJtVrB7d5Dm+UDZWQRR3DVdsGkBnCbd3Ss29pVo2BW7
         2EZdEJ7BmJcaeFACDDyF9L99juEtyHRCBmi7a7mf5N2ATegmPAIDT9KBl1ONh/JsrIb8
         ok6VCi4ZWRbaih/+l+pqHj7Gn3N09MeystCjOB4v9ktdi4rPWvq/PexygQmrfnGx149B
         LlvTPouwRsEXY/0Bebb/w6A5APHxMHL14Vc1fauwo+Gs05kxm9dPB8JruXoqMSD6dJIS
         +7Uw==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rjw@sisk.pl, badarkhe.manish@gmail.com, viresh.kumar@linaro.org, kgene.kim@samsung.com

Currently, code checks false return value from "regulator_set_voltage"
to show failure message. Modify the code to check proper return
value from "regulator_set_voltage".

Signed-off-by: Manish Badarkhe <badarkhe.manish@gmail.com>
---
Based on master branch of linux-mainline.

:100644 100644 0fac344... 1537f32... M	drivers/cpufreq/exynos-cpufreq.c
 drivers/cpufreq/exynos-cpufreq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 0fac344..1537f32 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -141,7 +141,7 @@ post_notify:
 	if ((freqs.new < freqs.old) ||
 	   ((freqs.new > freqs.old) && safe_arm_volt)) {
 		/* down the voltage after frequency change */
-		regulator_set_voltage(arm_regulator, arm_volt,
+		ret = regulator_set_voltage(arm_regulator, arm_volt,
 				arm_volt);
 		if (ret) {
 			pr_err("%s: failed to set cpu voltage to %d\n",
-- 
1.7.10.4
