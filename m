From: Thomas Renninger <trenn@suse.de>
Subject: intel-pstate driver questions
Date: Tue, 18 Mar 2014 18:29:48 +0100
Message-ID: <1922511.HUlbkiDQ6J@skinner>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: cpufreq@vger.kernel.org
Cc: dirk.j.brandewie@intel.com, rafael.j.wysocki@intel.com, viresh.kumar@linaro.org

Hi,

several questions, mostly about user(space) interference:

1) sysfs tunables:
   - max_perf_pct, min_perf_pct
     According to Documentation/cpu-freq/intel-pstate.txt this is:
      max_perf_pct: limits the maximum P state that will be requested by
      the driver stated as a percentage of the available performance.

      min_perf_pct: limits the minimum P state that will be  requested by
      the driver stated as a percentage of the available performance.

     Why is this needed, there already is:
     scaling_max_freq, scaling_min_freq

     How are both connected?
     For me those tunable are doing the same and intel_pstate specific ones
     should vanish to have one cpufreq min/max frequency interface exported
     to userspace on all archs/cpufreq drivers.

   - no_turbo: limits the driver to selecting P states below the turbo
     frequency range.

     Again, there is the general cpufreq "boost" tunable defined in cpufreq.c:
     ssize_t show_boost(..)
     static ssize_t store_boost(...)
     define_one_global_rw(boost);

     What is the difference, why does intel-pstate need its own tunable?

-> I'd like to integrate the intel-pstate specific stuff, mark above obsolete
   and let it use the generic cpufreq tunables.
   Would that work out or have I overseen something?

2) Disabling pstate driver (cpufreq in general)

   There is:
   intel_pstate=disable

   This again is somewhat driver specific. Imo cpufreq subsystem misses a
   general cpufreq.disable parameter for quite some time already.
   Best would be if this works at runtime as well.
   Not sure how an implementation could look like, I need to look deeper into
   that, but maybe someone already has an opinion about this.

3) Why is intel-pstate needed at all?

   This might have been discussed already? Would be great if someone can point
   be to the discussion then.
   I am interested in:
   - What is the advantage over acpi-cpufreq?
   - There were discussions that on modern Intel CPUs cpufreq is a kind of
     obsolete power saving technique and it might be better, performance and
     power wise, to disable CPU frequency alltogether and let the CPU enter
     CPU idle states as quickly as possible instead.
   - Are there numbers how much intel-pstate can affect performance
     (theoretically in worst case and practically (specific workload?))?

Thanks,

       Thomas
