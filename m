From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 54/92] cpufreq: longhaul: don't initialize part of policy that is set by core too
Date: Thu,  3 Oct 2013 20:28:48 +0530
Message-ID: <1b8e40d118c01c38aa6e9573d371cdffed23581c.1380783079.git.viresh.kumar@linaro.org>
References: <cover.1380783079.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1380783079.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1380783079.git.viresh.kumar@linaro.org>
References: <cover.1380783079.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

Many common initializations of struct policy are moved to core now and hence
this driver doesn't need to do it. This patch removes such code.

Most recent of those changes is to call ->get() in the core after calling
->init().

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/longhaul.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/longhaul.c b/drivers/cpufreq/longhaul.c
index 57d7b02..14df497 100644
--- a/drivers/cpufreq/longhaul.c
+++ b/drivers/cpufreq/longhaul.c
@@ -913,7 +913,6 @@ static int longhaul_cpu_init(struct cpufreq_policy *policy)
 		longhaul_setup_voltagescaling();
 
 	policy->cpuinfo.transition_latency = 200000;	/* nsec */
-	policy->cur = calc_speed(longhaul_get_cpu_mult());
 
 	return cpufreq_table_validate_and_show(policy, longhaul_table);
 }
-- 
1.7.12.rc2.18.g61b472e

