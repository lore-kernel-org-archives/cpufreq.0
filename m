From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 Resend 23/44] cpufreq: pasemi: use cpufreq_table_validate_and_show()
Date: Mon, 16 Sep 2013 18:56:25 +0530
Message-ID: <5e4d862be96ed0934920267cecdcb402096914f6.1379309339.git.viresh.kumar@linaro.org>
References: <cover.1379309339.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1379309339.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1379309339.git.viresh.kumar@linaro.org>
References: <cover.1379309339.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

Lets use cpufreq_table_validate_and_show() instead of calling
cpufreq_frequency_table_cpuinfo() and cpufreq_frequency_table_get_attr().

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/pasemi-cpufreq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index 534e43a..23bc8a82 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -219,12 +219,10 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 	ppc_proc_freq = policy->cur * 1000ul;
 
-	cpufreq_frequency_table_get_attr(pas_freqs, policy->cpu);
-
 	/* this ensures that policy->cpuinfo_min and policy->cpuinfo_max
 	 * are set correctly
 	 */
-	return cpufreq_frequency_table_cpuinfo(policy, pas_freqs);
+	return cpufreq_table_validate_and_show(policy, pas_freqs);
 
 out_unmap_sdcpwr:
 	iounmap(sdcpwr_mapbase);
-- 
1.7.12.rc2.18.g61b472e

