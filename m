From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-smi.c, NONE,
	1.1 Kconfig, 1.8, 1.9
Date: Wed, 03 Sep 2003 10:20:03 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19uTo3-0005dj-8o@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv21659/linux/arch/i386/kernel/cpufreq

Modified Files:
	Kconfig 
Added Files:
	speedstep-smi.c 
Log Message:
* add speedstep-smi driver (Hiroshi Miura)
* clean up speedstep-smi driver (Dominik Brodowski)
        - fixes a couple of warnings
        - to run as a module, we need to export ist_info. Also, only show the
          IST_INFO line in dmesg if speedstep_smi is enabled.
        - Use  a new ->resume callback in the cpufreq core.
        - let's call this driver "speedstep-smi" in cpufreq_driver also
        - if the smi_get_freqs call fails, fall back to the "let's try it out
          and see what frequency we are at" mechanism. Needed on my notebook (at
          least).
* update driver/cpufreq/cpufreq.c


--- NEW FILE speedstep-smi.c ---
/*
 * Intel SpeedStep SMI driver.
 *
 * (C) 2003  Hiroshi Miura <miura@da-cha.org>
 *
 *  Licensed under the terms of the GNU GPL License version 2.
 *
 */


/*********************************************************************
 *                        SPEEDSTEP - DEFINITIONS                    *
 *********************************************************************/

#include <linux/kernel.h>
#include <linux/module.h> 
#include <linux/init.h>
#include <linux/cpufreq.h>
#include <linux/pci.h>
#include <linux/slab.h>
#include <asm/ist.h>

#include "speedstep-lib.h"

/* speedstep system management interface port/command.
 *
 * These parameters are got from IST-SMI BIOS call.
 * If user gives it, these are used.
 * 
 */
static int		smi_port	= 0;
static int		smi_cmd		= 0;


#define SPEEDSTEP_HIGH	0x00000000
#define SPEEDSTEP_LOW   0x00000001

/* 
 *   There are only two frequency states for each processor. Values
 * are in kHz for the time being.
 */
static struct cpufreq_frequency_table speedstep_freqs[] = {
	{SPEEDSTEP_HIGH, 	0},
	{SPEEDSTEP_LOW,		0},
	{0,			CPUFREQ_TABLE_END},
};

#define GET_SPEEDSTEP_OWNER 0
#define GET_SPEEDSTEP_STATE 1
#define SET_SPEEDSTEP_STATE 2
#define GET_SPEEDSTEP_FREQS 4

/* DEBUG
 *   Define it if you want verbose debug output, e.g. for bug reporting
 */
#define SPEEDSTEP_DEBUG

#ifdef SPEEDSTEP_DEBUG
#define dprintk(msg...) printk(msg)
#else
#define dprintk(msg...) do { } while(0)
#endif

/**
 * speedstep_smi_ownership
 */
static int speedstep_smi_ownership (void)
{
        u32     command, result, magic;
        u32     function = GET_SPEEDSTEP_OWNER;
	unsigned char magic_data[] = "Copyright (c) 1999 Intel Corporation";

        command = (ist_info.signature & 0xffffff00) | (smi_cmd & 0xff);
	magic = virt_to_phys(magic_data);

        __asm__ __volatile__(
            "out %%al, (%%dx)\n"
            : "=D" (result)
            : "a" (command), "b" (function), "c" (0), "d" (smi_port), "D" (0), "S" (magic)
        );

        return result;
}
/**
 * speedstep_smi_get_freqs - get SpeedStep preferred & current freq.
 *
 */
static int speedstep_smi_get_freqs (unsigned int *low, unsigned int *high)
{
        u32     command, result, edi, high_mhz, low_mhz;
        u32     state=0;
        u32	function = GET_SPEEDSTEP_FREQS;

        command = (ist_info.signature & 0xffffff00) | (smi_cmd & 0xff);

        __asm__ __volatile__("movl $0, %%edi\n"
            "out %%al, (%%dx)\n"
            : "=a" (result), "=b" (high_mhz), "=c" (low_mhz), "=d" (state), "=D" (edi)
            : "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
        );
	*high = high_mhz * 1000;
	*low  = low_mhz  * 1000;

	return result;
} 
/**
 * speedstep_get_state - set the SpeedStep state
 * @state: processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
 *
 */
static int speedstep_get_state (void)
{
	u32		function=GET_SPEEDSTEP_STATE;
	u32		result, state, edi, command;

        command = (ist_info.signature & 0xffffff00) | (smi_cmd & 0xff);

        __asm__ __volatile__("movl $0, %%edi\n"
            "out %%al, (%%dx)\n"
            : "=a" (result), "=b" (state), "=D" (edi)
            : "a" (command), "b" (function), "c" (0), "d" (smi_port), "S" (0)
        );
	
	return state;
}

/**
 * speedstep_set_state - set the SpeedStep state
 * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
 *
 */
static void speedstep_set_state (unsigned int state, unsigned int notify)
{
	unsigned int		old_state, result, command, new_state;
	unsigned long		flags;
	struct cpufreq_freqs	freqs;
	unsigned int		function=SET_SPEEDSTEP_STATE;

	if (state > 0x1)
		return;

	old_state = speedstep_get_state();
	freqs.old = speedstep_freqs[old_state].frequency;
	freqs.new = speedstep_freqs[state].frequency;
	freqs.cpu = 0; /* speedstep.c is UP only driver */
	
	if (old_state == state)
		return;

	if (notify)
		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);

	/* Disable IRQs */
	local_irq_save(flags);

        command = (ist_info.signature & 0xffffff00) | (smi_cmd & 0xff);
        __asm__ __volatile__(
	    "movl $0, %%edi\n"
            "out %%al, (%%dx)\n"
            : "=b" (new_state), "=D" (result)
            : "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
        );

	/* enable IRQs */
	local_irq_restore(flags);

	if (new_state == state) {
		dprintk(KERN_INFO "cpufreq: change to %u MHz succeded\n", (freqs.new / 1000));
	} else {
		printk(KERN_ERR "cpufreq: change failed\n");
	}

	if (notify)
		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);

	return;
}


/**
 * speedstep_target - set a new CPUFreq policy
 * @policy: new policy
 * @target_freq: new freq
 * @relation: 
 *
 * Sets a new CPUFreq policy/freq.
 */
static int speedstep_target (struct cpufreq_policy *policy,
			     unsigned int target_freq,
			     unsigned int relation)
{
	unsigned int	newstate = 0;

	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
		return -EINVAL;

	speedstep_set_state(newstate, 1);

	return 0;
}


/**
 * speedstep_verify - verifies a new CPUFreq policy
 * @freq: new policy
 *
 * Limit must be within speedstep_low_freq and speedstep_high_freq, with
 * at least one border included.
 */
static int speedstep_verify (struct cpufreq_policy *policy)
{
	return cpufreq_frequency_table_verify(policy, &speedstep_freqs[0]);
}


static int speedstep_cpu_init(struct cpufreq_policy *policy)
{
	int		result;
	unsigned int	speed,state;

	/* capability check */
	if (policy->cpu != 0)
		return -ENODEV;

	result = speedstep_smi_ownership();

	if (result)
		dprintk(KERN_INFO "cpufreq: fails an aquiring ownership of a SMI interface.\n");

	/* detect low and high frequency */
	result = speedstep_smi_get_freqs(&speedstep_freqs[SPEEDSTEP_LOW].frequency,
				         &speedstep_freqs[SPEEDSTEP_HIGH].frequency);
	if (result) {
		/* fall back to speedstep_lib.c dection mechanism: try both states out */
		unsigned int speedstep_processor = speedstep_detect_processor();

		dprintk(KERN_INFO "speedstep-smi: could not detect low and high frequencies by SMI call.\n");
		if (!speedstep_processor)
			return -ENODEV;

		result = (int) speedstep_get_freqs(speedstep_processor,
					     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
					     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
					     &speedstep_set_state);

		if (result) {
			dprintk(KERN_INFO "speedstep-smi: could not detect two different speeds -- aborting.\n");
			return result;
		} else
			dprintk(KERN_INFO "speedstep-smi: workaround worked.\n");
	}

	/* get current speed setting */
	state = speedstep_get_state();
	speed = speedstep_freqs[state].frequency;

	dprintk(KERN_INFO "cpufreq: currently at %s speed setting - %i MHz\n", 
		(speed == speedstep_freqs[SPEEDSTEP_LOW].frequency) ? "low" : "high",
		(speed / 1000));

	/* cpuinfo and default policy values */
	/* TBD: clean up when the new core is commited. */
	policy->policy = (speed == speedstep_freqs[SPEEDSTEP_LOW].frequency) ? 
		CPUFREQ_POLICY_POWERSAVE : CPUFREQ_POLICY_PERFORMANCE;
	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
	policy->cur = speed;

	return cpufreq_frequency_table_cpuinfo(policy, &speedstep_freqs[0]);
}


static int speedstep_resume(struct cpufreq_policy *policy)
{
	int result = speedstep_smi_ownership();

	if (result)
		dprintk(KERN_INFO "cpufreq: fails an aquiring ownership of a SMI interface.\n");

	return result;
}


static struct cpufreq_driver speedstep_driver = {
	.name		= "speedstep-smi",
	.verify 	= speedstep_verify,
	.target 	= speedstep_target,
	.init		= speedstep_cpu_init,
	.resume		= speedstep_resume,
	.owner		= THIS_MODULE,
};

/**
 * speedstep_init - initializes the SpeedStep CPUFreq driver
 *
 *   Initializes the SpeedStep support. Returns -ENODEV on unsupported
 * BIOS, -EINVAL on problems during initiatization, and zero on
 * success.
 */
static int __init speedstep_init(void)
{
	/* Error if no IST-SMI BIOS or no PARM 
		 sig= 'ISGE' aka 'Intel Speedstep Gate E' */
	/* Don't understand: 0x47534943 is GSIC, meaning
	 * Geyserville System Interface Control perhaps. */

	dprintk(KERN_INFO "speedstep-smi: IST_SMI: signature:0x%.8lx, command:0x%.8lx, event:0x%.8lx, perf_level:0x%.8lx\n",
		ist_info.signature, ist_info.command, ist_info.event,ist_info.perf_level);

	if ((ist_info.signature !=  0x47534943) && ( 
	    (smi_port == 0) || (smi_cmd == 0)))
		return -ENODEV;

	/* setup smi_port from MODLULE_PARM or BIOS */
	if ((smi_port > 0xff) || (smi_port < 0)) {
		return -EINVAL;
	} else if (smi_port == 0) {
		smi_port = ist_info.command & 0xff;
	}

	if ((smi_cmd > 0xff) || (smi_cmd < 0)) {
		return -EINVAL;
	} else if (smi_cmd == 0) {
		smi_cmd = (ist_info.command >> 16) & 0xff;
	}

	return cpufreq_register_driver(&speedstep_driver);
}


/**
 * speedstep_exit - unregisters SpeedStep support
 *
 *   Unregisters SpeedStep support.
 */
static void __exit speedstep_exit(void)
{
	cpufreq_unregister_driver(&speedstep_driver);
}

MODULE_PARM (smi_port, "i");
MODULE_PARM (smi_cmd, "i");

MODULE_AUTHOR ("Hiroshi Miura");
MODULE_DESCRIPTION ("Speedstep driver for IST applet SMI interface.");
MODULE_LICENSE ("GPL");

module_init(speedstep_init);
module_exit(speedstep_exit);

Index: Kconfig
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/Kconfig,v
retrieving revision 1.8
retrieving revision 1.9
diff -u -r1.8 -r1.9
--- Kconfig	11 Jul 2003 15:55:38 -0000	1.8
+++ Kconfig	3 Sep 2003 09:19:59 -0000	1.9
@@ -125,6 +125,18 @@
 
 	  If in doubt, say N.
 
+config X86_SPEEDSTEP_SMI
+	tristate "Intel SpeedStep on 440BX/ZX/MX chipsets (SMI interface)"
+	depends on CPU_FREQ
+	help
+	  This adds the CPUFreq driver for certain mobile Intel Pentium III
+	  (Coppermine), all mobile Intel Pentium III-M (Tualatin)  
+	  on systems which have an Intel 440BX/ZX/MX southbridge.
+
+	  For details, take a look at linux/Documentation/cpu-freq.
+
+	  If in doubt, say N.
+
 config X86_SPEEDSTEP_CENTRINO
 	tristate "Intel Enhanced SpeedStep"
 	depends on CPU_FREQ_TABLE
@@ -138,8 +150,8 @@
 
 config X86_SPEEDSTEP_LIB
        tristate
-       depends on X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_PIIX4
-       default X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_PIIX4
+       depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_PIIX4 || X86_SPEEDSTEP_SMI)
+       default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_PIIX4 || X86_SPEEDSTEP_SMI)
 
 config X86_P4_CLOCKMOD
 	tristate "Intel Pentium 4 clock modulation"
