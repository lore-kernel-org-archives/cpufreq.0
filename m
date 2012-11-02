From: Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: [PATCH 2/6 v2] clk, highbank: remove non-bypass reset mode
Date: Fri,  2 Nov 2012 13:51:45 -0500
Message-ID: <1351882309-733-3-git-send-email-mark.langsdorf@calxeda.com>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com>
 <1351882309-733-1-git-send-email-mark.langsdorf@calxeda.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1351882309-733-1-git-send-email-mark.langsdorf@calxeda.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: cpufreq@vger.kernel.org, Mark Langsdorf <mark.langsdorf@calxeda.com>, Rob Herring <rob.herring@calxeda.com>, mturquette@linaro.org

The highbank clock will glitch if the clock rate is reset without
relocking the PLL. Remove the option to attempt reseting without
relocking.

Signed-off-by: Mark Langsdorf <mark.langsdorf@calxeda.com>
Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: mturquette@linaro.org

Changes from v2:
	Removed erroneous reformating.

---
 drivers/clk/clk-highbank.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-highbank.c b/drivers/clk/clk-highbank.c
index 52fecad..3a0b723 100644
--- a/drivers/clk/clk-highbank.c
+++ b/drivers/clk/clk-highbank.c
@@ -182,8 +182,10 @@ static int clk_pll_set_rate(struct clk_hw *hwclk, unsigned long rate,
 		reg |= HB_PLL_EXT_ENA;
 		reg &= ~HB_PLL_EXT_BYPASS;
 	} else {
+		writel(reg | HB_PLL_EXT_BYPASS, hbclk->reg);
 		reg &= ~HB_PLL_DIVQ_MASK;
 		reg |= divq << HB_PLL_DIVQ_SHIFT;
+		writel(reg | HB_PLL_EXT_BYPASS, hbclk->reg);
 	}
 	writel(reg, hbclk->reg);
 
-- 
1.7.11.7

