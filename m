From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: 3/4 SMT awareness: only register each cpu group
	once
Date: Mon, 9 Aug 2004 21:54:37 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040809195437.GF9397@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, davej@redhat.com

Only register each "affected_cpu_mask" once, and do symlinks for those 
CPUs not directly registered.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 drivers/cpufreq/cpufreq.c |   84 ++++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 77 insertions(+), 7 deletions(-)

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-08-06 22:09:45.395735216 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-08-06 22:12:53.117197216 +0200
@@ -162,6 +162,7 @@
 		 */
 		if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
 			if ((likely(cpufreq_cpu_data[freqs->cpu])) &&
+			    (likely(cpufreq_cpu_data[freqs->cpu]->cpu == freqs->cpu)) &&
 			    (likely(cpufreq_cpu_data[freqs->cpu]->cur)) &&
 			    (unlikely(freqs->old != cpufreq_cpu_data[freqs->cpu]->cur)))
 			{
@@ -179,7 +180,8 @@
 	case CPUFREQ_POSTCHANGE:
 		adjust_jiffies(CPUFREQ_POSTCHANGE, freqs);
 		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_POSTCHANGE, freqs);
-		if (likely(cpufreq_cpu_data[freqs->cpu]))
+		if ((likely(cpufreq_cpu_data[freqs->cpu])) && 
+		    (likely(cpufreq_cpu_data[freqs->cpu]->cpu == freqs->cpu)))
 			cpufreq_cpu_data[freqs->cpu]->cur = freqs->new;
 		break;
 	}
@@ -467,6 +469,18 @@
 	struct cpufreq_policy *policy;
 	struct freq_attr **drv_attr;
 	unsigned long flags;
+	unsigned int j;
+
+#ifdef CONFIG_SMP
+	/* check whether a different CPU already registered this
+	 * CPU because it is in the same boat. */
+	policy = cpufreq_cpu_get(cpu);
+	if (unlikely(policy)) {
+		cpu_sys_devices[cpu] = sys_dev;
+		sysfs_create_link(&sys_dev->kobj, &policy->kobj, "cpufreq");
+		return 0;
+	}
+#endif
 
 	if (!try_module_get(cpufreq_driver->owner))
 		return -EINVAL;
@@ -515,7 +529,8 @@
 		sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
-	cpufreq_cpu_data[cpu] = policy;
+	for_each_cpu_mask(j, policy->cpus)
+		cpufreq_cpu_data[j] = policy;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 	policy->governor = NULL; /* to assure that the starting sequence is
 				  * run in cpufreq_set_policy */
@@ -534,7 +549,8 @@
 
 err_out_unregister:
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
-	cpufreq_cpu_data[cpu] = NULL;
+	for_each_cpu_mask(j, policy->cpus)
+		cpufreq_cpu_data[j] = NULL;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
 	kobject_unregister(&policy->kobj);
@@ -559,21 +575,69 @@
 	unsigned int cpu = sys_dev->id;
 	unsigned long flags;
 	struct cpufreq_policy *data;
-
-	cpu_sys_devices[cpu] = NULL;
+#ifdef CONFIG_SMP
+	unsigned int j;
+#endif
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	data = cpufreq_cpu_data[cpu];
 
 	if (!data) {
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		cpu_sys_devices[cpu] = NULL;
 		return -EINVAL;
 	}
 	cpufreq_cpu_data[cpu] = NULL;
+
+
+#ifdef CONFIG_SMP
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
+#endif
+
+	cpu_sys_devices[cpu] = NULL;
+
+	if (!kobject_get(&data->kobj)) {
+		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+ 		return -EFAULT;
+	}
+
+#ifdef CONFIG_SMP
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
+
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
+#else
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+#endif
 
 	if (cpufreq_driver->target)
 		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
@@ -695,6 +759,12 @@
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
