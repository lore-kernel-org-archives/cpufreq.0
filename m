From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] cpufreq: Fix build of s3c64xx cpufreq driver for header change
Date: Fri, 29 Jul 2011 15:26:58 +0100
Message-ID: <1311949618-919-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

Some header change has removed an implicit include of module.h, breaking
the build due to the use of THIS_MODULE. Fix that.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 drivers/cpufreq/s3c64xx-cpufreq.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index b8d1d20..3475f65 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/regulator/consumer.h>
+#include <linux/module.h>
 
 static struct clk *armclk;
 static struct regulator *vddarm;
-- 
1.7.5.4

