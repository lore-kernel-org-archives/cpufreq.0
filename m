From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 135/228] cpufreq: kirkwood: use cpufreq_generic_init() routine
Date: Fri, 13 Sep 2013 18:31:21 +0530
Message-ID: <76198830de8f8fd9f8bcbba08ac4888d15e2c88a.1379063063.git.viresh.kumar@linaro.org>
References: <cover.1379063063.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1379063063.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1379063063.git.viresh.kumar@linaro.org>
References: <cover.1379063063.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Viresh Kumar <viresh.kumar@linaro.org>

Use generic cpufreq_generic_init() routine instead of replicating the same code
here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/kirkwood-cpufreq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
index dc434c4..fff8653 100644
--- a/drivers/cpufreq/kirkwood-cpufreq.c
+++ b/drivers/cpufreq/kirkwood-cpufreq.c
@@ -120,10 +120,7 @@ static int kirkwood_cpufreq_target(struct cpufreq_policy *policy,
 /* Module init and exit code */
 static int kirkwood_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	/* cpuinfo and default policy values */
-	policy->cpuinfo.transition_latency = 5000; /* 5uS */
-
-	return cpufreq_table_validate_and_show(policy, kirkwood_freq_table);
+	return cpufreq_generic_init(policy, kirkwood_freq_table, 5000);
 }
 
 static struct cpufreq_driver kirkwood_cpufreq_driver = {
-- 
1.7.12.rc2.18.g61b472e

