From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 62551] New: The system freezes for a moment when the CPU
 scaling is enabled
Date: Sat, 05 Oct 2013 07:16:41 +0000
Message-ID: <bug-62551-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=62551

            Bug ID: 62551
           Summary: The system freezes for a moment when the CPU scaling
                    is enabled
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.10.14
          Hardware: i386
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: zerobertons@yahoo.com
        Regression: No

Doesn't matter which governor I use, the mouse, keyboard, video playback stops
for a moment, then it works ok for seconds or minutes, and it happens again.
This started to happen with kernel 3.10 and only when the CPU scaling is
enabled. It happens on different Linux distribution. Going back to 3.9.x solves
the problem.

The CPU is AMD Phenom II 955.

cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 4.0 us.
  hardware limits: 800 MHz - 3.20 GHz
  available frequency steps: 3.20 GHz, 2.50 GHz, 2.10 GHz, 800 MHz
  available cpufreq governors: ondemand, userspace
  current policy: frequency should be within 800 MHz and 3.20 GHz.
                  The governor "userspace" may decide which speed to use
                  within this range.
  current CPU frequency is 3.20 GHz (asserted by call to hardware).
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 4.0 us.
  hardware limits: 800 MHz - 3.20 GHz
  available frequency steps: 3.20 GHz, 2.50 GHz, 2.10 GHz, 800 MHz
  available cpufreq governors: ondemand, userspace
  current policy: frequency should be within 800 MHz and 3.20 GHz.
                  The governor "userspace" may decide which speed to use
                  within this range.
  current CPU frequency is 3.20 GHz (asserted by call to hardware).
analyzing CPU 2:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 4.0 us.
  hardware limits: 800 MHz - 3.20 GHz
  available frequency steps: 3.20 GHz, 2.50 GHz, 2.10 GHz, 800 MHz
  available cpufreq governors: ondemand, userspace
  current policy: frequency should be within 800 MHz and 3.20 GHz.
                  The governor "userspace" may decide which speed to use
                  within this range.
  current CPU frequency is 3.20 GHz (asserted by call to hardware).
analyzing CPU 3:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 4.0 us.
  hardware limits: 800 MHz - 3.20 GHz
  available frequency steps: 3.20 GHz, 2.50 GHz, 2.10 GHz, 800 MHz
  available cpufreq governors: ondemand, userspace
  current policy: frequency should be within 800 MHz and 3.20 GHz.
                  The governor "userspace" may decide which speed to use
                  within this range.
  current CPU frequency is 3.20 GHz (asserted by call to hardware).
root@slack:/home/zero# uname -a
Linux slack 3.10.14-smp #2 SMP Tue Oct 1 17:17:51 CDT 2013 i686 AMD Phenom(tm)
II X4 955 Processor AuthenticAMD GNU/Linux

-- 
You are receiving this mail because:
You are the assignee for the bug.
