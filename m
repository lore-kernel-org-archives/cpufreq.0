From: Jon Anderson <janderson@janderson.ca>
Subject: Re: CPUFreq dynamic speed governor, take 2.
Date: Sat, 01 Nov 2003 21:37:42 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1067740662.3303.108.camel@localhost>
References: <1067583848.25805.234.camel@localhost>
	<20031101180948.GB3945@brodo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-UeLYtwR+2bOOL5Jp0qiC"
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031101180948.GB3945@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--=-UeLYtwR+2bOOL5Jp0qiC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks for your input on this one. I have a few questions...If they're
out of place, let me know, and I'll shut up. :)

On Sat, 2003-11-01 at 13:09, Dominik Brodowski wrote:
> It seems to me that your governor uses exactly the same algorithm as the one
> proposed by Venkatesh Pallipadi, but maybe with some slightly different
> default values. So, I'd prefer if only one of these two were
> merged into CVS and/or the kernel. And, for that matter, I prefer
> Venkatesh's code at the moment as it's cleaner, supports different CPUs,
> ... - but see below for some details.

I would actually say at this moment that I would probably prefer
Venkatesh's code be merged over my own, for basically the same reasons.
(I'm a student, and very much an amateur coder - a beginner in the
kernel arena. This is very much a learning experience for me. :)

I just took a look through it, and it does seem to use a similar
algorithm, though I don't understand some elements of it. Implementation
seems to be drastically different. I don't understand in what way the
two drivers differ in terms of CPU support. Please elaborate. (I don't
understand how my governor doesn't support different CPUs - I thought it
did.)

I did actually make a few major changes yesterday, the new file is
attached. It now should support SMP, and should now step downwards at
1/5th the speed of stepping up. I will make a pile of additional changes
based on your comments. (Thank you for taking the time to actually read
through my code! I really appreciate it!) 

Since this code won't be merged, should I continue to post my changes
here, or is that inappropriate?  

> That's not entirely correct -- it just has rather strict limits on the
> "transition latency", and several cpfureq drivers don't set the proper
> transition latency but the dummy value "CPUFREQ_ETERNAL" which disables
> dynamic governors [in kernelspace].

That is I noticed that in the code originally. I commented out the
latency check, so I could try the dbs module with the P4-clockmod
driver. This results in a machine lockup, which is why I originally
wrote the "dynamic" module. I assume the lockup is because the dbs
module seems to poll HZ times a second (10 times as often as mine.),
which would overwhelm the p4-clockmod driver. 

> > 2) People seem to prefer userspace tools to govern frequency.
> Well, I surely don't. I prefer kernelspace.

Woo! Strongly agreed!

> > +config CPU_FREQ_DEFAULT_GOV_DYNAMIC
> "Dynamic" governors can't be default governor -- they can fail due to
> transition latency limits, and would leave the cpufreq core in an undefined
> state then. Also, the name "dynamic" is too generic as there likely will be
> different dynamic cpufreq governors available.

I guess it just seems a waste to have to compile in two governors, when
the static governor would only be in use for the short period of time
until a boot script sets up whichever dynamic governor. Point taken
though.

I suppose the name is moot though, since it won't be merged anyway.
Perhaps cpufreq_dynamic_ugly for now. ;)

> There's no valid reason for such a table. A governor should either
> calculate a percentage of operating power, and say whether to go up or down
> if this frequency = percentage * max_frequency isn't available. 

That's why the meat of the table was commented out, and left only
FREQ_MIN and FREQ_MAX, which use policy->min and policy->max. I don't
know how to get the available frequencies from the current driver, so
that's why I used this. (I believe I even made a comment about the
ugliness of this in my code.)

I had originally planned on using the array (not originally a static
const) as a calculated table of available frequencies. Since I couldn't
think of a good way to get a set of available frequencies, I made it as
it is now.

What happens when a governor attempts to set a speed that the driver
can't handle? Is it driver independant? 

> Actually, this is a problem in Venkatesh's code: If the governor says "there's
> too few processing power available, let's increase the speed" it increases
> the current speed by 1 kHz, and says this is a "low limit" which means that
> the new speed must be higher than that. For the common frequency scaling
> implementations out there, which define only few frequency states, this is
> not a problem. For the geode driver, though, which has several thousand
> frequency states available IIRC, this is a big problem: switching from
> lowest to highest speed may take a couple of seconds or even minutes!

Is there a better way to search for available frequencies? Would it be 
worthwhile to set a number of defined steps, say 'max', '2/3 max', '1/3
max', 'min' -> What happens when something like '2/3 max' isn't an
available frequency? 

--
jon anderson

--=-UeLYtwR+2bOOL5Jp0qiC
Content-Disposition: attachment; filename=cpufreq_dynamic.c
Content-Type: text/x-c; name=cpufreq_dynamic.c; charset=us-ascii
Content-Transfer-Encoding: 7bit

/*
 *  linux/drivers/cpufreq/cpufreq_dynamic.c
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * *** Experimental! ***
 *
 * TODO: 
 *       - *** DONE *** Handle more than CPU 0.
 *       - Put in a better stepping mechanism.
 *       - *** DONE *** Step downwards slower than stepping upwards. 
 *          (I think this would work more efficiently than as it is now.)
 *       - Documenting in Documentation/cpufreq
 *       - Documentation that is NOT crappy in this file.
 *       - Proper debug printing.
 *
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/cpufreq.h>
#include <linux/init.h>
#include <linux/timer.h>
#include <linux/times.h>
#include <asm/timex.h>

#include <linux/kernel_stat.h>

/* How many times/second to poll */
#define POLL_FREQUENCY 10

/* Wait HZ/POLL_FREQUENCY jiffies in between polling. */
#define SLEEP_JIFFIES HZ/POLL_FREQUENCY

/* How many timer ticks to wait before decreasing frequency. */
#define DEC_TICKS 5

/* Minimum and maximum idle thresholds, in percent */
#define MIN_IDLE 20
#define MAX_IDLE 80

/* Internal definitions for temporary frequency table. Ug-ly. */
#define FREQ_MAX 0
#define FREQ_MIN -1

/** Should be a list, from FREQ_MAX to FREQ_MIN of CPU speeds in KHz. 
 * e.g. { FREQ_MAX,1500000,1000000,500000,FREQ_MIN }
 */
static const int32_t cpufreq_dynamic_freqs[] = {
	FREQ_MAX, \
/**
 * FIXME: Find better way to find frequencies to switch to.
 *
 * These values work on my non-mobile P4 2 GHz, but 
 * would probably just waste CPU cycles on most other
 * CPUs. (I.e. these values would probably be invalid.)
 */
/* 	1500000, \
	1000000, \
	500000, \ */
	FREQ_MIN \
};

// Kernel Timer for this module. (Timers are awesome!)
struct timer_list cpufreq_dynamic_timer[NR_CPUS];

// Struct to hold CPU status information.
typedef struct cpufreq_dynamic_cpuinfo {
	unsigned long prev_idle; // CPU idle time, in jiffies.
	unsigned long percent_idle; // Idle percentage. 
	uint8_t	cur_freq_id; // What ID from the stupid table we're at.
	uint8_t dec_wait;
} cpufreq_dynamic_cpuinfo;

// CPU Status information for all CPUs
cpufreq_dynamic_cpuinfo cpufreq_dynamic_status[NR_CPUS];

/**
 * cpufreq_governor_dynamic_getidle
 *
 * Collects idle and idle percentage statistics about a given CPU.
 *
 * @param cur_cpu The cpu for which statistics are to be collected.
 *
 * Inline to save needless function call overhead...I think. If this is bad, please let me know.
 */
inline void cpufreq_governor_dynamic_getidle(unsigned int cur_cpu) {
	//printk(KERN_DEBUG "cpufreq_dynamic: Calculating idle percentage for CPU%i\n",cur_cpu);
	cpufreq_dynamic_status[cur_cpu].percent_idle = POLL_FREQUENCY * 100 * (kstat_cpu(cur_cpu).cpustat.idle - cpufreq_dynamic_status[cur_cpu].prev_idle) / HZ;
	cpufreq_dynamic_status[cur_cpu].prev_idle = kstat_cpu(cur_cpu).cpustat.idle;
}

/**
 * cpufreq_governor_dynamic_callback
 * 
 * This is the kernel timer callback function. It executes cpufreq_governor if idles are outside thresholds.
 *
 * @param cur_cpu The cpu to work with. This parameter comes from timer.data.
 */
static void cpufreq_governor_dynamic_callback(unsigned long cur_cpu) {
	cpufreq_governor_dynamic_getidle(cur_cpu);
	//printk(KERN_DEBUG "cpufreq_dynamic: Timer callback for CPU%lu -> %lu%% idle.\n",cur_cpu,cpufreq_dynamic_status[cur_cpu].percent_idle);
	if ((cpufreq_dynamic_status[cur_cpu].percent_idle > MAX_IDLE) || (cpufreq_dynamic_status[cur_cpu].percent_idle < MIN_IDLE)) {
		cpufreq_governor(cur_cpu,CPUFREQ_GOV_LIMITS);
	} else {
		cpufreq_dynamic_status[cur_cpu].dec_wait = DEC_TICKS;
	}

	// Set the timer again.
	cpufreq_dynamic_timer[cur_cpu].expires = jiffies + SLEEP_JIFFIES;
	add_timer(&cpufreq_dynamic_timer[cur_cpu]);
}

/**
 * cpufreq_governor_dynamic
 *
 * The governor itself.
 * 
 * More documentation should go here.
 */
static int cpufreq_governor_dynamic(struct cpufreq_policy *policy,unsigned int event) {
	switch (event) {
	case CPUFREQ_GOV_START:
		printk(KERN_DEBUG "cpufreq_dynamic: Starting dynamic governor on CPU%i\n",policy->cpu);
		// Init info for policy CPU.
		cpufreq_dynamic_status[policy->cpu].cur_freq_id = 0; // Set initially to max speed.
		cpufreq_dynamic_status[policy->cpu].prev_idle = kstat_cpu(policy->cpu).cpustat.idle; // Set previous idle.
		cpufreq_governor_dynamic_getidle(policy->cpu); // Get initial idle time.
		
		// Initialize the timer.
		cpufreq_dynamic_timer[policy->cpu].function = cpufreq_governor_dynamic_callback;
		cpufreq_dynamic_timer[policy->cpu].data = policy->cpu;
		cpufreq_dynamic_timer[policy->cpu].expires = jiffies + SLEEP_JIFFIES;
		init_timer(&cpufreq_dynamic_timer[policy->cpu]);
		add_timer(&cpufreq_dynamic_timer[policy->cpu]);

		printk(KERN_DEBUG "cpufreq_dynamic: dynamic governor started on CPU%i.\n",policy->cpu);
	
		// No need to change the frequency until we've collected SLEEP_JIFFIES worth of stats.
		break;

	case CPUFREQ_GOV_LIMITS:
		
		// If we're too idle, we want to decrease the CPU frequency.
		if (cpufreq_dynamic_status[policy->cpu].percent_idle > MAX_IDLE) {
			if (--cpufreq_dynamic_status[policy->cpu].dec_wait > 0) {
				// Waiting a little before dropping frequency.
				// Leaving room for something here, if need be.
			// Don't do anything if we're already at minimum frequency.
			} else if (cpufreq_dynamic_freqs[cpufreq_dynamic_status[policy->cpu].cur_freq_id] != FREQ_MIN) {
				cpufreq_dynamic_status[policy->cpu].dec_wait = DEC_TICKS;
				// If we're to step down to FREQ_MIN, use the policy's value.
				if (cpufreq_dynamic_freqs[++cpufreq_dynamic_status[policy->cpu].cur_freq_id] == FREQ_MIN) {
					printk(KERN_INFO "cpufreq_dynamic: Setting CPU%i to minimum frequency: %u KHz\n",policy->cpu,policy->min);
					__cpufreq_driver_target(policy,policy->min,CPUFREQ_RELATION_L);
				} else {
					printk(KERN_INFO "cpufreq_dynamic: decreasing CPU%i frequency to %i KHz\n",policy->cpu,cpufreq_dynamic_freqs[cpufreq_dynamic_status[policy->cpu].cur_freq_id]);
					__cpufreq_driver_target(policy,cpufreq_dynamic_freqs[cpufreq_dynamic_status[policy->cpu].cur_freq_id],CPUFREQ_RELATION_L);
				}
			}
		// If we're not idle enough, we want to increase the CPU frequency.
		} else if (cpufreq_dynamic_status[policy->cpu].percent_idle < MIN_IDLE) {
			cpufreq_dynamic_status[policy->cpu].dec_wait = DEC_TICKS;
			// Don't do anything if we're already at the max frequency.
			if (cpufreq_dynamic_freqs[cpufreq_dynamic_status[policy->cpu].cur_freq_id] != FREQ_MAX) {
				// If we're to step up to FREQ_MAX, use the policy's value.
				if (cpufreq_dynamic_freqs[--cpufreq_dynamic_status[policy->cpu].cur_freq_id] == FREQ_MAX) {
					printk(KERN_INFO "cpufreq_dynamic: Setting CPU%i to maximum frequency: %u KHz\n",policy->cpu,policy->max);
					__cpufreq_driver_target(policy,policy->max,CPUFREQ_RELATION_L);
				} else {
					printk("cpufreq_dynamic: increasing CPU%i frequency to %i KHz\n",policy->cpu,cpufreq_dynamic_freqs[cpufreq_dynamic_status[policy->cpu].cur_freq_id]);
					__cpufreq_driver_target(policy,cpufreq_dynamic_freqs[cpufreq_dynamic_status[policy->cpu].cur_freq_id],CPUFREQ_RELATION_L);
				}
			}
		}
		break;
	case CPUFREQ_GOV_STOP:
		printk(KERN_DEBUG "cpufreq_dynamic: Stopping dynamic governor.\n");
		del_timer(&cpufreq_dynamic_timer[policy->cpu]);
		break;
	default:
		break;
	}
	return 0;
}
                                                            
struct cpufreq_governor cpufreq_gov_dynamic = {
	.name		= "dynamic",
	.governor	= cpufreq_governor_dynamic,
	.owner		= THIS_MODULE,
};
EXPORT_SYMBOL(cpufreq_gov_dynamic);


static int __init cpufreq_gov_dynamic_init(void)
{
	return cpufreq_register_governor(&cpufreq_gov_dynamic);
}


static void __exit cpufreq_gov_dynamic_exit(void)
{
	unsigned int cur_cpu;
	for (cur_cpu=0;cur_cpu<NR_CPUS;cur_cpu++) {
		del_timer(&cpufreq_dynamic_timer[cur_cpu]);
	}
	cpufreq_unregister_governor(&cpufreq_gov_dynamic);
}


MODULE_AUTHOR("Jonathan Anderson <janderson@janderson.ca");
MODULE_DESCRIPTION("Dynamic CPUfreq policy governor");
MODULE_LICENSE("GPL");

//fs_initcall(cpufreq_gov_dynamic_init);
module_init(cpufreq_gov_dynamic_init);
module_exit(cpufreq_gov_dynamic_exit);

--=-UeLYtwR+2bOOL5Jp0qiC
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--=-UeLYtwR+2bOOL5Jp0qiC--


