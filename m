From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [RFC][TEST] Why not some old alg. for governors?
Date: Wed, 15 Dec 2004 18:15:41 +0100
Message-ID: <20041215171541.GH2140@poupinou.org>
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I'm trying to make a new governor based on PAST.  I think I will improve
somehow things, but would like to get some output before, especially for
those who own a low latency switching driver like speedstep-centrino.
Since it's a time based thing, I hacked actually ondemand.

Comments are of course welcome!

--- linux-2.6.10-rc3/drivers/cpufreq/Kconfig	2004/12/15 16:59:28	1.1
+++ linux-2.6.10-rc3/drivers/cpufreq/Kconfig	2004/12/15 17:06:16
@@ -127,3 +127,17 @@ config CPU_FREQ_GOV_ONDEMAND
 	  For details, take a look at linux/Documentation/cpu-freq.
 
 	  If in doubt, say N.
+
+config CPU_FREQ_GOV_PAST
+	tristate "'PAST' cpufreq policy governor"
+	depends on CPU_FREQ
+	help
+	  'past' - This driver adds a dynamic cpufreq policy governor.
+	  The governor does a periodic polling and 
+	  changes frequency based on the CPU utilization.
+	  The algorithm used is somehow the one found in
+	  "Scheduling for Reduced CPU Energy", 1984, Mark Weiser et al.
+
+	  For details, take a look at linux/Documentation/cpu-freq.
+
+	  If in doubt, say N.
--- linux-2.6.10-rc3/drivers/cpufreq/Makefile	2004/12/15 16:58:42	1.1
+++ linux-2.6.10-rc3/drivers/cpufreq/Makefile	2004/12/15 16:59:23
@@ -6,6 +6,7 @@ obj-$(CONFIG_CPU_FREQ_GOV_PERFORMANCE)	+
 obj-$(CONFIG_CPU_FREQ_GOV_POWERSAVE)	+= cpufreq_powersave.o
 obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+= cpufreq_userspace.o
 obj-$(CONFIG_CPU_FREQ_GOV_ONDEMAND)	+= cpufreq_ondemand.o
+obj-$(CONFIG_CPU_FREQ_GOV_PAST)		+= cpufreq_past.o
 
 # CPUfreq cross-arch helpers
 obj-$(CONFIG_CPU_FREQ_TABLE)		+= freq_table.o
--- /dev/null	2004-08-12 12:24:12.000000000 +0200
+++ linux-2.6.10-rc3/drivers/cpufreq/cpufreq_past.c	2004-12-15 17:58:15.000000000 +0100
@@ -0,0 +1,421 @@
+/*
+ *  drivers/cpufreq/cpufreq_past.c
+ *
+ *  Copyright (C)  2001 Russell King
+ *            (C)  2003 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>.
+ *                      Jun Nakajima <jun.nakajima@intel.com>
+ *
+ *  Copyright (C)  2004 Bruno Ducrot
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/config.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/smp.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/ctype.h>
+#include <linux/cpufreq.h>
+#include <linux/sysctl.h>
+#include <linux/types.h>
+#include <linux/fs.h>
+#include <linux/sysfs.h>
+#include <linux/sched.h>
+#include <linux/kmod.h>
+#include <linux/workqueue.h>
+#include <linux/jiffies.h>
+#include <linux/config.h>
+#include <linux/kernel_stat.h>
+#include <linux/percpu.h>
+
+
+#define DEF_FREQUENCY_UP_THRESHOLD		(70)
+#define MIN_FREQUENCY_UP_THRESHOLD		(0)
+#define MAX_FREQUENCY_UP_THRESHOLD		(100)
+
+#define DEF_FREQUENCY_DOWN_THRESHOLD		(50)
+#define MIN_FREQUENCY_DOWN_THRESHOLD		(0)
+#define MAX_FREQUENCY_DOWN_THRESHOLD		(100)
+
+/* 
+ * The polling frequency of this governor depends on the capability of 
+ * the processor. Default polling frequency is 1000 times the transition
+ * latency of the processor. The governor will work on any processor with 
+ * transition latency <= 10mS, using appropriate sampling 
+ * rate.
+ * For CPUs with transition latency > 10mS (mostly drivers with CPUFREQ_ETERNAL)
+ * this governor will not work.
+ * All times here are in uS.
+ */
+static unsigned int 				def_sampling_rate;
+#define MIN_SAMPLING_RATE			(def_sampling_rate / 2)
+#define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
+#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
+#define TRANSITION_LATENCY_LIMIT		(10 * 1000)
+#define sampling_rate_in_HZ(x)			((x * HZ) / (1000 * 1000))
+
+static void do_past_timer(void *data);
+
+struct cpu_past_info_s {
+	struct cpufreq_policy 	*cur_policy;
+	u64 iowait;
+	u64 idle;
+	u64 run;
+	u64 excess_ticks;
+	unsigned int 		enable;
+};
+static DEFINE_PER_CPU(struct cpu_past_info_s, cpu_past_info);
+
+static unsigned int past_enable;	/* number of CPUs using this policy */
+
+static DECLARE_MUTEX 	(past_sem);
+static DECLARE_WORK	(past_work, do_past_timer, NULL);
+
+struct past_tuners {
+	unsigned int 		sampling_rate;
+	unsigned int		up_threshold;
+	unsigned int		down_threshold;
+};
+
+struct past_tuners past_tuners_ins = {
+	.up_threshold 		= DEF_FREQUENCY_UP_THRESHOLD,
+	.down_threshold 	= DEF_FREQUENCY_DOWN_THRESHOLD,
+};
+
+/************************** sysfs interface ************************/
+static ssize_t show_sampling_rate_max(struct cpufreq_policy *policy, char *buf)
+{
+	return sprintf (buf, "%u\n", MAX_SAMPLING_RATE);
+}
+
+static ssize_t show_sampling_rate_min(struct cpufreq_policy *policy, char *buf)
+{
+	return sprintf (buf, "%u\n", MIN_SAMPLING_RATE);
+}
+
+#define define_one_ro(_name) 					\
+static struct freq_attr _name = { 				\
+	.attr = { .name = __stringify(_name), .mode = 0444 }, 	\
+	.show = show_##_name, 					\
+}
+
+define_one_ro(sampling_rate_max);
+define_one_ro(sampling_rate_min);
+
+/* cpufreq_past Governor Tunables */
+#define show_one(file_name, object)					\
+static ssize_t show_##file_name						\
+(struct cpufreq_policy *unused, char *buf)				\
+{									\
+	return sprintf(buf, "%u\n", past_tuners_ins.object);		\
+}
+show_one(sampling_rate, sampling_rate);
+show_one(up_threshold, up_threshold);
+show_one(down_threshold, down_threshold);
+
+static ssize_t store_sampling_rate(struct cpufreq_policy *unused, 
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+	ret = sscanf (buf, "%u", &input);
+	down(&past_sem);
+	if (ret != 1 || input > MAX_SAMPLING_RATE || input < MIN_SAMPLING_RATE)
+		goto out;
+
+	past_tuners_ins.sampling_rate = input;
+out:
+	up(&past_sem);
+	return count;
+}
+
+static ssize_t store_up_threshold(struct cpufreq_policy *unused, 
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+	ret = sscanf (buf, "%u", &input);
+	down(&past_sem);
+	if (ret != 1 || input > MAX_FREQUENCY_UP_THRESHOLD || 
+			input < MIN_FREQUENCY_UP_THRESHOLD ||
+			input <= past_tuners_ins.down_threshold)
+		goto out;
+
+	past_tuners_ins.up_threshold = input;
+out:
+	up(&past_sem);
+	return count;
+}
+
+static ssize_t store_down_threshold(struct cpufreq_policy *unused, 
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+	ret = sscanf (buf, "%u", &input);
+	down(&past_sem);
+	if (ret != 1 || input > MAX_FREQUENCY_DOWN_THRESHOLD || 
+			input < MIN_FREQUENCY_DOWN_THRESHOLD ||
+			input >= past_tuners_ins.up_threshold)
+		goto out;
+
+	past_tuners_ins.down_threshold = input;
+out:
+	up(&past_sem);
+	return count;
+}
+
+#define define_one_rw(_name) 					\
+static struct freq_attr _name = { 				\
+	.attr = { .name = __stringify(_name), .mode = 0644 }, 	\
+	.show = show_##_name, 					\
+	.store = store_##_name, 				\
+}
+
+define_one_rw(sampling_rate);
+define_one_rw(up_threshold);
+define_one_rw(down_threshold);
+
+static struct attribute * past_attributes[] = {
+	&sampling_rate_max.attr,
+	&sampling_rate_min.attr,
+	&sampling_rate.attr,
+	&up_threshold.attr,
+	&down_threshold.attr,
+	NULL
+};
+
+static struct attribute_group past_attr_group = {
+	.attrs = past_attributes,
+	.name = "past",
+};
+
+/************************** sysfs end ************************/
+
+static void past_check_cpu(int cpu)
+{
+	unsigned int idle_ticks;
+	unsigned int iowait_ticks;
+	unsigned int run_ticks;
+	unsigned int excess_ticks;
+	int next_excess;
+	int min_freq;
+	unsigned int down_idle_ticks, up_idle_ticks;
+
+	struct cpu_past_info_s *this_past_info;
+
+	this_past_info = &per_cpu(cpu_past_info, cpu);
+	if (!this_past_info->enable)
+		return;
+
+	iowait_ticks = kstat_cpu(cpu).cpustat.iowait -
+		this_past_info->iowait;
+	this_past_info->iowait += iowait_ticks;
+
+	idle_ticks = kstat_cpu(cpu).cpustat.idle -
+		this_past_info->idle;
+	this_past_info->idle += idle_ticks;
+
+	run_ticks = kstat_cpu(cpu).cpustat.user +
+		kstat_cpu(cpu).cpustat.nice +
+		kstat_cpu(cpu).cpustat.system +
+		kstat_cpu(cpu).cpustat.softirq +
+		kstat_cpu(cpu).cpustat.irq
+		- this_past_info->run;
+	this_past_info->run += run_ticks;
+
+	run_ticks += this_past_info->excess_ticks;
+
+	next_excess = run_ticks -
+			cpufreq_scale(run_ticks + idle_ticks,
+				this_past_info->cur_policy->max,
+				this_past_info->cur_policy->cur);
+	if (next_excess < 0)
+		next_excess = 0;
+
+	excess_ticks = this_past_info->excess_ticks;
+	this_past_info->excess_ticks = next_excess;
+
+	if (this_past_info->cur_policy->cur < this_past_info->cur_policy->max) {
+		if (excess_ticks > idle_ticks + iowait_ticks) {
+			__cpufreq_driver_target(this_past_info->cur_policy,
+				this_past_info->cur_policy->max, 
+				CPUFREQ_RELATION_H);
+			return;
+		}
+
+		up_idle_ticks = (100 - past_tuners_ins.up_threshold) *
+				sampling_rate_in_HZ(past_tuners_ins.sampling_rate) / 100;
+
+		if (idle_ticks + iowait_ticks < up_idle_ticks) {
+			__cpufreq_driver_target(this_past_info->cur_policy,
+				this_past_info->cur_policy->cur +
+					(20 * this_past_info->cur_policy->max) / 100,
+				CPUFREQ_RELATION_H);
+			return;
+		}
+	}
+
+	if (this_past_info->cur_policy->cur <= this_past_info->cur_policy->min)
+		return;
+
+	down_idle_ticks = (100 - past_tuners_ins.down_threshold) *
+			sampling_rate_in_HZ(past_tuners_ins.sampling_rate) / 100;
+	if (idle_ticks + iowait_ticks > down_idle_ticks ) {
+		min_freq = this_past_info->cur_policy->cur - 
+			   ((60 - (100 * run_ticks / (iowait_ticks + idle_ticks + run_ticks)))
+				 * this_past_info->cur_policy->max) / 100;
+		if (min_freq < 0)
+			min_freq = 0;
+
+		__cpufreq_driver_target(this_past_info->cur_policy,
+				min_freq,
+			CPUFREQ_RELATION_H);
+		return;
+	}
+}
+
+static void do_past_timer(void *data)
+{ 
+	int i;
+	down(&past_sem);
+	for (i = 0; i < NR_CPUS; i++)
+		if (cpu_online(i))
+			past_check_cpu(i);
+	schedule_delayed_work(&past_work, 
+			sampling_rate_in_HZ(past_tuners_ins.sampling_rate));
+	up(&past_sem);
+} 
+
+static inline void past_timer_init(void)
+{
+	INIT_WORK(&past_work, do_past_timer, NULL);
+	schedule_delayed_work(&past_work, 
+			sampling_rate_in_HZ(past_tuners_ins.sampling_rate));
+	return;
+}
+
+static inline void past_timer_exit(void)
+{
+	cancel_delayed_work(&past_work);
+	return;
+}
+
+static int cpufreq_governor_past(struct cpufreq_policy *policy,
+				   unsigned int event)
+{
+	unsigned int cpu = policy->cpu;
+	struct cpu_past_info_s *this_past_info;
+
+	this_past_info = &per_cpu(cpu_past_info, cpu);
+
+	switch (event) {
+	case CPUFREQ_GOV_START:
+		if ((!cpu_online(cpu)) || 
+		    (!policy->cur))
+			return -EINVAL;
+
+		if (policy->cpuinfo.transition_latency >
+				(TRANSITION_LATENCY_LIMIT * 1000))
+			return -EINVAL;
+		if (this_past_info->enable) /* Already enabled */
+			break;
+		 
+		down(&past_sem);
+		this_past_info->cur_policy = policy;
+		
+		this_past_info->iowait = 
+				kstat_cpu(cpu).cpustat.iowait;
+		this_past_info->idle = 
+				kstat_cpu(cpu).cpustat.idle;
+		this_past_info->run = kstat_cpu(cpu).cpustat.user +
+				kstat_cpu(cpu).cpustat.nice +
+				kstat_cpu(cpu).cpustat.system +
+				kstat_cpu(cpu).cpustat.softirq +
+				kstat_cpu(cpu).cpustat.irq;
+		this_past_info->excess_ticks = 0;
+
+		this_past_info->enable = 1;
+		sysfs_create_group(&policy->kobj, &past_attr_group);
+		past_enable++;
+		/*
+		 * Start the timerschedule work, when this governor
+		 * is used for first time
+		 */
+		if (past_enable == 1) {
+			/* policy latency is in nS. Convert it to uS first */
+			def_sampling_rate = (policy->cpuinfo.transition_latency / 1000) *
+					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
+			past_tuners_ins.sampling_rate = def_sampling_rate;
+
+			past_timer_init();
+		}
+		
+		up(&past_sem);
+		break;
+
+	case CPUFREQ_GOV_STOP:
+		down(&past_sem);
+		this_past_info->enable = 0;
+		sysfs_remove_group(&policy->kobj, &past_attr_group);
+		past_enable--;
+		/*
+		 * Stop the timerschedule work, when this governor
+		 * is used for first time
+		 */
+		if (past_enable == 0) 
+			past_timer_exit();
+		
+		up(&past_sem);
+
+		break;
+
+	case CPUFREQ_GOV_LIMITS:
+		down(&past_sem);
+		if (policy->max < this_past_info->cur_policy->cur)
+			__cpufreq_driver_target(
+					this_past_info->cur_policy,
+				       	policy->max, CPUFREQ_RELATION_H);
+		else if (policy->min > this_past_info->cur_policy->cur)
+			__cpufreq_driver_target(
+					this_past_info->cur_policy,
+				       	policy->min, CPUFREQ_RELATION_L);
+		up(&past_sem);
+		break;
+	}
+	return 0;
+}
+
+struct cpufreq_governor cpufreq_gov_past = {
+	.name		= "past",
+	.governor	= cpufreq_governor_past,
+	.owner		= THIS_MODULE,
+};
+EXPORT_SYMBOL(cpufreq_gov_past);
+
+static int __init cpufreq_gov_past_init(void)
+{
+	return cpufreq_register_governor(&cpufreq_gov_past);
+}
+
+static void __exit cpufreq_gov_past_exit(void)
+{
+	/* Make sure that the scheduled work is indeed not running */
+	flush_scheduled_work();
+
+	cpufreq_unregister_governor(&cpufreq_gov_past);
+}
+
+
+MODULE_AUTHOR ("Bruno Ducrot <ducrot@poupinou.org>");
+MODULE_DESCRIPTION ("'cpufreq_past' - A dynamic cpufreq governor "
+		"using the PAST algorythm for "
+		"Low Latency Frequency Transition capable processors");
+MODULE_LICENSE ("GPL");
+
+module_init(cpufreq_gov_past_init);
+module_exit(cpufreq_gov_past_exit);


Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
