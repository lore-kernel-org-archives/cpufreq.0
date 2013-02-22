From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] imx6q-cpufreq: fix return value check in imx6q_cpufreq_probe()
Date: Fri, 22 Feb 2013 12:39:30 +0800
Message-ID: <CAPgLHd_sbN0i_6Lqh+-2o9rZx_CG3=czZJV3N6oAuSKrjkttbw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to:cc
         :content-type;
        bh=0o8rJO7dPYWiPGPkdqS1o6x18A6X4ByBV6Rm2LpCWzk=;
        b=z3d5WpQvo7XtKdH37An4jUAhEsHmHauBcIxYAy764O03B8QLAGMLBdm4u40emO0qsO
         hWL7iu2QM0SXas6FjMbNPDlTQ/NtstPEzWf16M7bL/4nuoqnmNNE7KYvVk5ZmYJ6+380
         PiLc5PrRdYy6KPrEslXu8JgpOu2ED3tGAh4VLuXTkE3FrklHQXaViW128IACuQZaZk+c
         XbTwAbJKnlTXpym9CeC1jc8lEHDvhveZv/LXS/EygOExOf6y9i9OfgJ9PcVc0IfP2fh0
         lkCbvxJdHny3QbKX5aK8rpZ7HmDtqKv55sntzA+eIPLoi9dAy2sh2PiDLYBDD1CIkJEc
         LAUw==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, shawn.guo@linaro.org
Cc: yongjun_wei@trendmicro.com.cn, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function devm_regulator_get() returns
ERR_PTR() and never returns NULL. The NULL test in the return
value check should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/cpufreq/imx6q-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index d6b6ef3..54e336d 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -245,7 +245,7 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 	arm_reg = devm_regulator_get(cpu_dev, "arm");
 	pu_reg = devm_regulator_get(cpu_dev, "pu");
 	soc_reg = devm_regulator_get(cpu_dev, "soc");
-	if (!arm_reg || !pu_reg || !soc_reg) {
+	if (IS_ERR(arm_reg) || IS_ERR(pu_reg) || IS_ERR(soc_reg)) {
 		dev_err(cpu_dev, "failed to get regulators\n");
 		ret = -ENOENT;
 		goto put_node;


