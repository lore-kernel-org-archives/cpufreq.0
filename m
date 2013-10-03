From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 47/92] cpufreq: elanfreq: don't initialize part of policy that is set by core too
Date: Thu,  3 Oct 2013 20:28:41 +0530
Message-ID: <d91cd2c6db3204ab0ffe1f2e6f7d541f3e9ea9f7.1380783079.git.viresh.kumar@linaro.org>
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
 drivers/cpufreq/elanfreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/elanfreq.c b/drivers/cpufreq/elanfreq.c
index fe7053c..d91a645 100644
--- a/drivers/cpufreq/elanfreq.c
+++ b/drivers/cpufreq/elanfreq.c
@@ -207,7 +207,6 @@ static int elanfreq_cpu_init(struct cpufreq_policy *policy)
 
 	/* cpuinfo and default policy values */
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
-	policy->cur = elanfreq_get_cpu_frequency(0);
 
 	return cpufreq_table_validate_and_show(policy, elanfreq_table);
 }
-- 
1.7.12.rc2.18.g61b472e

