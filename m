From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] New: Intel Pstate driver - powersave mode - CPU
 frequency too low
Date: Tue, 29 Apr 2014 23:47:53 +0000
Message-ID: <bug-75121-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75121

            Bug ID: 75121
           Summary: Intel Pstate driver - powersave mode - CPU frequency
                    too low
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.15rc3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: dsmythies@telus.net
        Regression: No

Until recently, the difference between the intel_pstate driver in performance
mode verses powersave mode was minimal to imperceptible. Now, the frequency
response (meaning the rate of load / noload on a CPU) is drastically different
than it used to be and often not even as good as the acpi-cpufreq driver in
ondemand mode.

This is a negative side effect from Commit fcb6a15c2e7e - intel_pstate: Take
core C0 time into account for core busy calculation.

I can revert to the same performance as previously for the intel_pstate driver
in powersave mode by changing one line in the code (kernel = 3.15rc3-doug on
the graphs). From this:

sample->core_pct_busy = mul_fp(core_pct, c0_pct);

to this:

sample->core_pct_busy = core_pct;

basically, reverting the commit.

There has been other bug reports and threads:
References:
https://bugzilla.kernel.org/show_bug.cgi?id=70941
https://bugzilla.kernel.org/show_bug.cgi?id=66581
https://lkml.org/lkml/2014/2/19/626

In a moment, I will add 3 attachment graphs that detail the issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.
