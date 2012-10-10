From: Ulf Hansson <ulf.hansson@stericsson.com>
Subject: [PATCH 6/8] clk: ux500: Support for prcmu_scalable_rate clock
Date: Wed, 10 Oct 2012 13:42:27 +0200
Message-ID: <1349869349-8070-7-git-send-email-ulf.hansson@stericsson.com>
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

The prcmu_scalable_rate clock can change rate but is not gateable.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/clk/ux500/clk-prcmu.c |   17 +++++++++++++++++
 drivers/clk/ux500/clk.h       |    6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 930cdfe..2e5ef7a 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -153,6 +153,13 @@ static struct clk_ops clk_prcmu_gate_ops = {
 	.recalc_rate = clk_prcmu_recalc_rate,
 };
 
+static struct clk_ops clk_prcmu_scalable_rate_ops = {
+	.is_enabled = clk_prcmu_is_enabled,
+	.recalc_rate = clk_prcmu_recalc_rate,
+	.round_rate = clk_prcmu_round_rate,
+	.set_rate = clk_prcmu_set_rate,
+};
+
 static struct clk_ops clk_prcmu_rate_ops = {
 	.is_enabled = clk_prcmu_is_enabled,
 	.recalc_rate = clk_prcmu_recalc_rate,
@@ -233,6 +240,16 @@ struct clk *clk_reg_prcmu_gate(const char *name,
 			&clk_prcmu_gate_ops);
 }
 
+struct clk *clk_reg_prcmu_scalable_rate(const char *name,
+					const char *parent_name,
+					u8 cg_sel,
+					unsigned long rate,
+					unsigned long flags)
+{
+	return clk_reg_prcmu(name, parent_name, cg_sel, rate, flags,
+			&clk_prcmu_scalable_rate_ops);
+}
+
 struct clk *clk_reg_prcmu_rate(const char *name,
 			       const char *parent_name,
 			       u8 cg_sel,
diff --git a/drivers/clk/ux500/clk.h b/drivers/clk/ux500/clk.h
index 836d7d1..a9e2961 100644
--- a/drivers/clk/ux500/clk.h
+++ b/drivers/clk/ux500/clk.h
@@ -35,6 +35,12 @@ struct clk *clk_reg_prcmu_gate(const char *name,
 			       u8 cg_sel,
 			       unsigned long flags);
 
+struct clk *clk_reg_prcmu_scalable_rate(const char *name,
+					const char *parent_name,
+					u8 cg_sel,
+					unsigned long rate,
+					unsigned long flags);
+
 struct clk *clk_reg_prcmu_rate(const char *name,
 			       const char *parent_name,
 			       u8 cg_sel,
-- 
1.7.10

