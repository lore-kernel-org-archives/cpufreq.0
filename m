From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77771] New: Intel P-State: Constantly changing CPU frequencies
 on idle system.
Date: Fri, 13 Jun 2014 05:49:56 +0000
Message-ID: <bug-77771-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77771

            Bug ID: 77771
           Summary: Intel P-State: Constantly changing CPU frequencies on
                    idle system.
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.14.7, 3.15-rc8 - 3.15
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: harn-solo@gmx.de
        Regression: No

With the introduction of the kernel patch 3.14.7 and around the release of
3.15-rc8 the idle CPU frequency of each core in an idle system is changing
erratically.

Before the patch the output of grep MHz /proc/cpuinfo looked like this:

cpu MHz         : 813.625
cpu MHz         : 813.625
cpu MHz         : 813.625
cpu MHz         : 813.625

After the patch:

cpu MHz         : 1600.207
cpu MHz         : 1600.207
cpu MHz         : 1599.847
cpu MHz         : 2342.675

The CPU clocks are wildly changing over the complete spectrum of available
frequencies. I can reproduce the phenomenon on at least three systems:

Desktop PC with Sandy-Bridge CPU: Intel i7-2600 (non-K)
Lenovo T530 with Ivy-Bridge CPU: i7-3610QM
Sony VAIO Pro 13 (example above) with Haswell CPU: i5-4200U

For me it is not clear whether this is expected behavior and I just hit some
kind of heisenbug or something is going wrong. Primarily I report this because
I noticed a significant sudden change. I haven't done any tests regarding
performance, battery run-time or heat implications yet.

Note: I've seen this kind of behavior in earlier kernel releases before, but
with 3.14 it vanished completely. So this might be a regression.

-- 
You are receiving this mail because:
You are the assignee for the bug.
