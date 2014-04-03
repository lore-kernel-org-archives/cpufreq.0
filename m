From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73421] New: intel/p_state Does not increase into Turbo Boost
 states and does not display al governors. i5-3201M
Date: Thu, 03 Apr 2014 00:51:16 +0000
Message-ID: <bug-73421-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73421

            Bug ID: 73421
           Summary: intel/p_state Does not increase into Turbo Boost
                    states and does not display al governors. i5-3201M
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.13.7-200.fc20.x86_64
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: netsys@fedoraproject.org
        Regression: No

I have two problems with my CPU Intel Core i5-3210M on my laptop Lenovo B590.

First, I cannot see all tipical governors availables such as ondemand,
userspace, conservative... only I see powersave and performance with
intel_pstate driver enabled.

I see this result of cpupower frequency-info with pstate driver:
"analyzing CPU 0:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 0.97 ms.
  hardware limits: 1.20 GHz - 3.10 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 1.20 GHz and 3.10 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 2.77 GHz (asserted by call to hardware).
  boost state support:
    Supported: yes
    Active: yes
    2900 MHz max turbo 4 active cores
    2900 MHz max turbo 3 active cores
    2900 MHz max turbo 2 active cores
    3100 MHz max turbo 1 active cores"

I can see on each cpu* file cpuinfo_max_freq with 3100000 values. I guess is
available set frequency into 3.1Ghz. ...


"# cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_max_freq 
3100000
"


Other way, turbostat display only 2.89 frecuencies of all cpus compiling a
linux kernel for test porporsing with make -j5. This is display:

"cor CPU    %c0  GHz  TSC SMI    %c1    %c3    %c6    %c7 CTMP PTMP   %pc2  
%pc3   %pc6   %pc7  Pkg_W  Cor_W GFX_W
         99.78 2.89 2.49   0   0.22   0.00   0.00   0.00   61   61   0.00  
0.00   0.00   0.00  18.24  13.54  1.64
  0   0  99.80 2.89 2.49   0   0.20   0.00   0.00   0.00   60   61   0.00  
0.00   0.00   0.00  18.24  13.54  1.64
  0   1  99.78 2.89 2.49   0   0.22
  1   2  99.92 2.89 2.49   0   0.08   0.00   0.00   0.00   61
  1   3  99.62 2.89 2.49   0   0.38
"
You can see how does not increase into 3.1Ghz per core. It's does not works
properly Turbo Boost.

Anyway intel_pstate is loaded correctly:

"
[    0.852750] Intel pstate controlling: cpu 0
[    0.852762] Intel pstate controlling: cpu 1
[    0.852777] Intel pstate controlling: cpu 2
[    0.852789] Intel pstate controlling: cpu 3
"

Respect governors with intel_pstate=disabled at kernel command line boot. I can
see all kernel's governors if I boot with intel_pstate=disable. That's using
old ACPI driver called acpi_cpufreq. This is result of cpupower frequency-info:

"analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 10.0 us.
  hardware limits: 1.20 GHz - 2.50 GHz
  available frequency steps: 2.50 GHz, 2.50 GHz, 2.40 GHz, 2.30 GHz, 2.20 GHz,
2.10 GHz, 2.00 GHz, 1.90 GHz, 1.80 GHz, 1.70 GHz, 1.60 GHz, 1.50 GHz, 1.40 GHz,
1.30 GHz, 1.20 GHz
  available cpufreq governors: conservative, userspace, powersave, ondemand,
performance
  current policy: frequency should be within 1.20 GHz and 2.50 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz (asserted by call to hardware).
  boost state support:
    Supported: yes
    Active: yes
    2900 MHz max turbo 4 active cores
    2900 MHz max turbo 3 active cores
    2900 MHz max turbo 2 active cores
    3100 MHz max turbo 1 active cores
"

However, I saw on all cpuinfo_max_freq reported:

"# cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_max_freq 
2501000"

It's not same that pstate that shows 3100000.

However, includes switch governor into performance. Does not increases into
3.1Ghz when I was compiling a Linux kernel to test. This is same results that
use intel_pstate:

"cor CPU    %c0  GHz  TSC SMI    %c1    %c3    %c6    %c7 CTMP PTMP   %pc2  
%pc3   %pc6   %pc7  Pkg_W  Cor_W GFX_W
         99.57 2.89 2.49   0   0.43   0.00   0.00   0.00   59   59   0.00  
0.00   0.00   0.00  18.37  13.38  1.94
  0   0  99.80 2.89 2.49   0   0.20   0.00   0.00   0.00   59   59   0.00  
0.00   0.00   0.00  18.37  13.38  1.94
  0   1  99.25 2.89 2.49   0   0.75
  1   2  99.61 2.89 2.49   0   0.39   0.00   0.00   0.00   58
  1   3  99.61 2.89 2.49   0   0.39
"

It's likes bug on intel_pstate driver. At Lenovo BIOS Intel Speed Step and
Turbo Boost It's enabled by default.

-- 
You are receiving this mail because:
You are the assignee for the bug.
