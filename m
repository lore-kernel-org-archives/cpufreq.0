From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 80651] New: [intel_pstate] pstate settings are lost during
 suspend/resume cycle
Date: Fri, 18 Jul 2014 22:37:22 +0000
Message-ID: <bug-80651-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=80651

            Bug ID: 80651
           Summary: [intel_pstate] pstate settings are lost during
                    suspend/resume cycle
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.15.6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: liquid.acid@gmx.net
        Regression: No

Created attachment 143431
  --> https://bugzilla.kernel.org/attachment.cgi?id=143431&action=edit
dmesg output

Hello,

the patches that went into 3.15.6 made the intel_pstate driver finally useable
for me. At least as long as I don't suspend/resume the system.

After resume the multiplicator is locked to the highest one. I have to change
min_perf_pct and max_perf_pct to some other values and then back to restore the
behaviour before the suspend.

CPU is a Haswell / i7-4700HQ.

With best wishes,
Tobias

-- 
You are receiving this mail because:
You are the assignee for the bug.
