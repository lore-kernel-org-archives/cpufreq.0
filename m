From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55091] New: cpufreq governors woks crazy
Date: Mon, 11 Mar 2013 21:58:46 +0000 (UTC)
Message-ID: <bug-55091-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55091

           Summary: cpufreq governors woks crazy
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.9-rc2
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: towo@siduction.org
        Regression: No


Since i test kernel 3.9-rc2, cpufreq is crazy with governors ondemand and
conservative.
Even if the system is idling, cpufreq is on the highest or medium frequency.
Only with powersafe i can get the cpu to the lowest frequency.

This behavior i cant see in 3.8 or below.

Here the output from cpufreq-info:

cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1 2 3
  CPUs which need to have their frequency coordinated by software: 0 1 2 3
  maximum transition latency: 10.0 us.
  hardware limits: 1.60 GHz - 2.66 GHz
  available frequency steps: 2.66 GHz, 2.13 GHz, 1.60 GHz
  available cpufreq governors: powersave, conservative, userspace, ondemand,
performance
  current policy: frequency should be within 1.60 GHz and 2.66 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 1.60 GHz.
  cpufreq stats: 2.66 GHz:3.10%, 2.13 GHz:3.09%, 1.60 GHz:93.81%  (8123)
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1 2 3
  CPUs which need to have their frequency coordinated by software: 0 1 2 3
  maximum transition latency: 10.0 us.
  hardware limits: 1.60 GHz - 2.66 GHz
  available frequency steps: 2.66 GHz, 2.13 GHz, 1.60 GHz
  available cpufreq governors: powersave, conservative, userspace, ondemand,
performance
  current policy: frequency should be within 1.60 GHz and 2.66 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 1.60 GHz.
  cpufreq stats: 2.66 GHz:3.10%, 2.13 GHz:3.09%, 1.60 GHz:93.81%  (8123)
analyzing CPU 2:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1 2 3
  CPUs which need to have their frequency coordinated by software: 0 1 2 3
  maximum transition latency: 10.0 us.
  hardware limits: 1.60 GHz - 2.66 GHz
  available frequency steps: 2.66 GHz, 2.13 GHz, 1.60 GHz
  available cpufreq governors: powersave, conservative, userspace, ondemand,
performance
  current policy: frequency should be within 1.60 GHz and 2.66 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 1.60 GHz.
  cpufreq stats: 2.66 GHz:3.10%, 2.13 GHz:3.09%, 1.60 GHz:93.81%  (8123)
analyzing CPU 3:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1 2 3
  CPUs which need to have their frequency coordinated by software: 0 1 2 3
  maximum transition latency: 10.0 us.
  hardware limits: 1.60 GHz - 2.66 GHz
  available frequency steps: 2.66 GHz, 2.13 GHz, 1.60 GHz
  available cpufreq governors: powersave, conservative, userspace, ondemand,
performance
  current policy: frequency should be within 1.60 GHz and 2.66 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 1.60 GHz.
  cpufreq stats: 2.66 GHz:3.10%, 2.13 GHz:3.09%, 1.60 GHz:93.81%  (8123)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
