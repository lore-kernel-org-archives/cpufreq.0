From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH] cpufreq/db8500: support all frequencies
Date: Fri, 2 Sep 2011 08:52:10 +0200
Message-ID: <1314946330-26014-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>

From: Linus Walleij <linus.walleij@linaro.org>

This adds support for the 200 MHz frequency mode of the
DB8500 SoC, and prints the available frequencies at init
time.

Cc: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/cpufreq/db8500-cpufreq.c |   24 ++++++++++++++++--------
 1 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/db8500-cpufreq.c b/drivers/cpufreq/db8500-cpufreq.c
index d90456a..26c1645 100644
--- a/drivers/cpufreq/db8500-cpufreq.c
+++ b/drivers/cpufreq/db8500-cpufreq.c
@@ -18,24 +18,29 @@
 static struct cpufreq_frequency_table freq_table[] = {
 	[0] = {
 		.index = 0,
-		.frequency = 300000,
+		.frequency = 200000,
 	},
 	[1] = {
 		.index = 1,
-		.frequency = 600000,
+		.frequency = 300000,
 	},
 	[2] = {
-		/* Used for MAX_OPP, if available */
 		.index = 2,
-		.frequency = CPUFREQ_TABLE_END,
+		.frequency = 600000,
 	},
 	[3] = {
+		/* Used for MAX_OPP, if available */
 		.index = 3,
 		.frequency = CPUFREQ_TABLE_END,
 	},
+	[4] = {
+		.index = 4,
+		.frequency = CPUFREQ_TABLE_END,
+	},
 };
 
 static enum arm_opp idx2opp[] = {
+	ARM_EXTCLK,
 	ARM_50_OPP,
 	ARM_100_OPP,
 	ARM_MAX_OPP
@@ -108,12 +113,15 @@ static int __cpuinit db8500_cpufreq_init(struct cpufreq_policy *policy)
 
 	BUILD_BUG_ON(ARRAY_SIZE(idx2opp) + 1 != ARRAY_SIZE(freq_table));
 
-	if (cpu_is_u8500v2() && !prcmu_is_u8400()) {
-		freq_table[0].frequency = 400000;
-		freq_table[1].frequency = 800000;
+	if (!prcmu_is_u8400()) {
+		freq_table[1].frequency = 400000;
+		freq_table[2].frequency = 800000;
 		if (prcmu_has_arm_maxopp())
-			freq_table[2].frequency = 1000000;
+			freq_table[3].frequency = 1000000;
 	}
+	pr_info("db8500-cpufreq : Available frequencies:\n");
+	while (freq_table[i].frequency != CPUFREQ_TABLE_END)
+		pr_info("  %d Mhz\n", freq_table[i++].frequency/1000);
 
 	/* get policy fields based on the table */
 	res = cpufreq_frequency_table_cpuinfo(policy, freq_table);
-- 
1.7.3.2

