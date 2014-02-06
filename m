From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] cpufreq: imx6q: Remove unused include
Date: Thu,  6 Feb 2014 16:11:25 +0100
Message-ID: <1391699485-2212-2-git-send-email-p.zabel@pengutronix.de>
References: <1391699485-2212-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1391699485-2212-1-git-send-email-p.zabel@pengutronix.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>

There is no need to include delay.h.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/cpufreq/imx6q-cpufreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index b1fc5ef..20f332e 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -9,7 +9,6 @@
 #include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
-#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/of.h>
-- 
1.8.5.3

