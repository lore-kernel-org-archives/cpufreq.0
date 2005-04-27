From: "Mark Bidewell" <mark.bidewell@alumni.clemson.edu>
Subject: Possible CPUFreq governor
Date: Tue, 26 Apr 2005 20:13:54 -0400 (EDT)
Message-ID: <46023.130.127.49.120.1114560834.squirrel@130.127.49.120>
Reply-To: mark.bidewell@alumni.clemson.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

I am attaching a Linux kernel patch which supplies a new CPUFreq governor
for the CPUFreq interface.  It allows a user or daemon to reduce the
thermal output of a mobile processor by reducing the frequency at which
non-interactive processes are run.  It has been extensively tested on the
2.6.11.x kernels on a P4-M 3.2 GHz machine.

Mark Bidewell

diff -Nur linux-2.6.11.6/drivers/cpufreq/cpufreq_tempscale.c
linux-sysfs/drivers/cpufreq/cpufreq_tempscale.c
--- linux-2.6.11.6/drivers/cpufreq/cpufreq_tempscale.c	1969-12-31
19:00:00.000000000 -0500
+++ linux-sysfs/drivers/cpufreq/cpufreq_tempscale.c	2005-04-06
22:56:36.000000000 -0400
@@ -0,0 +1,199 @@
+/*
+ *  linux/drivers/cpufreq/cpufreq_tempscale.c
+ *
+ *  Copyright (C) 2005  Mark Bidewell <mark.bidewell@alumni.clemson.edu
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/cpufreq.h>
+#include <linux/init.h>
+
+#define define_one_ro(_name) 					\
+static struct freq_attr _name =  				\
+__ATTR(_name, 0444, show_##_name, NULL)
+
+#define define_one_rw(_name) 					\
+static struct freq_attr _name =  				\
+__ATTR(_name, 0644, show_##_name,store_##_name)
+
+#define TRACK_NUM 5000
+
+void set_proc_stats(struct task_struct *t);
+
+struct task_param{
+	unsigned int pid;
+	unsigned int speed;
+};
+
+unsigned compute_spd=0;
+struct cpufreq_policy	*cpupolicy;
+static char enabled=0;
+
+
+
+void scale_proc_freq(struct task_struct *t, int tsk_intr)
+{
+	if(!enabled) return;
+	if(!cpupolicy) return;
+	if(t->prev_state & TASK_UNINTERRUPTIBLE){
+		__cpufreq_driver_target(cpupolicy, cpupolicy->max, CPUFREQ_RELATION_H);
+		return;
+	}
+	if(!tsk_intr){
+		if(compute_spd && cpupolicy->cur != compute_spd){
+			__cpufreq_driver_target(cpupolicy, compute_spd, CPUFREQ_RELATION_H);
+			compute_spd = cpupolicy->cur;
+		}
+	}
+	else {
+		if(cpupolicy->cur <= compute_spd){
+			__cpufreq_driver_target(cpupolicy, cpupolicy->max, CPUFREQ_RELATION_H);
+		}
+	}
+	#ifdef CONFIG_CPU_FREQ_GOV_TEMPSCALE_DBG
+		set_proc_stats(t);
+	#endif
+	return;
+}
+
+/*
+ *  SysFS tuning knobs  and information
+ */
+
+static ssize_t show_computebound_setspeed(struct cpufreq_policy *unused,
char *buf)
+{
+	return sprintf (buf, "%u\n", compute_spd);
+}
+static ssize_t store_computebound_setspeed(struct cpufreq_policy *unused,
const char *buf, size_t count)
+{
+	sscanf(buf, "%u", &compute_spd);
+	return count;
+}
+
+#ifdef CONFIG_CPU_FREQ_GOV_TEMPSCALE_DBG
+
+	struct task_param tasks[TRACK_NUM];
+	unsigned int curtask=0;
+
+	void set_proc_stats(struct task_struct *t)
+	{
+		struct task_param *tsk = &tasks[curtask];
+		curtask = (curtask+1) % TRACK_NUM;
+		tsk->pid = t->pid;
+		tsk->speed = cpufreq_get(0);
+	}
+
+	static ssize_t show_tempscale_stats(struct cpufreq_policy *unused, char
*buf){
+		int i;
+		int numtasks=curtask;
+		int sz=0;
+		unsigned maxspeed=0, minspeed=0xFFFFFFFF;
+		unsigned nummax=0, nummin=0;
+
+		for(i=0; i < numtasks; i++){
+			if(tasks[i].speed >= maxspeed){
+				maxspeed = tasks[i].speed;
+				nummax++;
+			}
+			if(tasks[i].speed <= minspeed){
+				minspeed = tasks[i].speed;
+				nummin++;
+			}
+		}
+		curtask=0;
+		sz = sprintf(buf, "Number of tasks:  %u\n", numtasks);
+		sz += sprintf(buf, "%sMax speed: %u\n", buf, maxspeed);
+		sz += sprintf(buf, "%sMin speed: %u\n", buf, minspeed);
+		sz += sprintf(buf, "%sNumber max speed: %u\n", buf, nummax);
+		sz += sprintf(buf, "%sNumber min speed: %u\n", buf, nummin);
+		return sz;
+	}
+	static ssize_t show_tempscale_data(struct cpufreq_policy *unused, char
*buf){
+		int i;
+		int numtasks=curtask;
+		int sz=0;
+		unsigned maxspeed=0, minspeed=0xFFFFFFFF;
+		unsigned nummax=0, nummin=0;
+		sz=sprintf(buf, "PID\tFREQ\n");
+		sz+=sprintf(buf, "%s------\t------\n", buf);
+		if(numtasks > 10) {
+			i = numtasks-10;
+		}
+		else{
+			i=0;
+		}
+		for(; i < numtasks; i++){
+			sz+=sprintf(buf, "%s%u\t%u\n",buf, tasks[i].pid, tasks[i].speed);
+		}
+		return sz;
+	}
+	define_one_ro(tempscale_stats);
+	define_one_ro(tempscale_data);
+#endif
+define_one_rw(computebound_setspeed);
+
+static struct attribute * tempscale_attributes[] = {
+	&computebound_setspeed.attr,
+	#ifdef CONFIG_CPU_FREQ_GOV_TEMPSCALE_DBG
+		&tempscale_stats.attr,
+		&tempscale_data.attr,
+	#endif
+	NULL
+};
+
+static struct attribute_group tempscale_attr_group = {
+	.attrs = tempscale_attributes,
+	.name = "tempscale",
+};
+
+
+static int cpufreq_governor_tempscale(struct cpufreq_policy *policy,
+					unsigned int event)
+{
+	compute_spd=policy->max;
+	cpupolicy = policy;
+	switch (event) {
+	case CPUFREQ_GOV_START:
+		enabled=1;
+		sysfs_create_group(&policy->kobj, &tempscale_attr_group);
+		break;
+	case CPUFREQ_GOV_STOP:
+		enabled=0;
+		sysfs_remove_group(&policy->kobj, &tempscale_attr_group);
+		__cpufreq_driver_target(policy, policy->max, CPUFREQ_RELATION_H);
+		break;
+	}
+	return 0;
+}
+
+static struct cpufreq_governor cpufreq_gov_tempscale = {
+	.name		= "tempscale",
+	.governor	= cpufreq_governor_tempscale,
+	.owner		= THIS_MODULE,
+};
+
+
+static int __init cpufreq_gov_tempscale_init(void)
+{
+	return cpufreq_register_governor(&cpufreq_gov_tempscale);
+}
+
+
+static void __exit cpufreq_gov_tempscale_exit(void)
+{
+	cpufreq_unregister_governor(&cpufreq_gov_tempscale);
+}
+
+
+MODULE_AUTHOR("Mark Bidewell <mark.bidewell@alumni.clemson.edu");
+MODULE_DESCRIPTION("CPUfreq policy governor 'tempscale'");
+MODULE_LICENSE("GPL");
+
+module_init(cpufreq_gov_tempscale_init);
+module_exit(cpufreq_gov_tempscale_exit);
diff -Nur linux-2.6.11.6/drivers/cpufreq/Kconfig
linux-sysfs/drivers/cpufreq/Kconfig
--- linux-2.6.11.6/drivers/cpufreq/Kconfig	2005-03-25 22:28:36.000000000
-0500
+++ linux-sysfs/drivers/cpufreq/Kconfig	2005-04-06 22:56:36.000000000 -0400
@@ -116,3 +116,14 @@
 	  For details, take a look at linux/Documentation/cpu-freq.

 	  If in doubt, say N.
+config CPU_FREQ_GOV_TEMPSCALE
+        bool "Temperature Aware Scheduling support"
+        depends on CPU_FREQ
+        help
+          Enables system calls which allow scaling performance between
+          Interactive and non-interactive processes.
+config CPU_FREQ_GOV_TEMPSCALE_DBG
+        bool "Statistics for temperature scaling"
+        depends on CPU_FREQ && CPU_FREQ_GOV_TEMPSCALE
+        help
+          Collect statistics on CPU temperature scaling
diff -Nur linux-2.6.11.6/drivers/cpufreq/Makefile
linux-sysfs/drivers/cpufreq/Makefile
--- linux-2.6.11.6/drivers/cpufreq/Makefile	2005-03-25 22:28:39.000000000
-0500
+++ linux-sysfs/drivers/cpufreq/Makefile	2005-04-06 22:56:36.000000000 -0400
@@ -8,7 +8,7 @@
 obj-$(CONFIG_CPU_FREQ_GOV_POWERSAVE)	+= cpufreq_powersave.o
 obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+= cpufreq_userspace.o
 obj-$(CONFIG_CPU_FREQ_GOV_ONDEMAND)	+= cpufreq_ondemand.o
-
+obj-$(CONFIG_CPU_FREQ_GOV_TEMPSCALE)	+= cpufreq_tempscale.o
 # CPUfreq cross-arch helpers
 obj-$(CONFIG_CPU_FREQ_TABLE)		+= freq_table.o

diff -Nur linux-2.6.11.6/include/linux/sched.h
linux-sysfs/include/linux/sched.h
--- linux-2.6.11.6/include/linux/sched.h	2005-03-25 22:28:15.000000000 -0500
+++ linux-sysfs/include/linux/sched.h	2005-04-06 22:55:44.000000000 -0400
@@ -112,14 +112,12 @@
 #define EXIT_DEAD		32

 #define __set_task_state(tsk, state_value)		\
-	do { (tsk)->state = (state_value); } while (0)
-#define set_task_state(tsk, state_value)		\
-	set_mb((tsk)->state, (state_value))
+	do {(tsk)->prev_state=(tsk)->state; (tsk)->state = (state_value); }
while (0)

 #define __set_current_state(state_value)			\
-	do { current->state = (state_value); } while (0)
-#define set_current_state(state_value)		\
-	set_mb(current->state, (state_value))
+	do {current->prev_state=current->state; current->state = (state_value);
} while (0)
+
+

 /* Task command name length */
 #define TASK_COMM_LEN 16
@@ -526,7 +524,7 @@
 struct mempolicy;

 struct task_struct {
-	volatile long state;	/* -1 unrunnable, 0 runnable, >0 stopped */
+	volatile long prev_state, state;	/* -1 unrunnable, 0 runnable, >0
stopped */
 	struct thread_info *thread_info;
 	atomic_t usage;
 	unsigned long flags;	/* per process flags, defined below */
@@ -1216,4 +1214,13 @@
 #endif /* CONFIG_PM */
 #endif /* __KERNEL__ */

+/*Change by Mark Bidewell*/
+inline static void set_task_state(struct task_struct *tsk, unsigned
state_value){
+	(tsk)->prev_state=(tsk)->state; set_mb((tsk)->state, (state_value));
+}
+/*Change by Mark Bidewell*/
+inline static void set_current_state(unsigned state_value){
+	current->prev_state=current->state; set_mb(current->state, (state_value));
+}
+
 #endif
diff -Nur linux-2.6.11.6/kernel/sched.c linux-sysfs/kernel/sched.c
--- linux-2.6.11.6/kernel/sched.c	2005-03-25 22:28:26.000000000 -0500
+++ linux-sysfs/kernel/sched.c	2005-04-06 22:55:33.000000000 -0400
@@ -2822,6 +2822,12 @@
 	prev = current;
 	if (unlikely(reacquire_kernel_lock(prev) < 0))
 		goto need_resched_nonpreemptible;
+	/*
+	 * Put thermal stuff here
+	 */
+	#ifdef CONFIG_CPU_FREQ_GOV_TEMPSCALE
+		scale_proc_freq(next, TASK_INTERACTIVE(next));
+	#endif
 	preempt_enable_no_resched();
 	if (unlikely(test_thread_flag(TIF_NEED_RESCHED)))
 		goto need_resched;
