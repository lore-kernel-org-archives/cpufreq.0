From: Jacob Shin <jacob.shin@amd.com>
Subject: [PATCH 1/1] cpufreq: CPU hotplug, re-create sysfs directory and symlinks
Date: Wed, 27 Apr 2011 13:32:11 -0500
Message-ID: <4DB8612B.1070604@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org
Cc: "Langsdorf, Mark" <mark.langsdorf@amd.com>, Thomas Renninger <trenn@suse.de>, davej@codemonkey.org.uk

When we discover CPUs that are affected by each other's
frequency/voltage transitions, the first CPU gets a sysfs directory
created, and rest of the siblings get symlinks. Currently, when we
hotplug off only the first CPU, all of the symlinks and the sysfs
directory gets removed. Even though rest of the siblings are still
online and functional, they are orphaned, and no longer governed by
cpufreq.

This patch, given the above scenario, creates a sysfs directory for
the first sibling and symlinks for the rest of the siblings.

Please note the recursive call, it was rather too ugly to roll it
out. And the removal of redundant NULL setting (it is already taken
care of near the top of the function).

Signed-off-by: Jacob Shin <jacob.shin@amd.com>
Acked-by: Mark Langsdorf <mark.langsdorf@amd.com>
Reviewed-by: Thomas Renninger <trenn@suse.de>
---
 drivers/cpufreq/cpufreq.c |   20 ++++++++++++++++++--
 1 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 2dafc5c..7c10f96 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1208,12 +1208,28 @@ static int __cpufreq_remove_dev(struct sys_device *sys_dev)
 		cpufreq_driver->exit(data);
 	unlock_policy_rwsem_write(cpu);
 
+	cpufreq_debug_enable_ratelimit();
+
+#ifdef CONFIG_HOTPLUG_CPU
+	/* when the CPU which is the parent of the kobj is hotplugged
+	 * offline, check for siblings, and create cpufreq sysfs interface
+	 * and symlinks
+	 */
+	if (unlikely(cpumask_weight(data->cpus) > 1)) {
+		/* first sibling now owns the new sysfs dir */
+		cpumask_clear_cpu(cpu, data->cpus);
+		cpufreq_add_dev(get_cpu_sysdev(cpumask_first(data->cpus)));
+
+		/* finally remove our own symlink */
+		lock_policy_rwsem_write(cpu);
+		__cpufreq_remove_dev(sys_dev);
+	}
+#endif
+
 	free_cpumask_var(data->related_cpus);
 	free_cpumask_var(data->cpus);
 	kfree(data);
-	per_cpu(cpufreq_cpu_data, cpu) = NULL;
 
-	cpufreq_debug_enable_ratelimit();
 	return 0;
 }
 
-- 
1.7.0.4


