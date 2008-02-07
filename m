From: Dave Jones <davej@redhat.com>
Subject: cpufreq_add_dev locking cleanup
Date: Thu, 7 Feb 2008 17:42:31 -0500
Message-ID: <20080207224231.GA10260@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Venki Pallipadi <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

Cleaning up the failure paths lets us remove a bit of code by
moving the unlock statements into the exit part of the code
rather than in each failure case.

Eyeballs welcomed for sanity checks before I commit.

With this change, err_out_unregister and err_out_driver_exit now
run with the policy rwsem held.
Given that err_out_unregister is touching policy-> (both read and write)
it probably should always have done so anyway.

I'm still trying to untangle some of the rats nest in this file.
Pretty sure that there's more work to be done cleaning this up.

	Dave


diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 74a4244..7d01ff9 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -799,7 +799,6 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 	ret = cpufreq_driver->init(policy);
 	if (ret) {
 		dprintk("initialization failed\n");
-		unlock_policy_rwsem_write(cpu);
 		goto err_out;
 	}
 	policy->user_policy.min = policy->cpuinfo.min_freq;
@@ -822,7 +821,7 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 		/* check for existing affected CPUs.  They may not be aware
 		 * of it due to CPU Hotplug.
 		 */
-		managed_policy = cpufreq_cpu_get(j);
+		managed_policy = cpufreq_cpu_get(j);		// FIXME: Where is this released?  What about error paths?
 		if (unlikely(managed_policy)) {
 
 			/* Set proper policy_cpu */
@@ -841,14 +840,11 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 			ret = sysfs_create_link(&sys_dev->kobj,
 						&managed_policy->kobj,
 						"cpufreq");
-			if (ret) {
-				unlock_policy_rwsem_write(cpu);
+			if (ret)
 				goto err_out_driver_exit;
-			}
 
 			cpufreq_debug_enable_ratelimit();
 			ret = 0;
-			unlock_policy_rwsem_write(cpu);
 			goto err_out_driver_exit; /* call driver->exit() */
 		}
 	}
@@ -858,33 +854,26 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 	/* prepare interface data */
 	ret = kobject_init_and_add(&policy->kobj, &ktype_cpufreq, &sys_dev->kobj,
 				   "cpufreq");
-	if (ret) {
-		unlock_policy_rwsem_write(cpu);
+	if (ret)
 		goto err_out_driver_exit;
-	}
+
 	/* set up files for this cpu device */
 	drv_attr = cpufreq_driver->attr;
 	while ((drv_attr) && (*drv_attr)) {
 		ret = sysfs_create_file(&policy->kobj, &((*drv_attr)->attr));
-		if (ret) {
-			unlock_policy_rwsem_write(cpu);
+		if (ret)
 			goto err_out_driver_exit;
-		}
 		drv_attr++;
 	}
-	if (cpufreq_driver->get){
+	if (cpufreq_driver->get) {
 		ret = sysfs_create_file(&policy->kobj, &cpuinfo_cur_freq.attr);
-		if (ret) {
-			unlock_policy_rwsem_write(cpu);
+		if (ret)
 			goto err_out_driver_exit;
-		}
 	}
-	if (cpufreq_driver->target){
+	if (cpufreq_driver->target) {
 		ret = sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
-		if (ret) {
-			unlock_policy_rwsem_write(cpu);
+		if (ret)
 			goto err_out_driver_exit;
-		}
 	}
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
@@ -906,10 +895,8 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 		cpu_sys_dev = get_cpu_sysdev(j);
 		ret = sysfs_create_link(&cpu_sys_dev->kobj, &policy->kobj,
 					"cpufreq");
-		if (ret) {
-			unlock_policy_rwsem_write(cpu);
+		if (ret)
 			goto err_out_unregister;
-		}
 	}
 
 	policy->governor = NULL; /* to assure that the starting sequence is
@@ -949,6 +936,7 @@ err_out_driver_exit:
 		cpufreq_driver->exit(policy);
 
 err_out:
+	unlock_policy_rwsem_write(cpu);
 	kfree(policy);
 
 nomem_out:

-- 
http://www.codemonkey.org.uk
