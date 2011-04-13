From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 33202] New: cpufreq-info-008 only reports maximum "current
 frequency", contradict cpufreq stats and /proc/cpuinfo
Date: Wed, 13 Apr 2011 07:02:05 GMT
Message-ID: <bug-33202-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=33202

           Summary: cpufreq-info-008 only reports maximum "current
                    frequency", contradict cpufreq stats and /proc/cpuinfo
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.38.2-zen
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: leho@kraav.com
        Regression: No


Linux travelmate 2.6.38.2-zen #56 ZEN SMP Tue Apr 12 14:06:11 EEST 2011 i686
Intel(R) Core(TM) i3 CPU U 330 @ 1.20GHz GenuineIntel GNU/Linux

leho@travelmate ~ $ sudo cpufreq-info
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 10.0 us.
  hardware limits: 666 MHz - 1.20 GHz
  available frequency steps: 1.20 GHz, 1.07 GHz, 933 MHz, 799 MHz, 666 MHz
  available cpufreq governors: ondemand, userspace, powersave, conservative,
performance
  current policy: frequency should be within 666 MHz and 1.20 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz (asserted by call to hardware).
  cpufreq stats: 1.20 GHz:1.00%, 1.07 GHz:0.78%, 933 MHz:0.98%, 799 MHz:1.59%,
666 MHz:95.65%  (9376)
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 10.0 us.
  hardware limits: 666 MHz - 1.20 GHz
  available frequency steps: 1.20 GHz, 1.07 GHz, 933 MHz, 799 MHz, 666 MHz
  available cpufreq governors: ondemand, userspace, powersave, conservative,
performance
  current policy: frequency should be within 666 MHz and 1.20 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz (asserted by call to hardware).
  cpufreq stats: 1.20 GHz:0.51%, 1.07 GHz:0.44%, 933 MHz:0.85%, 799 MHz:1.46%,
666 MHz:96.73%  (378)
analyzing CPU 2:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 10.0 us.
  hardware limits: 666 MHz - 1.20 GHz
  available frequency steps: 1.20 GHz, 1.07 GHz, 933 MHz, 799 MHz, 666 MHz
  available cpufreq governors: ondemand, userspace, powersave, conservative,
performance
  current policy: frequency should be within 666 MHz and 1.20 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz (asserted by call to hardware).
  cpufreq stats: 1.20 GHz:0.82%, 1.07 GHz:0.67%, 933 MHz:0.97%, 799 MHz:1.48%,
666 MHz:96.05%  (416)
analyzing CPU 3:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 10.0 us.
  hardware limits: 666 MHz - 1.20 GHz
  available frequency steps: 1.20 GHz, 1.07 GHz, 933 MHz, 799 MHz, 666 MHz
  available cpufreq governors: ondemand, userspace, powersave, conservative,
performance
  current policy: frequency should be within 666 MHz and 1.20 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz (asserted by call to hardware).
  cpufreq stats: 1.20 GHz:0.20%, 1.07 GHz:0.20%, 933 MHz:0.47%, 799 MHz:0.70%,
666 MHz:98.43%  

cat /proc/cpuinfo:
(234)
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 37
model name    : Intel(R) Core(TM) i3 CPU       U 330  @ 1.20GHz
stepping    : 5
cpu MHz        : 666.000
cache size    : 3072 KB
physical id    : 0
siblings    : 4
core id        : 0
cpu cores    : 2
apicid        : 0
initial apicid    : 0
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 11
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm
constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf pni dtes64
monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 popcnt lahf_lm
arat dts tpr_shadow vnmi flexpriority ept vpid
bogomips    : 2400.28
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:

processor    : 1
vendor_id    : GenuineIntel
cpu family    : 6
model        : 37
model name    : Intel(R) Core(TM) i3 CPU       U 330  @ 1.20GHz
stepping    : 5
cpu MHz        : 666.000
cache size    : 3072 KB
physical id    : 0
siblings    : 4
core id        : 0
cpu cores    : 2
apicid        : 1
initial apicid    : 1
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 11
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm
constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf pni dtes64
monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 popcnt lahf_lm
arat dts tpr_shadow vnmi flexpriority ept vpid
bogomips    : 2400.11
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:

processor    : 2
vendor_id    : GenuineIntel
cpu family    : 6
model        : 37
model name    : Intel(R) Core(TM) i3 CPU       U 330  @ 1.20GHz
stepping    : 5
cpu MHz        : 666.000
cache size    : 3072 KB
physical id    : 0
siblings    : 4
core id        : 2
cpu cores    : 2
apicid        : 4
initial apicid    : 4
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 11
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm
constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf pni dtes64
monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 popcnt lahf_lm
arat dts tpr_shadow vnmi flexpriority ept vpid
bogomips    : 2400.08
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:

processor    : 3
vendor_id    : GenuineIntel
cpu family    : 6
model        : 37
model name    : Intel(R) Core(TM) i3 CPU       U 330  @ 1.20GHz
stepping    : 5
cpu MHz        : 666.000
cache size    : 3072 KB
physical id    : 0
siblings    : 4
core id        : 2
cpu cores    : 2
apicid        : 5
initial apicid    : 5
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 11
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm
constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf pni dtes64
monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 popcnt lahf_lm
arat dts tpr_shadow vnmi flexpriority ept vpid
bogomips    : 2398.58
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:

at no point does cpufreq-info report a lower "current frequency". i also have a
core i5 server in the room that has no such problem. as evident from cpufreq
stats, majority of time is in fact spent in the frequency specified by governor
so i'd say cpufreq-info is wrong here.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
