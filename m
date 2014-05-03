From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Sat, 03 May 2014 00:19:21 +0000
Message-ID: <bug-75121-12968-26AuNCCyDh@https.bugzilla.kernel.org/>
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

--- Comment #11 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 134821
  --> https://bugzilla.kernel.org/attachment.cgi?id=134821&action=edit
Perf data for Kernel 3.15RC3-doug2 CPU at 85% load at 200 Hertz load / noload
frequency.

For this one, I tried the following, which includes C0 but applied to core_pct
on a scale from min_perf_pct rather than from 0. However, it made no
difference, as the C0 inclusion still dominates.

static inline void intel_pstate_calc_busy(struct cpudata *cpu,
                                        struct sample *sample)
{
        int32_t core_pct;
        int32_t c0_pct;
        int32_t temp;

// need to figure out how to do fractional weight
#define C0_WEIGHT 1

        core_pct = div_fp(int_tofp((sample->aperf)),
                        int_tofp((sample->mperf)));
        core_pct = mul_fp(core_pct, int_tofp(100));
        FP_ROUNDUP(core_pct);

        c0_pct = div_fp(int_tofp(sample->mperf), int_tofp(sample->tsc));

        sample->freq = fp_toint(
                mul_fp(int_tofp(cpu->pstate.max_pstate * 1000), core_pct));

//      sample->core_pct_busy = core_pct;
//      sample->core_pct_busy = mul_fp(core_pct, c0_pct);
        temp = core_pct - limits.min_perf_pct;
        c0_pct = int_tofp(1) - mul_fp((int_tofp(1) - c0_pct),
int_tofp(C0_WEIGHT));
        temp = mul_fp(temp, c0_pct);
        sample->core_pct_busy = temp + limits.min_perf_pct;
}

-- 
You are receiving this mail because:
You are the assignee for the bug.
