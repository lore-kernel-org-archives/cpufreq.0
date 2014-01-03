From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] cpufreq: s3c2440: Remove hardware.h inclusion
Date: Fri,  3 Jan 2014 14:57:35 +0530
Message-ID: <1388741257-26438-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: linux-pm@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, sachin.kamat@linaro.org, patches@linaro.org

The contents of this header file are not referenced in the driver.
Remove its inclusion.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/cpufreq/s3c2440-cpufreq.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/cpufreq/s3c2440-cpufreq.c b/drivers/cpufreq/s3c2440-cpufreq.c
index 72b2cc8a5a85..717ef04ec90e 100644
--- a/drivers/cpufreq/s3c2440-cpufreq.c
+++ b/drivers/cpufreq/s3c2440-cpufreq.c
@@ -22,8 +22,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 
-#include <mach/hardware.h>
-
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-- 
1.7.9.5

