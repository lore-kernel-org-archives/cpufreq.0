From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH] cpufreq: Reformat printk() statement
Date: Thu,  6 Mar 2014 09:34:39 -0800
Message-ID: <1394127279-29871-1-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=wsseLKaOraJNV96uVerQ3G6fSAWvrcWVuUzMlugJv3k=;
        b=1DLSH43sjSSnESJA/7c3bnCkWTkAqw5mK9NQ93Xsqcyfrsfo3QO3lv+1fBEZPiobTg
         67fB+5NIC4Gmigv9/Q+hzK2EbqW3k95Z2/3BaUICrGS4i88nZWNl5MDkuHnRhr9zUTId
         7HtBeGWvzggCKEqnj4ItbMkhXSYAs3OU7sY5gHsLwFpjE4LvWauX3kg91a+2mX3XE2yU
         qFCVMDY7BBXMAqtxdYpgm38++9t5f03uzGEgaceqInu8uC/WnCAoOlAK7cLxYFkqncu/
         3uQHq+0quRBbN1UrYMG2caeGaN4iAOwY8dBnKTsC7Muhm8ElDuiAAD/XUZNIVH+vN9kD
         gW/Q==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>

Reformat a printk statement to:
 - use pr_warn
 - bring the whole string into a single line in favor of being able to
   grep for the message (ignoring the 80 char limit)

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 drivers/cpufreq/cpufreq.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index cb003a6b72c8..534c2df608ed 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1874,11 +1874,8 @@ static int __cpufreq_governor(struct cpufreq_policy *policy,
 		if (!gov)
 			return -EINVAL;
 		else {
-			printk(KERN_WARNING "%s governor failed, too long"
-			       " transition latency of HW, fallback"
-			       " to %s governor\n",
-			       policy->governor->name,
-			       gov->name);
+			pr_warn("%s governor failed, too long transition latency of HW, fallback to %s governor\n",
+					policy->governor->name, gov->name);
 			policy->governor = gov;
 		}
 	}
-- 
1.9.0.1.g4196000

