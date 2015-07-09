From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 101241] New: cpufreq ondemand not work in my system
Date: Thu, 09 Jul 2015 03:26:14 +0000
Message-ID: <bug-101241-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=101241

            Bug ID: 101241
           Summary: cpufreq ondemand not work in my system
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.32
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: jakepain@gmail.com
        Regression: No

I want to use cpufreq "ondemand" policy to change the CPU frequency dynamiclly.

But when I insmod the powernow-k8 driver, it detected below data

Jul  9 11:11:43 localhost kernel: powernow-k8: Found 1 AMD GX-416RA SOC        
                       (4 cpu cores) (version 2.20.00)
Jul  9 11:11:43 localhost kernel: powernow-k8:    0 : pstate 0 (1600 MHz)
Jul  9 11:11:43 localhost kernel: powernow-k8:    1 : pstate 1 (1600 MHz)
Jul  9 11:11:43 localhost kernel: powernow-k8:    2 : pstate 2 (1600 MHz)
Jul  9 11:11:43 localhost kernel: powernow-k8:    3 : pstate 3 (1600 MHz)
Jul  9 11:11:43 localhost kernel: powernow-k8:    4 : pstate 4 (1600 MHz)
Jul  9 11:11:43 localhost kernel: powernow-k8:    5 : pstate 5 (1600 MHz)

Why the CPU frequency is fixed? is it caused by BIOS setting?
Is there some methods to modify the limit in software not BIOS?

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.
