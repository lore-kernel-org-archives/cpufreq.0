From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC][PATCH] (3/4) cpufreq SMT awareness: only register SMT group
	once
Date: Fri, 18 Jun 2004 16:43:53 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040618144353.GC8871@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

Only register each "affected_cpu_mask" once, and do symlinks for those 
CPUs not directly registered.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 drivers/cpufreq/cpufreq.c |   70 ++++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 64 insertions(+), 6 deletions(-)

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-06-18 16:16:55.774334856 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-06-18 16:19:05.157665600 +0200
@@ -381,11 +381,21 @@
 {
 	unsigned int cpu = sys_dev->id;
 	int ret = 0;
+	unsigned int j;
 	struct cpufreq_policy new_policy;
 	struct cpufreq_policy *policy;
 	struct freq_attr **drv_attr;
 	unsigned long flags;
 
+	/* check whether a different CPU already registered this
+	 * CPU because it is in the same boat. */
+	policy = cpufreq_cpu_get(cpu);
+	if (unlikely(policy)) {
+		cpu_sys_devices[cpu] = sys_dev;
+		sysfs_create_link(&sys_dev->kobj, &policy->kobj, "cpufreq");
+		return 0;
+	}
+
 	if (!try_module_get(cpufreq_driver->owner))
 		return -EINVAL;
 
@@ -397,6 +407,8 @@
 	memset(policy, 0, sizeof(struct cpufreq_policy));
 
 	policy->cpu = cpu;
+	policy->cpus = cpumask_of_cpu(cpu);
+
 	init_MUTEX_LOCKED(&policy->lock);
 	init_completion(&policy->kobj_unregister);
 	INIT_WORK(&policy->update, handle_update, (void *)(long)cpu);
@@ -431,7 +443,8 @@
 		sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
-	cpufreq_cpu_data[cpu] = policy;
+        for_each_cpu_mask(j, policy->cpus)
+		cpufreq_cpu_data[j] = policy;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 	policy->governor = NULL; /* to assure that the starting sequence is
 				  * run in cpufreq_set_policy */
@@ -450,7 +463,8 @@
 
 err_out_unregister:
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
-	cpufreq_cpu_data[cpu] = NULL;
+        for_each_cpu_mask(j, policy->cpus)
+		cpufreq_cpu_data[j] = NULL;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
 	kobject_unregister(&policy->kobj);
@@ -474,22 +488,60 @@
 {
 	unsigned int cpu = sys_dev->id;
 	unsigned long flags;
+	unsigned int j;
 	struct cpufreq_policy *data;
 
-	cpu_sys_devices[cpu] = NULL;
-
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	data = cpufreq_cpu_data[cpu];
 
 	if (!data) {
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		cpu_sys_devices[cpu] = NULL;
 		return -EINVAL;
 	}
 	cpufreq_cpu_data[cpu] = NULL;
+
+	/* if this isn't the CPU which is the parent of the kobj, we
+	 * only need to unlink, put and exit 
+	 */
+	if (unlikely(cpu != data->cpu)) {
+		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		sysfs_remove_link(&sys_dev->kobj, "cpufreq");
+		cpu_sys_devices[cpu] = NULL;
+		cpufreq_cpu_put(data);
+		return 0;
+	}
+
+	cpu_sys_devices[cpu] = NULL;
+
+	if (!kobject_get(&data->kobj)) {
+		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+ 		return -EFAULT;
+	}
+
+	/* if we have other CPUs still registered, we need to unlink them,
+	 * or else wait_for_completion below will lock up. Clean the
+	 * cpufreq_cpu_data[] while holding the lock, and remove the sysfs
+	 * links afterwards.
+	 */
+	if (unlikely(cpus_weight(data->cpus) > 1)) {
+		for_each_cpu_mask(j, data->cpus) {
+			if (j == cpu)
+				continue;
+			cpufreq_cpu_data[j] = NULL;
+		}
+	}
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
-	if (!kobject_get(&data->kobj))
-		return -EFAULT;
+	if (unlikely(cpus_weight(data->cpus) > 1)) {
+		for_each_cpu_mask(j, data->cpus) {
+			if (j == cpu)
+				continue;
+			
+			sysfs_remove_link(&cpu_sys_devices[j]->kobj, "cpufreq");
+			cpufreq_cpu_put(data);
+		}
+	}
 
 	if (cpufreq_driver->target)
 		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
@@ -611,6 +663,12 @@
 	if (!cpu_policy)
 		return -EINVAL;
 
+	/* only handle each CPU group once */
+	if (unlikely(cpu_policy->cpu != cpu)) {
+		cpufreq_cpu_put(cpu_policy);
+		return 0;
+	}
+
 	if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
 		unsigned int cur_freq = 0;
