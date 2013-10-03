From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 55/92] cpufreq: loongson2: don't initialize part of policy that is set by core too
Date: Thu,  3 Oct 2013 20:28:49 +0530
Message-ID: <e1663a493aa7a3d115deed4cce35112c13e42c05.1380783079.git.viresh.kumar@linaro.org>
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
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, John Crispin <blogic@openwrt.org>

Many common initializations of struct policy are moved to core now and hence
this driver doesn't need to do it. This patch removes such code.

Most recent of those changes is to call ->get() in the core after calling
->init().

Cc: John Crispin <blogic@openwrt.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/loongson2_cpufreq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index ed7fbe2..dd4f3e4 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -131,8 +131,6 @@ static int loongson2_cpufreq_cpu_init(struct cpufreq_policy *policy)
 		return ret;
 	}
 
-	policy->cur = loongson2_cpufreq_get(policy->cpu);
-
 	return cpufreq_table_validate_and_show(policy,
 					    &loongson2_clockmod_table[0]);
 }
-- 
1.7.12.rc2.18.g61b472e

