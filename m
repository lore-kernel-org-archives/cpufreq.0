From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] [CPUFREQ] EXYNOS: Use static for functions used in only this file
Date: Tue, 20 Nov 2012 11:29:14 +0530
Message-ID: <1353391154-32524-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, cpufreq@vger.kernel.org
Cc: rjw@sisk.pl, patches@linaro.org

Fixes following sparse error.
drivers/cpufreq/exynos-cpufreq.c:34:5: warning: symbol
'exynos_verify_speed' was not declared. Should it be static?
drivers/cpufreq/exynos-cpufreq.c:40:14: warning: symbol
'exynos_getspeed' was not declared. Should it be static?

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 drivers/cpufreq/exynos-cpufreq.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index af2d81e..eb057bf 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -31,13 +31,13 @@ static unsigned int locking_frequency;
 static bool frequency_locked;
 static DEFINE_MUTEX(cpufreq_lock);
 
-int exynos_verify_speed(struct cpufreq_policy *policy)
+static int exynos_verify_speed(struct cpufreq_policy *policy)
 {
 	return cpufreq_frequency_table_verify(policy,
 					      exynos_info->freq_table);
 }
 
-unsigned int exynos_getspeed(unsigned int cpu)
+static unsigned int exynos_getspeed(unsigned int cpu)
 {
 	return clk_get_rate(exynos_info->cpu_clk) / 1000;
 }
-- 
1.7.4.1

