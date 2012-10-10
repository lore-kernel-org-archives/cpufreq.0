From: Ulf Hansson <ulf.hansson@stericsson.com>
Subject: [PATCH 7/8] clk: ux500: Add armss clk and fixup smp_twd clk for u8500
Date: Wed, 10 Oct 2012 13:42:28 +0200
Message-ID: <1349869349-8070-8-git-send-email-ulf.hansson@stericsson.com>
References: <1349869349-8070-1-git-send-email-ulf.hansson@stericsson.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1349869349-8070-1-git-send-email-ulf.hansson@stericsson.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Philippe Begnic <philippe.begnic@st.com>, Rickard Andersson <rickard.andersson@stericsson.com>, Jonas Aberg <jonas.aberg@stericsson.com>, Vincent Guittot <vincent.guittot@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>

From: Ulf Hansson <ulf.hansson@linaro.org>

The new armss clk is a prcmu_scalable_rate clk which represents
the ARMSS clk. This then makes it possible to convert the smp_twd
clk to a fixed factor clock type, using a fixed divider of 2 and
with the armss clk as parent.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/clk/ux500/u8500_clk.c |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ux500/u8500_clk.c b/drivers/clk/ux500/u8500_clk.c
index ca4a25e..b1bd1c46 100644
--- a/drivers/clk/ux500/u8500_clk.c
+++ b/drivers/clk/ux500/u8500_clk.c
@@ -205,16 +205,18 @@ void u8500_clk_init(void)
 	clk_register_clkdev(clk, "dsilp2", "dsilink.2");
 	clk_register_clkdev(clk, "dsilp2", "mcde");
 
-	clk = clk_reg_prcmu_rate("smp_twd", NULL, PRCMU_ARMSS,
-				CLK_IS_ROOT|CLK_GET_RATE_NOCACHE|
-				CLK_IGNORE_UNUSED);
+	clk = clk_reg_prcmu_scalable_rate("armss", NULL,
+				PRCMU_ARMSS, 0, CLK_IS_ROOT|CLK_IGNORE_UNUSED);
+	clk_register_clkdev(clk, "armss", NULL);
+
+	clk = clk_register_fixed_factor(NULL, "smp_twd", "armss",
+				CLK_IGNORE_UNUSED, 1, 2);
 	clk_register_clkdev(clk, NULL, "smp_twd");
 
 	/*
 	 * FIXME: Add special handled PRCMU clocks here:
-	 * 1. clk_arm, use PRCMU_ARMCLK.
-	 * 2. clkout0yuv, use PRCMU as parent + need regulator + pinctrl.
-	 * 3. ab9540_clkout1yuv, see clkout0yuv
+	 * 1. clkout0yuv, use PRCMU as parent + need regulator + pinctrl.
+	 * 2. ab9540_clkout1yuv, see clkout0yuv
 	 */
 
 	/* PRCC P-clocks */
-- 
1.7.10

