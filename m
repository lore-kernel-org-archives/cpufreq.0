From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42648] New: Frequencies higher than 1.5 GHz is not available
 for A8-3500M
Date: Tue, 24 Jan 2012 15:15:03 GMT
Message-ID: <bug-42648-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42648

           Summary: Frequencies higher than 1.5 GHz is not available for
                    A8-3500M
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.2.1
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: runetmember@gmail.com
        Regression: No


Listed pstates:
[    2.591543] powernow-k8: Found 1 AMD A8-3500M APU with Radeon(tm) HD
Graphics (4 cpu cores) (version 2.20.00)
[    2.591570] powernow-k8: Core Performance Boosting: on.
[    2.591626] powernow-k8:    0 : pstate 0 (1500 MHz)
[    2.591629] powernow-k8:    1 : pstate 1 (1400 MHz)
[    2.591631] powernow-k8:    2 : pstate 2 (1200 MHz)
[    2.591634] powernow-k8:    3 : pstate 3 (1100 MHz)
[    2.591636] powernow-k8:    4 : pstate 4 (1000 MHz)
[    2.591639] powernow-k8:    5 : pstate 5 (900 MHz)
[    2.591641] powernow-k8:    6 : pstate 6 (800 MHz)

http://en.wikipedia.org/wiki/List_of_AMD_A_microprocessors#A8_Series_2
1.5 GHz is a base frequency, but maximum frequency (Turbo Core) should be 2.4
GHz, not 1.5 GHz.
Today tested with 3.3.0rc1 - same problem here.
Distribution is Kubuntu 11.10 x86_64, laptop is Acer Aspire 7560G.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
