From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: Re: ondemand vs suspend.
Date: Wed, 21 Jun 2006 11:35:25 -0700
Message-ID: <20060621113524.A16111@unix-os.sc.intel.com>
References: <EB12A50964762B4D8111D55B764A8454110B16@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454110B16@scsmsx413.amr.corp.intel.com>;
	from venkatesh.pallipadi@intel.com on Tue, Jun 13, 2006 at 07:50:56PM
	-0700
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
To: Dave Jones <davej@redhat.com>
Cc: Andrew Morton <akpm@osdl.org>, ashok.raj@intel.com, cpufreq@lists.linux.org.uk, pjones@redhat.com, arjan@infradead.org, alex@digriz.org.uk

On Tue, Jun 13, 2006 at 07:50:56PM -0700, Pallipadi, Venkatesh wrote:
> 
> Yes. I am able to reproduce this 2.6.17-rc6 and trying to narrow it
> down.
> 

Root caused this to a deadlock in cpufreq and ondemand. The deadlock is
due to non-existant ordering between cpu_hotplug lock and dbs_mutex.
Basically a race condition between cpu_down() and do_dbs_timer().

cpu_down() flow:
1 cpu_down() for CPU 1
2 Takes the cpu_hotplug lock
3 Calls pre-down notifiers
4   notifier handler in cpufreq calls cpufreq_driver_target
5     cpufreq_driver_target calls cpu_hotplu lock/unlock
      It is OK as cpu_hotplug lock is recusive for same process
6 CPU 1 goes down
7 CPU 0 calls post down notifiers for CPU 1
8   notifier handler in cpufreq calls governor event for stop
9     this ondemand governor routine takes dbs_mutex

Basically cpu_hotplug lock being taken before dbs_mutex in this path.

There is another event that gets triggered periodically in do_dbs_timer().
This runs in the context of ondemand workqueue and it takes dbs_mutex first
and takes cpu_hotplug later, inside __cpufreq_driver_target() call. This
ordering conflicts with mutex ordering in cpu_down and causes a deadlock.

Attached patch fixes the issue for both ondemand and conservative governors.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

--- linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c	2006-06-18 00:10:55.000000000 -0700
+++ linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c.new	2006-06-18 10:41:45.000000000 -0700
@@ -71,6 +71,14 @@ static DEFINE_PER_CPU(struct cpu_dbs_inf
 
 static unsigned int dbs_enable;	/* number of CPUs using this policy */
 
+/*
+ * DEADLOCK ALERT! There is a ordering requirement between cpu_hotplug
+ * lock and dbs_mutex. cpu_hotplug lock should always be held before
+ * dbs_mutex. If any function that can potentially take cpu_hotplug lock
+ * (like __cpufreq_driver_target()) is being called with dbs_mutex taken, then
+ * cpu_hotplug lock should be taken before that. Note that cpu_hotplug lock
+ * is recursive for the same process. -Venki
+ */
 static DEFINE_MUTEX (dbs_mutex);
 static DECLARE_WORK	(dbs_work, do_dbs_timer, NULL);
 
@@ -363,6 +371,7 @@ static void dbs_check_cpu(int cpu)
 static void do_dbs_timer(void *data)
 {
 	int i;
+	lock_cpu_hotplug();
 	mutex_lock(&dbs_mutex);
 	printk("CPU %d, dbs mutex taken\n", smp_processor_id());
 	for_each_online_cpu(i)
@@ -370,6 +379,7 @@ static void do_dbs_timer(void *data)
 	queue_delayed_work(dbs_workq, &dbs_work,
 			   usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
 	mutex_unlock(&dbs_mutex);
+	unlock_cpu_hotplug();
 }
 
 static inline void dbs_timer_init(void)
@@ -470,6 +480,7 @@ static int cpufreq_governor_dbs(struct c
 		break;
 
 	case CPUFREQ_GOV_LIMITS:
+		lock_cpu_hotplug();
 		mutex_lock(&dbs_mutex);
 		if (policy->max < this_dbs_info->cur_policy->cur)
 			__cpufreq_driver_target(
@@ -480,6 +491,7 @@ static int cpufreq_governor_dbs(struct c
 					this_dbs_info->cur_policy,
 					policy->min, CPUFREQ_RELATION_L);
 		mutex_unlock(&dbs_mutex);
+		unlock_cpu_hotplug();
 		break;
 	}
 	return 0;
--- linux-2.6.17/drivers/cpufreq/cpufreq_conservative.c	2006-06-17 13:41:32.000000000 -0700
+++ linux-2.6.17/drivers/cpufreq/cpufreq_conservative.c.new	2006-06-18 10:42:30.000000000 -0700
@@ -72,6 +72,14 @@ static DEFINE_PER_CPU(struct cpu_dbs_inf
 
 static unsigned int dbs_enable;	/* number of CPUs using this policy */
 
+/*
+ * DEADLOCK ALERT! There is a ordering requirement between cpu_hotplug
+ * lock and dbs_mutex. cpu_hotplug lock should always be held before
+ * dbs_mutex. If any function that can potentially take cpu_hotplug lock
+ * (like __cpufreq_driver_target()) is being called with dbs_mutex taken, then
+ * cpu_hotplug lock should be taken before that. Note that cpu_hotplug lock
+ * is recursive for the same process. -Venki
+ */
 static DEFINE_MUTEX 	(dbs_mutex);
 static DECLARE_WORK	(dbs_work, do_dbs_timer, NULL);
 
@@ -414,12 +422,14 @@ static void dbs_check_cpu(int cpu)
 static void do_dbs_timer(void *data)
 { 
 	int i;
+	lock_cpu_hotplug();
 	mutex_lock(&dbs_mutex);
 	for_each_online_cpu(i)
 		dbs_check_cpu(i);
 	schedule_delayed_work(&dbs_work, 
 			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
 	mutex_unlock(&dbs_mutex);
+	unlock_cpu_hotplug();
 } 
 
 static inline void dbs_timer_init(void)
@@ -514,6 +524,7 @@ static int cpufreq_governor_dbs(struct c
 		break;
 
 	case CPUFREQ_GOV_LIMITS:
+		lock_cpu_hotplug();
 		mutex_lock(&dbs_mutex);
 		if (policy->max < this_dbs_info->cur_policy->cur)
 			__cpufreq_driver_target(
@@ -524,6 +535,7 @@ static int cpufreq_governor_dbs(struct c
 					this_dbs_info->cur_policy,
 				       	policy->min, CPUFREQ_RELATION_L);
 		mutex_unlock(&dbs_mutex);
+		unlock_cpu_hotplug();
 		break;
 	}
 	return 0;
