From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 43037] New: cpufreq often stucks in lowest frequency.
Date: Tue, 3 Apr 2012 15:49:28 GMT
Message-ID: <bug-43037-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=43037

           Summary: cpufreq often stucks in lowest frequency.
           Product: Power Management
           Version: 2.5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: yasar11732@gmail.com
        Regression: No


Created an attachment (id=72798)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=72798)
Current linux configuration file

Although it works from time to time, cpufreq often stucks in the lowest
frequency, and won't let the frequency go any higher, regardless of the
governer. There is a discussion about this in here:
https://bbs.archlinux.org/viewtopic.php?pid=1082045

As it can be seen on the above thread, when this occurs, cpufreq-info gives
this kind of output;

analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1 2 3
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 10.0 us.
  hardware limits: 1.20 GHz - 2.53 GHz
  available frequency steps: 2.53 GHz, 2.53 GHz, 2.40 GHz, 2.27 GHz, 2.13 GHz,
2.00 GHz, 1.87 GHz, 1.73 GHz, 1.60 GHz, 1.47 GHz, 1.33 GHz, 1.20 GHz
  available cpufreq governors: ondemand, performance
  current policy: frequency should be within 1.20 GHz and 1.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz

As it can be seen, although it can see all available frequncies, but it will
only use lowest frequency.


I am on "3.2.13-1-ARCH #1 SMP PREEMPT i686 Intel(R) Pentium(R) M processor
1.86GHz GenuineIntel", however, as you can see on the thread above, it's not
the sole processor this problem happens.

Since this problem occurs from time to time (but often), I cannot provide a way
to reproduce this error. I am adding

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
