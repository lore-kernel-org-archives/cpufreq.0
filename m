From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] s3c64xx: Fix mis-cherry pick of VDDINT
Date: Thu, 16 Feb 2012 09:32:03 -0800
Message-ID: <1329413523-19912-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

We don't have any of the other code for VDDINT, including the variable
declaration, so don't try to get it as we can't build.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 drivers/cpufreq/s3c64xx-cpufreq.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index a5e72cb..6f9490b 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -217,13 +217,6 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
 	} else {
 		s3c64xx_cpufreq_config_regulator();
 	}
-
-	vddint = regulator_get(NULL, "vddint");
-	if (IS_ERR(vddint)) {
-		ret = PTR_ERR(vddint);
-		pr_err("Failed to obtain VDDINT: %d\n", ret);
-		vddint = NULL;
-	}
 #endif
 
 	freq = s3c64xx_freq_table;
-- 
1.7.9.rc1

