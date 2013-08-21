From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 07/14] cpufreq: maple: use cpufreq_generic_init() routine
Date: Wed, 21 Aug 2013 20:12:26 +0530
Message-ID: <ff89c213678230603e6b46a658bc7542b8698707.1377093938.git.viresh.kumar@linaro.org>
References: <cover.1377093938.git.viresh.kumar@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1377093938.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1377093938.git.viresh.kumar@linaro.org>
References: <cover.1377093938.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Use generic cpufreq_generic_init() routine instead of replicating the same code
here.

Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/maple-cpufreq.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/cpufreq/maple-cpufreq.c b/drivers/cpufreq/maple-cpufreq.c
index 45db7a2..2a2532a 100644
--- a/drivers/cpufreq/maple-cpufreq.c
+++ b/drivers/cpufreq/maple-cpufreq.c
@@ -141,16 +141,9 @@ static unsigned int maple_cpufreq_get_speed(unsigned int cpu)
 
 static int maple_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	policy->cpuinfo.transition_latency = 12000;
-	/* secondary CPUs are tied to the primary one by the
-	 * cpufreq core if in the secondary policy we tell it that
-	 * it actually must be one policy together with all others. */
-	cpumask_setall(policy->cpus);
-
-	return cpufreq_table_validate_and_show(policy, maple_cpu_freqs);
+	return cpufreq_generic_init(policy, maple_cpu_freqs, 12000);
 }
 
-
 static struct cpufreq_driver maple_cpufreq_driver = {
 	.name		= "maple",
 	.flags		= CPUFREQ_CONST_LOOPS,
-- 
1.7.12.rc2.18.g61b472e
