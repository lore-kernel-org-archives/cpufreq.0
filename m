From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58801] New: intel_pstate/powersave - cpu frequency remains at
 high level if if system is idle
Date: Sat, 25 May 2013 07:24:54 +0000 (UTC)
Message-ID: <bug-58801-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58801

           Summary: intel_pstate/powersave - cpu frequency remains at high
                    level if if system is idle
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.9.3 and 3.9.4
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: c.h.l@web.de
        Regression: Yes


I have a Lenovo T520 with a Intel(R) Core(TM) i5-2450M CPU and a Sandy Bridge
chipset.

Starting from kernel version 3.9.1 I switched the CPU frequency scaling driver
from acpi-cpufreq to intel_pstate. In combination with the powersave governor
it worked like a charm. I had higher frequencies due to the turbo boost (3.1
GHz instead of 2.5 GHz) and when the system was idle the frequency was switched
to the lowest values (around 800 MHz).

With the kernel versions 3.9.3 and now even 3.9.4 the frequency remains at a
quite high frequency (3.0 or 2.9 GHz) even if the the system is completely
idle.

As I have not changed the kernel-config when I updated to the versions 3.9.3
and 3.9.4 I assume some bug was introduced in the kernel as of 3.9.3.

Please let me know if you need any further info.

Christoph

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
