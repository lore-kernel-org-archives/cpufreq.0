From: Thomas Renninger <trenn@suse.de>
Subject: Re: intel-pstate driver questions
Date: Wed, 19 Mar 2014 16:44:06 +0100
Message-ID: <4921537.UafVOqWxOS@skinner>
References: <1922511.HUlbkiDQ6J@skinner> <532899AA.4070803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <532899AA.4070803@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: cpufreq@vger.kernel.org, dirk.j.brandewie@intel.com, rafael.j.wysocki@intel.com, viresh.kumar@linaro.org

On Tuesday, March 18, 2014 12:08:26 PM Dirk Brandewie wrote:
> On 03/18/2014 10:29 AM, Thomas Renninger wrote:
> > Hi,
> > 
> > several questions, mostly about user(space) interference:
> > 
> > 1) sysfs tunables:
> >     - max_perf_pct, min_perf_pct
> >     
> >       According to Documentation/cpu-freq/intel-pstate.txt this is:
> >        max_perf_pct: limits the maximum P state that will be requested by
> >        the driver stated as a percentage of the available performance.
> >        
> >        min_perf_pct: limits the minimum P state that will be  requested by
> >        the driver stated as a percentage of the available performance.
> >       
> >       Why is this needed, there already is:
> >       scaling_max_freq, scaling_min_freq
> 
> The min/max tunable interface was chosen to map nicely onto future Intel CPU
> P state selection mechanisms.
What for?
Instead of exporting a "future Intel CPUs" only interface to userspace,
intel_pstate driver should adapt to cpufreq subsystem and export
scaling_max_freq, scaling_min_freq
only.

I double checked:
cat /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
1600000
cat /sys/devices/system/cpu/intel_pstate/min_perf_pct
42

echo 2000000 >/sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
cat /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
2000000
cat /sys/devices/system/cpu/intel_pstate/min_perf_pct
52

So there is no need at all to keep "new Intel CPU only"
specific tunables: min_perf_pct, max_perf_pct
The same can be adjusted via general cpufreq interface via:
scaling_{min,max}_freq

Only difference is that the one is in percentage to max_freq,
the otherone is in absolute freq values, but userspace can easily
calculate this itself.

Can we deprecate these interfaces, please.

> 
> >       How are both connected?
> >       For me those tunable are doing the same and intel_pstate specific
> >       ones
> >       should vanish to have one cpufreq min/max frequency interface
> >       exported
> >       to userspace on all archs/cpufreq drivers.
> 
> They are connected via the cpufreq_set_policy() interface in the cpufreq
> core.
> >     - no_turbo: limits the driver to selecting P states below the turbo
> >     
> >       frequency range.
> >       
> >       Again, there is the general cpufreq "boost" tunable defined in
> >       cpufreq.c:
> >       ssize_t show_boost(..)
> >       static ssize_t store_boost(...)
> >       define_one_global_rw(boost);
> >       
> >       What is the difference, why does intel-pstate need its own tunable?
> 
> The current "boost" interface came in after intel_pstate.
I can darkly remember when I helped to unify the boost/turbo interface which
is quite a while ago. I expect there was something already...

Anyway, so you agree, that the general cpufreq subsystem "boost" interface
should be used instead of intel_pstate specific no_turbo tunable?

 
> > -> I'd like to integrate the intel-pstate specific stuff, mark above
> > obsolete> 
> >     and let it use the generic cpufreq tunables.
> >     Would that work out or have I overseen something?
> > 
> > 2) Disabling pstate driver (cpufreq in general)
> > 
> >     There is:
> >     intel_pstate=disable
> >     
> >     This again is somewhat driver specific. Imo cpufreq subsystem misses a
> >     general cpufreq.disable parameter for quite some time already.
> >     Best would be if this works at runtime as well.
> >     Not sure how an implementation could look like, I need to look deeper
> >     into
> >     that, but maybe someone already has an opinion about this.
> 
> This option was there to let people fallback to the old drivers if something
> went horribly wrong.
> 
> cpufreq has an API call to allow it to be completely disabled.  ATM no one
> is calling it that I am aware of, KVM was at one time.  You can work it out
> with Rafael whether a parameter should be added to disable the core
> completely. :-)

I'll look into this.
CPU frequency switching is overhead. For specific high-end (HPC,..) scenarios,
there should be a knob to switch it off easily (at runtime, not via boot 
param).
Having an intel_pstate=disable boot param and blacklisting other cpufreq 
modules to avoid the fallback to finally disable cpufreq is confusing.
Users want to have an easy knob for this.

Looking a bit into this: Disabling cpufreq at runtime can be tricky.
A workaround:
Setting the performance governor should set highest frequency and do nothing
anymore. This would be equal to "cpufreq off".

intel_pstate driver seem to recognize the performance governor, but it should:
   - Not disable no_boost option (this can still be done independetly and is
     especially useful to debug performance impact of boosting without
     dynamic cpufreq being involved
   - Disable the timer. On performance governor there is no reason to keep
     sampling overhead

> 
> Disabling cpufreq completely breaks a bunch of userspace tools.
?!? Then the tools are broken.
If you have examples, bugs should be reported.

> cpufreq is
> optional but in practice most people build it in and include tools that
> rely on cpufreq being there.
There should still be enough HW in use without CPU frequency switching 
support. Userspace must always handle this case gracefully.

> For most of intel_pstate's development before it was merged intel_pstate was
> calling cpufreq_disable since intel_pstate didn't really need the core to
> do its work.  In fact I fixed some sneaky paths were the core could be
> called into even after disable was called.
> 
> Integrating intel_pstate as a scaling driver with an internal governor in
> the cpufreq subsystem was chosen to avoid breaking as many tools as
> practical and provide an easy adoption path for those that wanted to use
> it.
> Also the precedent for this type driver was already set in the
> subsystem.
> 
> > 3) Why is intel-pstate needed at all?
> 
> Depending on the workload intel_pstate provides better system power
> efficiency that using the ondemand governor and acpi_cpufreq scaling
> driver.
Are there some numbers?
 
> >     This might have been discussed already? Would be great if someone can
> >     point
> >     be to the discussion then.
> >     I am interested in:
> >     - What is the advantage over acpi-cpufreq?
> 
> ACPI tables lie about the P states are available on a given CPU.  The ACPI
> spec limits the number of P states exposed to 16 including the hack of
> having a single P state represent the entire turbo range of the CPU.
Are there CPUs with more than 16 frequency states?
Turbo modes cannot be set by OS anyway.
But I agree that exporting supported ones read-only to userspace is a nice
feature.
This is not something Intel specific and should be more general.
cpupower frequency-info
(tools/power/cpupower in kernel git repo)
is trying to do that by directly accessing MSRs (or PCI registers on AMD).
It would be nice to have a general turbo/boost sysfs file exporting
available boost/turbo frequencies to userspace. Like that users get an idea
what is going on on their machines.
This would move the HW specific code from the userspace tool to where it 
belongs to -> the HW accessing cpufreq driver(s).
Is that possible for Intel CPUs?
 
> >     - There were discussions that on modern Intel CPUs cpufreq is a kind
> >     of
> >     
> >       obsolete power saving technique and it might be better, performance
> >       and
> >       power wise, to disable CPU frequency alltogether and let the CPU
> >       enter
> >       CPU idle states as quickly as possible instead.
> 
> This is mostly true.  Running the processor at a P state/frequency that is
> higher than needed to service the load wastes power and thermal headroom.
But you enter more efficient idle states quicker.

> You see this when the system is mostly idle or with workloads that are
> I/O bound.
Probably depends on work/sleep time cycles and CPU sleep state latencies
and efficiency and maybe some more parameters.
Therefore some numbers or hints for critical workloads and how to measure
would help a lot.

> 
> >     - Are there numbers how much intel-pstate can affect performance
> >     
> >       (theoretically in worst case and practically (specific workload?))?
> 
> intel_pstate provides as good or better performance than the ondemand
> governor in all cases I have seen.
Could you share some figures, please. Do you still have test results and 
similar, so that we get an impression under which workloads on what kind of 
CPUs (boostable, idle states avail, ...) we see performance improvement and
performance loss. I am not that interested in intel_pstate vs ondemand, but
more in intel_pstate vs no cpufreq switching active at all.

Sampling rate was an important knob which got quite some fine tuning over
time in ondemand (do not sample that often on constant high load, etc).
I wonder how high the performance overhead of sampling in intel_pstate is.
On both ways:
  - more sampling produces more pstate driver processing overhead
  - less sampling needs more time until "ramp up frequency" conditions
    are detected

> For some workloads you can get better
> performance than the performance governor due to the fact that thermal
> headroom is being conserved by running the CPU "just fast enough" allowing
> for more time to be spent in the higher turbo bins.
This is interesting and I would like to know more about workloads (IO bound?)
and how to measure/proof this.

Another question:
Why has the intel_pstate driver need to be built in?
I understand that it should be built-in in distros, so that it gets the 
prefered one over acpi-cpufreq. But why does it have to be built-in and
cannot be a tristate Kconfig option?

Thanks,

       Thomas
