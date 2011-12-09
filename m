From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: [PATCH] CPUFREQ Remove wall variable from cpufreq_gov_dbs_init()
Date: Fri, 9 Dec 2011 16:18:42 +0530
Message-ID: <20111209104842.GA3643@linux.vnet.ibm.com>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@vger.kernel.org

CPUFREQ Remove wall variable from cpufreq_gov_dbs_init()

Remove wall variable from cpufreq_gov_dbs_init() as 
get_cpu_idle_time_us() no longer updates the last_update_time
unconditionally. Passing non-NULL last_update_time address
will result in accounting additional idle time with 
update_ts_time_stats() before returning idle_sleeptime.

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
-- 
 drivers/cpufreq/cpufreq_ondemand.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index f3d327c..c12d62a 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -713,11 +713,10 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 
 static int __init cpufreq_gov_dbs_init(void)
 {
-	cputime64_t wall;
 	u64 idle_time;
 	int cpu = get_cpu();
 
-	idle_time = get_cpu_idle_time_us(cpu, &wall);
+	idle_time = get_cpu_idle_time_us(cpu, NULL);
 	put_cpu();
 	if (idle_time != -1ULL) {
 		/* Idle micro accounting is supported. Use finer thresholds */

