From: Dominik Brodowski <linux@brodo.de>
Subject: Re: dynamic cpufreq governor
Date: Mon, 3 Nov 2003 23:55:46 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031103225546.GC3895@brodo.de>
References: <1067583848.25805.234.camel@localhost>
	<20031101180948.GB3945@brodo.de>
	<1067740662.3303.108.camel@localhost>
	<1067832645.4586.10.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1067740662.3303.108.camel@localhost>
	<1067832645.4586.10.camel@localhost>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Anderson <janderson@janderson.ca>
Cc: cpufreq@www.linux.org.uk

On Sat, Nov 01, 2003 at 09:37:42PM -0500, Jon Anderson wrote:
> Thanks for your input on this one. I have a few questions...If they're
> out of place, let me know, and I'll shut up. :)

Discussion of cpufreq governors is never out of place on the cpufreq mailing
list, IMHO.

> On Sat, 2003-11-01 at 13:09, Dominik Brodowski wrote:
> > It seems to me that your governor uses exactly the same algorithm as the one
> > proposed by Venkatesh Pallipadi, but maybe with some slightly different
> > default values. So, I'd prefer if only one of these two were
> > merged into CVS and/or the kernel. And, for that matter, I prefer
> > Venkatesh's code at the moment as it's cleaner, supports different CPUs,
> > ... - but see below for some details.
> 
> I would actually say at this moment that I would probably prefer
> Venkatesh's code be merged over my own, for basically the same reasons.
> (I'm a student, and very much an amateur coder - a beginner in the
> kernel arena. This is very much a learning experience for me. :)

Hey, I'm a student myself, and cpufreq was one big learning experience for
me, too!

> I just took a look through it, and it does seem to use a similar
> algorithm, though I don't understand some elements of it. Implementation
> seems to be drastically different. I don't understand in what way the
> two drivers differ in terms of CPU support. Please elaborate. (I don't
> understand how my governor doesn't support different CPUs - I thought it
> did.)

It had not supported multiple CPUs, but it seems to do so now [haven't
looked at the code yet, will do so in a moment].

> I did actually make a few major changes yesterday, the new file is
> attached. It now should support SMP, and should now step downwards at
> 1/5th the speed of stepping up.

This changes causes your governor to use a different algorithm to 
Venkatesh's one, so one of the reasons why I preferred his governor over
your is gone :-) 

> Since this code won't be merged, should I continue to post my changes
> here, or is that inappropriate?  

a) I don't decide what's merged and what's not, that's Dave's job as
   maintainer of cpufreq.
b) IMO the previously posted code wasn't good enough to be merged -- this
   may have changed in the meantime [again, I haven't looked at the code
   yet], or it may change to do so in future. So there is still a chance it
   will eventually be merged.
c) Even if you say "I don't want this to be part of the kernel", it still
   would be a cpufreq governor which IMO can be discussed here.

> > That's not entirely correct -- it just has rather strict limits on the
> > "transition latency", and several cpfureq drivers don't set the proper
> > transition latency but the dummy value "CPUFREQ_ETERNAL" which disables
> > dynamic governors [in kernelspace].
> 
> That is I noticed that in the code originally. I commented out the
> latency check, so I could try the dbs module with the P4-clockmod
> driver. This results in a machine lockup, which is why I originally
> wrote the "dynamic" module. 
I'll investigate into the p4-clockmod lockup soon; I did not experience it
on my speedstep-smi testing system, though...

> I assume the lockup is because the dbs
> module seems to poll HZ times a second (10 times as often as mine.),
> which would overwhelm the p4-clockmod driver. 

Actually, there is no information by Intel (yet) on how often p4-clockmod
transitions may be done, so this might or might not be true.

> I guess it just seems a waste to have to compile in two governors, when
> the static governor would only be in use for the short period of time
> until a boot script sets up whichever dynamic governor. Point taken
> though.
Then compile the other one as a module. And cpufreq_performance.o is 3032 bytes
large... [I'm surprised by the difference to cpufreq_powersave.o [2284
bytes], though... anybody interested in investigating the difference?]

> I suppose the name is moot though, since it won't be merged anyway.
see above
> Perhaps cpufreq_dynamic_ugly for now. ;)
"anderson" maybe?

> What happens when a governor attempts to set a speed that the driver
> can't handle? Is it driver independant? 

There seems to be some confusion about this [I really need to write a
cpufreq HOWTO somewhen soon...]:

If a target frequency isn't supported by the CPU, the "relation" argument
decides what is done instead:
if it's CPUFREQ_RELATION_L, the next higher frequency supported by the CPU
is used [L stands for "lowest but not lower than"]
if it's CPUFREQ_RELATION_H, the next lower frequency supported by the CPU is
used [H stands for "highest but not higher than"]

In most cases you probably want to guarantee a specific level
of processing power, say n MHz. You then provide CPUFREQ_RELATION_L as
argument. 

> Is there a better way to search for available frequencies? Would it be 
> worthwhile to set a number of defined steps, say 'max', '2/3 max', '1/3
> max', 'min' 

IMHO yes.

> I didn't bother changing the name, because of probable non-inclusion.
See above.

> +config CPU_FREQ_DEFAULT_GOV_DYNAMIC
already discussed

> +/* FREQ_MULT is 1/4 with FREQ_STEPS = 5 -> max * 1/4 * step# = step_freq  */
> +#define FREQ_MULT 1/(FREQ_STEPS - 1)
nice :-)

> +/* If transition latency is too high, this module can be force-enabled anyway. */
> +/* # modprobe cpufreq_dynamic force_latency=1  */
> +static unsigned short force_latency = 0;
> +MODULE_PARM(force_latency,"i");

This might allow users to break their hardware. That's a no-go. Better
provide a module parameter which lets you set the sleep_interval, which in
turn changes the latency limit in this file.

> +/** Should be a list, from FREQ_MAX to FREQ_MIN of CPU speeds in KHz. */
> +/* Managed semi-automatically in frequency steps. */
> +unsigned int cpufreq_dynamic_freqs[NR_CPUS][FREQ_STEPS];
Can you move this into cpufreq_dynamic_cpuinfo, please?

> +/* Struct to hold CPU status information. */
> +typedef struct cpufreq_dynamic_cpuinfo {
No typedef's please.

> +/* CPU Status information for all CPUs */
> +cpufreq_dynamic_cpuinfo cpufreq_dynamic_status[NR_CPUS];
Can be defined as static.

> +/* Prototype for the work queue callback function. */
> +void cpufreq_gov_dynamic_work(void *mt);
Can be defined as static, too.

> +/* Use work queues, rather than kernel timers. */
> +DECLARE_WORK(cpufreq_dynamic,cpufreq_gov_dynamic_work,NULL);
I think this can be static, too.

> +	for (cur_cpu = 0;cur_cpu < NR_CPUS;cur_cpu++) {
> +		if (! cpufreq_dynamic_status[cur_cpu].enabled) {
Usually enabled != 0 means "enabled", contrary to your implementation.

> +			if ((cpufreq_dynamic_status[cur_cpu].percent_idle > MAX_IDLE) || (cpufreq_dynamic_status[cur_cpu].percent_idle < MIN_IDLE)) {
> +				cpufreq_governor(cur_cpu,CPUFREQ_GOV_LIMITS);
I'll get to that later...

> +	case CPUFREQ_GOV_START:
> +		printk(KERN_INFO "cpufreq_dynamic: Starting dynamic governor on CPU%i\n",policy->cpu);
> +
> +		if (policy->cpuinfo.transition_latency > MAX_LATENCY_NS) {
> +			printk(KERN_NOTICE "cpufreq_dynamic: Transition latency exceeds maximum allowable latency\n");
> +			if (! force_latency) {
> +				printk(KERN_NOTICE "cpufreq_dynamic: Reverting to 'performance' behavior.\n");
> +				__cpufreq_driver_target(policy,policy->max,CPUFREQ_RELATION_L);
You shouldn't need this last call. Also, please return an error as result,
not 0.

> +	case CPUFREQ_GOV_LIMITS:
I don't see you handling the case where policy->min and policy->max change.
That's usually when CPUFREQ_GOV_LIMITS gets called. Also, I don't see the
reason why you do the acutal setting here, after the indirect call from the
workqueue work function. You can do all the stuff you're doing here directly
there, as long as you use cpufreq_driver_target instead of
__cpufreq_driver_target.

Other than that, your code is getting more and more interesting. Need to
test it out somewhen.

	Dominik
