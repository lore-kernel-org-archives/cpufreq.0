From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 57871] New: Cpu frequency scaling not working after waking up
 from suspend.
Date: Thu,  9 May 2013 14:08:29 +0000 (UTC)
Message-ID: <bug-57871-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=57871

           Summary: Cpu frequency scaling not working after waking up from
                    suspend.
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.9
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: xdever@gmail.com
        Regression: Yes


Created an attachment (id=101031)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=101031)
Dmesg, cpuinfo and kernel config

Environment: Thinkpad X220, Intel(R) Core(TM) i7-2620M CPU @ 2.70GHz, Gentoo

Description. I use 3.9 mainline kernel, with intel_pstate disabled (with intel
pstate it uses ~0.2W more power when reading pdf document than without it).
Since kernel 3.9, when my machine wakes up from suspend, in about 1 cases out
of 3 the CPU scaling won't work and the CPU-s are stucked at 2.7GHz maximal
speed. The machine becomes hot. Top shows nothing using the cpu. When I notice
that the machine is hot, I put it back to suspend, and when I wake it up again
it works as it should.

Attachements: I attached dmesg, cpuinfo and my kernel configuration. The dmesg
is long since the machine is running more than 1 days, but in the resume before
the last it was overheating and in the last one it is not overheating.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
