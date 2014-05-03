From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Sat, 03 May 2014 03:49:52 +0000
Message-ID: <bug-75121-12968-qyfeCeUi6W@https.bugzilla.kernel.org/>
References: <bug-75121-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-75121-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75121

--- Comment #12 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 134831
  --> https://bugzilla.kernel.org/attachment.cgi?id=134831&action=edit
CPU 7 frequency vs load. Turbo on. Modified C0 inclusion

There was a stupid mistake in the code change I made in the previous post. Here
it is again, fixed.

static inline void intel_pstate_calc_busy(struct cpudata *cpu,
                                        struct sample *sample)
{
        int32_t core_pct;
        int32_t c0_pct;
        int32_t temp;

// As a float with 6 FRAC_BITS ( 1 << FRAC_BITS / 4 )
#define C0_WEIGHT 16

        core_pct = div_fp(int_tofp((sample->aperf)),
                        int_tofp((sample->mperf)));
        core_pct = mul_fp(core_pct, int_tofp(100));
        FP_ROUNDUP(core_pct);

        c0_pct = div_fp(int_tofp(sample->mperf), int_tofp(sample->tsc));

        sample->freq = fp_toint(
                mul_fp(int_tofp(cpu->pstate.max_pstate * 1000), core_pct));

//      sample->core_pct_busy = core_pct;
//      sample->core_pct_busy = mul_fp(core_pct, c0_pct);
        temp = core_pct - int_tofp(limits.min_perf_pct);
        c0_pct = int_tofp(1) - mul_fp((int_tofp(1) - c0_pct), C0_WEIGHT);
        temp = mul_fp(temp, c0_pct);
        sample->core_pct_busy = temp + int_tofp(limits.min_perf_pct);
}

And the graph shows the effect, for C0_WEIGHT of 1 (Doug3) and 0.25 (Doug 4)

-- 
You are receiving this mail because:
You are the assignee for the bug.
