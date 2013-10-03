From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 59/92] cpufreq: pcc: don't initialize part of policy that is set by core too
Date: Thu,  3 Oct 2013 20:28:53 +0530
Message-ID: <945e3f35296bbca5e38a815f7ae3d0c27b35c95b.1380783079.git.viresh.kumar@linaro.org>
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
 drivers/cpufreq/pcc-cpufreq.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
index 70438de..c265fd1 100644
--- a/drivers/cpufreq/pcc-cpufreq.c
+++ b/drivers/cpufreq/pcc-cpufreq.c
@@ -559,13 +559,6 @@ static int pcc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 		ioread32(&pcch_hdr->nominal) * 1000;
 	policy->min = policy->cpuinfo.min_freq =
 		ioread32(&pcch_hdr->minimum_frequency) * 1000;
-	policy->cur = pcc_get_freq(cpu);
-
-	if (!policy->cur) {
-		pr_debug("init: Unable to get current CPU frequency\n");
-		result = -EINVAL;
-		goto out;
-	}
 
 	pr_debug("init: policy->max is %d, policy->min is %d\n",
 		policy->max, policy->min);
-- 
1.7.12.rc2.18.g61b472e

