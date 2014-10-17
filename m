From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 86461] New: intel_pstate does not obey min/max frequencies set
 by user
Date: Fri, 17 Oct 2014 09:21:52 +0000
Message-ID: <bug-86461-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=86461

            Bug ID: 86461
           Summary: intel_pstate does not obey min/max frequencies set by
                    user
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.17-rc5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: patrakov@gmail.com
        Regression: No

# uname -a    
Linux aep-vaio 3.17.0-rc5 #1 SMP PREEMPT Thu Sep 18 23:13:08 YEKT 2014 x86_64
Intel(R) Core(TM) i7-2640M CPU @ 2.80GHz GenuineIntel GNU/Linu

# echo 2400000 | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq

# cpufreq-info
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 0.97 ms.
  hardware limits: 800 MHz - 3.50 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 2.40 GHz and 3.50 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 804 MHz (asserted by call to hardware).
analyzing CPU 1:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 0.97 ms.
  hardware limits: 800 MHz - 3.50 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 2.40 GHz and 3.50 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 885 MHz (asserted by call to hardware).
analyzing CPU 2:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 0.97 ms.
  hardware limits: 800 MHz - 3.50 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 2.40 GHz and 3.50 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).
analyzing CPU 3:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 0.97 ms.
  hardware limits: 800 MHz - 3.50 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 2.40 GHz and 3.50 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 822 MHz (asserted by call to hardware).


As you see, my attempt to force the minimum frequency to 2.4 GHz has been
ignored.

-- 
You are receiving this mail because:
You are the assignee for the bug.
