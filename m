From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/drivers/cpufreq cpufreq_ondemand.c, NONE, 1.1 Kconfig,
	1.4, 1.5 Makefile, 1.5, 1.6 cpufreq.c, 1.3,
	1.4 cpufreq_userspace.c, 1.1, 1.2 proc_intf.c, 1.3, 1.4
Date: Thu, 26 Aug 2004 14:25:26 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C0KFq-0006nU-9R@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq
In directory flint:/tmp/cvs-serv26017/linux/drivers/cpufreq

Modified Files:
	Kconfig Makefile cpufreq.c cpufreq_userspace.c proc_intf.c 
Added Files:
	cpufreq_ondemand.c 
Log Message:
merge with current cpufreq bk tree and 2.6.9-r1

--- NEW FILE cpufreq_ondemand.c ---
/*
 *  drivers/cpufreq/cpufreq_ondemand.c
 *
 *  Copyright (C)  2001 Russell King
 *            (C)  2003 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>.
 *                      Jun Nakajima <jun.nakajima@intel.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <linux/config.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/smp.h>
#include <linux/init.h>
#include <linux/interrupt.h>
#include <linux/ctype.h>
#include <linux/cpufreq.h>
#include <linux/sysctl.h>
#include <linux/types.h>
#include <linux/fs.h>
#include <linux/sysfs.h>
#include <linux/sched.h>
#include <linux/kmod.h>
#include <linux/workqueue.h>
#include <linux/jiffies.h>
#include <linux/config.h>
#include <linux/kernel_stat.h>
#include <linux/percpu.h>

/*
 * dbs is used in this file as a shortform for demandbased switching
 * It helps to keep variable names smaller, simpler
 */

#define DEF_FREQUENCY_UP_THRESHOLD		(80)
#define MIN_FREQUENCY_UP_THRESHOLD		(0)
#define MAX_FREQUENCY_UP_THRESHOLD		(100)

#define DEF_FREQUENCY_DOWN_THRESHOLD		(20)
#define MIN_FREQUENCY_DOWN_THRESHOLD		(0)
#define MAX_FREQUENCY_DOWN_THRESHOLD		(100)

/* 
 * The polling frequency of this governor depends on the capability of 
 * the processor. Default polling frequency is 1000 times the transition
 * latency of the processor. The governor will work on any processor with 
 * transition latency <= 10mS, using appropriate sampling 
 * rate.
 * For CPUs with transition latency > 10mS (mostly drivers with CPUFREQ_ETERNAL)
 * this governor will not work.
 * All times here are in uS.
 */
static unsigned int 				def_sampling_rate;
#define MIN_SAMPLING_RATE			(def_sampling_rate / 2)
#define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
#define DEF_SAMPLING_DOWN_FACTOR		(10)
#define TRANSITION_LATENCY_LIMIT		(10 * 1000)
#define sampling_rate_in_HZ(x)			((x * HZ) / (1000 * 1000))

static void do_dbs_timer(void *data);

struct cpu_dbs_info_s {
	struct cpufreq_policy 	*cur_policy;
	unsigned int 		prev_cpu_idle_up;
	unsigned int 		prev_cpu_idle_down;
	unsigned int 		enable;
};
static DEFINE_PER_CPU(struct cpu_dbs_info_s, cpu_dbs_info);

static unsigned int dbs_enable;	/* number of CPUs using this policy */

static DECLARE_MUTEX 	(dbs_sem);
static DECLARE_WORK	(dbs_work, do_dbs_timer, NULL);

struct dbs_tuners {
	unsigned int 		sampling_rate;
	unsigned int		sampling_down_factor;
	unsigned int		up_threshold;
	unsigned int		down_threshold;
};

struct dbs_tuners dbs_tuners_ins = {
	.up_threshold 		= DEF_FREQUENCY_UP_THRESHOLD,
	.down_threshold 	= DEF_FREQUENCY_DOWN_THRESHOLD,
	.sampling_down_factor 	= DEF_SAMPLING_DOWN_FACTOR,
};

/************************** sysfs interface ************************/
static ssize_t show_current_freq(struct cpufreq_policy *policy, char *buf)
{
	return sprintf (buf, "%u\n", policy->cur);
}

static ssize_t show_sampling_rate_max(struct cpufreq_policy *policy, char *buf)
{
	return sprintf (buf, "%u\n", MAX_SAMPLING_RATE);
}

static ssize_t show_sampling_rate_min(struct cpufreq_policy *policy, char *buf)
{
	return sprintf (buf, "%u\n", MIN_SAMPLING_RATE);
}

#define define_one_ro(_name) 					\
static struct freq_attr _name = { 				\
	.attr = { .name = __stringify(_name), .mode = 0444 }, 	\
	.show = show_##_name, 					\
}

define_one_ro(current_freq);
define_one_ro(sampling_rate_max);
define_one_ro(sampling_rate_min);

/* cpufreq_ondemand Governor Tunables */
#define show_one(file_name, object)					\
static ssize_t show_##file_name						\
(struct cpufreq_policy *unused, char *buf)				\
{									\
	return sprintf(buf, "%u\n", dbs_tuners_ins.object);		\
}
show_one(sampling_rate, sampling_rate);
show_one(sampling_down_factor, sampling_down_factor);
show_one(up_threshold, up_threshold);
show_one(down_threshold, down_threshold);

static ssize_t store_sampling_down_factor(struct cpufreq_policy *unused, 
		const char *buf, size_t count)
{
	unsigned int input;
	int ret;
	ret = sscanf (buf, "%u", &input);
	down(&dbs_sem);
	if (ret != 1 )
		goto out;

	dbs_tuners_ins.sampling_down_factor = input;
out:
	up(&dbs_sem);
	return count;
}

static ssize_t store_sampling_rate(struct cpufreq_policy *unused, 
		const char *buf, size_t count)
{
	unsigned int input;
	int ret;
	ret = sscanf (buf, "%u", &input);
	down(&dbs_sem);
	if (ret != 1 || input > MAX_SAMPLING_RATE || input < MIN_SAMPLING_RATE)
		goto out;

	dbs_tuners_ins.sampling_rate = input;
out:
	up(&dbs_sem);
	return count;
}

static ssize_t store_up_threshold(struct cpufreq_policy *unused, 
		const char *buf, size_t count)
{
	unsigned int input;
	int ret;
	ret = sscanf (buf, "%u", &input);
	down(&dbs_sem);
	if (ret != 1 || input > MAX_FREQUENCY_UP_THRESHOLD || 
			input < MIN_FREQUENCY_UP_THRESHOLD ||
			input <= dbs_tuners_ins.down_threshold)
		goto out;

	dbs_tuners_ins.up_threshold = input;
out:
	up(&dbs_sem);
	return count;
}

static ssize_t store_down_threshold(struct cpufreq_policy *unused, 
		const char *buf, size_t count)
{
	unsigned int input;
	int ret;
	ret = sscanf (buf, "%u", &input);
	down(&dbs_sem);
	if (ret != 1 || input > MAX_FREQUENCY_DOWN_THRESHOLD || 
			input < MIN_FREQUENCY_DOWN_THRESHOLD ||
			input >= dbs_tuners_ins.up_threshold)
		goto out;

	dbs_tuners_ins.down_threshold = input;
out:
	up(&dbs_sem);
	return count;
}

#define define_one_rw(_name) 					\
static struct freq_attr _name = { 				\
	.attr = { .name = __stringify(_name), .mode = 0644 }, 	\
	.show = show_##_name, 					\
	.store = store_##_name, 				\
}

define_one_rw(sampling_rate);
define_one_rw(sampling_down_factor);
define_one_rw(up_threshold);
define_one_rw(down_threshold);

static struct attribute * dbs_attributes[] = {
	&current_freq.attr,
	&sampling_rate_max.attr,
	&sampling_rate_min.attr,
	&sampling_rate.attr,
	&sampling_down_factor.attr,
	&up_threshold.attr,
	&down_threshold.attr,
	NULL
};

static struct attribute_group dbs_attr_group = {
	.attrs = dbs_attributes,
	.name = "ondemand",
};

/************************** sysfs end ************************/

static void dbs_check_cpu(int cpu)
{
	unsigned int idle_ticks, up_idle_ticks, down_idle_ticks;
	unsigned int freq_down_step;
	unsigned int freq_down_sampling_rate;
	static int down_skip[NR_CPUS];
	struct cpu_dbs_info_s *this_dbs_info;

	this_dbs_info = &per_cpu(cpu_dbs_info, cpu);
	if (!this_dbs_info->enable)
		return;

	/* 
	 * The default safe range is 20% to 80% 
	 * Every sampling_rate, we check
	 * 	- If current idle time is less than 20%, then we try to 
	 * 	  increase frequency
	 * Every sampling_rate*sampling_down_factor, we check
	 * 	- If current idle time is more than 80%, then we try to
	 * 	  decrease frequency
	 *
	 * Any frequency increase takes it to the maximum frequency. 
	 * Frequency reduction happens at minimum steps of 
	 * 5% of max_frequency 
	 */
	/* Check for frequency increase */
	idle_ticks = kstat_cpu(cpu).cpustat.idle - 
		this_dbs_info->prev_cpu_idle_up;
	this_dbs_info->prev_cpu_idle_up = kstat_cpu(cpu).cpustat.idle;

	up_idle_ticks = (100 - dbs_tuners_ins.up_threshold) *
			sampling_rate_in_HZ(dbs_tuners_ins.sampling_rate) / 100;

	if (idle_ticks < up_idle_ticks) {
		__cpufreq_driver_target(this_dbs_info->cur_policy,
			this_dbs_info->cur_policy->max, 
			CPUFREQ_RELATION_H);
		down_skip[cpu] = 0;
		this_dbs_info->prev_cpu_idle_down = kstat_cpu(cpu).cpustat.idle;
		return;
	}

	/* Check for frequency decrease */
	down_skip[cpu]++;
	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
		return;

	idle_ticks = kstat_cpu(cpu).cpustat.idle - 
		this_dbs_info->prev_cpu_idle_down;
	down_skip[cpu] = 0;
	this_dbs_info->prev_cpu_idle_down = kstat_cpu(cpu).cpustat.idle;

	freq_down_sampling_rate = dbs_tuners_ins.sampling_rate *
		dbs_tuners_ins.sampling_down_factor;
	down_idle_ticks = (100 - dbs_tuners_ins.down_threshold) *
			sampling_rate_in_HZ(freq_down_sampling_rate) / 100;

	if (idle_ticks > down_idle_ticks ) {
		freq_down_step = (5 * this_dbs_info->cur_policy->max) / 100;
		__cpufreq_driver_target(this_dbs_info->cur_policy,
			this_dbs_info->cur_policy->cur - freq_down_step, 
			CPUFREQ_RELATION_H);
		return;
	}
}

static void do_dbs_timer(void *data)
{ 
	int i;
	down(&dbs_sem);
	for (i = 0; i < NR_CPUS; i++)
		if (cpu_online(i))
			dbs_check_cpu(i);
	schedule_delayed_work(&dbs_work, 
			sampling_rate_in_HZ(dbs_tuners_ins.sampling_rate));
	up(&dbs_sem);
} 

static inline void dbs_timer_init(void)
{
	INIT_WORK(&dbs_work, do_dbs_timer, NULL);
	schedule_work(&dbs_work);
	return;
}

static inline void dbs_timer_exit(void)
{
	cancel_delayed_work(&dbs_work);
	return;
}

static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
				   unsigned int event)
{
	unsigned int cpu = policy->cpu;
	struct cpu_dbs_info_s *this_dbs_info;

	this_dbs_info = &per_cpu(cpu_dbs_info, cpu);

	switch (event) {
	case CPUFREQ_GOV_START:
		if ((!cpu_online(cpu)) || 
		    (!policy->cur))
			return -EINVAL;

		if (policy->cpuinfo.transition_latency >
				(TRANSITION_LATENCY_LIMIT * 1000))
			return -EINVAL;
		if (this_dbs_info->enable) /* Already enabled */
			break;
		 
		down(&dbs_sem);
		this_dbs_info->cur_policy = policy;
		
		this_dbs_info->prev_cpu_idle_up = 
				kstat_cpu(cpu).cpustat.idle;
		this_dbs_info->prev_cpu_idle_down = 
				kstat_cpu(cpu).cpustat.idle;
		this_dbs_info->enable = 1;
		sysfs_create_group(&policy->kobj, &dbs_attr_group);
		dbs_enable++;
		/*
		 * Start the timerschedule work, when this governor
		 * is used for first time
		 */
		if (dbs_enable == 1) {
			/* policy latency is in nS. Convert it to uS first */
			def_sampling_rate = (policy->cpuinfo.transition_latency / 1000) *
					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
			dbs_tuners_ins.sampling_rate = def_sampling_rate;

			dbs_timer_init();
		}
		
		up(&dbs_sem);
		break;

	case CPUFREQ_GOV_STOP:
		down(&dbs_sem);
		this_dbs_info->enable = 0;
		sysfs_remove_group(&policy->kobj, &dbs_attr_group);
		dbs_enable--;
		/*
		 * Stop the timerschedule work, when this governor
		 * is used for first time
		 */
		if (dbs_enable == 0) 
			dbs_timer_exit();
		
		up(&dbs_sem);

		break;

	case CPUFREQ_GOV_LIMITS:
		down(&dbs_sem);
		if (policy->max < this_dbs_info->cur_policy->cur)
			__cpufreq_driver_target(
					this_dbs_info->cur_policy,
				       	policy->max, CPUFREQ_RELATION_H);
		else if (policy->min > this_dbs_info->cur_policy->cur)
			__cpufreq_driver_target(
					this_dbs_info->cur_policy,
				       	policy->min, CPUFREQ_RELATION_L);
		up(&dbs_sem);
		break;
	}
	return 0;
}

struct cpufreq_governor cpufreq_gov_dbs = {
	.name		= "ondemand",
	.governor	= cpufreq_governor_dbs,
	.owner		= THIS_MODULE,
};
EXPORT_SYMBOL(cpufreq_gov_dbs);

static int __init cpufreq_gov_dbs_init(void)
{
	return cpufreq_register_governor(&cpufreq_gov_dbs);
}

static void __exit cpufreq_gov_dbs_exit(void)
{
	/* Make sure that the scheduled work is indeed not running */
	flush_scheduled_work();

	cpufreq_unregister_governor(&cpufreq_gov_dbs);
}


MODULE_AUTHOR ("Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>");
MODULE_DESCRIPTION ("'cpufreq_ondemand' - A dynamic cpufreq governor for "
		"Low Latency Frequency Transition capable processors");
MODULE_LICENSE ("GPL");

module_init(cpufreq_gov_dbs_init);
module_exit(cpufreq_gov_dbs_exit);

Index: Kconfig
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/Kconfig,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- Kconfig	20 Jan 2004 17:03:32 -0000	1.4
+++ Kconfig	26 Aug 2004 13:25:20 -0000	1.5
@@ -6,14 +6,15 @@
 	  CPUFreq. Please note that it is recommended to use the sysfs
 	  interface instead (which is built automatically). 
 	  
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 	  
 	  If in doubt, say N.
 
 choice
 	prompt "Default CPUFreq governor"
 	depends on CPU_FREQ
-	default CPU_FREQ_DEFAULT_GOV_PERFORMANCE
+	default CPU_FREQ_DEFAULT_GOV_PERFORMANCE if !CPU_FREQ_SA1100 && !CPU_FREQ_SA1110
+	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110
 	help
 	  This option sets which CPUFreq governor shall be loaded at
 	  startup. If in doubt, select 'performance'.
@@ -64,10 +65,25 @@
           be able to set the CPU dynamically, like on LART 
 	  <http://www.lart.tudelft.nl/>
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say Y.
 
+config CPU_FREQ_GOV_ONDEMAND
+	tristate "'ondemand' cpufreq policy governor"
+	depends on CPU_FREQ
+	help
+	  'ondemand' - This driver adds a dynamic cpufreq policy governor.
+	  The governor does a periodic polling and 
+	  changes frequency based on the CPU utilization.
+	  The support for this governor depends on CPU capability to
+	  do fast frequency switching (i.e, very low latency frequency
+	  transitions). 
+
+	  For details, take a look at linux/Documentation/cpu-freq.
+
+	  If in doubt, say N.
+
 config CPU_FREQ_24_API
 	bool "/proc/sys/cpu/ interface (2.4. / OLD)"
 	depends on CPU_FREQ && SYSCTL && CPU_FREQ_GOV_USERSPACE
@@ -78,6 +94,6 @@
 	  the same functionality as long as "userspace" is the
 	  selected governor for the specified CPU.
 	
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.

Index: Makefile
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/Makefile,v
retrieving revision 1.5
retrieving revision 1.6
diff -u -r1.5 -r1.6
--- Makefile	5 Nov 2003 18:27:44 -0000	1.5
+++ Makefile	26 Aug 2004 13:25:20 -0000	1.6
@@ -5,6 +5,7 @@
 obj-$(CONFIG_CPU_FREQ_GOV_PERFORMANCE)	+= cpufreq_performance.o
 obj-$(CONFIG_CPU_FREQ_GOV_POWERSAVE)	+= cpufreq_powersave.o
 obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+= cpufreq_userspace.o
+obj-$(CONFIG_CPU_FREQ_GOV_ONDEMAND)	+= cpufreq_ondemand.o
 
 # CPUfreq cross-arch helpers
 obj-$(CONFIG_CPU_FREQ_TABLE)		+= freq_table.o

Index: cpufreq.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/cpufreq.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -r1.3 -r1.4
--- cpufreq.c	5 Nov 2003 18:27:44 -0000	1.3
+++ cpufreq.c	26 Aug 2004 13:25:20 -0000	1.4
@@ -33,9 +33,10 @@
 static struct cpufreq_policy	*cpufreq_cpu_data[NR_CPUS];
 static spinlock_t		cpufreq_driver_lock = SPIN_LOCK_UNLOCKED;
 
-/* internal prototype */
+/* internal prototypes */
 static int __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event);
-
+static void handle_update(void *data);
+static inline void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci);
 
 /**
  * Two notifier lists: the "policy" list is involved in the 
@@ -99,6 +100,88 @@
 }
 
 /*********************************************************************
+ *            EXTERNALLY AFFECTING FREQUENCY CHANGES                 *
+ *********************************************************************/
+
+/**
+ * adjust_jiffies - adjust the system "loops_per_jiffy"
+ *
+ * This function alters the system "loops_per_jiffy" for the clock
+ * speed change. Note that loops_per_jiffy cannot be updated on SMP
+ * systems as each CPU might be scaled differently. So, use the arch 
+ * per-CPU loops_per_jiffy value wherever possible.
+ */
+#ifndef CONFIG_SMP
+static unsigned long l_p_j_ref;
+static unsigned int  l_p_j_ref_freq;
+
+static inline void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci)
+{
+	if (ci->flags & CPUFREQ_CONST_LOOPS)
+		return;
+
+	if (!l_p_j_ref_freq) {
+		l_p_j_ref = loops_per_jiffy;
+		l_p_j_ref_freq = ci->old;
+	}
+	if ((val == CPUFREQ_PRECHANGE  && ci->old < ci->new) ||
+	    (val == CPUFREQ_POSTCHANGE && ci->old > ci->new) ||
+	    (val == CPUFREQ_RESUMECHANGE))
+		loops_per_jiffy = cpufreq_scale(l_p_j_ref, l_p_j_ref_freq, ci->new);
+}
+#else
+static inline void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci) { return; }
+#endif
+
+
+/**
+ * cpufreq_notify_transition - call notifier chain and adjust_jiffies on frequency transition
+ *
+ * This function calls the transition notifiers and the "adjust_jiffies" function. It is called
+ * twice on all CPU frequency changes that have external effects. 
+ */
+void cpufreq_notify_transition(struct cpufreq_freqs *freqs, unsigned int state)
+{
+	BUG_ON(irqs_disabled());
+
+	freqs->flags = cpufreq_driver->flags;
+
+	down_read(&cpufreq_notifier_rwsem);
+	switch (state) {
+	case CPUFREQ_PRECHANGE:
+		/* detect if the driver reported a value as "old frequency" which
+		 * is not equal to what the cpufreq core thinks is "old frequency".
+		 */
+		if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
+			if ((likely(cpufreq_cpu_data[freqs->cpu])) &&
+			    (likely(cpufreq_cpu_data[freqs->cpu]->cur)) &&
+			    (unlikely(freqs->old != cpufreq_cpu_data[freqs->cpu]->cur)))
+			{
+				if (cpufreq_driver->flags & CPUFREQ_PANIC_OUTOFSYNC)
+					panic("CPU Frequency is out of sync.");
+
+				printk(KERN_WARNING "Warning: CPU frequency is %u, "
+				       "cpufreq assumed %u kHz.\n", freqs->old, cpufreq_cpu_data[freqs->cpu]->cur);
+				freqs->old = cpufreq_cpu_data[freqs->cpu]->cur;
+			}
+		}
+		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_PRECHANGE, freqs);
+		adjust_jiffies(CPUFREQ_PRECHANGE, freqs);
+		break;
+	case CPUFREQ_POSTCHANGE:
+		adjust_jiffies(CPUFREQ_POSTCHANGE, freqs);
+		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_POSTCHANGE, freqs);
+		if (likely(cpufreq_cpu_data[freqs->cpu]))
+			cpufreq_cpu_data[freqs->cpu]->cur = freqs->new;
+		break;
+	}
+	up_read(&cpufreq_notifier_rwsem);
+}
+EXPORT_SYMBOL_GPL(cpufreq_notify_transition);
+
+
+
+/*********************************************************************
  *                          SYSFS INTERFACE                          *
  *********************************************************************/
 
@@ -161,6 +244,7 @@
 show_one(cpuinfo_max_freq, cpuinfo.max_freq);
 show_one(scaling_min_freq, min);
 show_one(scaling_max_freq, max);
+show_one(scaling_cur_freq, cur);
 
 /**
  * cpufreq_per_cpu_attr_write() / store_##file_name() - sysfs write access
@@ -189,6 +273,18 @@
 store_one(scaling_max_freq,max);
 
 /**
+ * show_cpuinfo_cur_freq - current CPU frequency as detected by hardware
+ */
+static ssize_t show_cpuinfo_cur_freq (struct cpufreq_policy * policy, char *buf)
+{
+	unsigned int cur_freq = cpufreq_get(policy->cpu);
+	if (!cur_freq)
+		return sprintf(buf, "<unknown>");
+	return sprintf(buf, "%u\n", cur_freq);
+}
+
+
+/**
  * show_scaling_governor - show the current policy for the specified CPU
  */
 static ssize_t show_scaling_governor (struct cpufreq_policy * policy, char *buf)
@@ -198,7 +294,7 @@
 	else if (policy->policy == CPUFREQ_POLICY_PERFORMANCE)
 		return sprintf(buf, "performance\n");
 	else if (policy->governor)
-		return snprintf(buf, CPUFREQ_NAME_LEN, "%s\n", policy->governor->name);
+		return scnprintf(buf, CPUFREQ_NAME_LEN, "%s\n", policy->governor->name);
 	return -EINVAL;
 }
 
@@ -234,7 +330,7 @@
  */
 static ssize_t show_scaling_driver (struct cpufreq_policy * policy, char *buf)
 {
-	return snprintf(buf, CPUFREQ_NAME_LEN, "%s\n", cpufreq_driver->name);
+	return scnprintf(buf, CPUFREQ_NAME_LEN, "%s\n", cpufreq_driver->name);
 }
 
 /**
@@ -254,7 +350,7 @@
 	list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
 		if (i >= (ssize_t) ((PAGE_SIZE / sizeof(char)) - (CPUFREQ_NAME_LEN + 2)))
 			goto out;
-		i += snprintf(&buf[i], CPUFREQ_NAME_LEN, "%s ", t->name);
+		i += scnprintf(&buf[i], CPUFREQ_NAME_LEN, "%s ", t->name);
 	}
  out:
 	i += sprintf(&buf[i], "\n");
@@ -268,6 +364,12 @@
 	.show = show_##_name, \
 }
 
+#define define_one_ro0400(_name) \
+struct freq_attr _name = { \
+	.attr = { .name = __stringify(_name), .mode = 0400 }, \
+	.show = show_##_name, \
+}
+
 #define define_one_rw(_name) \
 struct freq_attr _name = { \
 	.attr = { .name = __stringify(_name), .mode = 0644 }, \
@@ -275,10 +377,12 @@
 	.store = store_##_name, \
 }
 
+define_one_ro0400(cpuinfo_cur_freq);
 define_one_ro(cpuinfo_min_freq);
 define_one_ro(cpuinfo_max_freq);
 define_one_ro(scaling_available_governors);
 define_one_ro(scaling_driver);
+define_one_ro(scaling_cur_freq);
 define_one_rw(scaling_min_freq);
 define_one_rw(scaling_max_freq);
 define_one_rw(scaling_governor);
@@ -360,13 +464,16 @@
 		return -EINVAL;
 
 	policy = kmalloc(sizeof(struct cpufreq_policy), GFP_KERNEL);
-	if (!policy)
-		return -ENOMEM;
+	if (!policy) {
+		ret = -ENOMEM;
+		goto nomem_out;
+	}
 	memset(policy, 0, sizeof(struct cpufreq_policy));
 
 	policy->cpu = cpu;
 	init_MUTEX_LOCKED(&policy->lock);
 	init_completion(&policy->kobj_unregister);
+	INIT_WORK(&policy->update, handle_update, (void *)(long)cpu);
 
 	/* call driver. From then on the cpufreq must be able
 	 * to accept all calls to ->verify and ->setpolicy for this CPU
@@ -392,6 +499,10 @@
 		sysfs_create_file(&policy->kobj, &((*drv_attr)->attr));
 		drv_attr++;
 	}
+	if (cpufreq_driver->get)
+		sysfs_create_file(&policy->kobj, &cpuinfo_cur_freq.attr);
+	if (cpufreq_driver->target)
+		sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	cpufreq_cpu_data[cpu] = policy;
@@ -410,7 +521,7 @@
 	return 0;
 
 
- err_out_unregister:
+err_out_unregister:
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	cpufreq_cpu_data[cpu] = NULL;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
@@ -418,8 +529,10 @@
 	kobject_unregister(&policy->kobj);
 	wait_for_completion(&policy->kobj_unregister);
 
- err_out:
+err_out:
 	kfree(policy);
+
+nomem_out:
 	module_put(cpufreq_driver->owner);
 	return ret;
 }
@@ -470,11 +583,86 @@
 	return 0;
 }
 
+
+static void handle_update(void *data)
+{
+	unsigned int cpu = (unsigned int)(long)data;
+	cpufreq_update_policy(cpu);
+}
+
 /**
- *	cpufreq_resume - restore the CPU clock frequency after resume
+ *	cpufreq_out_of_sync - If actual and saved CPU frequency differs, we're in deep trouble.
+ *	@cpu: cpu number
+ *	@old_freq: CPU frequency the kernel thinks the CPU runs at
+ *	@new_freq: CPU frequency the CPU actually runs at
+ *
+ *	We adjust to current frequency first, and need to clean up later. So either call
+ *	to cpufreq_update_policy() or schedule handle_update()).
+ */
+static void cpufreq_out_of_sync(unsigned int cpu, unsigned int old_freq, unsigned int new_freq)
+{
+	struct cpufreq_freqs freqs;
+
+	if (cpufreq_driver->flags & CPUFREQ_PANIC_OUTOFSYNC)
+		panic("CPU Frequency is out of sync.");
+
+	printk(KERN_WARNING "Warning: CPU frequency out of sync: cpufreq and timing "
+	       "core thinks of %u, is %u kHz.\n", old_freq, new_freq);
+
+	freqs.cpu = cpu;
+	freqs.old = old_freq;
+	freqs.new = new_freq;
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+}
+
+
+/** 
+ * cpufreq_get - get the current CPU frequency (in kHz)
+ * @cpu: CPU number
  *
- *	Restore the CPU clock frequency so that our idea of the current
- *	frequency reflects the actual hardware.
+ * Get the CPU current (static) CPU frequency
+ */
+unsigned int cpufreq_get(unsigned int cpu)
+{
+	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
+	unsigned int ret = 0;
+
+	if (!policy)
+		return 0;
+
+	if (!cpufreq_driver->get)
+		goto out;
+
+	down(&policy->lock);
+
+	ret = cpufreq_driver->get(cpu);
+
+	if (ret && policy->cur && !(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) 
+	{
+		/* verify no discrepancy between actual and saved value exists */
+		if (unlikely(ret != policy->cur)) {
+			cpufreq_out_of_sync(cpu, policy->cur, ret);
+			schedule_work(&policy->update);
+		}
+	}
+
+	up(&policy->lock);
+
+ out:
+	cpufreq_cpu_put(policy);
+
+	return (ret);
+}
+EXPORT_SYMBOL(cpufreq_get);
+
+
+/**
+ *	cpufreq_resume -  restore proper CPU frequency handling after resume
+ *
+ *	1.) resume CPUfreq hardware support (cpufreq_driver->resume())
+ *	2.) if ->target and !CPUFREQ_CONST_LOOPS: verify we're in sync
+ *	3.) schedule call cpufreq_update_policy() ASAP as interrupts are restored.
  */
 static int cpufreq_resume(struct sys_device * sysdev)
 {
@@ -494,29 +682,40 @@
 	if (!cpu_policy)
 		return -EINVAL;
 
-	if (cpufreq_driver->resume)
-		ret = cpufreq_driver->resume(cpu_policy);
-	if (ret) {
-		printk(KERN_ERR "cpufreq: resume failed in ->resume step on CPU %u\n", cpu_policy->cpu);
-		goto out;
-	}
+	if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
+		unsigned int cur_freq = 0;
 
-	if (cpufreq_driver->setpolicy)
-		ret = cpufreq_driver->setpolicy(cpu_policy);
-	else
-	/* CPUFREQ_RELATION_H or CPUFREQ_RELATION_L have the same effect here, as cpu_policy->cur is known
-	 * to be a valid and exact target frequency
-	 */
-		ret = cpufreq_driver->target(cpu_policy, cpu_policy->cur, CPUFREQ_RELATION_H);
+		if (cpufreq_driver->get)
+			cur_freq = cpufreq_driver->get(cpu_policy->cpu);
 
-	if (ret) {
-		printk(KERN_ERR "cpufreq: resume failed in ->setpolicy/target step on CPU %u\n", cpu_policy->cpu);
-		goto out;
+		if (!cur_freq || !cpu_policy->cur) {
+			printk(KERN_ERR "cpufreq: resume failed to assert current frequency is what timing core thinks it is.\n");
+			goto out;
+		}
+
+		if (unlikely(cur_freq != cpu_policy->cur)) {
+			struct cpufreq_freqs freqs;
+
+			if (cpufreq_driver->flags & CPUFREQ_PANIC_RESUME_OUTOFSYNC)
+				panic("CPU Frequency is out of sync.");
+
+			printk(KERN_WARNING "Warning: CPU frequency is %u, "
+			       "cpufreq assumed %u kHz.\n", cur_freq, cpu_policy->cur);
+
+			freqs.cpu = cpu;
+			freqs.old = cpu_policy->cur;
+			freqs.new = cur_freq;
+
+			notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_RESUMECHANGE, &freqs);
+			adjust_jiffies(CPUFREQ_RESUMECHANGE, &freqs);
+
+			cpu_policy->cur = cur_freq;
+		}
 	}
 
- out:
+out:
+	schedule_work(&cpu_policy->update);
 	cpufreq_cpu_put(cpu_policy);
-
 	return ret;
 }
 
@@ -607,7 +806,12 @@
 			    unsigned int target_freq,
 			    unsigned int relation)
 {
-	return cpufreq_driver->target(policy, target_freq, relation);
+	int retval = -EINVAL;
+	lock_cpu_hotplug();
+	if (cpu_online(policy->cpu))
+		retval = cpufreq_driver->target(policy, target_freq, relation);
+	unlock_cpu_hotplug();
+	return retval;
 }
 EXPORT_SYMBOL_GPL(__cpufreq_driver_target);
 
@@ -868,7 +1072,7 @@
 	down(&data->lock);
 
 	memcpy(&policy, 
-	       &data, 
+	       data,
 	       sizeof(struct cpufreq_policy));
 	policy.min = data->user_policy.min;
 	policy.max = data->user_policy.max;
@@ -886,67 +1090,6 @@
 
 
 /*********************************************************************
- *            EXTERNALLY AFFECTING FREQUENCY CHANGES                 *
- *********************************************************************/
-
-/**
- * adjust_jiffies - adjust the system "loops_per_jiffy"
- *
- * This function alters the system "loops_per_jiffy" for the clock
- * speed change. Note that loops_per_jiffy cannot be updated on SMP
- * systems as each CPU might be scaled differently. So, use the arch 
- * per-CPU loops_per_jiffy value wherever possible.
- */
-#ifndef CONFIG_SMP
-static unsigned long l_p_j_ref;
-static unsigned int  l_p_j_ref_freq;
-
-static inline void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci)
-{
-	if (!l_p_j_ref_freq) {
-		l_p_j_ref = loops_per_jiffy;
-		l_p_j_ref_freq = ci->old;
-	}
-	if ((val == CPUFREQ_PRECHANGE  && ci->old < ci->new) ||
-	    (val == CPUFREQ_POSTCHANGE && ci->old > ci->new))
-		loops_per_jiffy = cpufreq_scale(l_p_j_ref, l_p_j_ref_freq, ci->new);
-}
-#else
-#define adjust_jiffies(x...) do {} while (0)
-#endif
-
-
-/**
- * cpufreq_notify_transition - call notifier chain and adjust_jiffies on frequency transition
- *
- * This function calls the transition notifiers and the "adjust_jiffies" function. It is called
- * twice on all CPU frequency changes that have external effects. 
- */
-void cpufreq_notify_transition(struct cpufreq_freqs *freqs, unsigned int state)
-{
-	if (irqs_disabled())
-		return;   /* Only valid if we're in the resume process where
-			   * everyone knows what CPU frequency we are at */
-
-	down_read(&cpufreq_notifier_rwsem);
-	switch (state) {
-	case CPUFREQ_PRECHANGE:
-		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_PRECHANGE, freqs);
-		adjust_jiffies(CPUFREQ_PRECHANGE, freqs);
-		break;
-	case CPUFREQ_POSTCHANGE:
-		adjust_jiffies(CPUFREQ_POSTCHANGE, freqs);
-		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_POSTCHANGE, freqs);
-		cpufreq_cpu_data[freqs->cpu]->cur = freqs->new;
-		break;
-	}
-	up_read(&cpufreq_notifier_rwsem);
-}
-EXPORT_SYMBOL_GPL(cpufreq_notify_transition);
-
-
-
-/*********************************************************************
  *               REGISTER / UNREGISTER CPUFREQ DRIVER                *
  *********************************************************************/
 
@@ -963,11 +1106,15 @@
 int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 {
 	unsigned long flags;
+	int ret;
 
 	if (!driver_data || !driver_data->verify || !driver_data->init ||
 	    ((!driver_data->setpolicy) && (!driver_data->target)))
 		return -EINVAL;
 
+	if (driver_data->setpolicy)
+		driver_data->flags |= CPUFREQ_CONST_LOOPS;
+
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	if (cpufreq_driver) {
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
@@ -976,7 +1123,28 @@
 	cpufreq_driver = driver_data;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
-	return sysdev_driver_register(&cpu_sysdev_class,&cpufreq_sysdev_driver);
+	ret = sysdev_driver_register(&cpu_sysdev_class,&cpufreq_sysdev_driver);
+
+	if ((!ret) && !(cpufreq_driver->flags & CPUFREQ_STICKY)) {
+		int i;
+		ret = -ENODEV;
+
+		/* check for at least one working CPU */
+		for (i=0; i<NR_CPUS; i++)
+			if (cpufreq_cpu_data[i])
+				ret = 0;
+
+		/* if all ->init() calls failed, unregister */
+		if (ret) {
+			sysdev_driver_unregister(&cpu_sysdev_class, &cpufreq_sysdev_driver);
+
+			spin_lock_irqsave(&cpufreq_driver_lock, flags);
+			cpufreq_driver = NULL;
+			spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		}
+	}
+
+	return (ret);
 }
 EXPORT_SYMBOL_GPL(cpufreq_register_driver);
 

Index: cpufreq_userspace.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/cpufreq_userspace.c,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -r1.1 -r1.2
--- cpufreq_userspace.c	5 Nov 2003 18:27:44 -0000	1.1
+++ cpufreq_userspace.c	26 Aug 2004 13:25:21 -0000	1.2
@@ -2,7 +2,7 @@
  *  linux/drivers/cpufreq/cpufreq_userspace.c
  *
  *  Copyright (C)  2001 Russell King
- *            (C)  2002 - 2003 Dominik Brodowski <linux@brodo.de>
+ *            (C)  2002 - 2004 Dominik Brodowski <linux@brodo.de>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -82,6 +82,13 @@
 {
         struct cpufreq_freqs *freq = data;
 
+	/* Don't update cur_freq if CPU is managed and we're
+	 * waking up: else we won't remember what frequency 
+	 * we need to set the CPU to.
+	 */
+	if (cpu_is_managed[freq->cpu] && (val == CPUFREQ_RESUMECHANGE))
+		return 0;
+
 	cpu_cur_freq[freq->cpu] = freq->new;
 
         return 0;
@@ -112,7 +119,14 @@
 	if (freq > cpu_max_freq[cpu])
 		freq = cpu_max_freq[cpu];
 
-	ret = cpufreq_driver_target(&current_policy[cpu], freq, 
+	/*
+	 * We're safe from concurrent calls to ->target() here
+	 * as we hold the userspace_sem lock. If we were calling
+	 * cpufreq_driver_target, a deadlock situation might occur:
+	 * A: cpufreq_set (lock userspace_sem) -> cpufreq_driver_target(lock policy->lock)
+	 * B: cpufreq_set_policy(lock policy->lock) -> __cpufreq_governor -> cpufreq_governor_userspace (lock userspace_sem)
+	 */
+	ret = __cpufreq_driver_target(&current_policy[cpu], freq, 
 	      CPUFREQ_RELATION_L);
 
  err:
@@ -138,36 +152,33 @@
 EXPORT_SYMBOL_GPL(cpufreq_setmax);
 
 
-/** 
- * cpufreq_get - get the current CPU frequency (in kHz)
- * @cpu: CPU number
- *
- * Get the CPU current (static) CPU frequency
- */
-unsigned int cpufreq_get(unsigned int cpu)
-{
-	return cpu_cur_freq[cpu];
-}
-EXPORT_SYMBOL(cpufreq_get);
-
-
 #ifdef CONFIG_CPU_FREQ_24_API
 
+#warning The /proc/sys/cpu/ and sysctl interface to cpufreq will be removed from the 2.6. kernel series soon after 2005-01-01
+
+static unsigned int warning_print = 0;
 
 /*********************** cpufreq_sysctl interface ********************/
 static int
 cpufreq_procctl(ctl_table *ctl, int write, struct file *filp,
-		void __user *buffer, size_t *lenp)
+		void __user *buffer, size_t *lenp, loff_t *ppos)
 {
 	char buf[16], *p;
-	int cpu = (int) ctl->extra1;
-	int len, left = *lenp;
+	int cpu = (long) ctl->extra1;
+	unsigned int len, left = *lenp;
 
-	if (!left || (filp->f_pos && !write) || !cpu_online(cpu)) {
+	if (!left || (*ppos && !write) || !cpu_online(cpu)) {
 		*lenp = 0;
 		return 0;
 	}
 
+	if (!warning_print) {
+		warning_print++;
+		printk(KERN_INFO "Access to /proc/sys/cpu/ is deprecated and "
+			"will be removed from (new) 2.6. kernels soon "
+			"after 2005-01-01\n");
+	}
+
 	if (write) {
 		unsigned int freq;
 
@@ -189,7 +200,7 @@
 	}
 
 	*lenp = len;
-	filp->f_pos += len;
+	*ppos += len;
 	return 0;
 }
 
@@ -198,11 +209,18 @@
 	       void __user *oldval, size_t __user *oldlenp,
 	       void __user *newval, size_t newlen, void **context)
 {
-	int cpu = (int) table->extra1;
+	int cpu = (long) table->extra1;
 
 	if (!cpu_online(cpu))
 		return -EINVAL;
 
+	if (!warning_print) {
+		warning_print++;
+		printk(KERN_INFO "Access to /proc/sys/cpu/ is deprecated and "
+			"will be removed from (new) 2.6. kernels soon "
+			"after 2005-01-01\n");
+	}
+
 	if (oldval && oldlenp) {
 		size_t oldlen;
 
@@ -212,7 +230,7 @@
 		if (oldlen != sizeof(unsigned int))
 			return -EINVAL;
 
-		if (put_user(cpufreq_get(cpu), (unsigned int *)oldval) ||
+		if (put_user(cpufreq_get(cpu), (unsigned int __user *)oldval) ||
 		    put_user(sizeof(unsigned int), oldlenp))
 			return -EFAULT;
 	}
@@ -222,7 +240,7 @@
 		if (newlen != sizeof(unsigned int))
 			return -EINVAL;
 
-		if (get_user(freq, (unsigned int *)newval))
+		if (get_user(freq, (unsigned int __user *)newval))
 			return -EFAULT;
 
 		cpufreq_set(freq, cpu);
@@ -528,6 +546,9 @@
 		else if (policy->min > cpu_cur_freq[cpu])
 			__cpufreq_driver_target(&current_policy[cpu], policy->min, 
 			      CPUFREQ_RELATION_L);
+		else
+			__cpufreq_driver_target(&current_policy[cpu], cpu_cur_freq[cpu],
+			      CPUFREQ_RELATION_L);
 		memcpy (&current_policy[cpu], policy, sizeof(struct cpufreq_policy));
 		up(&userspace_sem);
 		break;
@@ -535,20 +556,6 @@
 	return 0;
 }
 
-/* on ARM SA1100 we need to rely on the values of cpufreq_get() - because 
- * of this, cpu_cur_freq[] needs to be set early.
- */
-#if defined(CONFIG_ARM) && defined(CONFIG_ARCH_SA1100)
-extern unsigned int sa11x0_getspeed(void);
-
-static void cpufreq_sa11x0_compat(void)
-{
-	cpu_cur_freq[0] = sa11x0_getspeed();
-}
-#else
-#define cpufreq_sa11x0_compat() do {} while(0)
-#endif
-
 
 struct cpufreq_governor cpufreq_gov_userspace = {
 	.name		= "userspace",
@@ -557,21 +564,12 @@
 };
 EXPORT_SYMBOL(cpufreq_gov_userspace);
 
-static int already_init = 0;
-
-int cpufreq_gov_userspace_init(void)
+static int __init cpufreq_gov_userspace_init(void)
 {
-	if (!already_init) {
-		down(&userspace_sem);
-		cpufreq_sa11x0_compat();
-		cpufreq_sysctl_init();
-		cpufreq_register_notifier(&userspace_cpufreq_notifier_block, CPUFREQ_TRANSITION_NOTIFIER);
-		already_init = 1;
-		up(&userspace_sem);
-	}
+	cpufreq_sysctl_init();
+	cpufreq_register_notifier(&userspace_cpufreq_notifier_block, CPUFREQ_TRANSITION_NOTIFIER);
 	return cpufreq_register_governor(&cpufreq_gov_userspace);
 }
-EXPORT_SYMBOL(cpufreq_gov_userspace_init);
 
 
 static void __exit cpufreq_gov_userspace_exit(void)

Index: proc_intf.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/proc_intf.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -r1.3 -r1.4
--- proc_intf.c	5 Nov 2003 18:27:44 -0000	1.3
+++ proc_intf.c	26 Aug 2004 13:25:21 -0000	1.4
@@ -12,9 +12,12 @@
 #include <linux/proc_fs.h>
 #include <asm/uaccess.h>
 
+#warning This module will be removed from the 2.6. kernel series soon after 2005-01-01
 
 #define CPUFREQ_ALL_CPUS		((NR_CPUS))
 
+static unsigned int warning_print = 0;
+
 /**
  * cpufreq_parse_policy - parse a policy string
  * @input_string: the string to parse.
@@ -110,6 +113,13 @@
 	if (off != 0)
 		goto end;
 
+	if (!warning_print) {
+		warning_print++;
+		printk(KERN_INFO "Access to /proc/cpufreq is deprecated and "
+			"will be removed from (new) 2.6. kernels soon "
+			"after 2005-01-01\n");
+	}
+
 	p += sprintf(p, "          minimum CPU frequency  -  maximum CPU frequency  -  policy\n");
 	for (i=0;i<NR_CPUS;i++) {
 		if (!cpu_online(i))
@@ -139,7 +149,7 @@
 				break;
 			} 
 		} else
-			p += snprintf(p, CPUFREQ_NAME_LEN, "%s\n", policy.governor->name);
+			p += scnprintf(p, CPUFREQ_NAME_LEN, "%s\n", policy.governor->name);
 	}
 end:
 	len = (p - page);
@@ -164,7 +174,7 @@
  */
 static int cpufreq_proc_write (
         struct file		*file,
-        const char		*buffer,
+        const char		__user *buffer,
         unsigned long		count,
         void			*data)
 {
@@ -179,6 +189,13 @@
 	
 	if (copy_from_user(proc_string, buffer, count))
 		return -EFAULT;
+
+	if (!warning_print) {
+		warning_print++;
+		printk(KERN_INFO "Access to /proc/cpufreq is deprecated and "
+			"will be removed from (new) 2.6. kernels soon "
+			"after 2005-01-01\n");
+	}
 	
 	proc_string[count] = '\0';
