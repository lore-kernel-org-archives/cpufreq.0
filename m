From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC] cpufreq and cpumask_t
Date: Thu, 13 May 2004 18:20:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040513162043.GA17201@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

Hi!

FYI, here is a change I'll propose to the cpufreq infrastructure in the near
future. It's far from ready, but I'd like to hear opinions before I continue
working on it.

More and more physical CPUs contain several "logical" CPUs [e.g.
HyperThreading]. In most if not all cases, all logical CPUs on a physical 
CPU package can only be frequency scaled at the same time. So, I suggest
changing the entry in struct cpufreq_policy from

	unsigned int	cpu;

to

	cpumask_t	cpu;

and linking in sysfs from all affected cpus to one "real" directory below
the first registered CPU where all the actual cpufreq files are in.

The attached patch won't even compile on UP, won't work on SMP, but well,
you should get the idea:

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-05-13 16:52:03.309054504 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-05-13 18:12:50.730134488 +0200
@@ -174,7 +174,7 @@
 	unsigned int ret = -EINVAL;					\
 	struct cpufreq_policy new_policy;				\
 									\
-	ret = cpufreq_get_policy(&new_policy, policy->cpu);		\
+	ret = cpufreq_get_policy(&new_policy, policy->_cpu);		\
 	if (ret)							\
 		return -EINVAL;						\
 									\
@@ -195,7 +195,7 @@
  */
 static ssize_t show_cpuinfo_cur_freq (struct cpufreq_policy * policy, char *buf)
 {
-	unsigned int cur_freq = cpufreq_get(policy->cpu);
+	unsigned int cur_freq = cpufreq_get(policy->_cpu);
 	if (!cur_freq)
 		return sprintf(buf, "<unknown>");
 	return sprintf(buf, "%u\n", cur_freq);
@@ -227,7 +227,7 @@
 	char	str_governor[16];
 	struct cpufreq_policy new_policy;
 
-	ret = cpufreq_get_policy(&new_policy, policy->cpu);
+	ret = cpufreq_get_policy(&new_policy, policy->_cpu);
 	if (ret)
 		return ret;
 
@@ -324,7 +324,7 @@
 	struct cpufreq_policy * policy = to_policy(kobj);
 	struct freq_attr * fattr = to_attr(attr);
 	ssize_t ret;
-	policy = cpufreq_cpu_get(policy->cpu);
+	policy = cpufreq_cpu_get(policy->_cpu);
 	if (!policy)
 		return -EINVAL;
 	ret = fattr->show ? fattr->show(policy,buf) : 0;
@@ -338,7 +338,7 @@
 	struct cpufreq_policy * policy = to_policy(kobj);
 	struct freq_attr * fattr = to_attr(attr);
 	ssize_t ret;
-	policy = cpufreq_cpu_get(policy->cpu);
+	policy = cpufreq_cpu_get(policy->_cpu);
 	if (!policy)
 		return -EINVAL;
 	ret = fattr->store ? fattr->store(policy,buf,count) : 0;
@@ -373,11 +373,24 @@
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
+		sysfs_create_link(&sys_dev->kobj, &policy->kobj, "cpufreq");
+		return 0;
+	}
+
+	spin_lock_irqsave(&cpufreq_driver_lock, flags);
+	cpufreq_cpu_data[cpu] = policy;
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+
 	if (!try_module_get(cpufreq_driver->owner))
 		return -EINVAL;
 
@@ -388,7 +401,9 @@
 	}
 	memset(policy, 0, sizeof(struct cpufreq_policy));
 
-	policy->cpu = cpu;
+	policy->_cpu = cpu;
+	policy->cpus = cpumask_of_cpu(cpu);
+
 	init_MUTEX_LOCKED(&policy->lock);
 	init_completion(&policy->kobj_unregister);
 	INIT_WORK(&policy->update, handle_update, (void *)(long)cpu);
@@ -423,8 +438,10 @@
 		sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
-	cpufreq_cpu_data[cpu] = policy;
+        for_each_cpu_mask(j, policy->cpus)
+		cpufreq_cpu_data[j] = policy;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+
 	policy->governor = NULL; /* to assure that the starting sequence is
 				  * run in cpufreq_set_policy */
 	up(&policy->lock);
@@ -441,7 +458,8 @@
 
 err_out_unregister:
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
-	cpufreq_cpu_data[cpu] = NULL;
+        for_each_cpu_mask(j, policy->cpus)
+		cpufreq_cpu_data[j] = NULL;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
 	kobject_unregister(&policy->kobj);
@@ -464,21 +482,61 @@
 static int cpufreq_remove_dev (struct sys_device * sys_dev)
 {
 	unsigned int cpu = sys_dev->id;
+	unsigned int j;
 	unsigned long flags;
 	struct cpufreq_policy *data;
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	data = cpufreq_cpu_data[cpu];
-
 	if (!data) {
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 		return -EINVAL;
 	}
 	cpufreq_cpu_data[cpu] = NULL;
-	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
-	if (!kobject_get(&data->kobj))
+	/* if this isn't the CPU which is the parent of the kobj, we
+	 * only need to unlink, put and exit 
+	 */
+	if (unlikely(cpu != data->_cpu)) {
+		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		sysfs_remove_link(&sys_dev->kobj, "cpufreq");
+		cpufreq_cpu_put(data);
+		return 0;
+	}
+
+	if (!kobject_get(&data->kobj)) {
+		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 		return -EFAULT;
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
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+
+	if (unlikely(cpus_weight(data->cpus) > 1)) {
+		for_each_cpu_mask(j, data->cpus) {
+			struct sys_device *other_sys_dev = NULL; /* FIXME. */
+			/* There's no arch-generic way to do a direct 
+			 * access to struct sys_device for a specific CPU
+			 * whose number we know -- ideas needed.
+			 */
+			if (j == cpu)
+				continue;
+			
+			sysfs_remove_link(&other_sys_dev->kobj, "cpufreq");
+			cpufreq_cpu_put(data);
+		}
+	}
 
 	if (cpufreq_driver->target)
 		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
@@ -510,14 +568,14 @@
 
 /**
  *	cpufreq_out_of_sync - If actual and saved CPU frequency differs, we're in deep trouble.
- *	@cpu: cpu number
+ *	@cpus: group of affected CPUs
  *	@old_freq: CPU frequency the kernel thinks the CPU runs at
  *	@new_freq: CPU frequency the CPU actually runs at
  *
  *	We adjust to current frequency first, and need to clean up later. So either call
  *	to cpufreq_update_policy() or schedule handle_update()).
  */
-static void cpufreq_out_of_sync(unsigned int cpu, unsigned int old_freq, unsigned int new_freq)
+static void cpufreq_out_of_sync(cpumask_t cpus, unsigned int old_freq, unsigned int new_freq)
 {
 	struct cpufreq_freqs freqs;
 
@@ -527,7 +585,7 @@
 	printk(KERN_WARNING "Warning: CPU frequency out of sync: cpufreq and timing "
 	       "core thinks of %u, is %u kHz.\n", old_freq, new_freq);
 
-	freqs.cpu = cpu;
+	freqs.cpus = cpus;
 	freqs.old = old_freq;
 	freqs.new = new_freq;
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
@@ -560,7 +618,7 @@
 	{
 		/* verify no discrepancy between actual and saved value exists */
 		if (unlikely(ret != policy->cur)) {
-			cpufreq_out_of_sync(cpu, policy->cur, ret);
+			cpufreq_out_of_sync(policy->cpus, policy->cur, ret);
 			schedule_work(&policy->update);
 		}
 	}
@@ -599,12 +657,17 @@
 	cpu_policy = cpufreq_cpu_get(cpu);
 	if (!cpu_policy)
 		return -EINVAL;
+	/* only handle each CPU group once */
+	if (unlikely(cpu_policy->_cpu != cpu)) {
+		cpufreq_cpu_put(cpu_policy);
+		return 0;
+	}
 
 	if (!cpufreq_driver->flags & CPUFREQ_CONST_LOOPS) {
 		unsigned int cur_freq = 0;
 
 		if (cpufreq_driver->get)
-			cur_freq = cpufreq_driver->get(cpu_policy->cpu);
+			cur_freq = cpufreq_driver->get(cpu);
 
 		if (!cur_freq || !cpu_policy->cur) {
 			printk(KERN_ERR "cpufreq: resume failed to assert current frequency is what timing core thinks it is.\n");
@@ -620,7 +683,7 @@
 			printk(KERN_WARNING "Warning: CPU frequency out of sync: cpufreq and timing"
 			       "core thinks of %u, is %u kHz.\n", cpu_policy->cur, cur_freq);
 
-			freqs.cpu = cpu;
+			freqs.cpus = cpu_policy->cpus;
 			freqs.old = cpu_policy->cur;
 			freqs.new = cur_freq;
 
@@ -733,7 +796,7 @@
 {
 	unsigned int ret;
 
-	policy = cpufreq_cpu_get(policy->cpu);
+	policy = cpufreq_cpu_get(policy->_cpu);
 	if (!policy)
 		return -EINVAL;
 
@@ -864,6 +927,8 @@
 	memcpy(&policy->cpuinfo, 
 	       &data->cpuinfo, 
 	       sizeof(struct cpufreq_cpuinfo));
+	policy->cpus = data->cpus;
+	policy->_cpu = data->_cpu;
 
 	/* verify the cpu speed can be set within this limit */
 	ret = cpufreq_driver->verify(policy);
@@ -943,7 +1008,7 @@
 	if (!policy)
 		return -EINVAL;
 
-	data = cpufreq_cpu_get(policy->cpu);
+	data = cpufreq_cpu_get(policy->_cpu);
 	if (!data)
 		return -EINVAL;
 
@@ -1043,6 +1108,11 @@
  */
 void cpufreq_notify_transition(struct cpufreq_freqs *freqs, unsigned int state)
 {
+#ifdef CONFIG_SMP
+	unsigned int cpu = first_cpu_const(mk_cpumask_const(freqs->cpus));
+#else
+	unsigned int cpu = 0;
+#endif
 	BUG_ON(irqs_disabled());
 
 	freqs->flags = cpufreq_driver->flags;
@@ -1054,16 +1124,16 @@
 		 * is not equal to what the cpufreq core thinks is "old frequency".
 		 */
 		if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
-			if ((likely(cpufreq_cpu_data[freqs->cpu]->cur)) &&
-			    (unlikely(freqs->old != cpufreq_cpu_data[freqs->cpu]->cur)))
+			if ((likely(cpufreq_cpu_data[cpu]->cur)) &&
+			    (unlikely(freqs->old != cpufreq_cpu_data[cpu]->cur)))
 			{
 				if (cpufreq_driver->flags & CPUFREQ_PANIC_OUTOFSYNC)
 					panic("CPU Frequency is out of sync.");
 
 				printk(KERN_WARNING "Warning: CPU frequency out of sync: "
 				       "cpufreq and timing core thinks of %u, is %u kHz.\n", 
-				       cpufreq_cpu_data[freqs->cpu]->cur, freqs->old);
-				freqs->old = cpufreq_cpu_data[freqs->cpu]->cur;
+				       cpufreq_cpu_data[cpu]->cur, freqs->old);
+				freqs->old = cpufreq_cpu_data[cpu]->cur;
 			}
 		}
 		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_PRECHANGE, freqs);
@@ -1072,7 +1142,7 @@
 	case CPUFREQ_POSTCHANGE:
 		adjust_jiffies(CPUFREQ_POSTCHANGE, freqs);
 		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_POSTCHANGE, freqs);
-		cpufreq_cpu_data[freqs->cpu]->cur = freqs->new;
+		cpufreq_cpu_data[cpu]->cur = freqs->new;
 		break;
 	}
 	up_read(&cpufreq_notifier_rwsem);
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-05-13 16:52:03.455032312 +0200
+++ linux/include/linux/cpufreq.h	2004-05-13 18:15:19.707486488 +0200
@@ -22,6 +22,7 @@
 #include <linux/sysfs.h>
 #include <linux/completion.h>
 #include <linux/workqueue.h>
+#include <linux/cpumask.h>
 
 #define CPUFREQ_NAME_LEN 16
 
@@ -69,8 +70,13 @@
 };
 
 struct cpufreq_policy {
-	unsigned int		cpu;    /* cpu nr */
-	struct cpufreq_cpuinfo	cpuinfo;/* see above */
+	cpumask_t		cpus;	/* the group of CPUs whose freq can
+					 * only be changed at the same time
+					 */
+	unsigned int		_cpu;	/* the "lead" cpu as whose child
+					 * the kobj is registered */
+	struct cpufreq_cpuinfo	cpuinfo;/* see above, needs to be the same
+					 * for all CPUs in this group */
 
 	unsigned int		min;    /* in kHz */
 	unsigned int		max;    /* in kHz */
@@ -103,7 +109,7 @@
 #define CPUFREQ_RESUMECHANGE	(8)
 
 struct cpufreq_freqs {
-	unsigned int cpu;	/* cpu nr */
+	cpumask_t cpus;		/* cpu nr */
 	unsigned int old;
 	unsigned int new;
 	u8 flags;		/* flags of cpufreq_driver, see below. */
