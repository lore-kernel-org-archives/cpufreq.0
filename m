From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 71931] New: intel_pstate: cpufreq: __cpufreq_add_dev: ->get()
 failed
Date: Tue, 11 Mar 2014 20:41:52 +0000
Message-ID: <bug-71931-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=71931

            Bug ID: 71931
           Summary: intel_pstate: cpufreq: __cpufreq_add_dev: ->get()
                    failed
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.13.5
          Hardware: IA-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: patrik.lundquist@gmail.com
                CC: dirk.brandewie@gmail.com
        Regression: No

Booting 3.13.5 on a dual socket Ivy Bridge-EP resulted in this error:

[    0.194139] smpboot: CPU0: Intel(R) Xeon(R) CPU E5-2687W v2 @ 3.40GHz (fam:
06, model: 3e, stepping: 04)
...
[    0.246755] x86: Booting SMP configuration:
[    0.250935] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
[    0.357648] .... node  #1, CPUs:    #8  #9 #10 #11 #12 #13 #14 #15
[    0.553293] x86: Booted up 2 nodes, 16 CPUs
[    0.557666] smpboot: Total of 16 processors activated (108850.19 BogoMIPS)
...
[    5.210204] Intel P-state driver initializing.
[    5.232407] Intel pstate controlling: cpu 0
[    5.253628] Intel pstate controlling: cpu 1
[    5.274899] cpufreq: __cpufreq_add_dev: ->get() failed
[    5.294856] Intel pstate controlling: cpu 2
[    5.313553] Intel pstate controlling: cpu 3
[    5.332526] Intel pstate controlling: cpu 4
[    5.352347] Intel pstate controlling: cpu 5
[    5.372112] Intel pstate controlling: cpu 6
[    5.391097] Intel pstate controlling: cpu 7
[    5.410272] Intel pstate controlling: cpu 8
[    5.429092] Intel pstate controlling: cpu 9
[    5.447714] Intel pstate controlling: cpu 10
[    5.465872] Intel pstate controlling: cpu 11
[    5.482942] Intel pstate controlling: cpu 12
[    5.498414] Intel pstate controlling: cpu 13
[    5.513586] Intel pstate controlling: cpu 14
[    5.529200] Intel pstate controlling: cpu 15

CPU 1 is alive and well but missing the cpufreq driver. The system is running
fine otherwise.

Looking closer at the problem gives that intel_pstate_init_cpu() is successful
but intel_pstate_get(), which is called right after by cpufreq, fails.

Since all_cpu_data[1] is initialized it gives that sample->freq must be zero.
So the bug should be in intel_pstate_calc_busy() which calculates sample->freq
to zero.

core_pct is likely 0 due to truncation in
intel_pstate.c:intel_pstate_calc_busy():

    core_pct = div64_u64(int_tofp(sample->aperf * 100),
                 sample->mperf);

-- 
You are receiving this mail because:
You are the assignee for the bug.
