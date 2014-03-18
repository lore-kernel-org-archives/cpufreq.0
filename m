From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: intel-pstate driver questions
Date: Tue, 18 Mar 2014 12:08:26 -0700
Message-ID: <532899AA.4070803@gmail.com>
References: <1922511.HUlbkiDQ6J@skinner>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=6mkga6ojXhp0smB/L1lL0nsfY6OchZaYW/HZLo1I6w8=;
        b=favMCZIm5JPL7Mah2mGiFeMcZvqhJ8lfAT/h4tfnxrWu20EphE09Ry3xrTK9GFFhQ2
         ekDUtZ2+Y8ietucBZWmFfaUmoI1Th4sB1sxsnMUShIvzaTk1JrziJLxv7ojlxwJlWITH
         YG+oRhaYpdiyIocuA0rfknsGS/BMdsa2LIxx8TSmxqmc2PTnaoeqgl12l5zlboMJHlTS
         4ZRnLr69+FepH/3EXGUjVzaQ/8OlBvKqp/2MIK/M63wDyRHJQPKUQDGo0qnxkFgjofGY
         R3hy2Mp04eYj45jlOeg7mGWL0JjUrHoAT8UhOBLv3xo9jjvEawzxT4K6Y4/nsaXr5d82
         fl5w==
In-Reply-To: <1922511.HUlbkiDQ6J@skinner>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org
Cc: dirk.brandewie@gmail.com, dirk.j.brandewie@intel.com, rafael.j.wysocki@intel.com, viresh.kumar@linaro.org

On 03/18/2014 10:29 AM, Thomas Renninger wrote:
> Hi,
>
> several questions, mostly about user(space) interference:
>
> 1) sysfs tunables:
>     - max_perf_pct, min_perf_pct
>       According to Documentation/cpu-freq/intel-pstate.txt this is:
>        max_perf_pct: limits the maximum P state that will be requested by
>        the driver stated as a percentage of the available performance.
>
>        min_perf_pct: limits the minimum P state that will be  requested by
>        the driver stated as a percentage of the available performance.
>
>       Why is this needed, there already is:
>       scaling_max_freq, scaling_min_freq
>

The min/max tunable interface was chosen to map nicely onto future Intel CPU
P state selection mechanisms.

>       How are both connected?
>       For me those tunable are doing the same and intel_pstate specific ones
>       should vanish to have one cpufreq min/max frequency interface exported
>       to userspace on all archs/cpufreq drivers.
>

They are connected via the cpufreq_set_policy() interface in the cpufreq core.

>     - no_turbo: limits the driver to selecting P states below the turbo
>       frequency range.
>
>       Again, there is the general cpufreq "boost" tunable defined in cpufreq.c:
>       ssize_t show_boost(..)
>       static ssize_t store_boost(...)
>       define_one_global_rw(boost);
>
>       What is the difference, why does intel-pstate need its own tunable?
>

The current "boost" interface came in after intel_pstate.

> -> I'd like to integrate the intel-pstate specific stuff, mark above obsolete
>     and let it use the generic cpufreq tunables.
>     Would that work out or have I overseen something?
>
> 2) Disabling pstate driver (cpufreq in general)
>
>     There is:
>     intel_pstate=disable
>
>     This again is somewhat driver specific. Imo cpufreq subsystem misses a
>     general cpufreq.disable parameter for quite some time already.
>     Best would be if this works at runtime as well.
>     Not sure how an implementation could look like, I need to look deeper into
>     that, but maybe someone already has an opinion about this.
>

This option was there to let people fallback to the old drivers if something
went horribly wrong.

cpufreq has an API call to allow it to be completely disabled.  ATM no one is
calling it that I am aware of, KVM was at one time.  You can work it out with
Rafael whether a parameter should be added to disable the core completely. :-)

Disabling cpufreq completely breaks a bunch of userspace tools.  cpufreq is
optional but in practice most people build it in and include tools that
rely on cpufreq being there.

For most of intel_pstate's development before it was merged intel_pstate was
calling cpufreq_disable since intel_pstate didn't really need the core to do
its work.  In fact I fixed some sneaky paths were the core could be called
into even after disable was called.

Integrating intel_pstate as a scaling driver with an internal governor in
the cpufreq subsystem was chosen to avoid breaking as many tools as practical
and provide an easy adoption path for those that wanted to use it.  Also the
precedent for this type driver was already set in the subsystem.

> 3) Why is intel-pstate needed at all?

Depending on the workload intel_pstate provides better system power efficiency
that using the ondemand governor and acpi_cpufreq scaling driver.

>
>     This might have been discussed already? Would be great if someone can point
>     be to the discussion then.
>     I am interested in:
>     - What is the advantage over acpi-cpufreq?

ACPI tables lie about the P states are available on a given CPU.  The ACPI spec
limits the number of P states exposed to 16 including the hack of having a
single P state represent the entire turbo range of the CPU.

>     - There were discussions that on modern Intel CPUs cpufreq is a kind of
>       obsolete power saving technique and it might be better, performance and
>       power wise, to disable CPU frequency alltogether and let the CPU enter
>       CPU idle states as quickly as possible instead.

This is mostly true.  Running the processor at a P state/frequency that is
higher than needed to service the load wastes power and thermal headroom.
You see this when the system is mostly idle or with workloads that are
I/O bound.


>     - Are there numbers how much intel-pstate can affect performance
>       (theoretically in worst case and practically (specific workload?))?

intel_pstate provides as good or better performance than the ondemand governor
in all cases I have seen. For some workloads you can get better performance
than the performance governor due to the fact that thermal headroom is being
conserved by running the CPU "just fast enough" allowing for more time to be
spent in the higher turbo bins.


>
> Thanks,
>
>         Thomas
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

