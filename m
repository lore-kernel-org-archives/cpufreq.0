From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] cpufreq: SPEAr: Fix incorrect variable type
Date: Thu, 26 Sep 2013 10:56:42 +0530
Message-ID: <1380173202-12624-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: cpufreq@vger.kernel.org, viresh.kumar@linaro.org, rjw@sisk.pl, sachin.kamat@linaro.org

'clk_round_rate' returns a negative error code upon failure. This
will never get detected by unsigned 'newfreq'. Make it signed.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/cpufreq/spear-cpufreq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
index 19e364fa..3f41816 100644
--- a/drivers/cpufreq/spear-cpufreq.c
+++ b/drivers/cpufreq/spear-cpufreq.c
@@ -113,7 +113,7 @@ static int spear_cpufreq_target(struct cpufreq_policy *policy,
 		unsigned int target_freq, unsigned int relation)
 {
 	struct cpufreq_freqs freqs;
-	unsigned long newfreq;
+	long newfreq;
 	struct clk *srcclk;
 	int index, ret, mult = 1;
 
-- 
1.7.9.5

