From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH RESEND 2/2] cpufreq: imx6q: Remove unused include
Date: Mon, 14 Apr 2014 11:46:57 +0200
Message-ID: <1397468817-23266-2-git-send-email-p.zabel@pengutronix.de>
References: <1397468817-23266-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397468817-23266-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Shawn Guo <shawn.guo@freescale.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>

There is no need to include delay.h.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Shawn Guo <shawn.guo@freescale.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/cpufreq/imx6q-cpufreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index 92a82ec..af366c2 100644
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
1.9.1
