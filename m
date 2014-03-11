From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58001] "ondemand" CPU governor never raises frequency (Dell XPS
 12)
Date: Tue, 11 Mar 2014 03:26:14 +0000
Message-ID: <bug-58001-12968-dclWEokGkp@https.bugzilla.kernel.org/>
References: <bug-58001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58001

--- Comment #13 from Raymond Auge <rotty3000@gmail.com> ---
Effectively, I have exactly the same issue as outlined above. The 'ondemand'
governor never reacts to changes in system load, no matter what the system is
doing.

However, the other governors all work perfectly. I generally place my machine
in 'conservative' and that seems to work fine. When I'm going a build and need
more power I switch to performance.

the output of cpufreq-info is:

cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 10.0 us.
  hardware limits: 800 MHz - 2.00 GHz
  available frequency steps: 2.00 GHz, 2.00 GHz, 1.90 GHz, 1.80 GHz, 1.70 GHz,
1.60 GHz, 1.50 GHz, 1.40 GHz, 1.30 GHz, 1.20 GHz, 1.10 GHz, 1000 MHz, 900 MHz,
800 MHz
  available cpufreq governors: conservative, ondemand, userspace, powersave,
performance
  current policy: frequency should be within 800 MHz and 2.00 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz.
  cpufreq stats: 2.00 GHz:-nan%, 2.00 GHz:-nan%, 1.90 GHz:-nan%, 1.80
GHz:-nan%, 1.70 GHz:-nan%, 1.60 GHz:-nan%, 1.50 GHz:-nan%, 1.40 GHz:-nan%, 1.30
GHz:-nan%, 1.20 GHz:-nan%, 1.10 GHz:-nan%, 1000 MHz:-nan%, 900 MHz:-nan%, 800
MHz:-nan%  (403)
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 10.0 us.
  hardware limits: 800 MHz - 2.00 GHz
  available frequency steps: 2.00 GHz, 2.00 GHz, 1.90 GHz, 1.80 GHz, 1.70 GHz,
1.60 GHz, 1.50 GHz, 1.40 GHz, 1.30 GHz, 1.20 GHz, 1.10 GHz, 1000 MHz, 900 MHz,
800 MHz
  available cpufreq governors: conservative, ondemand, userspace, powersave,
performance
  current policy: frequency should be within 800 MHz and 2.00 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz.
  cpufreq stats: 2.00 GHz:-nan%, 2.00 GHz:-nan%, 1.90 GHz:-nan%, 1.80
GHz:-nan%, 1.70 GHz:-nan%, 1.60 GHz:-nan%, 1.50 GHz:-nan%, 1.40 GHz:-nan%, 1.30
GHz:-nan%, 1.20 GHz:-nan%, 1.10 GHz:-nan%, 1000 MHz:-nan%, 900 MHz:-nan%, 800
MHz:-nan%  (382)
analyzing CPU 2:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 10.0 us.
  hardware limits: 800 MHz - 2.00 GHz
  available frequency steps: 2.00 GHz, 2.00 GHz, 1.90 GHz, 1.80 GHz, 1.70 GHz,
1.60 GHz, 1.50 GHz, 1.40 GHz, 1.30 GHz, 1.20 GHz, 1.10 GHz, 1000 MHz, 900 MHz,
800 MHz
  available cpufreq governors: conservative, ondemand, userspace, powersave,
performance
  current policy: frequency should be within 800 MHz and 2.00 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz.
  cpufreq stats: 2.00 GHz:-nan%, 2.00 GHz:-nan%, 1.90 GHz:-nan%, 1.80
GHz:-nan%, 1.70 GHz:-nan%, 1.60 GHz:-nan%, 1.50 GHz:-nan%, 1.40 GHz:-nan%, 1.30
GHz:-nan%, 1.20 GHz:-nan%, 1.10 GHz:-nan%, 1000 MHz:-nan%, 900 MHz:-nan%, 800
MHz:-nan%  (445)
analyzing CPU 3:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 10.0 us.
  hardware limits: 800 MHz - 2.00 GHz
  available frequency steps: 2.00 GHz, 2.00 GHz, 1.90 GHz, 1.80 GHz, 1.70 GHz,
1.60 GHz, 1.50 GHz, 1.40 GHz, 1.30 GHz, 1.20 GHz, 1.10 GHz, 1000 MHz, 900 MHz,
800 MHz
  available cpufreq governors: conservative, ondemand, userspace, powersave,
performance
  current policy: frequency should be within 800 MHz and 2.00 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz.
  cpufreq stats: 2.00 GHz:-nan%, 2.00 GHz:-nan%, 1.90 GHz:-nan%, 1.80
GHz:-nan%, 1.70 GHz:-nan%, 1.60 GHz:-nan%, 1.50 GHz:-nan%, 1.40 GHz:-nan%, 1.30
GHz:-nan%, 1.20 GHz:-nan%, 1.10 GHz:-nan%, 1000 MHz:-nan%, 900 MHz:-nan%, 800
MHz:-nan%  (354)

-- 
You are receiving this mail because:
You are the assignee for the bug.
