From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCHES 2.5] cpufreq: fix up locking
Date: Sat, 12 Jul 2003 23:58:05 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030712215805.GA995@brodo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AhhlLboLdkugWU4S"
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: davej@suse.de, cpufreq@www.linux.org.uk


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

cpufreq locking was broken. Horribly. And I'm ashamed of it. Really. But
these eleven patches[*] try to fix it. Please review, test & apply.

	Dominik

[*] they don't really depend on the 
- cpufreq-2.5.75-bk1-documentation_changes
- cpufreq-2.5.75-bk1-fix_compilation_speedstep_debug
patches but on the 
- cpufreq-2.5.75-bk1-longrun_validate_can_fail
patch which I all sent to this list before.

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking1"

First part in a series of patches which clean up the locking in
cpufreq. It sort of worked, but is full of races. But to keep it
working at least as well it works now, add a new spinlock
cpufreq_driver_lock which will be what cpufreq_driver_sem intended to
be -- but it can indeed be a spinlock instead of a semaphore. 

This driver adds proper protection for struct cpufreq_driver
*cpufreq_driver which can only go away during cpufreq_unregister --
block this by increasing the driver's module reference count.

 cpufreq.c |   46 +++++++++++++++++++++++++++++++++++-----------
 1 files changed, 35 insertions(+), 11 deletions(-)

diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 21:45:46.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 21:58:58.000000000 +0200
@@ -27,10 +27,13 @@
 
 /**
  * The "cpufreq driver" - the arch- or hardware-dependend low
- * level driver of CPUFreq support, and its locking mutex. 
+ * level driver of CPUFreq support, and its spinlock.
  * cpu_max_freq is in kHz.
  */
 static struct cpufreq_driver   	*cpufreq_driver;
+static spinlock_t		cpufreq_driver_lock = SPIN_LOCK_UNLOCKED;
+
+/* will go away once the locking mess is cleaned up */
 static DECLARE_MUTEX            (cpufreq_driver_sem);
 
 /**
@@ -52,21 +55,38 @@
 
 static int cpufreq_cpu_get(unsigned int cpu)
 {
+	struct cpufreq_policy *data;
+
 	if (cpu >= NR_CPUS)
-		return 0;
+		goto err_out;
+
+	/* get the cpufreq driver */
+	spin_lock(&cpufreq_driver_lock);
 
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
+
+	/* get the CPU */
+	data = &cpufreq_driver->policy[cpu];
+
+	if (!kobject_get(&data->kobj))
+		goto err_out_put_module;
+
+
+	spin_unlock(&cpufreq_driver_lock);
 
 	return 1;
+
+ err_out_put_module:
+	module_put(cpufreq_driver->owner);
+ err_out_unlock:
+	spin_unlock(&cpufreq_driver_lock);
+ err_out:
+	return 0;
 }
 
 static void cpufreq_cpu_put(unsigned int cpu)
@@ -830,13 +850,13 @@
 	    ((!driver_data->setpolicy) && (!driver_data->target)))
 		return -EINVAL;
 
-	down(&cpufreq_driver_sem);
+	spin_lock(&cpufreq_driver_lock);
 	if (cpufreq_driver) {
-		up(&cpufreq_driver_sem);		
+		spin_unlock(&cpufreq_driver_lock);
 		return -EBUSY;
 	}
 	cpufreq_driver = driver_data;
-	up(&cpufreq_driver_sem);
+	spin_unlock(&cpufreq_driver_lock);
 
 	cpufreq_driver->policy = kmalloc(NR_CPUS * sizeof(struct cpufreq_policy), GFP_KERNEL);
 	if (!cpufreq_driver->policy) {
@@ -867,8 +887,12 @@
 	sysdev_driver_unregister(&cpu_sysdev_class, &cpufreq_sysdev_driver);
 
 	down(&cpufreq_driver_sem);
+
+	spin_lock(&cpufreq_driver_lock);
 	kfree(cpufreq_driver->policy);
 	cpufreq_driver = NULL;
+	spin_unlock(&cpufreq_driver_lock);
+
 	up(&cpufreq_driver_sem);
 
 	return 0;

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking10"

Remove the final instances of the now-deprecated
cpufreq_driver_sem. Also, the previous "one-frequency change at one
moment" limitation is gone. If it's needed by the cpufreq driver, it
should be implemented in its cpufreq_driver->{target,setpolicy}
callback.

 kernel/cpufreq.c |   13 +------------
 1 files changed, 1 insertion(+), 12 deletions(-)

diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 23:24:39.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 23:26:18.000000000 +0200
@@ -34,17 +34,13 @@
 static struct cpufreq_policy	*cpufreq_cpu_data[NR_CPUS];
 static spinlock_t		cpufreq_driver_lock = SPIN_LOCK_UNLOCKED;
 
-/* will go away once the locking mess is cleaned up */
-static DECLARE_MUTEX            (cpufreq_driver_sem);
 
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
@@ -784,8 +780,6 @@
 
 	up_read(&cpufreq_notifier_rwsem);
 
-	/* from here on we limit it to one limit and/or governor change running at the moment */
-	down(&cpufreq_driver_sem);
 	data->min    = policy->min;
 	data->max    = policy->max;
 
@@ -815,7 +809,6 @@
 		}
 		__cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
 	}
-	up(&cpufreq_driver_sem);
 
  error_out:
 	up(&data->lock);
@@ -940,15 +933,11 @@
 
 	sysdev_driver_unregister(&cpu_sysdev_class, &cpufreq_sysdev_driver);
 
-	down(&cpufreq_driver_sem);
-
 	spin_lock(&cpufreq_driver_lock);
 	kfree(cpufreq_driver->policy);
 	cpufreq_driver = NULL;
 	spin_unlock(&cpufreq_driver_lock);
 
-	up(&cpufreq_driver_sem);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cpufreq_unregister_driver);

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking11"

Implement per-CPU memory allocation. Is a bit cleaner than the
previous "once and for all" approach. Also, release the per-CPU lock
in the exit function again -- another thread may want to aquire
it. Instead, only do the final cleanup (GOV_STOP signal to governor,
call to cpufreq_driver->exit function) after the per-CPU kobject has
reached the end of its existence.

 include/linux/cpufreq.h |    2 --
 kernel/cpufreq.c        |   46 ++++++++++++++++++----------------------------
 2 files changed, 18 insertions(+), 30 deletions(-)

diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2003-07-12 23:09:09.000000000 +0200
+++ linux/include/linux/cpufreq.h	2003-07-12 23:31:14.000000000 +0200
@@ -164,8 +164,6 @@
 	struct module           *owner;
 	char			name[CPUFREQ_NAME_LEN];
 
-	struct cpufreq_policy	*policy;
-
 	/* needed by all drivers */
 	int	(*init)		(struct cpufreq_policy *policy);
 	int	(*verify)	(struct cpufreq_policy *policy);
diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 23:28:29.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 23:45:04.000000000 +0200
@@ -35,6 +35,9 @@
 static spinlock_t		cpufreq_driver_lock = SPIN_LOCK_UNLOCKED;
 
 
+/* internal prototype */
+static int __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event);
+
 /**
  * Two notifier lists: the "policy" list is involved in the 
  * validation process for a new CPU frequency policy; the 
@@ -354,7 +357,11 @@
 	if (!try_module_get(cpufreq_driver->owner))
 		return -EINVAL;
 
-	policy = &cpufreq_driver->policy[cpu];
+	policy = kmalloc(sizeof(struct cpufreq_policy), GFP_KERNEL);
+	if (!policy)
+		return -ENOMEM;
+	memset(policy, 0, sizeof(struct cpufreq_policy));
+
 	policy->cpu = cpu;
 	init_MUTEX_LOCKED(&policy->lock);
 	init_completion(&policy->kobj_unregister);
@@ -399,6 +406,7 @@
 
 		kobject_unregister(&policy->kobj);
 		wait_for_completion(&policy->kobj_unregister);
+		kfree(policy);
 	}
 
  out:
@@ -427,31 +435,22 @@
 	cpufreq_cpu_data[cpu] = NULL;
 	spin_unlock(&cpufreq_driver_lock);
 
-	if (!kobject_get(&data->kobj))
-		return -EFAULT;
-
-	/* lock it forever */
-	down(&data->lock);
-
-	if ((cpufreq_driver->target) && 
-	    (data->policy == CPUFREQ_POLICY_GOVERNOR)) {
-		data->governor->governor(data, CPUFREQ_GOV_STOP);
-		module_put(data->governor->owner);
-	}
-
-	if (cpufreq_driver->exit)
-		cpufreq_driver->exit(data);
-
 	kobject_unregister(&data->kobj);
 
-	kobject_put(&data->kobj);
-
 	/* we need to make sure that the underlying kobj is actually
 	 * destroyed before we proceed e.g. with cpufreq driver module
 	 * unloading
 	 */
 	wait_for_completion(&data->kobj_unregister);
 
+	if (cpufreq_driver->target)
+		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
+
+	if (cpufreq_driver->exit)
+		cpufreq_driver->exit(data);
+
+	kfree(data);
+
 	return 0;
 }
 
@@ -868,7 +867,7 @@
 	case CPUFREQ_POSTCHANGE:
 		adjust_jiffies(CPUFREQ_POSTCHANGE, freqs);
 		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_POSTCHANGE, freqs);
-		cpufreq_driver->policy[freqs->cpu].cur = freqs->new;
+		cpufreq_cpu_data[freqs->cpu]->cur = freqs->new;
 		break;
 	}
 	up_read(&cpufreq_notifier_rwsem);
@@ -905,14 +904,6 @@
 	cpufreq_driver = driver_data;
 	spin_unlock(&cpufreq_driver_lock);
 
-	cpufreq_driver->policy = kmalloc(NR_CPUS * sizeof(struct cpufreq_policy), GFP_KERNEL);
-	if (!cpufreq_driver->policy) {
-		cpufreq_driver = NULL;
-		return -ENOMEM;
-	}
-
-	memset(cpufreq_driver->policy, 0, NR_CPUS * sizeof(struct cpufreq_policy));
-
 	return sysdev_driver_register(&cpu_sysdev_class,&cpufreq_sysdev_driver);
 }
 EXPORT_SYMBOL_GPL(cpufreq_register_driver);
@@ -934,7 +925,6 @@
 	sysdev_driver_unregister(&cpu_sysdev_class, &cpufreq_sysdev_driver);
 
 	spin_lock(&cpufreq_driver_lock);
-	kfree(cpufreq_driver->policy);
 	cpufreq_driver = NULL;
 	spin_unlock(&cpufreq_driver_lock);
 

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking2"

as the per-CPU initialization can fail, we need to deal with this
situation in cpufreq_remove_dev as the sysdev core doesn't (yet) do
this for us. The solution: add a "struct cpufreq_policy
*cpufreq_cpu_data[NR_CPUS]" array, which has a NULL pointer for each
CPU not managed by cpufreq (yet) and a pointer to the per-CPU data
for each CPU managed by cpufreq. It is locked by cpufreq_driver_lock.

diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 22:01:26.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 22:11:50.000000000 +0200
@@ -27,10 +27,11 @@
 
 /**
  * The "cpufreq driver" - the arch- or hardware-dependend low
- * level driver of CPUFreq support, and its spinlock.
- * cpu_max_freq is in kHz.
+ * level driver of CPUFreq support, and its spinlock. This lock
+ * also protects the cpufreq_cpu_data array.
  */
 static struct cpufreq_driver   	*cpufreq_driver;
+static struct cpufreq_policy	*cpufreq_cpu_data[NR_CPUS];
 static spinlock_t		cpufreq_driver_lock = SPIN_LOCK_UNLOCKED;
 
 /* will go away once the locking mess is cleaned up */
@@ -71,7 +72,10 @@
 
 
 	/* get the CPU */
-	data = &cpufreq_driver->policy[cpu];
+	data = cpufreq_cpu_data[cpu];
+
+	if (!data)
+		goto err_out_put_module;
 
 	if (!kobject_get(&data->kobj))
 		goto err_out_put_module;
@@ -352,11 +356,12 @@
 	if (!try_module_get(cpufreq_driver->owner))
 		return -EINVAL;
 
+	policy = &cpufreq_driver->policy[cpu];
+	policy->cpu = cpu;
+
 	/* call driver. From then on the cpufreq must be able
 	 * to accept all calls to ->verify and ->setpolicy for this CPU
 	 */
-	policy = &cpufreq_driver->policy[cpu];
-	policy->cpu = cpu;
 	ret = cpufreq_driver->init(policy);
 	if (ret)
 		goto out;
@@ -386,10 +391,17 @@
 		sysfs_create_file(&policy->kobj, &((*drv_attr)->attr));
 		drv_attr++;
 	}
+
+	spin_lock(&cpufreq_driver_lock);
+	cpufreq_cpu_data[cpu] = policy;
+	spin_unlock(&cpufreq_driver_lock);
 	
 	/* set default policy */
 	ret = cpufreq_set_policy(&new_policy);
 	if (ret) {
+		spin_lock(&cpufreq_driver_lock);
+		cpufreq_cpu_data[cpu] = NULL;
+		spin_unlock(&cpufreq_driver_lock);
 		kobject_unregister(&policy->kobj);
 		wait_for_completion(&policy->kobj_unregister);
 	}
@@ -409,6 +421,14 @@
 {
 	unsigned int cpu = sys_dev->id;
 
+	spin_lock(&cpufreq_driver_lock);
+	if (!cpufreq_cpu_data[cpu]) {
+		spin_unlock(&cpufreq_driver_lock);
+		return -EINVAL;
+	}
+	cpufreq_cpu_data[cpu] = NULL;
+	spin_unlock(&cpufreq_driver_lock);
+
 	if (!kobject_get(&cpufreq_driver->policy[cpu].kobj))
 		return -EFAULT;
 

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking3"

Change the return value of cpufreq_cpu_get from a nondescriptent int
to struct cpufreq_policy*. This will allow for cleaner code - and
later it will be expected that anyone who grabs a reference by calling
cpufreq_cpu_get must return this struct cpufreq_policy* to
cpufreq_cpu_put.

 kernel/cpufreq.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 22:13:22.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 22:18:05.000000000 +0200
@@ -54,7 +54,7 @@
 static LIST_HEAD(cpufreq_governor_list);
 static DECLARE_MUTEX		(cpufreq_governor_sem);
 
-static int cpufreq_cpu_get(unsigned int cpu)
+static struct cpufreq_policy * cpufreq_cpu_get(unsigned int cpu)
 {
 	struct cpufreq_policy *data;
 
@@ -83,14 +83,14 @@
 
 	spin_unlock(&cpufreq_driver_lock);
 
-	return 1;
+	return data;
 
  err_out_put_module:
 	module_put(cpufreq_driver->owner);
  err_out_unlock:
 	spin_unlock(&cpufreq_driver_lock);
  err_out:
-	return 0;
+	return NULL;
 }
 
 static void cpufreq_cpu_put(unsigned int cpu)
@@ -571,18 +571,18 @@
 				 unsigned int relation)
 {
 	unsigned int ret;
-	unsigned int cpu = policy->cpu;
 
-	if (!cpufreq_cpu_get(cpu))
+	policy = cpufreq_cpu_get(policy->cpu);
+	if (!policy)
 		return -EINVAL;
 
-	down(&cpufreq_driver->policy[cpu].lock);
+	down(&policy->lock);
 
 	ret = cpufreq_driver->target(policy, target_freq, relation);
 
-	up(&cpufreq_driver->policy[cpu].lock);
+	up(&policy->lock);
 
-	cpufreq_cpu_put(cpu);
+	cpufreq_cpu_put(policy->cpu);
 
 	return ret;
 }
@@ -592,9 +592,9 @@
 int cpufreq_governor(unsigned int cpu, unsigned int event)
 {
 	int ret = 0;
-	struct cpufreq_policy *policy = &cpufreq_driver->policy[cpu];
+	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
 
-	if (!cpufreq_cpu_get(cpu))
+	if (!policy)
 		return -EINVAL;
 
 	switch (policy->policy) {

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking4"

Make cpufreq_remove_dev a bit more readable. [Almost] no code change.

 kernel/cpufreq.c |   21 ++++++++++++---------
 1 files changed, 12 insertions(+), 9 deletions(-)

diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 22:20:35.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 22:26:21.000000000 +0200
@@ -420,23 +420,26 @@
 static int cpufreq_remove_dev (struct sys_device * sys_dev)
 {
 	unsigned int cpu = sys_dev->id;
+	struct cpufreq_policy *data;
 
 	spin_lock(&cpufreq_driver_lock);
-	if (!cpufreq_cpu_data[cpu]) {
+	data = cpufreq_cpu_data[cpu];
+
+	if (!data) {
 		spin_unlock(&cpufreq_driver_lock);
 		return -EINVAL;
 	}
 	cpufreq_cpu_data[cpu] = NULL;
 	spin_unlock(&cpufreq_driver_lock);
 
-	if (!kobject_get(&cpufreq_driver->policy[cpu].kobj))
+	if (!kobject_get(&data->kobj))
 		return -EFAULT;
 
 	down(&cpufreq_driver_sem);
 	if ((cpufreq_driver->target) && 
-	    (cpufreq_driver->policy[cpu].policy == CPUFREQ_POLICY_GOVERNOR)) {
-		cpufreq_driver->policy[cpu].governor->governor(&cpufreq_driver->policy[cpu], CPUFREQ_GOV_STOP);
-		module_put(cpufreq_driver->policy[cpu].governor->owner);
+	    (data->policy == CPUFREQ_POLICY_GOVERNOR)) {
+		data->governor->governor(data, CPUFREQ_GOV_STOP);
+		module_put(data->governor->owner);
 	}
 
 	/* we may call driver->exit here without checking for try_module_exit
@@ -444,18 +447,18 @@
 	 * removal AND driver removal at the same time...
 	 */
 	if (cpufreq_driver->exit)
-		cpufreq_driver->exit(&cpufreq_driver->policy[cpu]);
+		cpufreq_driver->exit(data);
 
-	kobject_unregister(&cpufreq_driver->policy[cpu].kobj);
+	kobject_unregister(&data->kobj);
 
 	up(&cpufreq_driver_sem);
-	kobject_put(&cpufreq_driver->policy[cpu].kobj);
+	kobject_put(&data->kobj);
 
 	/* we need to make sure that the underlying kobj is actually
 	 * destroyed before we proceed e.g. with cpufreq driver module
 	 * unloading
 	 */
-	wait_for_completion(&cpufreq_driver->policy[cpu].kobj_unregister);
+	wait_for_completion(&data->kobj_unregister);
 
 	return 0;
 }

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking5"

Make cpufreq_set_policy a bit more readable by storing the CPU's
cpufreq_policy into a pointer.

 kernel/cpufreq.c |   47 ++++++++++++++++++++++++++++-------------------
 1 files changed, 28 insertions(+), 19 deletions(-)

diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 22:27:10.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 22:30:57.000000000 +0200
@@ -717,13 +717,18 @@
 int cpufreq_set_policy(struct cpufreq_policy *policy)
 {
 	int ret = 0;
+	struct cpufreq_policy *data;
 
-	if (!policy || !cpufreq_cpu_get(policy->cpu))
+	if (!policy)
+		return -EINVAL;
+
+	data = cpufreq_cpu_get(policy->cpu);
+	if (!data)
 		return -EINVAL;
 
 	down(&cpufreq_driver_sem);
 	memcpy(&policy->cpuinfo, 
-	       &cpufreq_driver->policy[policy->cpu].cpuinfo, 
+	       &data->cpuinfo, 
 	       sizeof(struct cpufreq_cpuinfo));
 	up(&cpufreq_driver_sem);
 
@@ -758,37 +763,41 @@
 
 	/* from here on we limit it to one limit and/or governor change running at the moment */
 	down(&cpufreq_driver_sem);
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
+			cpufreq_governor(data->cpu, CPUFREQ_GOV_STOP);
+
 			/* start new governor */
-			if (cpufreq_governor(policy->cpu, CPUFREQ_GOV_START)) {
-				cpufreq_driver->policy[policy->cpu].policy = old_pol;
-				cpufreq_driver->policy[policy->cpu].governor = old_gov;
-				cpufreq_governor(policy->cpu, CPUFREQ_GOV_START);
+			data->policy = policy->policy;
+			data->governor = policy->governor;
+			if (cpufreq_governor(data->cpu, CPUFREQ_GOV_START)) {
+				/* new governor failed, so re-start old one */
+				data->policy = old_pol;
+				data->governor = old_gov;
+				cpufreq_governor(data->cpu, CPUFREQ_GOV_START);
 			}
 			/* might be a policy change, too */
-			cpufreq_governor(policy->cpu, CPUFREQ_GOV_LIMITS);
+			cpufreq_governor(data->cpu, CPUFREQ_GOV_LIMITS);
 		} else {
-			cpufreq_governor(policy->cpu, CPUFREQ_GOV_LIMITS);
+			cpufreq_governor(data->cpu, CPUFREQ_GOV_LIMITS);
 		}
 	}
 	up(&cpufreq_driver_sem);
 
  error_out:	
-	cpufreq_cpu_put(policy->cpu);
+	cpufreq_cpu_put(data->cpu);
 
 	return ret;
 }

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking6"

Change the function parameter of cpufreq_cpu_put to struct
cpufreq_policy *.

 kernel/cpufreq.c |   54 ++++++++++++++++++++++++++++++++----------------------
 1 files changed, 32 insertions(+), 22 deletions(-)

diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 22:31:42.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 22:36:58.000000000 +0200
@@ -93,9 +93,9 @@
 	return NULL;
 }
 
-static void cpufreq_cpu_put(unsigned int cpu)
+static void cpufreq_cpu_put(struct cpufreq_policy *data)
 {
-	kobject_put(&cpufreq_driver->policy[cpu].kobj);
+	kobject_put(&data->kobj);
 	module_put(cpufreq_driver->owner);
 }
 
@@ -302,10 +302,11 @@
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
 
@@ -315,10 +316,11 @@
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
 
@@ -474,15 +476,20 @@
 	int cpu = sysdev->id;
 	unsigned int ret = 0;
 	struct cpufreq_policy policy;
+	struct cpufreq_policy *cpu_policy;
 
-	if (cpu_online(cpu) && cpufreq_cpu_get(cpu)) {
-		down(&cpufreq_driver_sem);
-		memcpy(&policy, &cpufreq_driver->policy[cpu], 
-		       sizeof(struct cpufreq_policy));
-		up(&cpufreq_driver_sem);
-		ret = cpufreq_set_policy(&policy);
-		cpufreq_cpu_put(cpu);
-	}
+	if (!cpu_online(cpu))
+		return 0;
+
+	cpu_policy = cpufreq_cpu_get(cpu);
+
+	down(&cpufreq_driver_sem);
+	memcpy(&policy, cpu_policy, sizeof(struct cpufreq_policy));
+	up(&cpufreq_driver_sem);
+
+	ret = cpufreq_set_policy(&policy);
+
+	cpufreq_cpu_put(cpu_policy);
 
 	return ret;
 }
@@ -585,7 +592,7 @@
 
 	up(&policy->lock);
 
-	cpufreq_cpu_put(policy->cpu);
+	cpufreq_cpu_put(policy);
 
 	return ret;
 }
@@ -630,7 +637,7 @@
 		ret = -EINVAL;
 	}
 
-	cpufreq_cpu_put(cpu);
+	cpufreq_cpu_put(policy);
 
 	return ret;
 }
@@ -692,16 +699,19 @@
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
 
 	down(&cpufreq_driver_sem);
-	memcpy(policy, 
-	       &cpufreq_driver->policy[cpu], 
-	       sizeof(struct cpufreq_policy));
+	memcpy(policy, cpu_policy, sizeof(struct cpufreq_policy));
 	up(&cpufreq_driver_sem);
 
-	cpufreq_cpu_put(cpu);
+	cpufreq_cpu_put(cpu_policy);
 
 	return 0;
 }
@@ -797,7 +807,7 @@
 	up(&cpufreq_driver_sem);
 
  error_out:	
-	cpufreq_cpu_put(data->cpu);
+	cpufreq_cpu_put(data);
 
 	return ret;
 }

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking7"

Finally implement the two different cpufreq_driver_target callbacks --
the one called while the per-CPU lock is held, the other while
not. While we're at it, clean up cpufreq_governor.

 Documentation/cpu-freq/governors.txt |   14 ++++++------
 drivers/cpufreq/userspace.c          |    4 +--
 include/linux/cpufreq.h              |    6 ++++-
 kernel/cpufreq.c                     |   38 ++++++++++++++++++++++-------------
 4 files changed, 38 insertions(+), 24 deletions(-)

diff -ruN linux-original/Documentation/cpu-freq/governors.txt linux/Documentation/cpu-freq/governors.txt
--- linux-original/Documentation/cpu-freq/governors.txt	2003-03-25 18:23:09.000000000 +0100
+++ linux/Documentation/cpu-freq/governors.txt	2003-07-12 23:07:37.000000000 +0200
@@ -135,21 +135,21 @@
 The CPUfreq governor may call the CPU processor driver using one of
 these two functions:
 
-inline int cpufreq_driver_target(struct cpufreq_policy *policy,
+static int cpufreq_driver_target(struct cpufreq_policy *policy,
                                  unsigned int target_freq,
                                  unsigned int relation);
 
-inline int cpufreq_driver_target_l(struct cpufreq_policy *policy,
+static int __cpufreq_driver_target(struct cpufreq_policy *policy,
                                    unsigned int target_freq,
                                    unsigned int relation);
 
 target_freq must be within policy->min and policy->max, of course.
 What's the difference between these two functions? When your governor
 still is in a direct code path of a call to governor->governor, the
-cpufreq_driver_sem lock is still held in the cpufreq core, and there's
+per-CPU cpufreq lock is still held in the cpufreq core, and there's
 no need to lock it again (in fact, this would cause a deadlock). So
-use cpufreq_driver_target only in these cases. In all other cases (for
-example, when there's a "daemonized" function that wakes up every
-second), use cpufreq_driver_target_l to lock the cpufreq_driver_sem
-before the command is passed to the cpufreq processor driver.
+use __cpufreq_driver_target only in these cases. In all other cases 
+(for example, when there's a "daemonized" function that wakes up 
+every second), use cpufreq_driver_target to lock the cpufreq per-CPU
+lock before the command is passed to the cpufreq processor driver.
 
diff -ruN linux-original/drivers/cpufreq/userspace.c linux/drivers/cpufreq/userspace.c
--- linux-original/drivers/cpufreq/userspace.c	2003-03-25 18:23:09.000000000 +0100
+++ linux/drivers/cpufreq/userspace.c	2003-07-12 22:57:16.000000000 +0200
@@ -524,10 +524,10 @@
 		cpu_min_freq[cpu] = policy->min;
 		cpu_max_freq[cpu] = policy->max;
 		if (policy->max < cpu_cur_freq[cpu])
-			cpufreq_driver_target(&current_policy[cpu], policy->max, 
+			__cpufreq_driver_target(&current_policy[cpu], policy->max, 
 			      CPUFREQ_RELATION_H);
 		else if (policy->min > cpu_cur_freq[cpu])
-			cpufreq_driver_target(&current_policy[cpu], policy->min, 
+			__cpufreq_driver_target(&current_policy[cpu], policy->min, 
 			      CPUFREQ_RELATION_L);
 		memcpy (&current_policy[cpu], policy, sizeof(struct cpufreq_policy));
 		up(&userspace_sem);
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2003-07-11 14:12:36.000000000 +0200
+++ linux/include/linux/cpufreq.h	2003-07-12 23:03:33.000000000 +0200
@@ -137,9 +137,13 @@
 
 /* pass a target to the cpufreq driver 
  */
-inline int cpufreq_driver_target(struct cpufreq_policy *policy,
+extern int cpufreq_driver_target(struct cpufreq_policy *policy,
 				 unsigned int target_freq,
 				 unsigned int relation);
+extern int __cpufreq_driver_target(struct cpufreq_policy *policy,
+				   unsigned int target_freq,
+				   unsigned int relation);
+
 
 /* pass an event to the cpufreq governor */
 int cpufreq_governor(unsigned int cpu, unsigned int event);
diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 23:06:46.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 23:04:05.000000000 +0200
@@ -576,9 +576,19 @@
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
 
@@ -588,7 +598,7 @@
 
 	down(&policy->lock);
 
-	ret = cpufreq_driver->target(policy, target_freq, relation);
+	ret = __cpufreq_driver_target(policy, target_freq, relation);
 
 	up(&policy->lock);
 
@@ -607,36 +617,36 @@
 	if (!policy)
 		return -EINVAL;
 
+	down(&policy->lock);
+
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
 
+	up(&policy->lock);
+
 	cpufreq_cpu_put(policy);
 
 	return ret;

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking8"

Split up cpufreq_governor into a locking and non-locking variant.

 kernel/cpufreq.c |   22 +++++++++++++++-------
 1 files changed, 15 insertions(+), 7 deletions(-)

diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 23:16:23.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 23:17:00.000000000 +0200
@@ -609,15 +609,9 @@
 EXPORT_SYMBOL_GPL(cpufreq_driver_target);
 
 
-int cpufreq_governor(unsigned int cpu, unsigned int event)
+static int __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event)
 {
 	int ret = 0;
-	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
-
-	if (!policy)
-		return -EINVAL;
-
-	down(&policy->lock);
 
 	switch (policy->policy) {
 	case CPUFREQ_POLICY_POWERSAVE: 
@@ -645,6 +639,20 @@
 		ret = -EINVAL;
 	}
 
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
 	up(&policy->lock);
 
 	cpufreq_cpu_put(policy);

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.5.75-bk1-locking9"

Use the per-CPU policy->lock to lock the per-CPU "policy" data. Also,
use it to serialize the setting of new frequency policies on each CPU.

 kernel/cpufreq.c |   52 +++++++++++++++++++++++-----------------------------
 1 files changed, 23 insertions(+), 29 deletions(-)

diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-12 23:22:08.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-12 23:21:29.000000000 +0200
@@ -360,6 +360,8 @@
 
 	policy = &cpufreq_driver->policy[cpu];
 	policy->cpu = cpu;
+	init_MUTEX_LOCKED(&policy->lock);
+	init_completion(&policy->kobj_unregister);
 
 	/* call driver. From then on the cpufreq must be able
 	 * to accept all calls to ->verify and ->setpolicy for this CPU
@@ -368,15 +370,7 @@
 	if (ret)
 		goto out;
 
-	/* set default policy on this CPU */
-	down(&cpufreq_driver_sem);
-	memcpy(&new_policy, 
-	       policy, 
-	       sizeof(struct cpufreq_policy));
-	up(&cpufreq_driver_sem);
-
-	init_MUTEX(&policy->lock);
-	init_completion(&policy->kobj_unregister);
+	memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
 
 	/* prepare interface data */
 	policy->kobj.parent = &sys_dev->kobj;
@@ -397,6 +391,8 @@
 	spin_lock(&cpufreq_driver_lock);
 	cpufreq_cpu_data[cpu] = policy;
 	spin_unlock(&cpufreq_driver_lock);
+
+	up(&policy->lock);
 	
 	/* set default policy */
 	ret = cpufreq_set_policy(&new_policy);
@@ -404,6 +400,7 @@
 		spin_lock(&cpufreq_driver_lock);
 		cpufreq_cpu_data[cpu] = NULL;
 		spin_unlock(&cpufreq_driver_lock);
+
 		kobject_unregister(&policy->kobj);
 		wait_for_completion(&policy->kobj_unregister);
 	}
@@ -437,23 +434,20 @@
 	if (!kobject_get(&data->kobj))
 		return -EFAULT;
 
-	down(&cpufreq_driver_sem);
+	/* lock it forever */
+	down(&data->lock);
+
 	if ((cpufreq_driver->target) && 
 	    (data->policy == CPUFREQ_POLICY_GOVERNOR)) {
 		data->governor->governor(data, CPUFREQ_GOV_STOP);
 		module_put(data->governor->owner);
 	}
 
-	/* we may call driver->exit here without checking for try_module_exit
-	 * as it's either the driver which wants to unload or we have a CPU
-	 * removal AND driver removal at the same time...
-	 */
 	if (cpufreq_driver->exit)
 		cpufreq_driver->exit(data);
 
 	kobject_unregister(&data->kobj);
 
-	up(&cpufreq_driver_sem);
 	kobject_put(&data->kobj);
 
 	/* we need to make sure that the underlying kobj is actually
@@ -483,9 +477,9 @@
 
 	cpu_policy = cpufreq_cpu_get(cpu);
 
-	down(&cpufreq_driver_sem);
+	down(&cpu_policy->lock);
 	memcpy(&policy, cpu_policy, sizeof(struct cpufreq_policy));
-	up(&cpufreq_driver_sem);
+	up(&cpu_policy->lock);
 
 	ret = cpufreq_set_policy(&policy);
 
@@ -725,9 +719,9 @@
 	if (!cpu_policy)
 		return -EINVAL;
 
-	down(&cpufreq_driver_sem);
+	down(&cpu_policy->lock);
 	memcpy(policy, cpu_policy, sizeof(struct cpufreq_policy));
-	up(&cpufreq_driver_sem);
+	up(&cpu_policy->lock);
 
 	cpufreq_cpu_put(cpu_policy);
 
@@ -754,11 +748,12 @@
 	if (!data)
 		return -EINVAL;
 
-	down(&cpufreq_driver_sem);
+	/* lock this CPU */
+	down(&data->lock);
+
 	memcpy(&policy->cpuinfo, 
 	       &data->cpuinfo, 
 	       sizeof(struct cpufreq_cpuinfo));
-	up(&cpufreq_driver_sem);
 
 	/* verify the cpu speed can be set within this limit */
 	ret = cpufreq_driver->verify(policy);
@@ -805,26 +800,25 @@
 			struct cpufreq_governor *old_gov = data->governor;
 
 			/* end old governor */
-			cpufreq_governor(data->cpu, CPUFREQ_GOV_STOP);
+			__cpufreq_governor(data, CPUFREQ_GOV_STOP);
 
 			/* start new governor */
 			data->policy = policy->policy;
 			data->governor = policy->governor;
-			if (cpufreq_governor(data->cpu, CPUFREQ_GOV_START)) {
+			if (__cpufreq_governor(data, CPUFREQ_GOV_START)) {
 				/* new governor failed, so re-start old one */
 				data->policy = old_pol;
 				data->governor = old_gov;
-				cpufreq_governor(data->cpu, CPUFREQ_GOV_START);
+				__cpufreq_governor(data, CPUFREQ_GOV_START);
 			}
-			/* might be a policy change, too */
-			cpufreq_governor(data->cpu, CPUFREQ_GOV_LIMITS);
-		} else {
-			cpufreq_governor(data->cpu, CPUFREQ_GOV_LIMITS);
+			/* might be a policy change, too, so fall through */
 		}
+		__cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
 	}
 	up(&cpufreq_driver_sem);
 
- error_out:	
+ error_out:
+	up(&data->lock);
 	cpufreq_cpu_put(data);
 
 	return ret;

--AhhlLboLdkugWU4S--
