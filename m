From: Zwane Mwaikambo <zwane@linuxpower.ca>
Subject: Re: [PATCH] cpufreq: 1/4 SMT awareness: save cpumask_t cpus
Date: Sat, 14 Aug 2004 16:47:45 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0408141634230.22076@montezuma.fsmlabs.com>
References: <20040809195426.GD9397@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040809195426.GD9397@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

Hi Dominik,

On Mon, 9 Aug 2004, Dominik Brodowski wrote:

> Save the "affected_cpu_map" used in SMT-aware drivers in struct
> cpufreq_policy->(cpumask_t) cpus, and use it wherever possible. In
> most cases, the ->get() function is only allowed to run on one CPU [the
> one passed as argument] to keep code simpler, and as that code path
> isn't executed often, and only root can do it anyway.

>  	cpus_allowed = current->cpus_allowed;
> -        affected_cpu_map = cpumask_of_cpu(cpu);
>
> -	set_cpus_allowed(current, affected_cpu_map);
> -        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
> +	set_cpus_allowed(current, cpumask_of_cpu(cpu));
> +	BUG_ON(smp_processor_id() != cpu);

I was poking around here today to fix p4-clockmod with hotplug cpu,
something like the following should do;

set_cpus_allowed(current, cpumask_of_cpu(cpu));
preempt_disable();
if (smp_processor_id() != cpu) {
	preempt_enable();
	return;
}

rdmsr(...);

preempt_enable();

But that aside (i'll send a patch for it and Cc you), does this patchset
cover the case on SMT systems where one logical cpu is idle and the whole
physical package gets throttled. We should only be programming both
logical cpus when we're increasing the clock frequency and only one at a
time on idle. Beat me if this is covered by your patch but i couldn't find where.

Thanks,
	Zwane
