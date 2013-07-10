From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: Re: [REGRESSION] Commit a66b2e50 "Preserve sysfs files across suspend/resume"
 causes a regression in intel_pstate
Date: Thu, 11 Jul 2013 03:48:35 +0530
Message-ID: <51DDDDBB.6070105@linux.vnet.ibm.com>
References: <51DD8890.8040008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <51DD8890.8040008@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: cpufreq <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, durgadoss.r@intel.com, "Jarzmik, Robert" <robert.jarzmik@intel.com>, tianyu.lan@intel.com

On 07/10/2013 09:45 PM, Dirk Brandewie wrote:
> Hi All,
> 
> Tianyu debugged into https://bugzilla.kernel.org/show_bug.cgi?id=59781
> and found
> that commit a66b2e50 is causing the regression.
> 
> Tianyu has proposed a fix (patch attached to bugzilla) but having scaling
> drivers receive hotplug notifications through two paths seems weird.
> 
> Looking at the core code and some of the other scaling drivers
> I don't see an obvious fix.  Maybe adding optional suspend/resume callbacks
> to the scaling driver interface?
> 
> All the scaling drivers that need to do stateful  work in the init/exit
> callbacks are being affected by this change so I think there are other
> subtle side-effects out there that haven't been noticed yet.
> 
> I am not sure how we should proceed here?
> 
> Thoughts?

While writing that patch, I had taken a shortcut - instead of reorganizing the
code such that I only skip the sysfs parts of cpufreq during suspend/resume,
I went ahead and skipped the _entire_ add/remove calls of cpufreq subsystem.
Obviously that didn't go so well, and for that I'm truly sorry.

Below is an untested patch which tries to do it the way it should have been
done originally - by splitting the functionality into cpufreq low-level code
and the sysfs part, and only skipping the sysfs part during suspend/resume.
You might want to give it a try and see how it goes. But note that Rafael is
planning to revert commit a66b2e50 altogether, so this might be moot.

(BTW, the first patch proposed in that bugzilla is already upstream, see commit
f51e1eb cpufreq: Fix cpufreq regression after suspend/resume).

Regards,
Srivatsa S. Bhat


(Applies on current mainline)

---

 drivers/cpufreq/cpufreq.c |  144 ++++++++++++++++++++++++++-------------------
 1 file changed, 82 insertions(+), 62 deletions(-)


diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 6a015ad..28c690f 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -834,11 +834,8 @@ static int cpufreq_add_dev_interface(unsigned int cpu,
 				     struct cpufreq_policy *policy,
 				     struct device *dev)
 {
-	struct cpufreq_policy new_policy;
 	struct freq_attr **drv_attr;
-	unsigned long flags;
 	int ret = 0;
-	unsigned int j;
 
 	/* prepare interface data */
 	ret = kobject_init_and_add(&policy->kobj, &ktype_cpufreq,
@@ -870,31 +867,10 @@ static int cpufreq_add_dev_interface(unsigned int cpu,
 			goto err_out_kobj_put;
 	}
 
-	write_lock_irqsave(&cpufreq_driver_lock, flags);
-	for_each_cpu(j, policy->cpus) {
-		per_cpu(cpufreq_cpu_data, j) = policy;
-		per_cpu(cpufreq_policy_cpu, j) = policy->cpu;
-	}
-	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
-
 	ret = cpufreq_add_dev_symlink(cpu, policy);
 	if (ret)
 		goto err_out_kobj_put;
 
-	memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
-	/* assure that the starting sequence is run in __cpufreq_set_policy */
-	policy->governor = NULL;
-
-	/* set default policy */
-	ret = __cpufreq_set_policy(policy, &new_policy);
-	policy->user_policy.policy = policy->policy;
-	policy->user_policy.governor = policy->governor;
-
-	if (ret) {
-		pr_debug("setting policy failed\n");
-		if (cpufreq_driver->exit)
-			cpufreq_driver->exit(policy);
-	}
 	return ret;
 
 err_out_kobj_put:
@@ -905,7 +881,7 @@ err_out_kobj_put:
 
 #ifdef CONFIG_HOTPLUG_CPU
 static int cpufreq_add_policy_cpu(unsigned int cpu, unsigned int sibling,
-				  struct device *dev)
+				  struct device *dev, bool init_sysfs)
 {
 	struct cpufreq_policy *policy;
 	int ret = 0, has_target = !!cpufreq_driver->target;
@@ -933,30 +909,25 @@ static int cpufreq_add_policy_cpu(unsigned int cpu, unsigned int sibling,
 		__cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
 	}
 
-	ret = sysfs_create_link(&dev->kobj, &policy->kobj, "cpufreq");
-	if (ret) {
-		cpufreq_cpu_put(policy);
-		return ret;
+	if (init_sysfs) {
+		ret = sysfs_create_link(&dev->kobj, &policy->kobj, "cpufreq");
+		if (ret) {
+			cpufreq_cpu_put(policy);
+			return ret;
+		}
 	}
 
 	return 0;
 }
 #endif
 
-/**
- * cpufreq_add_dev - add a CPU device
- *
- * Adds the cpufreq interface for a CPU device.
- *
- * The Oracle says: try running cpufreq registration/unregistration concurrently
- * with with cpu hotplugging and all hell will break loose. Tried to clean this
- * mess up, but more thorough testing is needed. - Mathieu
- */
-static int cpufreq_add_dev(struct device *dev, struct subsys_interface *sif)
+static int __cpufreq_add_dev(struct device *dev, struct subsys_interface *sif,
+			     bool init_sysfs)
 {
 	unsigned int j, cpu = dev->id;
 	int ret = -ENOMEM;
 	struct cpufreq_policy *policy;
+	struct cpufreq_policy new_policy;
 	unsigned long flags;
 #ifdef CONFIG_HOTPLUG_CPU
 	struct cpufreq_governor *gov;
@@ -984,7 +955,8 @@ static int cpufreq_add_dev(struct device *dev, struct subsys_interface *sif)
 		struct cpufreq_policy *cp = per_cpu(cpufreq_cpu_data, sibling);
 		if (cp && cpumask_test_cpu(cpu, cp->related_cpus)) {
 			read_unlock_irqrestore(&cpufreq_driver_lock, flags);
-			return cpufreq_add_policy_cpu(cpu, sibling, dev);
+			return cpufreq_add_policy_cpu(cpu, sibling, dev,
+						      init_sysfs);
 		}
 	}
 	read_unlock_irqrestore(&cpufreq_driver_lock, flags);
@@ -1049,9 +1021,33 @@ static int cpufreq_add_dev(struct device *dev, struct subsys_interface *sif)
 	}
 #endif
 
-	ret = cpufreq_add_dev_interface(cpu, policy, dev);
-	if (ret)
-		goto err_out_unregister;
+	write_lock_irqsave(&cpufreq_driver_lock, flags);
+	for_each_cpu(j, policy->cpus) {
+		per_cpu(cpufreq_cpu_data, j) = policy;
+		per_cpu(cpufreq_policy_cpu, j) = policy->cpu;
+	}
+	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
+
+	if (init_sysfs) {
+		ret = cpufreq_add_dev_interface(cpu, policy, dev);
+		if (ret)
+			goto err_out_unregister;
+	}
+
+	memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
+	/* assure that the starting sequence is run in __cpufreq_set_policy */
+	policy->governor = NULL;
+
+	/* set default policy */
+	ret = __cpufreq_set_policy(policy, &new_policy);
+	policy->user_policy.policy = policy->policy;
+	policy->user_policy.governor = policy->governor;
+
+	if (ret) {
+		pr_debug("setting policy failed\n");
+		if (cpufreq_driver->exit)
+			cpufreq_driver->exit(policy);
+	}
 
 	kobject_uevent(&policy->kobj, KOBJ_ADD);
 	module_put(cpufreq_driver->owner);
@@ -1081,6 +1077,20 @@ module_out:
 	return ret;
 }
 
+/**
+ * cpufreq_add_dev - add a CPU device
+ *
+ * Adds the cpufreq interface for a CPU device.
+ *
+ * The Oracle says: try running cpufreq registration/unregistration concurrently
+ * with with cpu hotplugging and all hell will break loose. Tried to clean this
+ * mess up, but more thorough testing is needed. - Mathieu
+ */
+static int cpufreq_add_dev(struct device *dev, struct subsys_interface *sif)
+{
+	return __cpufreq_add_dev(dev, sif, true);
+}
+
 static void update_policy_cpu(struct cpufreq_policy *policy, unsigned int cpu)
 {
 	int j;
@@ -1106,7 +1116,7 @@ static void update_policy_cpu(struct cpufreq_policy *policy, unsigned int cpu)
  * This routine frees the rwsem before returning.
  */
 static int __cpufreq_remove_dev(struct device *dev,
-		struct subsys_interface *sif)
+				struct subsys_interface *sif, bool remove_sysfs)
 {
 	unsigned int cpu = dev->id, ret, cpus;
 	unsigned long flags;
@@ -1145,9 +1155,9 @@ static int __cpufreq_remove_dev(struct device *dev,
 		cpumask_clear_cpu(cpu, data->cpus);
 	unlock_policy_rwsem_write(cpu);
 
-	if (cpu != data->cpu) {
+	if (cpu != data->cpu && remove_sysfs) {
 		sysfs_remove_link(&dev->kobj, "cpufreq");
-	} else if (cpus > 1) {
+	} else if (cpus > 1 && remove_sysfs) {
 		/* first sibling now owns the new sysfs dir */
 		cpu_dev = get_cpu_device(cpumask_first(data->cpus));
 		sysfs_remove_link(&cpu_dev->kobj, "cpufreq");
@@ -1184,26 +1194,25 @@ static int __cpufreq_remove_dev(struct device *dev,
 
 	/* If cpu is last user of policy, free policy */
 	if (cpus == 1) {
-		lock_policy_rwsem_read(cpu);
-		kobj = &data->kobj;
-		cmp = &data->kobj_unregister;
-		unlock_policy_rwsem_read(cpu);
-		kobject_put(kobj);
-
-		/* we need to make sure that the underlying kobj is actually
-		 * not referenced anymore by anybody before we proceed with
-		 * unloading.
-		 */
-		pr_debug("waiting for dropping of refcount\n");
-		wait_for_completion(cmp);
-		pr_debug("wait complete\n");
-
 		if (cpufreq_driver->exit)
 			cpufreq_driver->exit(data);
 
 		free_cpumask_var(data->related_cpus);
 		free_cpumask_var(data->cpus);
 		kfree(data);
+
+		if (remove_sysfs) {
+			lock_policy_rwsem_read(cpu);
+			kobj = &data->kobj;
+			cmp = &data->kobj_unregister;
+			unlock_policy_rwsem_read(cpu);
+			kobject_put(kobj);
+
+			pr_debug("waiting for dropping of refcount\n");
+			wait_for_completion(cmp);
+			pr_debug("wait complete\n");
+		}
+
 	} else if (cpufreq_driver->target) {
 		__cpufreq_governor(data, CPUFREQ_GOV_START);
 		__cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
@@ -1221,7 +1230,7 @@ static int cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif)
 	if (cpu_is_offline(cpu))
 		return 0;
 
-	retval = __cpufreq_remove_dev(dev, sif);
+	retval = __cpufreq_remove_dev(dev, sif, true);
 	return retval;
 }
 
@@ -1943,13 +1952,24 @@ static int __cpuinit cpufreq_cpu_callback(struct notifier_block *nfb,
 		case CPU_ONLINE:
 			cpufreq_add_dev(dev, NULL);
 			break;
+		case CPU_ONLINE_FROZEN:
+			__cpufreq_add_dev(dev, NULL, false);
+			break;
+
 		case CPU_DOWN_PREPARE:
 		case CPU_UP_CANCELED_FROZEN:
-			__cpufreq_remove_dev(dev, NULL);
+			__cpufreq_remove_dev(dev, NULL, true);
+			break;
+		case CPU_DOWN_PREPARE_FROZEN:
+			__cpufreq_remove_dev(dev, NULL, false);
 			break;
+
 		case CPU_DOWN_FAILED:
 			cpufreq_add_dev(dev, NULL);
 			break;
+		case CPU_DOWN_FAILED_FROZEN:
+			__cpufreq_add_dev(dev, NULL, false);
+			break;
 		}
 	}
 	return NOTIFY_OK;

