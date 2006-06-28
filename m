From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 3/4] minor optimizations to ondemand governor
Date: Wed, 28 Jun 2006 13:51:19 -0700
Message-ID: <20060628135119.D12989@unix-os.sc.intel.com>
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


ondemand_percpu_06.patch
Make ondemand sampling per CPU and remove the mutex usage in sampling path.

Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.17.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c
@@ -8,6 +8,7 @@
  *  Jun 2006 - Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
  *             Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
  *      - Remove slow down option and reduce the path length dbs_check_cpu
+ *	- Make dbs_check_cpu percpu and use ondemand workqueue
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -68,6 +69,7 @@ struct cpu_dbs_info_s {
 	cputime64_t prev_cpu_idle;
 	cputime64_t prev_cpu_wall;
 	struct cpufreq_policy *cur_policy;
+ 	struct work_struct work;
 	unsigned int enable;
 };
 static DEFINE_PER_CPU(struct cpu_dbs_info_s, cpu_dbs_info);
@@ -85,7 +87,7 @@ static unsigned int dbs_enable;	/* numbe
 static DEFINE_MUTEX (dbs_mutex);
 static DECLARE_WORK	(dbs_work, do_dbs_timer, NULL);
 
-static struct workqueue_struct *dbs_workq;
+static struct workqueue_struct	*kondemand_wq;
 
 struct dbs_tuners {
 	unsigned int sampling_rate;
@@ -237,17 +239,15 @@ static struct attribute_group dbs_attr_g
 
 /************************** sysfs end ************************/
 
-static void dbs_check_cpu(int cpu)
+static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
 {
 	unsigned int idle_ticks, total_ticks;
 	unsigned int load;
-	struct cpu_dbs_info_s *this_dbs_info;
 	cputime64_t cur_jiffies;
 
 	struct cpufreq_policy *policy;
 	unsigned int j;
 
-	this_dbs_info = &per_cpu(cpu_dbs_info, cpu);
 	if (!this_dbs_info->enable)
 		return;
 
@@ -318,35 +318,29 @@ static void dbs_check_cpu(int cpu)
 
 static void do_dbs_timer(void *data)
 {
-	int i;
-	lock_cpu_hotplug();
-	mutex_lock(&dbs_mutex);
-	for_each_online_cpu(i)
-		dbs_check_cpu(i);
-	queue_delayed_work(dbs_workq, &dbs_work,
-			   usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
-	mutex_unlock(&dbs_mutex);
-	unlock_cpu_hotplug();
+	unsigned int cpu = smp_processor_id();
+	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, cpu);
+
+	dbs_check_cpu(dbs_info);
+	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work,
+			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
 }
 
-static inline void dbs_timer_init(void)
+static inline void dbs_timer_init(unsigned int cpu)
 {
-	INIT_WORK(&dbs_work, do_dbs_timer, NULL);
-	if (!dbs_workq)
-		dbs_workq = create_singlethread_workqueue("ondemand");
-	if (!dbs_workq) {
-		printk(KERN_ERR "ondemand: Cannot initialize kernel thread\n");
-		return;
-	}
-	queue_delayed_work(dbs_workq, &dbs_work,
-			   usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
+	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, cpu);
+
+	INIT_WORK(&dbs_info->work, do_dbs_timer, 0);
+	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work,
+			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
 	return;
 }
 
-static inline void dbs_timer_exit(void)
+static inline void dbs_timer_exit(unsigned int cpu)
 {
-	if (dbs_workq)
-		cancel_rearming_delayed_workqueue(dbs_workq, &dbs_work);
+	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, cpu);
+
+	cancel_rearming_delayed_workqueue(kondemand_wq, &dbs_info->work);
 }
 
 static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
@@ -374,6 +368,16 @@ static int cpufreq_governor_dbs(struct c
 			break;
 
 		mutex_lock(&dbs_mutex);
+		dbs_enable++;
+		if (dbs_enable == 1) {
+			kondemand_wq = create_workqueue("kondemand");
+			if (!kondemand_wq) {
+				printk("Creation of kondemand failed\n");
+				dbs_enable--;
+				mutex_unlock(&dbs_mutex);
+				return -ENOSPC;
+			}
+		}
 		for_each_cpu_mask(j, policy->cpus) {
 			struct cpu_dbs_info_s *j_dbs_info;
 			j_dbs_info = &per_cpu(cpu_dbs_info, j);
@@ -384,7 +388,6 @@ static int cpufreq_governor_dbs(struct c
 		}
 		this_dbs_info->enable = 1;
 		sysfs_create_group(&policy->kobj, &dbs_attr_group);
-		dbs_enable++;
 		/*
 		 * Start the timerschedule work, when this governor
 		 * is used for first time
@@ -403,23 +406,20 @@ static int cpufreq_governor_dbs(struct c
 				def_sampling_rate = MIN_STAT_SAMPLING_RATE;
 
 			dbs_tuners_ins.sampling_rate = def_sampling_rate;
-			dbs_timer_init();
 		}
+		dbs_timer_init(policy->cpu);
 
 		mutex_unlock(&dbs_mutex);
 		break;
 
 	case CPUFREQ_GOV_STOP:
 		mutex_lock(&dbs_mutex);
+		dbs_timer_exit(policy->cpu);
 		this_dbs_info->enable = 0;
 		sysfs_remove_group(&policy->kobj, &dbs_attr_group);
 		dbs_enable--;
-		/*
-		 * Stop the timerschedule work, when this governor
-		 * is used for first time
-		 */
 		if (dbs_enable == 0)
-			dbs_timer_exit();
+			destroy_workqueue(kondemand_wq);
 
 		mutex_unlock(&dbs_mutex);
 
@@ -456,13 +456,6 @@ static int __init cpufreq_gov_dbs_init(v
 
 static void __exit cpufreq_gov_dbs_exit(void)
 {
-	/* Make sure that the scheduled work is indeed not running.
-	   Assumes the timer has been cancelled first. */
-	if (dbs_workq) {
-		flush_workqueue(dbs_workq);
-		destroy_workqueue(dbs_workq);
-	}
-
 	cpufreq_unregister_governor(&cpufreq_gov_dbs);
 }
