From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH 2.6.8-rc2] speedstep SMT support
Date: Wed, 28 Jul 2004 19:20:28 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040728172028.GB8678@dominikbrodowski.de>
References: <4107B8DE.5020401@cern.ch>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4107B8DE.5020401@cern.ch>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian.Hoelbling@cpt.univ-mrs.fr
Cc: cpufreq@www.linux.org.uk

On Wed, Jul 28, 2004 at 02:31:58PM +0000, Christian Hoelbling wrote:
> i have noticed that the most recent vanilla kernel oopses on a P4M-HT 
> (because only one CPU is registered in sysfs but 2 are informed of a 
> change of state).

Yes, please see my patch sent to this list on July 19th adressing this
issue. Hopefully it gets into 2.6.8.

> this patch should fix these 2 issues. for the first one, it registerers 
> all logical cpu's
I don't like this: as both siblings can only be changed at the same time,
and all changes affect both siblings, only one instance should be
registered. The current cpufreq core lacks proper support for that, but --
as you have seen -- I'm working on it. Until then, I'd prefer to work around
the issues, and simply not register a second instance.

> maybe they are usefull still.
Let's see:

> --- linux-2.6.8-rc2/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-07-26 10:13:07.000000000 +0000
> +++ linux-2.6.8-rc2-speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-07-28 11:10:09.000000000 +0000
> @@ -67,6 +67,7 @@
>  /**
>   * speedstep_set_state - set the SpeedStep state
>   * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
> + * @notify: whether to call cpufreq_notify_transition for CPU speed changes

There's no "notify" argument to speedstep_set_state, AFAICS.

> +	set_cpus_allowed(current, affected_cpu_map);
> +	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
> +	set_cpus_allowed(current, cpus_allowed);

I agree that this is "cleaner"... as there's only one physical CPU and both
[or even more...] siblings run at the same speed, it shouldn't matter. As
it's cleaner, though, I like this change. However, why not simply call
speedstep_get(cpu), which needs the same change [and you already did the
change there, too...]. Saving 1 line of code ;-)

> +	/* no transition necessary */
> +	if (freqs.old == freqs.new) {
> +	        set_cpus_allowed(current, cpus_allowed);
No need to do that, you already did that above.

>  
>  	for_each_cpu_mask(i, affected_cpu_map) {
> -		freqs.cpu = i;
> +	        freqs.cpu = i;
Whitespace is corrected the "wrong" way: two tabs are preferred.

> +	/* notifiers */
>  	for_each_cpu_mask(i, affected_cpu_map) {
> -		freqs.cpu = i;
> +	        freqs.cpu = i;
Same here.

> -
> -	/* capability check */
> -	if (policy->cpu != 0) /* FIXME: better support for SMT in cpufreq core. Up until then, it's better to register only one CPU */
> -		return -ENODEV;
> -

Please don't remove this, as stated above. Please use my workaround patch
instead.

>  	/* get current speed setting */
> +	set_cpus_allowed(current, affected_cpu_map);
>  	speed = speedstep_get_processor_frequency(speedstep_processor);
>  	set_cpus_allowed(current, cpus_allowed);

Please use speedstep_get() here as well, as it'll save an additional two
lines of code ;-) ... no, that's not the real reason: it is that if one
piece of code already provides that functionality, doubling it should be
avoided to remove maintenance overhead. And so it'll simplify me writing the
proper SMT handling...

>  static unsigned int speedstep_get(unsigned int cpu)
>  {
> -	return speedstep_get_processor_frequency(speedstep_processor);
> + 	unsigned int	speed;
> +	cpumask_t       cpus_allowed,affected_cpu_map;
> + 
> +	/* only run on CPU to be set, or on its sibling */
> +	cpus_allowed = current->cpus_allowed;
> +#ifdef CONFIG_SMP
> +	affected_cpu_map = cpu_sibling_map[cpu];
> +#else
> +	affected_cpu_map = cpumask_of_cpu(cpu);
> +#endif
> +	set_cpus_allowed(current, affected_cpu_map);
> +	speed=speedstep_get_processor_frequency(speedstep_processor);
> +	set_cpus_allowed(current, cpus_allowed);
> +	return speed;
Looks good, as stated above.

>  static struct freq_attr* speedstep_attr[] = {
> diff --unified --recursive --new-file linux-2.6.8-rc2/drivers/cpufreq/cpufreq.c linux-2.6.8-rc2-speedstep/drivers/cpufreq/cpufreq.c
> --- linux-2.6.8-rc2/drivers/cpufreq/cpufreq.c	2004-07-26 10:13:07.000000000 +0000
> +++ linux-2.6.8-rc2-speedstep/drivers/cpufreq/cpufreq.c	2004-07-28 12:35:52.000000000 +0000
> @@ -218,7 +218,7 @@
>  
>  
>  /**
> - * store_scaling_governor - store policy for the specified CPU
> + * store_scaling_governor - store policy for the specified CPU and all of its siblings
>   */
>  static ssize_t store_scaling_governor (struct cpufreq_policy * policy, 
>  				       const char *buf, size_t count) 
> @@ -226,6 +226,8 @@
>  	unsigned int ret = -EINVAL;
>  	char	str_governor[16];
>  	struct cpufreq_policy new_policy;
> +	cpumask_t affected_cpu_map;
> +	int i;
>  
>  	ret = cpufreq_get_policy(&new_policy, policy->cpu);
>  	if (ret)
> @@ -238,8 +240,15 @@
>  	if (cpufreq_parse_governor(str_governor, &new_policy.policy, &new_policy.governor))
>  		return -EINVAL;
>  
> +#ifdef CONFIG_SMP
> +	affected_cpu_map = cpu_sibling_map[new_policy.cpu];
> +	for_each_cpu_mask(i, affected_cpu_map) {
> +	        new_policy.cpu = i;
> +		ret = ret & cpufreq_set_policy(&new_policy);
> +	}
> +#else

This I'd prefer not to be merged: 
a) CONFIG_SMP doesn't mean cpu_sibling_map exist, e.g. on non-x86 architectures
b) it "emulates" sibling-awareness, though the governors are not.

Instead, I'd prefer if we keep up with the "only-register-one-CPU" in the
speedstep-ich case until a proper SMT patchkit is applied.

However, for the other changes: could you consider my opinions, maybe update it
and resend it, please? 


Thanks,
	Dominik
