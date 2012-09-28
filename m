From: Ulf Hansson <ulf.hansson@stericsson.com>
Subject: [PATCH 2/4] mfd: db8500: Provide cpufreq table as platform data
Date: Fri, 28 Sep 2012 16:16:52 +0200
Message-ID: <1348841814-13645-3-git-send-email-ulf.hansson@stericsson.com>
References: <1348841814-13645-1-git-send-email-ulf.hansson@stericsson.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1348841814-13645-1-git-send-email-ulf.hansson@stericsson.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, Rickard Andersson <rickard.andersson@stericsson.com>, Jonas Aberg <jonas.aberg@stericsson.com>, Vincent Guittot <vincent.guittot@linaro.org>, Philippe Begnic <philippe.begnic@st.com>, Ulf Hansson <ulf.hansson@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>

From: Ulf Hansson <ulf.hansson@linaro.org>

The cpufreq table needs dynamically update due to what the PRCMU
firmware is supporting. The table is then provided through to the
mfd child device as platform data.

Cc: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mfd/db8500-prcmu.c |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index bac4876..163d1b3 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -31,6 +31,7 @@
 #include <linux/mfd/abx500/ab8500.h>
 #include <linux/regulator/db8500-prcmu.h>
 #include <linux/regulator/machine.h>
+#include <linux/cpufreq.h>
 #include <asm/hardware/gic.h>
 #include <mach/hardware.h>
 #include <mach/irqs.h>
@@ -3001,6 +3002,15 @@ static struct regulator_init_data db8500_regulators[DB8500_NUM_REGULATORS] = {
 	},
 };
 
+/* CPU FREQ table, may be changed due to if MAX_OPP is supported. */
+static struct cpufreq_frequency_table db8500_cpufreq_table[] = {
+	{ .frequency = 200000, .index = ARM_EXTCLK,},
+	{ .frequency = 400000, .index = ARM_50_OPP,},
+	{ .frequency = 800000, .index = ARM_100_OPP,},
+	{ .frequency = CPUFREQ_TABLE_END,}, /* To be used for MAX_OPP. */
+	{ .frequency = CPUFREQ_TABLE_END,},
+};
+
 static struct resource ab8500_resources[] = {
 	[0] = {
 		.start	= IRQ_DB8500_AB8500,
@@ -3019,6 +3029,8 @@ static struct mfd_cell db8500_prcmu_devs[] = {
 	{
 		.name = "cpufreq-u8500",
 		.of_compatible = "stericsson,cpufreq-u8500",
+		.platform_data = &db8500_cpufreq_table,
+		.pdata_size = sizeof(db8500_cpufreq_table),
 	},
 	{
 		.name = "ab8500-core",
@@ -3029,6 +3041,14 @@ static struct mfd_cell db8500_prcmu_devs[] = {
 	},
 };
 
+static void db8500_prcmu_update_cpufreq(void)
+{
+	if (prcmu_has_arm_maxopp()) {
+		db8500_cpufreq_table[3].frequency = 1000000;
+		db8500_cpufreq_table[3].index = ARM_MAX_OPP;
+	}
+}
+
 /**
  * prcmu_fw_init - arch init call for the Linux PRCMU fw init logic
  *
@@ -3073,6 +3093,8 @@ static int __devinit db8500_prcmu_probe(struct platform_device *pdev)
 	if (cpu_is_u8500v20_or_later())
 		prcmu_config_esram0_deep_sleep(ESRAM0_DEEP_SLEEP_STATE_RET);
 
+	db8500_prcmu_update_cpufreq();
+
 	err = mfd_add_devices(&pdev->dev, 0, db8500_prcmu_devs,
 			      ARRAY_SIZE(db8500_prcmu_devs), NULL, 0, NULL);
 	if (err) {
-- 
1.7.10

