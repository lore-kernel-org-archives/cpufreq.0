From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/kernel cpufreq.c,1.69,1.70
Date: Tue, 19 Aug 2003 14:38:38 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19p6h4-0005kB-QG@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/kernel
In directory flint:/tmp/cvs-serv22028/linux/kernel

Modified Files:
	cpufreq.c 
Log Message:
sync with latest davej version

Index: cpufreq.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/kernel/cpufreq.c,v
retrieving revision 1.69
retrieving revision 1.70
diff -u -r1.69 -r1.70
--- cpufreq.c	16 Jun 2003 21:04:52 -0000	1.69
+++ cpufreq.c	19 Aug 2003 13:38:34 -0000	1.70
@@ -23,23 +23,27 @@
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/cpu.h>
+#include <linux/completion.h>
 
 /**
  * The "cpufreq driver" - the arch- or hardware-dependend low
- * level driver of CPUFreq support, and its locking mutex. 
- * cpu_max_freq is in kHz.
+ * level driver of CPUFreq support, and its spinlock. This lock
+ * also protects the cpufreq_cpu_data array.
  */
 static struct cpufreq_driver   	*cpufreq_driver;
-static DECLARE_MUTEX            (cpufreq_driver_sem);
+static struct cpufreq_policy	*cpufreq_cpu_data[NR_CPUS];
+static spinlock_t		cpufreq_driver_lock = SPIN_LOCK_UNLOCKED;
+
+/* internal prototype */
+static int __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event);
+
 
 /**
  * Two notifier lists: the "policy" list is involved in the 
  * validation process for a new CPU frequency policy; the 
  * "transition" list for kernel code that needs to handle
  * changes to devices when the CPU clock speed changes.
- * The mutex locks both lists. If both cpufreq_driver_sem
- * and cpufreq_notifier_sem need to be hold, get cpufreq_driver_sem
- * first.
+ * The mutex locks both lists.
  */
 static struct notifier_block    *cpufreq_policy_notifier_list;
 static struct notifier_block    *cpufreq_transition_notifier_list;
@@ -49,28 +53,49 @@
 static LIST_HEAD(cpufreq_governor_list);
 static DECLARE_MUTEX		(cpufreq_governor_sem);
 
-static int cpufreq_cpu_get(unsigned int cpu)
+static struct cpufreq_policy * cpufreq_cpu_get(unsigned int cpu)
 {
+	struct cpufreq_policy *data;
+	unsigned long flags;
+
 	if (cpu >= NR_CPUS)
-		return 0;
+		goto err_out;
+
+	/* get the cpufreq driver */
+	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 
 	if (!cpufreq_driver)
-		return 0;
+		goto err_out_unlock;
 
 	if (!try_module_get(cpufreq_driver->owner))
-		return 0;
+		goto err_out_unlock;
 
-	if (!kobject_get(&cpufreq_driver->policy[cpu].kobj)) {
-		module_put(cpufreq_driver->owner);
-		return 0;
-	}
 
-	return 1;
+	/* get the CPU */
+	data = cpufreq_cpu_data[cpu];
+
+	if (!data)
+		goto err_out_put_module;
+
+	if (!kobject_get(&data->kobj))
+		goto err_out_put_module;
+
+
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+
+	return data;
+
+ err_out_put_module:
+	module_put(cpufreq_driver->owner);
+ err_out_unlock:
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+ err_out:
+	return NULL;
 }
 
-static void cpufreq_cpu_put(unsigned int cpu)
+static void cpufreq_cpu_put(struct cpufreq_policy *data)
 {
-	kobject_put(&cpufreq_driver->policy[cpu].kobj);
+	kobject_put(&data->kobj);
 	module_put(cpufreq_driver->owner);
 }
 
@@ -277,10 +302,11 @@
 	struct cpufreq_policy * policy = to_policy(kobj);
 	struct freq_attr * fattr = to_attr(attr);
 	ssize_t ret;
-	if (!cpufreq_cpu_get(policy->cpu))
+	policy = cpufreq_cpu_get(policy->cpu);
+	if (!policy)
 		return -EINVAL;
 	ret = fattr->show ? fattr->show(policy,buf) : 0;
-	cpufreq_cpu_put(policy->cpu);
+	cpufreq_cpu_put(policy);
 	return ret;
 }
 
@@ -290,13 +316,20 @@
 	struct cpufreq_policy * policy = to_policy(kobj);
 	struct freq_attr * fattr = to_attr(attr);
 	ssize_t ret;
-	if (!cpufreq_cpu_get(policy->cpu))
+	policy = cpufreq_cpu_get(policy->cpu);
+	if (!policy)
 		return -EINVAL;
 	ret = fattr->store ? fattr->store(policy,buf,count) : 0;
-	cpufreq_cpu_put(policy->cpu);
+	cpufreq_cpu_put(policy);
 	return ret;
 }
 
+static void cpufreq_sysfs_release(struct kobject * kobj)
+{
+	struct cpufreq_policy * policy = to_policy(kobj);
+	complete(&policy->kobj_unregister);
+}
+
 static struct sysfs_ops sysfs_ops = {
 	.show	= show,
 	.store	= store,
@@ -305,6 +338,7 @@
 static struct kobj_type ktype_cpufreq = {
 	.sysfs_ops	= &sysfs_ops,
 	.default_attrs	= default_attrs,
+	.release	= cpufreq_sysfs_release,
 };
 
 
@@ -320,29 +354,29 @@
 	struct cpufreq_policy new_policy;
 	struct cpufreq_policy *policy;
 	struct freq_attr **drv_attr;
+	unsigned long flags;
 
 	if (!try_module_get(cpufreq_driver->owner))
 		return -EINVAL;
 
+	policy = kmalloc(sizeof(struct cpufreq_policy), GFP_KERNEL);
+	if (!policy)
+		return -ENOMEM;
+	memset(policy, 0, sizeof(struct cpufreq_policy));
+
+	policy->cpu = cpu;
+	init_MUTEX_LOCKED(&policy->lock);
+	init_completion(&policy->kobj_unregister);
+
 	/* call driver. From then on the cpufreq must be able
 	 * to accept all calls to ->verify and ->setpolicy for this CPU
 	 */
-	policy = &cpufreq_driver->policy[cpu];
-	policy->cpu = cpu;
-	if (cpufreq_driver->init) {
-		ret = cpufreq_driver->init(policy);
-		if (ret)
-			goto out;
-	}
+	ret = cpufreq_driver->init(policy);
+	if (ret)
+		goto err_out;
 
-	/* set default policy on this CPU */
-	down(&cpufreq_driver_sem);
-	memcpy(&new_policy, 
-	       policy, 
-	       sizeof(struct cpufreq_policy));
-	up(&cpufreq_driver_sem);
+	memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
 
-	init_MUTEX(&policy->lock);
 	/* prepare interface data */
 	policy->kobj.parent = &sys_dev->kobj;
 	policy->kobj.ktype = &ktype_cpufreq;
@@ -350,22 +384,40 @@
 
 	ret = kobject_register(&policy->kobj);
 	if (ret)
-		goto out;
+		goto err_out;
 
+	/* set up files for this cpu device */
 	drv_attr = cpufreq_driver->attr;
 	while ((drv_attr) && (*drv_attr)) {
 		sysfs_create_file(&policy->kobj, &((*drv_attr)->attr));
 		drv_attr++;
 	}
-	/* set up files for this cpu device */
 
+	spin_lock_irqsave(&cpufreq_driver_lock, flags);
+	cpufreq_cpu_data[cpu] = policy;
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+
+	up(&policy->lock);
 	
 	/* set default policy */
 	ret = cpufreq_set_policy(&new_policy);
 	if (ret)
-		kobject_unregister(&policy->kobj);
+		goto err_out_unregister;
 
- out:
+	module_put(cpufreq_driver->owner);
+	return 0;
+
+
+ err_out_unregister:
+	spin_lock_irqsave(&cpufreq_driver_lock, flags);
+	cpufreq_cpu_data[cpu] = NULL;
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+
+	kobject_unregister(&policy->kobj);
+	wait_for_completion(&policy->kobj_unregister);
+
+ err_out:
+	kfree(policy);
 	module_put(cpufreq_driver->owner);
 	return ret;
 }
@@ -379,32 +431,71 @@
 static int cpufreq_remove_dev (struct sys_device * sys_dev)
 {
 	unsigned int cpu = sys_dev->id;
+	unsigned long flags;
+	struct cpufreq_policy *data;
 
-	if (!kobject_get(&cpufreq_driver->policy[cpu].kobj))
-		return -EFAULT;
+	spin_lock_irqsave(&cpufreq_driver_lock, flags);
+	data = cpufreq_cpu_data[cpu];
 
-	down(&cpufreq_driver_sem);
-	if ((cpufreq_driver->target) && 
-	    (cpufreq_driver->policy[cpu].policy == CPUFREQ_POLICY_GOVERNOR)) {
-		cpufreq_driver->policy[cpu].governor->governor(&cpufreq_driver->policy[cpu], CPUFREQ_GOV_STOP);
-		module_put(cpufreq_driver->policy[cpu].governor->owner);
+	if (!data) {
+		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		return -EINVAL;
 	}
+	cpufreq_cpu_data[cpu] = NULL;
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
-	/* we may call driver->exit here without checking for try_module_exit
-	 * as it's either the driver which wants to unload or we have a CPU
-	 * removal AND driver removal at the same time...
+	if (!kobject_get(&data->kobj))
+		return -EFAULT;
+
+	kobject_unregister(&data->kobj);
+
+	kobject_put(&data->kobj);
+
+	/* we need to make sure that the underlying kobj is actually
+	 * not referenced anymore by anybody before we proceed with 
+	 * unloading.
 	 */
+	wait_for_completion(&data->kobj_unregister);
+
+	if (cpufreq_driver->target)
+		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
+
 	if (cpufreq_driver->exit)
-		cpufreq_driver->exit(&cpufreq_driver->policy[cpu]);
+		cpufreq_driver->exit(data);
 
-	kobject_unregister(&cpufreq_driver->policy[cpu].kobj);
+	kfree(data);
 
-	up(&cpufreq_driver_sem);
-	kobject_put(&cpufreq_driver->policy[cpu].kobj);
 	return 0;
 }
 
-static int cpufreq_restore(struct sys_device *);
+/**
+ *	cpufreq_restore - restore the CPU clock frequency after resume
+ *
+ *	Restore the CPU clock frequency so that our idea of the current
+ *	frequency reflects the actual hardware.
+ */
+static int cpufreq_restore(struct sys_device * sysdev)
+{
+	int cpu = sysdev->id;
+	unsigned int ret = 0;
+	struct cpufreq_policy policy;
+	struct cpufreq_policy *cpu_policy;
+
+	if (!cpu_online(cpu))
+		return 0;
+
+	cpu_policy = cpufreq_cpu_get(cpu);
+
+	down(&cpu_policy->lock);
+	memcpy(&policy, cpu_policy, sizeof(struct cpufreq_policy));
+	up(&cpu_policy->lock);
+
+	ret = cpufreq_set_policy(&policy);
+
+	cpufreq_cpu_put(cpu_policy);
+
+	return ret;
+}
 
 static struct sysdev_driver cpufreq_sysdev_driver = {
 	.add		= cpufreq_add_dev,
@@ -488,68 +579,86 @@
  *                              GOVERNORS                            *
  *********************************************************************/
 
-inline int cpufreq_driver_target(struct cpufreq_policy *policy,
-				 unsigned int target_freq,
-				 unsigned int relation)
+
+int __cpufreq_driver_target(struct cpufreq_policy *policy,
+			    unsigned int target_freq,
+			    unsigned int relation)
+{
+	return cpufreq_driver->target(policy, target_freq, relation);
+}
+EXPORT_SYMBOL_GPL(__cpufreq_driver_target);
+
+
+int cpufreq_driver_target(struct cpufreq_policy *policy,
+			  unsigned int target_freq,
+			  unsigned int relation)
 {
 	unsigned int ret;
-	unsigned int cpu = policy->cpu;
 
-	if (!cpufreq_cpu_get(cpu))
+	policy = cpufreq_cpu_get(policy->cpu);
+	if (!policy)
 		return -EINVAL;
 
-	down(&cpufreq_driver->policy[cpu].lock);
+	down(&policy->lock);
 
-	ret = cpufreq_driver->target(policy, target_freq, relation);
+	ret = __cpufreq_driver_target(policy, target_freq, relation);
 
-	up(&cpufreq_driver->policy[cpu].lock);
+	up(&policy->lock);
 
-	cpufreq_cpu_put(cpu);
+	cpufreq_cpu_put(policy);
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(cpufreq_driver_target);
 
 
-int cpufreq_governor(unsigned int cpu, unsigned int event)
+static int __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event)
 {
 	int ret = 0;
-	struct cpufreq_policy *policy = &cpufreq_driver->policy[cpu];
-
-	if (!cpufreq_cpu_get(cpu))
-		return -EINVAL;
 
 	switch (policy->policy) {
 	case CPUFREQ_POLICY_POWERSAVE: 
 		if ((event == CPUFREQ_GOV_LIMITS) || (event == CPUFREQ_GOV_START)) {
-			down(&cpufreq_driver->policy[cpu].lock);
-			ret = cpufreq_driver->target(policy, policy->min, CPUFREQ_RELATION_L);
-			up(&cpufreq_driver->policy[cpu].lock);
+			ret = __cpufreq_driver_target(policy, policy->min, CPUFREQ_RELATION_L);
 		}
 		break;
 	case CPUFREQ_POLICY_PERFORMANCE:
 		if ((event == CPUFREQ_GOV_LIMITS) || (event == CPUFREQ_GOV_START)) {
-			down(&cpufreq_driver->policy[cpu].lock);
-			ret = cpufreq_driver->target(policy, policy->max, CPUFREQ_RELATION_H);
-			up(&cpufreq_driver->policy[cpu].lock);
+			ret = __cpufreq_driver_target(policy, policy->max, CPUFREQ_RELATION_H);
 		}
 		break;
 	case CPUFREQ_POLICY_GOVERNOR:
 		ret = -EINVAL;
-		if (!try_module_get(cpufreq_driver->policy[cpu].governor->owner))
+		if (!try_module_get(policy->governor->owner))
 			break;
-		ret = cpufreq_driver->policy[cpu].governor->governor(policy, event);
+		ret = policy->governor->governor(policy, event);
 		/* we keep one module reference alive for each CPU governed by this CPU */
 		if ((event != CPUFREQ_GOV_START) || ret)
-			module_put(cpufreq_driver->policy[cpu].governor->owner);
+			module_put(policy->governor->owner);
 		if ((event == CPUFREQ_GOV_STOP) && !ret)
-			module_put(cpufreq_driver->policy[cpu].governor->owner);
+			module_put(policy->governor->owner);
 		break;
 	default:
 		ret = -EINVAL;
 	}
 
-	cpufreq_cpu_put(cpu);
+	return ret;
+}
+
+
+int cpufreq_governor(unsigned int cpu, unsigned int event)
+{
+	int ret = 0;
+	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
+
+	if (!policy)
+		return -EINVAL;
+
+	down(&policy->lock);
+	ret = __cpufreq_governor(policy, event);
+	up(&policy->lock);
+
+	cpufreq_cpu_put(policy);
 
 	return ret;
 }
@@ -587,33 +696,10 @@
 
 void cpufreq_unregister_governor(struct cpufreq_governor *governor)
 {
-	unsigned int i;
-	
 	if (!governor)
 		return;
 
 	down(&cpufreq_governor_sem);
-
-	/* 
-	 * Unless the user uses rmmod -f, we can be safe. But we never
-	 * know, so check whether if it's currently used. If so,
-	 * stop it and replace it with the default governor.
-	 */
-	for (i=0; i<NR_CPUS; i++)
-	{
-		if (!cpufreq_cpu_get(i))
-			continue;
-		if ((cpufreq_driver->policy[i].policy == CPUFREQ_POLICY_GOVERNOR) && 
-		    (cpufreq_driver->policy[i].governor == governor)) {
-			cpufreq_governor(i, CPUFREQ_GOV_STOP);
-			cpufreq_driver->policy[i].policy = CPUFREQ_POLICY_PERFORMANCE;
-			cpufreq_governor(i, CPUFREQ_GOV_START);
-			cpufreq_governor(i, CPUFREQ_GOV_LIMITS);
-		}
-		cpufreq_cpu_put(i);
-	}
-
-	/* now we can safely remove it from the list */
 	list_del(&governor->governor_list);
 	up(&cpufreq_governor_sem);
 	return;
@@ -634,16 +720,19 @@
  */
 int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu)
 {
-	if (!policy || !cpufreq_cpu_get(cpu))
+	struct cpufreq_policy *cpu_policy;
+	if (!policy)
+		return -EINVAL;
+
+	cpu_policy = cpufreq_cpu_get(cpu);
+	if (!cpu_policy)
 		return -EINVAL;
 
-	down(&cpufreq_driver_sem);
-	memcpy(policy, 
-	       &cpufreq_driver->policy[cpu], 
-	       sizeof(struct cpufreq_policy));
-	up(&cpufreq_driver_sem);
+	down(&cpu_policy->lock);
+	memcpy(policy, cpu_policy, sizeof(struct cpufreq_policy));
+	up(&cpu_policy->lock);
 
-	cpufreq_cpu_put(cpu);
+	cpufreq_cpu_put(cpu_policy);
 
 	return 0;
 }
@@ -659,15 +748,21 @@
 int cpufreq_set_policy(struct cpufreq_policy *policy)
 {
 	int ret = 0;
+	struct cpufreq_policy *data;
 
-	if (!policy || !cpufreq_cpu_get(policy->cpu))
+	if (!policy)
 		return -EINVAL;
 
-	down(&cpufreq_driver_sem);
+	data = cpufreq_cpu_get(policy->cpu);
+	if (!data)
+		return -EINVAL;
+
+	/* lock this CPU */
+	down(&data->lock);
+
 	memcpy(&policy->cpuinfo, 
-	       &cpufreq_driver->policy[policy->cpu].cpuinfo, 
+	       &data->cpuinfo, 
 	       sizeof(struct cpufreq_cpuinfo));
-	up(&cpufreq_driver_sem);
 
 	/* verify the cpu speed can be set within this limit */
 	ret = cpufreq_driver->verify(policy);
@@ -698,39 +793,39 @@
 
 	up_read(&cpufreq_notifier_rwsem);
 
-	/* from here on we limit it to one limit and/or governor change running at the moment */
-	down(&cpufreq_driver_sem);
-	cpufreq_driver->policy[policy->cpu].min    = policy->min;
-	cpufreq_driver->policy[policy->cpu].max    = policy->max;
+	data->min    = policy->min;
+	data->max    = policy->max;
 
 	if (cpufreq_driver->setpolicy) {
-		cpufreq_driver->policy[policy->cpu].policy = policy->policy;
+		data->policy = policy->policy;
 		ret = cpufreq_driver->setpolicy(policy);
 	} else {
-		if ((policy->policy != cpufreq_driver->policy[policy->cpu].policy) || 
-		    ((policy->policy == CPUFREQ_POLICY_GOVERNOR) && (policy->governor != cpufreq_driver->policy[policy->cpu].governor))) {
-			unsigned int old_pol = cpufreq_driver->policy[policy->cpu].policy;
-			struct cpufreq_governor *old_gov = cpufreq_driver->policy[policy->cpu].governor;
+		if ((policy->policy != data->policy) || 
+		    ((policy->policy == CPUFREQ_POLICY_GOVERNOR) && (policy->governor != data->governor))) {
+			/* save old, working values */
+			unsigned int old_pol = data->policy;
+			struct cpufreq_governor *old_gov = data->governor;
+
 			/* end old governor */
-			cpufreq_governor(policy->cpu, CPUFREQ_GOV_STOP);
-			cpufreq_driver->policy[policy->cpu].policy = policy->policy;
-			cpufreq_driver->policy[policy->cpu].governor = policy->governor;
+			__cpufreq_governor(data, CPUFREQ_GOV_STOP);
+
 			/* start new governor */
-			if (cpufreq_governor(policy->cpu, CPUFREQ_GOV_START)) {
-				cpufreq_driver->policy[policy->cpu].policy = old_pol;
-				cpufreq_driver->policy[policy->cpu].governor = old_gov;
-				cpufreq_governor(policy->cpu, CPUFREQ_GOV_START);
+			data->policy = policy->policy;
+			data->governor = policy->governor;
+			if (__cpufreq_governor(data, CPUFREQ_GOV_START)) {
+				/* new governor failed, so re-start old one */
+				data->policy = old_pol;
+				data->governor = old_gov;
+				__cpufreq_governor(data, CPUFREQ_GOV_START);
 			}
-			/* might be a policy change, too */
-			cpufreq_governor(policy->cpu, CPUFREQ_GOV_LIMITS);
-		} else {
-			cpufreq_governor(policy->cpu, CPUFREQ_GOV_LIMITS);
+			/* might be a policy change, too, so fall through */
 		}
+		__cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
 	}
-	up(&cpufreq_driver_sem);
 
- error_out:	
-	cpufreq_cpu_put(policy->cpu);
+ error_out:
+	up(&data->lock);
+	cpufreq_cpu_put(data);
 
 	return ret;
 }
@@ -751,8 +846,8 @@
  * per-CPU loops_per_jiffy value wherever possible.
  */
 #ifndef CONFIG_SMP
-static unsigned long l_p_j_ref = 0;
-static unsigned int  l_p_j_ref_freq = 0;
+static unsigned long l_p_j_ref;
+static unsigned int  l_p_j_ref_freq;
 
 static inline void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci)
 {
@@ -781,12 +876,12 @@
 	switch (state) {
 	case CPUFREQ_PRECHANGE:
 		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_PRECHANGE, freqs);
-		adjust_jiffies(CPUFREQ_PRECHANGE, freqs);		
+		adjust_jiffies(CPUFREQ_PRECHANGE, freqs);
 		break;
 	case CPUFREQ_POSTCHANGE:
 		adjust_jiffies(CPUFREQ_POSTCHANGE, freqs);
 		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_POSTCHANGE, freqs);
-		cpufreq_driver->policy[freqs->cpu].cur = freqs->new;
+		cpufreq_cpu_data[freqs->cpu]->cur = freqs->new;
 		break;
 	}
 	up_read(&cpufreq_notifier_rwsem);
@@ -811,25 +906,19 @@
  */
 int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 {
+	unsigned long flags;
+
 	if (!driver_data || !driver_data->verify || !driver_data->init ||
 	    ((!driver_data->setpolicy) && (!driver_data->target)))
 		return -EINVAL;
 
-	down(&cpufreq_driver_sem);
+	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	if (cpufreq_driver) {
-		up(&cpufreq_driver_sem);		
+		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 		return -EBUSY;
 	}
 	cpufreq_driver = driver_data;
-	up(&cpufreq_driver_sem);
-
-	cpufreq_driver->policy = kmalloc(NR_CPUS * sizeof(struct cpufreq_policy), GFP_KERNEL);
-	if (!cpufreq_driver->policy) {
-		cpufreq_driver = NULL;
-		return -ENOMEM;
-	}
-
-	memset(cpufreq_driver->policy, 0, NR_CPUS * sizeof(struct cpufreq_policy));
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
 	return sysdev_driver_register(&cpu_sysdev_class,&cpufreq_sysdev_driver);
 }
@@ -846,50 +935,17 @@
  */
 int cpufreq_unregister_driver(struct cpufreq_driver *driver)
 {
+	unsigned long flags;
+
 	if (!cpufreq_driver || (driver != cpufreq_driver))
 		return -EINVAL;
 
 	sysdev_driver_unregister(&cpu_sysdev_class, &cpufreq_sysdev_driver);
 
-	down(&cpufreq_driver_sem);
-	kfree(cpufreq_driver->policy);
+	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	cpufreq_driver = NULL;
-	up(&cpufreq_driver_sem);
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cpufreq_unregister_driver);
-
-
-#ifdef CONFIG_PM
-
-/**
- *	cpufreq_restore - restore the CPU clock frequency after resume
- *
- *	Restore the CPU clock frequency so that our idea of the current
- *	frequency reflects the actual hardware.
- */
-static int cpufreq_restore(struct sys_device * sysdev)
-{
-	int cpu = sysdev->id;
-	unsigned int ret = 0;
-	struct cpufreq_policy policy;
-
-	if (cpu_online(cpu) && cpufreq_cpu_get(cpu)) {
-		down(&cpufreq_driver_sem);
-		memcpy(&policy, &cpufreq_driver->policy[cpu], 
-		       sizeof(struct cpufreq_policy));
-		up(&cpufreq_driver_sem);
-		ret = cpufreq_set_policy(&policy);
-		cpufreq_cpu_put(cpu);
-	}
-
-	return ret;
-}
-
-#else
-static int cpufreq_restore(struct sys_device * sysdev)
-{
-	return 0;
-}
-#endif /* CONFIG_PM */
