From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 4/4] minor optimizations to ondemand governor
Date: Wed, 28 Jun 2006 13:52:18 -0700
Message-ID: <20060628135217.E12989@unix-os.sc.intel.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq <cpufreq@www.linux.org.uk>
Cc: alexey.y.starikovskiy@intel.com, Dave Jones <davej@redhat.com>, Len Brown <lenb@unix-os.sc.intel.com>


ondemand_misc_cleanups_06.patch

Misc cleanups in ondemand. Should have zero functional impact.
Also adding Alexey as author.

Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.17.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c
@@ -17,23 +17,11 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/smp.h>
 #include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/ctype.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
-#include <linux/sysctl.h>
-#include <linux/types.h>
-#include <linux/fs.h>
-#include <linux/sysfs.h>
-#include <linux/sched.h>
-#include <linux/kmod.h>
-#include <linux/workqueue.h>
 #include <linux/jiffies.h>
 #include <linux/kernel_stat.h>
-#include <linux/percpu.h>
-#include <linux/mutex.h>
 
 /*
  * dbs is used in this file as a shortform for demandbased switching
@@ -84,8 +72,7 @@ static unsigned int dbs_enable;	/* numbe
  * cpu_hotplug lock should be taken before that. Note that cpu_hotplug lock
  * is recursive for the same process. -Venki
  */
-static DEFINE_MUTEX (dbs_mutex);
-static DECLARE_WORK	(dbs_work, do_dbs_timer, NULL);
+static DEFINE_MUTEX(dbs_mutex);
 
 static struct workqueue_struct	*kondemand_wq;
 
@@ -147,7 +134,7 @@ static ssize_t store_sampling_rate(struc
 {
 	unsigned int input;
 	int ret;
-	ret = sscanf (buf, "%u", &input);
+	ret = sscanf(buf, "%u", &input);
 
 	mutex_lock(&dbs_mutex);
 	if (ret != 1 || input > MAX_SAMPLING_RATE || input < MIN_SAMPLING_RATE) {
@@ -166,7 +153,7 @@ static ssize_t store_up_threshold(struct
 {
 	unsigned int input;
 	int ret;
-	ret = sscanf (buf, "%u", &input);
+	ret = sscanf(buf, "%u", &input);
 
 	mutex_lock(&dbs_mutex);
 	if (ret != 1 || input > MAX_FREQUENCY_UP_THRESHOLD ||
@@ -189,7 +176,7 @@ static ssize_t store_ignore_nice_load(st
 
 	unsigned int j;
 
-	ret = sscanf (buf, "%u", &input);
+	ret = sscanf(buf, "%u", &input);
 	if ( ret != 1 )
 		return -EINVAL;
 
@@ -354,8 +341,7 @@ static int cpufreq_governor_dbs(struct c
 
 	switch (event) {
 	case CPUFREQ_GOV_START:
-		if ((!cpu_online(cpu)) ||
-		    (!policy->cur))
+		if ((!cpu_online(cpu)) || (!policy->cur))
 			return -EINVAL;
 
 		if (policy->cpuinfo.transition_latency >
@@ -429,13 +415,13 @@ static int cpufreq_governor_dbs(struct c
 		lock_cpu_hotplug();
 		mutex_lock(&dbs_mutex);
 		if (policy->max < this_dbs_info->cur_policy->cur)
-			__cpufreq_driver_target(
-					this_dbs_info->cur_policy,
-					policy->max, CPUFREQ_RELATION_H);
+			__cpufreq_driver_target(this_dbs_info->cur_policy,
+			                        policy->max,
+			                        CPUFREQ_RELATION_H);
 		else if (policy->min > this_dbs_info->cur_policy->cur)
-			__cpufreq_driver_target(
-					this_dbs_info->cur_policy,
-					policy->min, CPUFREQ_RELATION_L);
+			__cpufreq_driver_target(this_dbs_info->cur_policy,
+			                        policy->min,
+			                        CPUFREQ_RELATION_L);
 		mutex_unlock(&dbs_mutex);
 		unlock_cpu_hotplug();
 		break;
@@ -444,9 +430,9 @@ static int cpufreq_governor_dbs(struct c
 }
 
 static struct cpufreq_governor cpufreq_gov_dbs = {
-	.name		= "ondemand",
-	.governor	= cpufreq_governor_dbs,
-	.owner		= THIS_MODULE,
+	.name = "ondemand",
+	.governor = cpufreq_governor_dbs,
+	.owner = THIS_MODULE,
 };
 
 static int __init cpufreq_gov_dbs_init(void)
@@ -460,10 +446,11 @@ static void __exit cpufreq_gov_dbs_exit(
 }
 
 
-MODULE_AUTHOR ("Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>");
-MODULE_DESCRIPTION ("'cpufreq_ondemand' - A dynamic cpufreq governor for "
-		"Low Latency Frequency Transition capable processors");
-MODULE_LICENSE ("GPL");
+MODULE_AUTHOR("Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>");
+MODULE_AUTHOR("Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>");
+MODULE_DESCRIPTION("'cpufreq_ondemand' - A dynamic cpufreq governor for "
+                   "Low Latency Frequency Transition capable processors");
+MODULE_LICENSE("GPL");
 
 module_init(cpufreq_gov_dbs_init);
 module_exit(cpufreq_gov_dbs_exit);
