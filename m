From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 69/92] cpufreq: spear: don't initialize part of policy that is set by core too
Date: Thu,  3 Oct 2013 20:29:03 +0530
Message-ID: <f58f74d756b60f76ae038699966aede07bc47eb8.1380783079.git.viresh.kumar@linaro.org>
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
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, spear-devel@list.st.com

Many common initializations of struct policy are moved to core now and hence
this driver doesn't need to do it. This patch removes such code.

Most recent of those changes is to call ->get() in the core after calling
->init().

Cc: spear-devel@list.st.com
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/spear-cpufreq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
index 796b1db..34f04f4 100644
--- a/drivers/cpufreq/spear-cpufreq.c
+++ b/drivers/cpufreq/spear-cpufreq.c
@@ -180,8 +180,6 @@ static int spear_cpufreq_init(struct cpufreq_policy *policy)
 	}
 
 	policy->cpuinfo.transition_latency = spear_cpufreq.transition_latency;
-	policy->cur = spear_cpufreq_get(0);
-
 	cpumask_setall(policy->cpus);
 
 	return 0;
-- 
1.7.12.rc2.18.g61b472e

