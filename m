From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/drivers/cpufreq cpufreq.c,1.1,1.1.2.1
Date: Wed, 27 Aug 2003 15:11:24 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19s11A-00018a-CB@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq
In directory flint:/tmp/cvs-serv4369

Modified Files:
      Tag: LINUX_2_4
	cpufreq.c 
Log Message:
move kernel/cpufreq.c to driver/cpufreq (Dominik Brodowski)


Index: cpufreq.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/cpufreq.c,v
retrieving revision 1.1
retrieving revision 1.1.2.1
diff -u -r1.1 -r1.1.2.1
--- cpufreq.c	27 Aug 2003 10:42:19 -0000	1.1
+++ cpufreq.c	27 Aug 2003 14:11:21 -0000	1.1.2.1
@@ -18,11 +18,9 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/spinlock.h>
-#include <linux/device.h>
 #include <linux/slab.h>
-#include <linux/cpu.h>
-#include <linux/completion.h>
 
+#include <asm/semaphore.h>
 /**
  * The "cpufreq driver" - the arch- or hardware-dependend low
  * level driver of CPUFreq support, and its spinlock. This lock
@@ -51,6 +49,13 @@
 static LIST_HEAD(cpufreq_governor_list);
 static DECLARE_MUTEX		(cpufreq_governor_sem);
 
+/*
+ * backport info:
+ * we don't have a kobj we can use for ref-counting, so use a
+ * "unsigned int policy->use_count" and an "unload_sem" [idea from
+ * Pat Mochel's struct driver unload_sem] for proper reference counting.
+ */
+
 static struct cpufreq_policy * cpufreq_cpu_get(unsigned int cpu)
 {
 	struct cpufreq_policy *data;
@@ -65,26 +70,21 @@
 	if (!cpufreq_driver)
 		goto err_out_unlock;
 
-	if (!try_module_get(cpufreq_driver->owner))
-		goto err_out_unlock;
-
-
 	/* get the CPU */
 	data = cpufreq_cpu_data[cpu];
 
 	if (!data)
-		goto err_out_put_module;
+		goto err_out_unlock;
 
-	if (!kobject_get(&data->kobj))
-		goto err_out_put_module;
+	if (!data->use_count)
+		goto err_out_unlock;
 
+	data->use_count += 1;
 
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
 	return data;
 
- err_out_put_module:
-	module_put(cpufreq_driver->owner);
  err_out_unlock:
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
  err_out:
@@ -93,8 +93,16 @@
 
 static void cpufreq_cpu_put(struct cpufreq_policy *data)
 {
-	kobject_put(&data->kobj);
-	module_put(cpufreq_driver->owner);
+	unsigned long flags;
+
+	spin_lock_irqsave(&cpufreq_driver_lock, flags);
+	data->use_count -= 1;
+	if (!data->use_count) {
+		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		up(&data->unload_sem);
+		return;
+	}
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 }
 
 /*********************************************************************
@@ -134,237 +142,31 @@
 EXPORT_SYMBOL_GPL(cpufreq_parse_governor);
 
 
-/* drivers/base/cpu.c */
-extern struct sysdev_class cpu_sysdev_class;
-
-
-/**
- * cpufreq_per_cpu_attr_read() / show_##file_name() - print out cpufreq information
- *
- * Write out information from cpufreq_driver->policy[cpu]; object must be
- * "unsigned int".
- */
-
-#define show_one(file_name, object)		 			\
-static ssize_t show_##file_name 					\
-(struct cpufreq_policy * policy, char *buf)				\
-{									\
-	return sprintf (buf, "%u\n", policy->object);			\
-}
-
-show_one(cpuinfo_min_freq, cpuinfo.min_freq);
-show_one(cpuinfo_max_freq, cpuinfo.max_freq);
-show_one(scaling_min_freq, min);
-show_one(scaling_max_freq, max);
-
-/**
- * cpufreq_per_cpu_attr_write() / store_##file_name() - sysfs write access
- */
-#define store_one(file_name, object)			\
-static ssize_t store_##file_name					\
-(struct cpufreq_policy * policy, const char *buf, size_t count)		\
-{									\
-	unsigned int ret = -EINVAL;					\
-	struct cpufreq_policy new_policy;				\
-									\
-	ret = cpufreq_get_policy(&new_policy, policy->cpu);		\
-	if (ret)							\
-		return -EINVAL;						\
-									\
-	ret = sscanf (buf, "%u", &new_policy.object);			\
-	if (ret != 1)							\
-		return -EINVAL;						\
-									\
-	ret = cpufreq_set_policy(&new_policy);				\
-									\
-	return ret ? ret : count;					\
-}
-
-store_one(scaling_min_freq,min);
-store_one(scaling_max_freq,max);
-
-/**
- * show_scaling_governor - show the current policy for the specified CPU
- */
-static ssize_t show_scaling_governor (struct cpufreq_policy * policy, char *buf)
-{
-	switch (policy->policy) {
-	case CPUFREQ_POLICY_POWERSAVE:
-		return sprintf(buf, "powersave\n");
-	case CPUFREQ_POLICY_PERFORMANCE:
-		return sprintf(buf, "performance\n");
-	case CPUFREQ_POLICY_GOVERNOR:
-		return snprintf(buf, CPUFREQ_NAME_LEN, "%s\n", policy->governor->name);
-	default:
-		return -EINVAL;
-	}
-}
-
-
-/**
- * store_scaling_governor - store policy for the specified CPU
+/* backport info:
+ * all the sysfs stuff is missing -- of course
  */
-static ssize_t store_scaling_governor (struct cpufreq_policy * policy, 
-				       const char *buf, size_t count) 
-{
-	unsigned int ret = -EINVAL;
-	char	str_governor[16];
-	struct cpufreq_policy new_policy;
-
-	ret = cpufreq_get_policy(&new_policy, policy->cpu);
-	if (ret)
-		return ret;
-
-	ret = sscanf (buf, "%15s", str_governor);
-	if (ret != 1)
-		return -EINVAL;
-
-	if (cpufreq_parse_governor(str_governor, &new_policy.policy, &new_policy.governor))
-		return -EINVAL;
-
-	ret = cpufreq_set_policy(&new_policy);
-
-	return ret ? ret : count;
-}
-
-/**
- * show_scaling_driver - show the cpufreq driver currently loaded
- */
-static ssize_t show_scaling_driver (struct cpufreq_policy * policy, char *buf)
-{
-	return snprintf(buf, CPUFREQ_NAME_LEN, "%s\n", cpufreq_driver->name);
-}
-
-/**
- * show_scaling_available_governors - show the available CPUfreq governors
- */
-static ssize_t show_scaling_available_governors (struct cpufreq_policy * policy,
-				char *buf)
-{
-	ssize_t i = 0;
-	struct cpufreq_governor *t;
-
-	i += sprintf(buf, "performance powersave");
-
-	if (!cpufreq_driver->target)
-		goto out;
-
-	list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
-		if (i >= (ssize_t) ((PAGE_SIZE / sizeof(char)) - (CPUFREQ_NAME_LEN + 2)))
-			goto out;
-		i += snprintf(&buf[i], CPUFREQ_NAME_LEN, " %s", t->name);
-	}
- out:
-	i += sprintf(&buf[i], "\n");
-	return i;
-}
-
-
-#define define_one_ro(_name) \
-struct freq_attr _name = { \
-	.attr = { .name = __stringify(_name), .mode = 0444 }, \
-	.show = show_##_name, \
-}
-
-#define define_one_rw(_name) \
-struct freq_attr _name = { \
-	.attr = { .name = __stringify(_name), .mode = 0644 }, \
-	.show = show_##_name, \
-	.store = store_##_name, \
-}
-
-define_one_ro(cpuinfo_min_freq);
-define_one_ro(cpuinfo_max_freq);
-define_one_ro(scaling_available_governors);
-define_one_ro(scaling_driver);
-define_one_rw(scaling_min_freq);
-define_one_rw(scaling_max_freq);
-define_one_rw(scaling_governor);
-
-static struct attribute * default_attrs[] = {
-	&cpuinfo_min_freq.attr,
-	&cpuinfo_max_freq.attr,
-	&scaling_min_freq.attr,
-	&scaling_max_freq.attr,
-	&scaling_governor.attr,
-	&scaling_driver.attr,
-	&scaling_available_governors.attr,
-	NULL
-};
-
-#define to_policy(k) container_of(k,struct cpufreq_policy,kobj)
-#define to_attr(a) container_of(a,struct freq_attr,attr)
-
-static ssize_t show(struct kobject * kobj, struct attribute * attr ,char * buf)
-{
-	struct cpufreq_policy * policy = to_policy(kobj);
-	struct freq_attr * fattr = to_attr(attr);
-	ssize_t ret;
-	policy = cpufreq_cpu_get(policy->cpu);
-	if (!policy)
-		return -EINVAL;
-	ret = fattr->show ? fattr->show(policy,buf) : 0;
-	cpufreq_cpu_put(policy);
-	return ret;
-}
-
-static ssize_t store(struct kobject * kobj, struct attribute * attr, 
-		     const char * buf, size_t count)
-{
-	struct cpufreq_policy * policy = to_policy(kobj);
-	struct freq_attr * fattr = to_attr(attr);
-	ssize_t ret;
-	policy = cpufreq_cpu_get(policy->cpu);
-	if (!policy)
-		return -EINVAL;
-	ret = fattr->store ? fattr->store(policy,buf,count) : 0;
-	cpufreq_cpu_put(policy);
-	return ret;
-}
-
-static void cpufreq_sysfs_release(struct kobject * kobj)
-{
-	struct cpufreq_policy * policy = to_policy(kobj);
-	complete(&policy->kobj_unregister);
-}
-
-static struct sysfs_ops sysfs_ops = {
-	.show	= show,
-	.store	= store,
-};
-
-static struct kobj_type ktype_cpufreq = {
-	.sysfs_ops	= &sysfs_ops,
-	.default_attrs	= default_attrs,
-	.release	= cpufreq_sysfs_release,
-};
-
 
 /**
  * cpufreq_add_dev - add a CPU device
  *
  * Adds the cpufreq interface for a CPU device. 
  */
-static int cpufreq_add_dev (struct sys_device * sys_dev)
+static int cpufreq_add_dev (unsigned int cpu)
 {
-	unsigned int cpu = sys_dev->id;
 	int ret = 0;
 	struct cpufreq_policy new_policy;
 	struct cpufreq_policy *policy;
-	struct freq_attr **drv_attr;
 	unsigned long flags;
 
-	if (!try_module_get(cpufreq_driver->owner))
-		return -EINVAL;
-
 	policy = kmalloc(sizeof(struct cpufreq_policy), GFP_KERNEL);
 	if (!policy)
 		return -ENOMEM;
 	memset(policy, 0, sizeof(struct cpufreq_policy));
 
 	policy->cpu = cpu;
+	policy->use_count = 1;
 	init_MUTEX_LOCKED(&policy->lock);
-	init_completion(&policy->kobj_unregister);
+	init_MUTEX_LOCKED(&policy->unload_sem);
 
 	/* call driver. From then on the cpufreq must be able
 	 * to accept all calls to ->verify and ->setpolicy for this CPU
@@ -375,22 +177,6 @@
 
 	memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
 
-	/* prepare interface data */
-	policy->kobj.parent = &sys_dev->kobj;
-	policy->kobj.ktype = &ktype_cpufreq;
-	strlcpy(policy->kobj.name, "cpufreq", KOBJ_NAME_LEN);
-
-	ret = kobject_register(&policy->kobj);
-	if (ret)
-		goto err_out;
-
-	/* set up files for this cpu device */
-	drv_attr = cpufreq_driver->attr;
-	while ((drv_attr) && (*drv_attr)) {
-		sysfs_create_file(&policy->kobj, &((*drv_attr)->attr));
-		drv_attr++;
-	}
-
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	cpufreq_cpu_data[cpu] = policy;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
@@ -402,7 +188,6 @@
 	if (ret)
 		goto err_out_unregister;
 
-	module_put(cpufreq_driver->owner);
 	return 0;
 
 
@@ -411,12 +196,8 @@
 	cpufreq_cpu_data[cpu] = NULL;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
-	kobject_unregister(&policy->kobj);
-	wait_for_completion(&policy->kobj_unregister);
-
  err_out:
 	kfree(policy);
-	module_put(cpufreq_driver->owner);
 	return ret;
 }
 
@@ -426,34 +207,29 @@
  *
  * Removes the cpufreq interface for a CPU device.
  */
-static int cpufreq_remove_dev (struct sys_device * sys_dev)
+static int cpufreq_remove_dev (unsigned int cpu)
 {
-	unsigned int cpu = sys_dev->id;
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
-
-	if (!kobject_get(&data->kobj))
-		return -EFAULT;
-
-	kobject_unregister(&data->kobj);
-
-	kobject_put(&data->kobj);
 
-	/* we need to make sure that the underlying kobj is actually
-	 * not referenced anymore by anybody before we proceed with 
-	 * unloading.
-	 */
-	wait_for_completion(&data->kobj_unregister);
+	data->use_count -= 1;
+	if (!data->use_count) {
+		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		up(&data->unload_sem);
+	} else {
+		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		/* this will sleep until data->use_count gets to zero */
+		down(&data->unload_sem);
+		up(&data->unload_sem);
+	}
 
 	if (cpufreq_driver->target)
 		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
@@ -466,41 +242,6 @@
 	return 0;
 }
 
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
-	struct cpufreq_policy *cpu_policy;
-
-	if (!cpu_online(cpu))
-		return 0;
-
-	cpu_policy = cpufreq_cpu_get(cpu);
-
-	down(&cpu_policy->lock);
-	memcpy(&policy, cpu_policy, sizeof(struct cpufreq_policy));
-	up(&cpu_policy->lock);
-
-	ret = cpufreq_set_policy(&policy);
-
-	cpufreq_cpu_put(cpu_policy);
-
-	return ret;
-}
-
-static struct sysdev_driver cpufreq_sysdev_driver = {
-	.add		= cpufreq_add_dev,
-	.remove		= cpufreq_remove_dev,
-	.restore	= cpufreq_restore,
-};
-
 
 /*********************************************************************
  *                     NOTIFIER LISTS INTERFACE                      *
@@ -626,15 +367,7 @@
 		}
 		break;
 	case CPUFREQ_POLICY_GOVERNOR:
-		ret = -EINVAL;
-		if (!try_module_get(policy->governor->owner))
-			break;
 		ret = policy->governor->governor(policy, event);
-		/* we keep one module reference alive for each CPU governed by this CPU */
-		if ((event != CPUFREQ_GOV_START) || ret)
-			module_put(policy->governor->owner);
-		if ((event == CPUFREQ_GOV_STOP) && !ret)
-			module_put(policy->governor->owner);
 		break;
 	default:
 		ret = -EINVAL;
@@ -694,10 +427,38 @@
 
 void cpufreq_unregister_governor(struct cpufreq_governor *governor)
 {
+	/* backport info: 
+	 * As the module usage count isn't assured in 2.4., check for removal
+	 * of running cpufreq governor
+	 */
+	unsigned int i;
+
 	if (!governor)
 		return;
 
 	down(&cpufreq_governor_sem);
+
+	for (i=0; i<NR_CPUS; i++) {
+		struct cpufreq_policy *policy = cpufreq_cpu_get(i);
+		if (!policy)
+			goto done;
+		down(&policy->lock);
+
+		if (policy->policy != CPUFREQ_POLICY_GOVERNOR)
+			goto unlock_done;
+		if (policy->governor != governor)
+			goto unlock_done;
+
+		/* stop old one, start performance [always present] */
+		__cpufreq_governor(policy, CPUFREQ_GOV_STOP);
+		policy->policy = CPUFREQ_POLICY_PERFORMANCE;
+		__cpufreq_governor(policy, CPUFREQ_GOV_START);
+
+	unlock_done:
+		up(&policy->lock);
+	done:
+		cpufreq_cpu_put(policy);
+	}
 	list_del(&governor->governor_list);
 	up(&cpufreq_governor_sem);
 	return;
@@ -844,8 +605,8 @@
  * per-CPU loops_per_jiffy value wherever possible.
  */
 #ifndef CONFIG_SMP
-static unsigned long l_p_j_ref;
-static unsigned int  l_p_j_ref_freq;
+static unsigned long l_p_j_ref = 0;
+static unsigned int  l_p_j_ref_freq = 0;
 
 static inline void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci)
 {
@@ -905,6 +666,7 @@
 int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 {
 	unsigned long flags;
+	unsigned int i;
 
 	if (!driver_data || !driver_data->verify || !driver_data->init ||
 	    ((!driver_data->setpolicy) && (!driver_data->target)))
@@ -918,7 +680,12 @@
 	cpufreq_driver = driver_data;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
-	return sysdev_driver_register(&cpu_sysdev_class,&cpufreq_sysdev_driver);
+	for (i=0; i<NR_CPUS; i++) {
+		if (cpu_online(i)) 
+			cpufreq_add_dev(i);
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(cpufreq_register_driver);
 
@@ -934,11 +701,15 @@
 int cpufreq_unregister_driver(struct cpufreq_driver *driver)
 {
 	unsigned long flags;
+	unsigned int i;
 
 	if (!cpufreq_driver || (driver != cpufreq_driver))
 		return -EINVAL;
 
-	sysdev_driver_unregister(&cpu_sysdev_class, &cpufreq_sysdev_driver);
+	for (i=0; i<NR_CPUS; i++) {
+		if (cpu_online(i)) 
+			cpufreq_remove_dev(i);
+	}
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	cpufreq_driver = NULL;
