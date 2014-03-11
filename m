From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 71841] New: ignore_nice_load ignores real load
Date: Tue, 11 Mar 2014 00:59:28 +0000
Message-ID: <bug-71841-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=71841

            Bug ID: 71841
           Summary: ignore_nice_load ignores real load
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.13.5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: higuita@gmx.net
        Regression: No

I have a AMD64 cpu (opteron 175) and it use the powernow_k8 cpufreq drive. I'm
using the ondemand governor and have enables the "ignore_nice_load". Yet, i'm
right now compiling the kernel 3.15.6 and notice that the cpufreq is stick on
the 1GHz instead of working on the expected 2.2GHz. The kernel compile is
running on the default nice level (ie: 0 )

If i disable the "ignore_nice_load", the cpufreq jumps to the 2.2GHz. 


 00:23:17 /sys/devices/system/cpu/cpufreq/ondemand/$ for i in *; do echo  $i;
cat $i ; done
ignore_nice_load
1
io_is_busy
0
powersave_bias
0
sampling_down_factor
1
sampling_rate
107000
sampling_rate_min
10000
up_threshold
50

 00:23:46 /sys/devices/system/cpu/cpufreq/ondemand/$ vmstat 5 
procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
 4  0      0 377948 157812 2752820    0    0   535   140 1191  768 73  8 15  3
 3  0      0 336640 157824 2753364    0    0    82    18 2718 1616 91  9  0  0
 3  0      0 347520 157832 2753688    0    0    18     2 2718 1601 92  8  0  0
 3  0      0 363204 157848 2754132    0    0    41   457 2823 1641 91  9  0  0
 3  0      0 396960 157856 2754488    0    0    44     2 2789 1681 90 10  0  0
^C

 00:24:43 /sys/devices/system/cpu/cpufreq/ondemand/$ cpufreq-info 
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0 1
  maximum transition latency: 107 us.
  hardware limits: 1000 MHz - 2.20 GHz
  available frequency steps: 2.20 GHz, 2.00 GHz, 1.80 GHz, 1000 MHz
  available cpufreq governors: ondemand, performance
  current policy: frequency should be within 1000 MHz and 2.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1000 MHz (asserted by call to hardware).
analyzing CPU 1:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0 1
  maximum transition latency: 107 us.
  hardware limits: 1000 MHz - 2.20 GHz
  available frequency steps: 2.20 GHz, 2.00 GHz, 1.80 GHz, 1000 MHz
  available cpufreq governors: ondemand, performance
  current policy: frequency should be within 1000 MHz and 2.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1000 MHz (asserted by call to hardware).

 00:30:15 ~/$ cat /proc/cpuinfo 
processor    : 0
vendor_id    : AuthenticAMD
cpu family    : 15
model        : 35
model name    : Dual Core AMD Opteron(tm) Processor 175
stepping    : 2
microcode    : 0x4d
cpu MHz        : 1000.000
cache size    : 1024 KB
physical id    : 0
siblings    : 2
core id        : 0
cpu cores    : 2
apicid        : 0
initial apicid    : 0
fpu        : yes
fpu_exception    : yes
cpuid level    : 1
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt lm 3dnowext
3dnow rep_good nopl extd_apicid pni lahf_lm cmp_legacy
bogomips    : 2002.43
TLB size    : 1024 4K pages
clflush size    : 64
cache_alignment    : 64
address sizes    : 40 bits physical, 48 bits virtual
power management: ts fid vid ttp

processor    : 1
vendor_id    : AuthenticAMD
cpu family    : 15
model        : 35
model name    : Dual Core AMD Opteron(tm) Processor 175
stepping    : 2
microcode    : 0x4d
cpu MHz        : 1000.000
cache size    : 1024 KB
physical id    : 0
siblings    : 2
core id        : 1
cpu cores    : 2
apicid        : 1
initial apicid    : 1
fpu        : yes
fpu_exception    : yes
cpuid level    : 1
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt lm 3dnowext
3dnow rep_good nopl extd_apicid pni lahf_lm cmp_legacy
bogomips    : 2002.43
TLB size    : 1024 4K pages
clflush size    : 64
cache_alignment    : 64
address sizes    : 40 bits physical, 48 bits virtual
power management: ts fid vid ttp

-- 
You are receiving this mail because:
You are the assignee for the bug.
