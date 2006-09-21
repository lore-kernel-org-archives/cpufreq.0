From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: writing a cpufreq driver
Date: Thu, 21 Sep 2006 13:48:33 -0500
Message-ID: <20060921184833.GC1216@dbz.icequake.net>
Reply-To: nemesis@icequake.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="cNdxnHkX5QqsyA0e"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Cpufreq@lists.linux.org.uk


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline


I wrote a cpufreq target driver for older Toshiba laptops.  It uses SMM
to change between a "fast" and a "slow" processing speed.  I have two
remaining bugs.  Any comments would be appreciated.

1.  The first time cpufreq changes speed, I get the whole "Losing some
ticks... checking if CPU frequency changed." then eventually "Losing too
many ticks!" and timer switches to PIT.  This does not happen when I use
the /dev/toshiba driver to change speeds from userspace.  Not sure what
is going on here...  SMI handler latency is between 6 and 7 ms.

2.  The current CPU frequency is stored in NVRAM by the SMI handler.
Unfortunately, this means if cpufreq throttles the CPU and the system is
then rebooted, the boot process is exceedingly slow.  Is there some sane
way to hook into the shutdown process to restore the appropriate values,
or is this something I have to live with?

-- 
Ryan Underwood, <nemesis@icequake.net>

--cNdxnHkX5QqsyA0e
Content-Type: text/x-csrc; charset=iso-8859-1
Content-Disposition: attachment; filename="toshiba_freq.c"

/*
 *	toshiba_freq.c: cpufreq driver for Toshiba SCI (non-Speedstep) laptops
 *
 *	Copyright (C) 2006 Ryan Underwood <nemesis@icequake.net>
 *
 *	This program is free software; you can redistribute it and/or
 *	modify it under the terms of the GNU General Public License
 *	as published by the Free Software Foundation; either version
 *	2 of the License, or (at your option) any later version.
 *
 *	Based on sc520_freq.c
 *
 *	2006-09-11: - initial revision
 */

/* NOTE: currently this should drag in toshiba.ko which checks for the
 * appropriate hardware in its init function. Things will be different when
 * ACPI instead of the SMM driver is used as the SCI access method. */

/* FIXME: Fan and LCD brightness are variable on some systems */
/* FIXME: TSC timer needs recalibration, why isn't this an issue with /dev/toshiba? */
/* FIXME: on reboot (Esp SysRq) how to restore state? */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/timex.h>
#include <linux/delay.h>

#include <linux/cpufreq.h>
#include <linux/toshiba.h>

#define DRIVER_NAME "toshiba_freq"
#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, DRIVER_NAME, msg)

static u32 original_battsave;
static u32 original_cpustate;
static u32 original_cache;
static u32 original_brightness;
static u32 original_fan;

/* Store this locally to avoid a SMM round trip to obtain it */
static u32 current_cpustate;

/* The operating speed of the CPU when in 'fast' mode */
static int nominal_khz;

/* The maximum SMI interrupt latency we have encountered */
static int max_smm_latency = 7000000; /* Start with 7ms */

/* Has an SCI error occurred in the past? */
static int sci_error;

static int control_cpucache = 1;
static int control_fan = 1;
static int control_lcd;

/* User-supplied nominal MHz rating */
static int user_mhz = -1;

module_param_named(cpucache, control_cpucache, int, 1);
MODULE_PARM_DESC(cpucache, "Allow CPUFreq to enable/disable CPU cache");
module_param_named(fan, control_fan, int, 1);
MODULE_PARM_DESC(fan, "Allow CPUFreq to control the system fan");
module_param_named(lcd, control_lcd, int, 0);
MODULE_PARM_DESC(lcd, "Allow CPUFreq to control LCD brightness");
module_param_named(mhz, user_mhz, int, -1);
MODULE_PARM_DESC(mhz, "MHz rating of CPU (required for pre-Pentium)");

/* Index corresponds to the SCI CPU speed state (0 or 1) */
static struct cpufreq_frequency_table toshiba_freq_table[] = {
	{0,	0},  /* slow (low) */
	{1,	0},  /* fast (high) */
	{0,	CPUFREQ_TABLE_END},
};

static void restore_original_config(void)
{
	/* When an error condition is set, the config has already
	 * been restored */
	if (sci_error) return;

	if (control_fan)
		tosh_scihci_set(HCI_SET, HCI_FAN, original_fan);

	if (control_lcd)
		tosh_scihci_set(0, SCI_LCD_BRIGHTNESS, original_brightness);

	if (control_cpucache)
		tosh_scihci_set(0, SCI_CPU_CACHE, original_cache);

	tosh_scihci_set(0, SCI_PROCESSING, original_cpustate);
	tosh_scihci_set(0, SCI_BATTERY_SAVE, original_battsave);
}

static unsigned int toshiba_freq_get_cpu_frequency(unsigned int cpu)
{
#if 0
	unsigned int val;
	tosh_scihci_get(0, SCI_PROCESSING, &val);
	val &= 1; /* safety */
	return toshiba_freq_table[val].frequency;
#else
	/* It is okay to cache this, as long as userland is
	 * prevented from messing with the current state via
	 * /dev/toshiba.  */

	return toshiba_freq_table[current_cpustate].frequency;
#endif
}

static void tosh_scihci_set_error(unsigned int hci, unsigned int cmd, unsigned int arg)
{
	int err;
	int transition_usecs;
	struct timeval tv, tv2;

	if (sci_error) return;

	do_gettimeofday(&tv);
	err = tosh_scihci_set(hci, cmd, arg);
	do_gettimeofday(&tv2);

	transition_usecs = 1000000*(tv2.tv_sec - tv.tv_sec) + (tv2.tv_usec - tv.tv_usec);
	if (transition_usecs*1000 > max_smm_latency) { /* latency is in ns */
		dprintk(DRIVER_NAME": transition latency increased from %d to %d ns\n", max_smm_latency, transition_usecs*1000);
		max_smm_latency = transition_usecs * 1000;
	}

	if (err) {
		printk(DRIVER_NAME": SCI error condition encountered, giving up.\n");
		/* Attempt to restore the original config, so i.e. the 
		 * processor is not at high speed while the fan is not on,
		 * or some other inconsistent state. */
		restore_original_config();
		/* We will do nothing more now */
		tosh_cpufreq_in_control = 0;
		sci_error = 1;
	}
}

static void toshiba_freq_set_cpu_state (unsigned int state)
{
	struct cpufreq_freqs freqs;

	freqs.old = toshiba_freq_get_cpu_frequency(0);
	freqs.new = toshiba_freq_table[state].frequency;
	freqs.cpu = 0;

	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);

	dprintk(DRIVER_NAME": attempting to set frequency to %i kHz\n",
			toshiba_freq_table[state].frequency);

	if (state == 0) { /* slow */
		if (control_fan)
			tosh_scihci_set_error(HCI_SET, HCI_FAN, HCI_DISABLE);
		if (control_lcd)
			tosh_scihci_set_error(0, SCI_LCD_BRIGHTNESS, SCI_SEMI_BRIGHT);
		if (control_cpucache)
			tosh_scihci_set_error(0, SCI_CPU_CACHE, SCI_OFF);
		tosh_scihci_set_error(0, SCI_PROCESSING, SCI_LOW);
	}
	else { /* fast */
		if (control_fan)
			tosh_scihci_set_error(HCI_SET, HCI_FAN, HCI_ENABLE);
		if (control_lcd)
			tosh_scihci_set_error(0, SCI_LCD_BRIGHTNESS, SCI_BRIGHT);
		if (control_cpucache)
			tosh_scihci_set_error(0, SCI_CPU_CACHE, SCI_ON);
#if 0
		tosh_scihci_set_error(0, SCI_PROCESSING, SCI_HIGH);
#else
		{
		//Experimenting with SMM latency
		u32 low, low2;
		local_irq_disable();
		sync_core();
		low = get_cycles();
		tosh_scihci_set_error(0, SCI_PROCESSING, SCI_HIGH);
		sync_core();
		low2 = get_cycles();
		local_irq_enable();
		dprintk(DRIVER_NAME": SMM took %d cycles\n", low2-low);
		}
#endif
	}

	current_cpustate = toshiba_freq_table[state].index;

	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
};

static int toshiba_freq_verify (struct cpufreq_policy *policy)
{
	return cpufreq_frequency_table_verify(policy, &toshiba_freq_table[0]);
}

static int toshiba_freq_target (struct cpufreq_policy *policy,
			    unsigned int target_freq,
			    unsigned int relation)
{
	unsigned int newstate = 0;

	if (cpufreq_frequency_table_target(policy, toshiba_freq_table, target_freq, relation, &newstate))
		return -EINVAL;

	toshiba_freq_set_cpu_state(newstate);

	policy->cpuinfo.transition_latency = max_smm_latency;

	return 0;
}

/*
 *	Module init and exit code
 */

static int toshiba_freq_cpu_init(struct cpufreq_policy *policy)
{
	int result;

	/* Prevent userspace from using /dev/toshiba to frob the CPU speed */
	tosh_cpufreq_in_control = 1;

	/* Fill out the frequency table (in KHz) for the two Toshiba SCI modes
	 * "slow" and "fast". 	 */
	toshiba_freq_table[0].frequency = nominal_khz / 2;
	toshiba_freq_table[1].frequency = nominal_khz;

	/* cpuinfo and default policy values */
	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
	policy->cpuinfo.transition_latency = max_smm_latency;
	policy->cur = toshiba_freq_get_cpu_frequency(0);

	result = cpufreq_frequency_table_cpuinfo(policy, toshiba_freq_table);
	if (result)
		return (result);

	cpufreq_frequency_table_get_attr(toshiba_freq_table, policy->cpu);

	return 0;
}

static int toshiba_freq_cpu_exit(struct cpufreq_policy *policy)
{
	cpufreq_frequency_table_put_attr(policy->cpu);
	
	restore_original_config();

	/* Allow userspace to control CPU via /dev/toshiba again */
	tosh_cpufreq_in_control = 0;

	return 0;
}


static struct freq_attr* toshiba_freq_attr[] = {
	&cpufreq_freq_attr_scaling_available_freqs,
	NULL,
};


static struct cpufreq_driver toshiba_freq_driver = {
	.get	= toshiba_freq_get_cpu_frequency,
	.verify	= toshiba_freq_verify,
	.target	= toshiba_freq_target,
	.init	= toshiba_freq_cpu_init,
	.exit	= toshiba_freq_cpu_exit,
	.name	= "toshiba_freq",
	.owner	= THIS_MODULE,
	.attr	= toshiba_freq_attr,
};


static int __init toshiba_freq_init(void)
{
	char buf[128];

	/* Save the original state */
	if (tosh_scihci_get(0, SCI_BATTERY_SAVE, &original_battsave) ||
			tosh_scihci_get(0, SCI_PROCESSING, &original_cpustate) ||
			tosh_scihci_get(0, SCI_CPU_CACHE, &original_cache) ||
			tosh_scihci_get(HCI_GET, HCI_FAN, &original_fan) ||
			tosh_scihci_get(0, SCI_LCD_BRIGHTNESS, &original_brightness))
		return -ENODEV;

	/* Note: At least some ACPI machines do not allow the SMI handler to
	 * modify the CPU frequency.  Here, we will read all the settings we
	 * are interested in and attempt to set their values, as a test that we
	 * are actually in control of the hardware. */

	/* First the laptop must be put in the "user settings" battery
	 * save mode; otherwise the SMI handler rejects software requests to
	 * change CPU speed. */

	if (tosh_scihci_set(0, SCI_BATTERY_SAVE, SCI_USER_SETTINGS)) {
		restore_original_config();
		return -ENODEV;
	}

	/* CPU state */
	if (tosh_scihci_set(0, SCI_PROCESSING, original_cpustate)) {
		restore_original_config();
		return -ENODEV;
	}

	/* CPU cache */
	if (control_cpucache) {
		if (tosh_scihci_set(0, SCI_CPU_CACHE, original_cache)) {
			restore_original_config();
			return -ENODEV;
		}
	}

	/* Fan */
	if (control_fan) {
		if (tosh_scihci_set(HCI_SET, HCI_FAN, original_fan)) {
			restore_original_config();
			return -ENODEV;
		}
	}

	/* Display brightness */
	if (control_lcd) {
		if (tosh_scihci_set(0, SCI_LCD_BRIGHTNESS, original_brightness)) {
			restore_original_config();
			return -ENODEV;
		}
	}

	/* Now that we know we can control all the appropriate settings,
	 * we can continue */

	/* Now we need to obtain the nominal CPU speed for cpufreq to use.
	 *
	 * Possible methods: firmware, TSC, cpu_khz, user
	 * We don't know how to do it via firmware.
	 * cpu_khz is variable and thus unreliable.
	 * We thus try timing it with the TSC if available, and otherwise
	 * rely on the user to supply the speed.
	 */

	if (user_mhz < 0) {
		/* Use TSC to estimate CPU speed */
		u32 count, count2, lapsed_usec;
		struct timeval tv, tv2;
		int i;

		if (!cpu_has_tsc) {
			printk(DRIVER_NAME": 'mhz' option is required for systems without TSC\n");
			restore_original_config();
			return -EINVAL;
		}

		/* Place CPU into 'fast' state (max speed) */
		if (tosh_scihci_set(0, SCI_PROCESSING, SCI_HIGH)) {
			restore_original_config();
			return -ENODEV;
		}

		/* According to RDTSCPM1.HTM, make 3 pre-runs to
		 * prime the instruction cache, and disable all
		 * pending speculations prior to RDTSC */
		for (i = 0; i < 4; i++) {
			local_irq_disable();
			do_gettimeofday(&tv);
			/* If core supports CPUID, then it may support
			 * speculative execution which should be evaded
			 * for accurate RDTSC timing */
			if (boot_cpu_data.cpuid_level != -1)
				sync_core();
			count = get_cycles();
			local_irq_enable();
			msleep_interruptible(1);
			local_irq_disable();
			do_gettimeofday(&tv2);
			if (boot_cpu_data.cpuid_level != -1)
				sync_core();
			count2 = get_cycles();
			local_irq_enable();
		}

		if (tosh_scihci_set(0, SCI_PROCESSING, original_cpustate)) {
			restore_original_config();
			return -ENODEV;
		}

		lapsed_usec = 1000000*(tv2.tv_sec - tv.tv_sec) + (tv2.tv_usec - tv.tv_usec);
		nominal_khz = (count2 - count) / lapsed_usec; /* cycles / us  = MHz */
		nominal_khz *= 1000; /* cycles / ms = kHz */
	}
	else
		nominal_khz = user_mhz * 1000;

	sprintf(buf, DRIVER_NAME": Managing CPU (nominal %d MHz)", nominal_khz / 1000);
	if (control_cpucache)
		strcat(buf, ", L2 cache");
	if (control_fan)
		strcat(buf, ", system fan");
	if (control_lcd)
		strcat(buf, ", LCD");

	printk("%s\n", buf);

	current_cpustate = original_cpustate;

	return cpufreq_register_driver(&toshiba_freq_driver);
}


static void __exit toshiba_freq_exit(void)
{
	cpufreq_unregister_driver(&toshiba_freq_driver);
}


MODULE_LICENSE("GPL");
MODULE_AUTHOR("Ryan Underwood <nemesis@icequake.net>");
MODULE_DESCRIPTION("cpufreq driver for Toshiba non-Speedstep (SCI) laptops");

module_init(toshiba_freq_init);
module_exit(toshiba_freq_exit);


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--cNdxnHkX5QqsyA0e--

