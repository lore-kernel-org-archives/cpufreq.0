From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/drivers/cpufreq cpufreq_performance.c, NONE,
	1.1 cpufreq_powersave.c, NONE, 1.1 cpufreq_userspace.c, NONE,
	1.1 Kconfig, 1.2, 1.3 Makefile, 1.4, 1.5 cpufreq.c, 1.2,
	1.3 proc_intf.c, 1.2, 1.3 userspace.c, 1.5, NONE
Date: Wed, 05 Nov 2003 18:27:48 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AHSNg-0000Yv-TW@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv2114/linux/drivers/cpufreq

Modified Files:
	Kconfig Makefile cpufreq.c proc_intf.c 
Added Files:
	cpufreq_performance.c cpufreq_powersave.c cpufreq_userspace.c 
Removed Files:
	userspace.c 
Log Message:
Merge with davej cpufreq bk tree.

--- NEW FILE cpufreq_performance.c ---
/*
 *  linux/drivers/cpufreq/cpufreq_performance.c
 *
 *  Copyright (C) 2002 - 2003 Dominik Brodowski <linux@brodo.de>
 *
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/cpufreq.h>
#include <linux/init.h>

static int cpufreq_governor_performance(struct cpufreq_policy *policy,
					unsigned int event)
{
	switch (event) {
	case CPUFREQ_GOV_START:
	case CPUFREQ_GOV_LIMITS:
		__cpufreq_driver_target(policy, policy->max, CPUFREQ_RELATION_H);
		break;
	default:
		break;
	}
	return 0;
}
                                                            
struct cpufreq_governor cpufreq_gov_performance = {
	.name		= "performance",
	.governor	= cpufreq_governor_performance,
	.owner		= THIS_MODULE,
};
EXPORT_SYMBOL(cpufreq_gov_performance);


static int __init cpufreq_gov_performance_init(void)
{
	return cpufreq_register_governor(&cpufreq_gov_performance);
}


static void __exit cpufreq_gov_performance_exit(void)
{
	cpufreq_unregister_governor(&cpufreq_gov_performance);
}


MODULE_AUTHOR("Dominik Brodowski <linux@brodo.de>");
MODULE_DESCRIPTION("CPUfreq policy governor 'performance'");
MODULE_LICENSE("GPL");

fs_initcall(cpufreq_gov_performance_init);
module_exit(cpufreq_gov_performance_exit);

--- NEW FILE cpufreq_powersave.c ---
/*
 *  linux/drivers/cpufreq/cpufreq_powersave.c
 *
 *  Copyright (C) 2002 - 2003 Dominik Brodowski <linux@brodo.de>
 *
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/cpufreq.h>
#include <linux/init.h>

static int cpufreq_governor_powersave(struct cpufreq_policy *policy,
					unsigned int event)
{
	switch (event) {
	case CPUFREQ_GOV_START:
	case CPUFREQ_GOV_LIMITS:
		__cpufreq_driver_target(policy, policy->min, CPUFREQ_RELATION_L);
		break;
	default:
		break;
	}
	return 0;
}
                                                            
static struct cpufreq_governor cpufreq_gov_powersave = {
	.name		= "powersave",
	.governor	= cpufreq_governor_powersave,
	.owner		= THIS_MODULE,
};


static int __init cpufreq_gov_powersave_init(void)
{
	return cpufreq_register_governor(&cpufreq_gov_powersave);
}


static void __exit cpufreq_gov_powersave_exit(void)
{
	cpufreq_unregister_governor(&cpufreq_gov_powersave);
}


MODULE_AUTHOR("Dominik Brodowski <linux@brodo.de>");
MODULE_DESCRIPTION("CPUfreq policy governor 'powersave'");
MODULE_LICENSE("GPL");

module_init(cpufreq_gov_powersave_init);
module_exit(cpufreq_gov_powersave_exit);

--- NEW FILE cpufreq_userspace.c ---
/*
 *  linux/drivers/cpufreq/cpufreq_userspace.c
 *
 *  Copyright (C)  2001 Russell King
 *            (C)  2002 - 2003 Dominik Brodowski <linux@brodo.de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 */

#include <linux/config.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/smp.h>
#include <linux/init.h>
#include <linux/spinlock.h>
#include <linux/interrupt.h>
#include <linux/ctype.h>
#include <linux/cpufreq.h>
#include <linux/sysctl.h>
#include <linux/types.h>
#include <linux/fs.h>
#include <linux/sysfs.h>

#include <asm/uaccess.h>

#define CTL_CPU_VARS_SPEED_MAX(cpunr) { \
                .ctl_name	= CPU_NR_FREQ_MAX, \
                .data		= &cpu_max_freq[cpunr], \
                .procname	= "speed-max", \
                .maxlen		= sizeof(cpu_max_freq[cpunr]),\
                .mode		= 0444, \
                .proc_handler	= proc_dointvec, }

#define CTL_CPU_VARS_SPEED_MIN(cpunr) { \
                .ctl_name	= CPU_NR_FREQ_MIN, \
                .data		= &cpu_min_freq[cpunr], \
                .procname	= "speed-min", \
                .maxlen		= sizeof(cpu_min_freq[cpunr]),\
                .mode		= 0444, \
                .proc_handler	= proc_dointvec, }

#define CTL_CPU_VARS_SPEED(cpunr) { \
                .ctl_name	= CPU_NR_FREQ, \
                .procname	= "speed", \
                .mode		= 0644, \
                .proc_handler	= cpufreq_procctl, \
                .strategy	= cpufreq_sysctl, \
                .extra1		= (void*) (cpunr), }

#define CTL_TABLE_CPU_VARS(cpunr) static ctl_table ctl_cpu_vars_##cpunr[] = {\
                CTL_CPU_VARS_SPEED_MAX(cpunr), \
                CTL_CPU_VARS_SPEED_MIN(cpunr), \
                CTL_CPU_VARS_SPEED(cpunr),  \
                { .ctl_name = 0, }, }

/* the ctl_table entry for each CPU */
#define CPU_ENUM(s) { \
                .ctl_name	= (CPU_NR + s), \
                .procname	= #s, \
                .mode		= 0555, \
                .child		= ctl_cpu_vars_##s }

/**
 * A few values needed by the userspace governor
 */
static unsigned int	cpu_max_freq[NR_CPUS];
static unsigned int	cpu_min_freq[NR_CPUS];
static unsigned int	cpu_cur_freq[NR_CPUS];
static unsigned int	cpu_is_managed[NR_CPUS];
static struct cpufreq_policy current_policy[NR_CPUS];

static DECLARE_MUTEX	(userspace_sem); 


/* keep track of frequency transitions */
static int 
userspace_cpufreq_notifier(struct notifier_block *nb, unsigned long val,
                       void *data)
{
        struct cpufreq_freqs *freq = data;

	cpu_cur_freq[freq->cpu] = freq->new;

        return 0;
}

static struct notifier_block userspace_cpufreq_notifier_block = {
        .notifier_call  = userspace_cpufreq_notifier
};


/** 
 * cpufreq_set - set the CPU frequency
 * @freq: target frequency in kHz
 * @cpu: CPU for which the frequency is to be set
 *
 * Sets the CPU frequency to freq.
 */
int cpufreq_set(unsigned int freq, unsigned int cpu)
{
	int ret = -EINVAL;

	down(&userspace_sem);
	if (!cpu_is_managed[cpu])
		goto err;

	if (freq < cpu_min_freq[cpu])
		freq = cpu_min_freq[cpu];
	if (freq > cpu_max_freq[cpu])
		freq = cpu_max_freq[cpu];

	ret = cpufreq_driver_target(&current_policy[cpu], freq, 
	      CPUFREQ_RELATION_L);

 err:
	up(&userspace_sem);
	return ret;
}
EXPORT_SYMBOL_GPL(cpufreq_set);


/** 
 * cpufreq_setmax - set the CPU to the maximum frequency
 * @cpu - affected cpu;
 *
 * Sets the CPU frequency to the maximum frequency supported by
 * this CPU.
 */
int cpufreq_setmax(unsigned int cpu)
{
	if (!cpu_is_managed[cpu] || !cpu_online(cpu))
		return -EINVAL;
	return cpufreq_set(cpu_max_freq[cpu], cpu);
}
EXPORT_SYMBOL_GPL(cpufreq_setmax);


/** 
 * cpufreq_get - get the current CPU frequency (in kHz)
 * @cpu: CPU number
 *
 * Get the CPU current (static) CPU frequency
 */
unsigned int cpufreq_get(unsigned int cpu)
{
	return cpu_cur_freq[cpu];
}
EXPORT_SYMBOL(cpufreq_get);


#ifdef CONFIG_CPU_FREQ_24_API


/*********************** cpufreq_sysctl interface ********************/
static int
cpufreq_procctl(ctl_table *ctl, int write, struct file *filp,
		void __user *buffer, size_t *lenp)
{
	char buf[16], *p;
	int cpu = (int) ctl->extra1;
	int len, left = *lenp;

	if (!left || (filp->f_pos && !write) || !cpu_online(cpu)) {
		*lenp = 0;
		return 0;
	}

	if (write) {
		unsigned int freq;

		len = left;
		if (left > sizeof(buf))
			left = sizeof(buf);
		if (copy_from_user(buf, buffer, left))
			return -EFAULT;
		buf[sizeof(buf) - 1] = '\0';

		freq = simple_strtoul(buf, &p, 0);
		cpufreq_set(freq, cpu);
	} else {
		len = sprintf(buf, "%d\n", cpufreq_get(cpu));
		if (len > left)
			len = left;
		if (copy_to_user(buffer, buf, len))
			return -EFAULT;
	}

	*lenp = len;
	filp->f_pos += len;
	return 0;
}

static int
cpufreq_sysctl(ctl_table *table, int __user *name, int nlen,
	       void __user *oldval, size_t __user *oldlenp,
	       void __user *newval, size_t newlen, void **context)
{
	int cpu = (int) table->extra1;

	if (!cpu_online(cpu))
		return -EINVAL;

	if (oldval && oldlenp) {
		size_t oldlen;

		if (get_user(oldlen, oldlenp))
			return -EFAULT;

		if (oldlen != sizeof(unsigned int))
			return -EINVAL;

		if (put_user(cpufreq_get(cpu), (unsigned int *)oldval) ||
		    put_user(sizeof(unsigned int), oldlenp))
			return -EFAULT;
	}
	if (newval && newlen) {
		unsigned int freq;

		if (newlen != sizeof(unsigned int))
			return -EINVAL;

		if (get_user(freq, (unsigned int *)newval))
			return -EFAULT;

		cpufreq_set(freq, cpu);
	}
	return 1;
}

/* ctl_table ctl_cpu_vars_{0,1,...,(NR_CPUS-1)} */
/* due to NR_CPUS tweaking, a lot of if/endifs are required, sorry */
        CTL_TABLE_CPU_VARS(0);
#if NR_CPUS > 1
	CTL_TABLE_CPU_VARS(1);
#endif
#if NR_CPUS > 2
	CTL_TABLE_CPU_VARS(2);
#endif
#if NR_CPUS > 3
	CTL_TABLE_CPU_VARS(3);
#endif
#if NR_CPUS > 4
	CTL_TABLE_CPU_VARS(4);
#endif
#if NR_CPUS > 5
	CTL_TABLE_CPU_VARS(5);
#endif
#if NR_CPUS > 6
	CTL_TABLE_CPU_VARS(6);
#endif
#if NR_CPUS > 7
	CTL_TABLE_CPU_VARS(7);
#endif
#if NR_CPUS > 8
	CTL_TABLE_CPU_VARS(8);
#endif
#if NR_CPUS > 9
	CTL_TABLE_CPU_VARS(9);
#endif
#if NR_CPUS > 10
	CTL_TABLE_CPU_VARS(10);
#endif
#if NR_CPUS > 11
	CTL_TABLE_CPU_VARS(11);
#endif
#if NR_CPUS > 12
	CTL_TABLE_CPU_VARS(12);
#endif
#if NR_CPUS > 13
	CTL_TABLE_CPU_VARS(13);
#endif
#if NR_CPUS > 14
	CTL_TABLE_CPU_VARS(14);
#endif
#if NR_CPUS > 15
	CTL_TABLE_CPU_VARS(15);
#endif
#if NR_CPUS > 16
	CTL_TABLE_CPU_VARS(16);
#endif
#if NR_CPUS > 17
	CTL_TABLE_CPU_VARS(17);
#endif
#if NR_CPUS > 18
	CTL_TABLE_CPU_VARS(18);
#endif
#if NR_CPUS > 19
	CTL_TABLE_CPU_VARS(19);
#endif
#if NR_CPUS > 20
	CTL_TABLE_CPU_VARS(20);
#endif
#if NR_CPUS > 21
	CTL_TABLE_CPU_VARS(21);
#endif
#if NR_CPUS > 22
	CTL_TABLE_CPU_VARS(22);
#endif
#if NR_CPUS > 23
	CTL_TABLE_CPU_VARS(23);
#endif
#if NR_CPUS > 24
	CTL_TABLE_CPU_VARS(24);
#endif
#if NR_CPUS > 25
	CTL_TABLE_CPU_VARS(25);
#endif
#if NR_CPUS > 26
	CTL_TABLE_CPU_VARS(26);
#endif
#if NR_CPUS > 27
	CTL_TABLE_CPU_VARS(27);
#endif
#if NR_CPUS > 28
	CTL_TABLE_CPU_VARS(28);
#endif
#if NR_CPUS > 29
	CTL_TABLE_CPU_VARS(29);
#endif
#if NR_CPUS > 30
	CTL_TABLE_CPU_VARS(30);
#endif
#if NR_CPUS > 31
	CTL_TABLE_CPU_VARS(31);
#endif
#if NR_CPUS > 32
#error please extend CPU enumeration
#endif

/* due to NR_CPUS tweaking, a lot of if/endifs are required, sorry */
static ctl_table ctl_cpu_table[NR_CPUS + 1] = {
	CPU_ENUM(0),
#if NR_CPUS > 1
	CPU_ENUM(1),
#endif
#if NR_CPUS > 2
	CPU_ENUM(2),
#endif
#if NR_CPUS > 3
	CPU_ENUM(3),
#endif
#if NR_CPUS > 4
	CPU_ENUM(4),
#endif
#if NR_CPUS > 5
	CPU_ENUM(5),
#endif
#if NR_CPUS > 6
	CPU_ENUM(6),
#endif
#if NR_CPUS > 7
	CPU_ENUM(7),
#endif
#if NR_CPUS > 8
	CPU_ENUM(8),
#endif
#if NR_CPUS > 9
	CPU_ENUM(9),
#endif
#if NR_CPUS > 10
	CPU_ENUM(10),
#endif
#if NR_CPUS > 11
	CPU_ENUM(11),
#endif
#if NR_CPUS > 12
	CPU_ENUM(12),
#endif
#if NR_CPUS > 13
	CPU_ENUM(13),
#endif
#if NR_CPUS > 14
	CPU_ENUM(14),
#endif
#if NR_CPUS > 15
	CPU_ENUM(15),
#endif
#if NR_CPUS > 16
	CPU_ENUM(16),
#endif
#if NR_CPUS > 17
	CPU_ENUM(17),
#endif
#if NR_CPUS > 18
	CPU_ENUM(18),
#endif
#if NR_CPUS > 19
	CPU_ENUM(19),
#endif
#if NR_CPUS > 20
	CPU_ENUM(20),
#endif
#if NR_CPUS > 21
	CPU_ENUM(21),
#endif
#if NR_CPUS > 22
	CPU_ENUM(22),
#endif
#if NR_CPUS > 23
	CPU_ENUM(23),
#endif
#if NR_CPUS > 24
	CPU_ENUM(24),
#endif
#if NR_CPUS > 25
	CPU_ENUM(25),
#endif
#if NR_CPUS > 26
	CPU_ENUM(26),
#endif
#if NR_CPUS > 27
	CPU_ENUM(27),
#endif
#if NR_CPUS > 28
	CPU_ENUM(28),
#endif
#if NR_CPUS > 29
	CPU_ENUM(29),
#endif
#if NR_CPUS > 30
	CPU_ENUM(30),
#endif
#if NR_CPUS > 31
	CPU_ENUM(31),
#endif
#if NR_CPUS > 32
#error please extend CPU enumeration
#endif
	{
		.ctl_name	= 0,
	}
};

static ctl_table ctl_cpu[2] = {
	{
		.ctl_name	= CTL_CPU,
		.procname	= "cpu",
		.mode		= 0555,
		.child		= ctl_cpu_table,
	},
	{
		.ctl_name	= 0,
	}
};

struct ctl_table_header *cpufreq_sysctl_table;

static inline void cpufreq_sysctl_init(void)
{
	cpufreq_sysctl_table = register_sysctl_table(ctl_cpu, 0);
}

static inline void cpufreq_sysctl_exit(void)
{
	unregister_sysctl_table(cpufreq_sysctl_table);
}

#else
#define cpufreq_sysctl_init() do {} while(0)
#define cpufreq_sysctl_exit() do {} while(0)
#endif /* CONFIG_CPU_FREQ_24API */


/************************** sysfs interface ************************/
static ssize_t show_speed (struct cpufreq_policy *policy, char *buf)
{
	return sprintf (buf, "%u\n", cpu_cur_freq[policy->cpu]);
}

static ssize_t 
store_speed (struct cpufreq_policy *policy, const char *buf, size_t count) 
{
	unsigned int freq = 0;
	unsigned int ret;

	ret = sscanf (buf, "%u", &freq);
	if (ret != 1)
		return -EINVAL;

	cpufreq_set(freq, policy->cpu);

	return count;
}

static struct freq_attr freq_attr_scaling_setspeed = {
	.attr = { .name = "scaling_setspeed", .mode = 0644 },
	.show = show_speed,
	.store = store_speed,
};

static int cpufreq_governor_userspace(struct cpufreq_policy *policy,
				   unsigned int event)
{
	unsigned int cpu = policy->cpu;
	switch (event) {
	case CPUFREQ_GOV_START:
		if ((!cpu_online(cpu)) || (!try_module_get(THIS_MODULE)))
			return -EINVAL;
		BUG_ON(!policy->cur);
		down(&userspace_sem);
		cpu_is_managed[cpu] = 1;		
		cpu_min_freq[cpu] = policy->min;
		cpu_max_freq[cpu] = policy->max;
		cpu_cur_freq[cpu] = policy->cur;
		sysfs_create_file (&policy->kobj, &freq_attr_scaling_setspeed.attr);
		memcpy (&current_policy[cpu], policy, sizeof(struct cpufreq_policy));
		up(&userspace_sem);
		break;
	case CPUFREQ_GOV_STOP:
		down(&userspace_sem);
		cpu_is_managed[cpu] = 0;
		cpu_min_freq[cpu] = 0;
		cpu_max_freq[cpu] = 0;
		sysfs_remove_file (&policy->kobj, &freq_attr_scaling_setspeed.attr);
		up(&userspace_sem);
		module_put(THIS_MODULE);
		break;
	case CPUFREQ_GOV_LIMITS:
		down(&userspace_sem);
		cpu_min_freq[cpu] = policy->min;
		cpu_max_freq[cpu] = policy->max;
		if (policy->max < cpu_cur_freq[cpu])
			__cpufreq_driver_target(&current_policy[cpu], policy->max, 
			      CPUFREQ_RELATION_H);
		else if (policy->min > cpu_cur_freq[cpu])
			__cpufreq_driver_target(&current_policy[cpu], policy->min, 
			      CPUFREQ_RELATION_L);
		memcpy (&current_policy[cpu], policy, sizeof(struct cpufreq_policy));
		up(&userspace_sem);
		break;
	}
	return 0;
}

/* on ARM SA1100 we need to rely on the values of cpufreq_get() - because 
 * of this, cpu_cur_freq[] needs to be set early.
 */
#if defined(CONFIG_ARM) && defined(CONFIG_ARCH_SA1100)
extern unsigned int sa11x0_getspeed(void);

static void cpufreq_sa11x0_compat(void)
{
	cpu_cur_freq[0] = sa11x0_getspeed();
}
#else
#define cpufreq_sa11x0_compat() do {} while(0)
#endif


struct cpufreq_governor cpufreq_gov_userspace = {
	.name		= "userspace",
	.governor	= cpufreq_governor_userspace,
	.owner		= THIS_MODULE,
};
EXPORT_SYMBOL(cpufreq_gov_userspace);

static int already_init = 0;

int cpufreq_gov_userspace_init(void)
{
	if (!already_init) {
		down(&userspace_sem);
		cpufreq_sa11x0_compat();
		cpufreq_sysctl_init();
		cpufreq_register_notifier(&userspace_cpufreq_notifier_block, CPUFREQ_TRANSITION_NOTIFIER);
		already_init = 1;
		up(&userspace_sem);
	}
	return cpufreq_register_governor(&cpufreq_gov_userspace);
}
EXPORT_SYMBOL(cpufreq_gov_userspace_init);


static void __exit cpufreq_gov_userspace_exit(void)
{
	cpufreq_unregister_governor(&cpufreq_gov_userspace);
        cpufreq_unregister_notifier(&userspace_cpufreq_notifier_block, CPUFREQ_TRANSITION_NOTIFIER);
	cpufreq_sysctl_exit();
}


MODULE_AUTHOR ("Dominik Brodowski <linux@brodo.de>, Russell King <rmk@arm.linux.org.uk>");
MODULE_DESCRIPTION ("CPUfreq policy governor 'userspace'");
MODULE_LICENSE ("GPL");

fs_initcall(cpufreq_gov_userspace_init);
module_exit(cpufreq_gov_userspace_exit);

Index: Kconfig
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/Kconfig,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- Kconfig	22 Feb 2003 10:23:47 -0000	1.2
+++ Kconfig	5 Nov 2003 18:27:44 -0000	1.3
@@ -6,20 +6,65 @@
 	  CPUFreq. Please note that it is recommended to use the sysfs
 	  interface instead (which is built automatically). 
 	  
-	  For details, take a look at linux/Documentation/cpufreq. 
+	  For details, take a look at linux/Documentation/cpu-freq. 
 	  
 	  If in doubt, say N.
 
+choice
+	prompt "Default CPUFreq governor"
+	depends on CPU_FREQ
+	default CPU_FREQ_DEFAULT_GOV_PERFORMANCE
+	help
+	  This option sets which CPUFreq governor shall be loaded at
+	  startup. If in doubt, select 'performance'.
+
+config CPU_FREQ_DEFAULT_GOV_PERFORMANCE
+	bool "performance"
+	select CPU_FREQ_GOV_PERFORMANCE
+	help
+	  Use the CPUFreq governor 'performance' as default. This sets
+	  the frequency statically to the highest frequency supported by
+	  the CPU.
+
+config CPU_FREQ_DEFAULT_GOV_USERSPACE
+	bool "userspace"
+	select CPU_FREQ_GOV_USERSPACE
+	help
+	  Use the CPUFreq governor 'userspace' as default. This allows
+	  you to set the CPU frequency manually or when an userspace 
+	  programm shall be able to set the CPU dynamically without having
+	  to enable the userspace governor manually.
+
+endchoice
+
+config CPU_FREQ_GOV_PERFORMANCE
+       tristate "'performance' governor"
+       depends on CPU_FREQ
+       help
+	  This cpufreq governors set the frequency statically to the
+	  highest available CPU frequency.
+
+	  If in doubt, say Y.
+
+config CPU_FREQ_GOV_POWERSAVE
+       tristate "'powersave' governor"
+       depends on CPU_FREQ
+       help
+	  Theis cpufreq governors set the frequency statically to the
+	  lowest available CPU frequency.
+
+	  If in doubt, say Y.
+
 config CPU_FREQ_GOV_USERSPACE
        tristate "'userspace' governor for userspace frequency scaling"
-       depends on CPU_FREQ
+       depends on CPU_FREQ 
        help
 	  Enable this cpufreq governor when you either want to set the
 	  CPU frequency manually or when an userspace programm shall
           be able to set the CPU dynamically, like on LART 
-	  ( http://www.lart.tudelft.nl/ )
+	  <http://www.lart.tudelft.nl/>
 
-	  For details, take a look at linux/Documentation/cpufreq. 
+	  For details, take a look at linux/Documentation/cpu-freq. 
 
 	  If in doubt, say Y.
 
@@ -33,6 +78,6 @@
 	  the same functionality as long as "userspace" is the
 	  selected governor for the specified CPU.
 	
-	  For details, take a look at linux/Documentation/cpufreq. 
+	  For details, take a look at linux/Documentation/cpu-freq. 
 
 	  If in doubt, say N.

Index: Makefile
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/Makefile,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- Makefile	27 Aug 2003 10:42:18 -0000	1.4
+++ Makefile	5 Nov 2003 18:27:44 -0000	1.5
@@ -2,7 +2,9 @@
 obj-$(CONFIG_CPU_FREQ)			+= cpufreq.o
 
 # CPUfreq governors 
-obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+= userspace.o
+obj-$(CONFIG_CPU_FREQ_GOV_PERFORMANCE)	+= cpufreq_performance.o
+obj-$(CONFIG_CPU_FREQ_GOV_POWERSAVE)	+= cpufreq_powersave.o
+obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+= cpufreq_userspace.o
 
 # CPUfreq cross-arch helpers
 obj-$(CONFIG_CPU_FREQ_TABLE)		+= freq_table.o

Index: cpufreq.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/cpufreq.c,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- cpufreq.c	3 Sep 2003 09:20:00 -0000	1.2
+++ cpufreq.c	5 Nov 2003 18:27:44 -0000	1.3
@@ -1,5 +1,5 @@
 /*
- *  linux/kernel/cpufreq.c
+ *  linux/drivers/cpufreq/cpufreq.c
  *
  *  Copyright (C) 2001 Russell King
  *            (C) 2002 - 2003 Dominik Brodowski <linux@brodo.de>
@@ -10,6 +10,7 @@
  *
  */
 
+#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -107,13 +108,18 @@
 int cpufreq_parse_governor (char *str_governor, unsigned int *policy,
 				struct cpufreq_governor **governor)
 {
-	if (!strnicmp(str_governor, "performance", CPUFREQ_NAME_LEN)) {
-		*policy = CPUFREQ_POLICY_PERFORMANCE;
-		return 0;
-	} else if (!strnicmp(str_governor, "powersave", CPUFREQ_NAME_LEN)) {
-		*policy = CPUFREQ_POLICY_POWERSAVE;
-		return 0;
-	} else 	{
+	if (!cpufreq_driver)
+		return -EINVAL;
+	if (cpufreq_driver->setpolicy) {
+		if (!strnicmp(str_governor, "performance", CPUFREQ_NAME_LEN)) {
+			*policy = CPUFREQ_POLICY_PERFORMANCE;
+			return 0;
+		} else if (!strnicmp(str_governor, "powersave", CPUFREQ_NAME_LEN)) {
+			*policy = CPUFREQ_POLICY_POWERSAVE;
+			return 0;
+		}
+		return -EINVAL;
+	} else {
 		struct cpufreq_governor *t;
 		down(&cpufreq_governor_sem);
 		if (!cpufreq_driver || !cpufreq_driver->target)
@@ -121,7 +127,6 @@
 		list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
 			if (!strnicmp(str_governor,t->name,CPUFREQ_NAME_LEN)) {
 				*governor = t;
-				*policy = CPUFREQ_POLICY_GOVERNOR;
 				up(&cpufreq_governor_sem);
 				return 0;
 			}
@@ -188,16 +193,13 @@
  */
 static ssize_t show_scaling_governor (struct cpufreq_policy * policy, char *buf)
 {
-	switch (policy->policy) {
-	case CPUFREQ_POLICY_POWERSAVE:
+	if(policy->policy == CPUFREQ_POLICY_POWERSAVE)
 		return sprintf(buf, "powersave\n");
-	case CPUFREQ_POLICY_PERFORMANCE:
+	else if (policy->policy == CPUFREQ_POLICY_PERFORMANCE)
 		return sprintf(buf, "performance\n");
-	case CPUFREQ_POLICY_GOVERNOR:
+	else if (policy->governor)
 		return snprintf(buf, CPUFREQ_NAME_LEN, "%s\n", policy->governor->name);
-	default:
-		return -EINVAL;
-	}
+	return -EINVAL;
 }
 
 
@@ -244,15 +246,15 @@
 	ssize_t i = 0;
 	struct cpufreq_governor *t;
 
-	i += sprintf(buf, "performance powersave");
-
-	if (!cpufreq_driver->target)
+	if (!cpufreq_driver->target) {
+		i += sprintf(buf, "performance powersave");
 		goto out;
+	}
 
 	list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
 		if (i >= (ssize_t) ((PAGE_SIZE / sizeof(char)) - (CPUFREQ_NAME_LEN + 2)))
 			goto out;
-		i += snprintf(&buf[i], CPUFREQ_NAME_LEN, " %s", t->name);
+		i += snprintf(&buf[i], CPUFREQ_NAME_LEN, "%s ", t->name);
 	}
  out:
 	i += sprintf(&buf[i], "\n");
@@ -394,10 +396,12 @@
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	cpufreq_cpu_data[cpu] = policy;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
-
+	policy->governor = NULL; /* to assure that the starting sequence is
+				  * run in cpufreq_set_policy */
 	up(&policy->lock);
 	
 	/* set default policy */
+	
 	ret = cpufreq_set_policy(&new_policy);
 	if (ret)
 		goto err_out_unregister;
@@ -445,6 +449,9 @@
 	if (!kobject_get(&data->kobj))
 		return -EFAULT;
 
+	if (cpufreq_driver->target)
+		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
+
 	kobject_unregister(&data->kobj);
 
 	kobject_put(&data->kobj);
@@ -455,9 +462,6 @@
 	 */
 	wait_for_completion(&data->kobj_unregister);
 
-	if (cpufreq_driver->target)
-		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
-
 	if (cpufreq_driver->exit)
 		cpufreq_driver->exit(data);
 
@@ -633,33 +637,18 @@
 
 static int __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event)
 {
-	int ret = 0;
+	int ret = -EINVAL;
 
-	switch (policy->policy) {
-	case CPUFREQ_POLICY_POWERSAVE: 
-		if ((event == CPUFREQ_GOV_LIMITS) || (event == CPUFREQ_GOV_START)) {
-			ret = __cpufreq_driver_target(policy, policy->min, CPUFREQ_RELATION_L);
-		}
-		break;
-	case CPUFREQ_POLICY_PERFORMANCE:
-		if ((event == CPUFREQ_GOV_LIMITS) || (event == CPUFREQ_GOV_START)) {
-			ret = __cpufreq_driver_target(policy, policy->max, CPUFREQ_RELATION_H);
-		}
-		break;
-	case CPUFREQ_POLICY_GOVERNOR:
-		ret = -EINVAL;
-		if (!try_module_get(policy->governor->owner))
-			break;
-		ret = policy->governor->governor(policy, event);
-		/* we keep one module reference alive for each CPU governed by this CPU */
-		if ((event != CPUFREQ_GOV_START) || ret)
-			module_put(policy->governor->owner);
-		if ((event == CPUFREQ_GOV_STOP) && !ret)
-			module_put(policy->governor->owner);
-		break;
-	default:
-		ret = -EINVAL;
-	}
+	if (!try_module_get(policy->governor->owner))
+		return -EINVAL;
+
+	ret = policy->governor->governor(policy, event);
+
+	/* we keep one module reference alive for each CPU governed by this CPU */
+	if ((event != CPUFREQ_GOV_START) || ret)
+		module_put(policy->governor->owner);
+	if ((event == CPUFREQ_GOV_STOP) && !ret)
+		module_put(policy->governor->owner);
 
 	return ret;
 }
@@ -691,11 +680,6 @@
 	if (!governor)
 		return -EINVAL;
 
-	if (!strnicmp(governor->name,"powersave",CPUFREQ_NAME_LEN))
-		return -EBUSY;
-	if (!strnicmp(governor->name,"performance",CPUFREQ_NAME_LEN))
-		return -EBUSY;
-
 	down(&cpufreq_governor_sem);
 	
 	list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
@@ -758,26 +742,9 @@
 EXPORT_SYMBOL(cpufreq_get_policy);
 
 
-/**
- *	cpufreq_set_policy - set a new CPUFreq policy
- *	@policy: policy to be set.
- *
- *	Sets a new CPU frequency and voltage scaling policy.
- */
-int cpufreq_set_policy(struct cpufreq_policy *policy)
+static int __cpufreq_set_policy(struct cpufreq_policy *data, struct cpufreq_policy *policy)
 {
 	int ret = 0;
-	struct cpufreq_policy *data;
-
-	if (!policy)
-		return -EINVAL;
-
-	data = cpufreq_cpu_get(policy->cpu);
-	if (!data)
-		return -EINVAL;
-
-	/* lock this CPU */
-	down(&data->lock);
 
 	memcpy(&policy->cpuinfo, 
 	       &data->cpuinfo, 
@@ -819,23 +786,24 @@
 		data->policy = policy->policy;
 		ret = cpufreq_driver->setpolicy(policy);
 	} else {
-		if ((policy->policy != data->policy) || 
-		    ((policy->policy == CPUFREQ_POLICY_GOVERNOR) && (policy->governor != data->governor))) {
+		if (policy->governor != data->governor) {
 			/* save old, working values */
-			unsigned int old_pol = data->policy;
 			struct cpufreq_governor *old_gov = data->governor;
 
 			/* end old governor */
-			__cpufreq_governor(data, CPUFREQ_GOV_STOP);
+			if (data->governor)
+				__cpufreq_governor(data, CPUFREQ_GOV_STOP);
 
 			/* start new governor */
-			data->policy = policy->policy;
 			data->governor = policy->governor;
 			if (__cpufreq_governor(data, CPUFREQ_GOV_START)) {
 				/* new governor failed, so re-start old one */
-				data->policy = old_pol;
-				data->governor = old_gov;
-				__cpufreq_governor(data, CPUFREQ_GOV_START);
+				if (old_gov) {
+					data->governor = old_gov;
+					__cpufreq_governor(data, CPUFREQ_GOV_START);
+				}
+				ret = -EINVAL;
+				goto error_out;
 			}
 			/* might be a policy change, too, so fall through */
 		}
@@ -843,6 +811,36 @@
 	}
 
  error_out:
+	return ret;
+}
+
+/**
+ *	cpufreq_set_policy - set a new CPUFreq policy
+ *	@policy: policy to be set.
+ *
+ *	Sets a new CPU frequency and voltage scaling policy.
+ */
+int cpufreq_set_policy(struct cpufreq_policy *policy)
+{
+	int ret = 0;
+	struct cpufreq_policy *data;
+
+	if (!policy)
+		return -EINVAL;
+
+	data = cpufreq_cpu_get(policy->cpu);
+	if (!data)
+		return -EINVAL;
+
+	/* lock this CPU */
+	down(&data->lock);
+
+	ret = __cpufreq_set_policy(data, policy);
+	data->user_policy.min = data->min;
+	data->user_policy.max = data->max;
+	data->user_policy.policy = data->policy;
+	data->user_policy.governor = data->governor;
+
 	up(&data->lock);
 	cpufreq_cpu_put(data);
 
@@ -850,6 +848,41 @@
 }
 EXPORT_SYMBOL(cpufreq_set_policy);
 
+
+/**
+ *	cpufreq_update_policy - re-evaluate an existing cpufreq policy
+ *	@cpu: CPU which shall be re-evaluated
+ *
+ *	Usefull for policy notifiers which have different necessities
+ *	at different times.
+ */
+int cpufreq_update_policy(unsigned int cpu)
+{
+	struct cpufreq_policy *data = cpufreq_cpu_get(cpu);
+	struct cpufreq_policy policy;
+	int ret = 0;
+
+	if (!data)
+		return -ENODEV;
+
+	down(&data->lock);
+
+	memcpy(&policy, 
+	       &data, 
+	       sizeof(struct cpufreq_policy));
+	policy.min = data->user_policy.min;
+	policy.max = data->user_policy.max;
+	policy.policy = data->user_policy.policy;
+	policy.governor = data->user_policy.governor;
+
+	ret = __cpufreq_set_policy(data, &policy);
+
+	up(&data->lock);
+
+	cpufreq_cpu_put(data);
+	return ret;
+}
+EXPORT_SYMBOL(cpufreq_update_policy);
 
 
 /*********************************************************************

Index: proc_intf.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/proc_intf.c,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- proc_intf.c	19 Aug 2003 13:38:33 -0000	1.2
+++ proc_intf.c	5 Nov 2003 18:27:44 -0000	1.3
@@ -126,20 +126,20 @@
 
 		p += sprintf(p, "CPU%3d    %9d kHz (%3d %%)  -  %9d kHz (%3d %%)  -  ",
 			     i , policy.min, min_pctg, policy.max, max_pctg);
-		switch (policy.policy) {
-		case CPUFREQ_POLICY_POWERSAVE:
-			p += sprintf(p, "powersave\n");
-			break;
-		case CPUFREQ_POLICY_PERFORMANCE:
-			p += sprintf(p, "performance\n");
-			break;
-		case CPUFREQ_POLICY_GOVERNOR:
+		if (policy.policy) {
+			switch (policy.policy) {
+				case CPUFREQ_POLICY_POWERSAVE:
+				p += sprintf(p, "powersave\n");
+				break;	
+			case CPUFREQ_POLICY_PERFORMANCE:
+				p += sprintf(p, "performance\n");
+				break;
+			default:
+				p += sprintf(p, "INVALID\n");
+				break;
+			} 
+		} else
 			p += snprintf(p, CPUFREQ_NAME_LEN, "%s\n", policy.governor->name);
-			break;
-		default:
-			p += sprintf(p, "INVALID\n");
-			break;
-		}
 	}
 end:
 	len = (p - page);

--- userspace.c DELETED ---
