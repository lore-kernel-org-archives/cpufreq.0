From: steven finney <Steven.Finney@palm.com>
Subject: [PATCH] Fix memory leak in cpufreq_stats.c (resubmit)
Date: Mon, 02 May 2011 11:29:17 -0700
Message-ID: <1304360957.13439.7.camel@LZ8002UA1030GLM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org
Cc: steven.finney@palm.com

Resubmitting this patch as a pure text file.

--------------------------------------

When a CPU is taken offline in an SMP system, cpufreq_remove_dev()
nulls out the per-cpu policy before cpufreq_stats_free_table() can
make use of it.  cpufreq_stats_free_table() then skips the
call to sysfs_remove_group(), leaving about 100 bytes of sysfs-related
memory unclaimed each time a CPU-removal occurs. Break up
cpu_stats_free_table into sysfs and table portions, and
call the sysfs portion early.

Change-Id: I4d2eab13a68ead5943fe89dae6f71862b4fb3dd9

Signed-off-by: Steven Finney <steven.finney@palm.com>
---
 drivers/cpufreq/cpufreq_stats.c |   21 ++++++++++++++++++---
 1 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index 00d73fc..4f1b8de 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -165,17 +165,27 @@ static int freq_table_get_index(struct cpufreq_stats *stat, unsigned int freq)
 	return -1;
 }
 
+/* should be called late in the CPU removal sequence so that the stats
+ * memory is still available in case someone tries to use it.
+ */
 static void cpufreq_stats_free_table(unsigned int cpu)
 {
 	struct cpufreq_stats *stat = per_cpu(cpufreq_stats_table, cpu);
-	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
-	if (policy && policy->cpu == cpu)
-		sysfs_remove_group(&policy->kobj, &stats_attr_group);
 	if (stat) {
 		kfree(stat->time_in_state);
 		kfree(stat);
 	}
 	per_cpu(cpufreq_stats_table, cpu) = NULL;
+}
+
+/* must be called early in the CPU removal sequence (before
+ * cpufreq_remove_dev) so that policy is still valid.
+ */
+static void cpufreq_stats_free_sysfs(unsigned int cpu)
+{
+	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
+	if (policy && policy->cpu == cpu)
+		sysfs_remove_group(&policy->kobj, &stats_attr_group);
 	if (policy)
 		cpufreq_cpu_put(policy);
 }
@@ -316,6 +326,9 @@ static int __cpuinit cpufreq_stat_cpu_callback(struct notifier_block *nfb,
 	case CPU_ONLINE_FROZEN:
 		cpufreq_update_policy(cpu);
 		break;
+	case CPU_DOWN_PREPARE:
+		cpufreq_stats_free_sysfs(cpu);
+		break;
 	case CPU_DEAD:
 	case CPU_DEAD_FROZEN:
 		cpufreq_stats_free_table(cpu);
@@ -324,9 +337,11 @@ static int __cpuinit cpufreq_stat_cpu_callback(struct notifier_block *nfb,
 	return NOTIFY_OK;
 }
 
+/* priority=1 so this will get called before cpufreq_remove_dev */
 static struct notifier_block cpufreq_stat_cpu_notifier __refdata =
 {
 	.notifier_call = cpufreq_stat_cpu_callback,
+	.priority = 1,
 };
 
 static struct notifier_block notifier_policy_block = {
-- 
1.7.0.4




