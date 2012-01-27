From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42671] New: cpufreq userspace governor doesn't work on Intel
 Core 2 Gen 2 CPUs
Date: Fri, 27 Jan 2012 19:43:50 GMT
Message-ID: <bug-42671-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42671

           Summary: cpufreq userspace governor doesn't work on Intel Core
                    2 Gen 2 CPUs
           Product: Power Management
           Version: 2.5
    Kernel Version: All known
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: t.artem@mailcity.com
        Regression: No


On my Intel Core i5 2500 CPU with acpi-cpufreq module loaded I do this

# echo 2000000 | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_setspeed

then

# cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
2000000
2000000
2000000
2000000

so theoretically it should work.

However i7z (http://code.google.com/p/i7z/) shows that CPU frequency is freely
floating and turbo boost gets enabled as soon as I have any discernible load,
in other words userspace CPU frequency driver doesn't work at all and it
doesn't really enforce the specified CPU frequency.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
