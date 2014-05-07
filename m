From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75661] New: acpi-cpufreq cannot use lowest reported P-state
Date: Wed, 07 May 2014 16:15:54 +0000
Message-ID: <bug-75661-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75661

            Bug ID: 75661
           Summary: acpi-cpufreq cannot use lowest reported P-state
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.14.2
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: runningskittle@gmail.com
        Regression: No

CPU: AMD A8-4500M
cpupower reports 900Mhz is lowest P-state frequency. However available
frequency for governor only 1.4ghz - 1.9ghz.

****************************************************
[root@skittle-hp skittle]# cpupower frequency-info
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 1.90 GHz
  available frequency steps: 1.90 GHz, 1.80 GHz, 1.70 GHz, 1.60 GHz, 1.40 GHz
  available cpufreq governors: ondemand, performance
  current policy: frequency should be within 1.40 GHz and 1.90 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz (asserted by call to hardware).
  boost state support:
    Supported: yes
    Active: no
    Boost States: 2
    Total States: 8
    Pstate-Pb0: 2800MHz (boost state)
    Pstate-Pb1: 2300MHz (boost state)
    Pstate-P0:  1900MHz
    Pstate-P1:  1800MHz
    Pstate-P2:  1700MHz
    Pstate-P3:  1600MHz
    Pstate-P4:  1400MHz
    Pstate-P5:  900MHz


[root@skittle-hp skittle]# cat /proc/cpuinfo 
processor    : 0
vendor_id    : AuthenticAMD
cpu family    : 21
model        : 16
model name    : AMD A8-4500M APU with Radeon(tm) HD Graphics
stepping    : 1
microcode    : 0x6001119
cpu MHz        : 1400.000
cache size    : 2048 KB
physical id    : 0
siblings    : 4
core id        : 0
cpu cores    : 2
apicid        : 16
initial apicid    : 0
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb
rdtscp lm constant_tsc rep_good nopl nonstop_tsc extd_apicid aperfmperf pni
pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 popcnt aes xsave avx f16c
lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch
osvw ibs xop skinit wdt lwp fma4 tce nodeid_msr tbm topoext perfctr_core
perfctr_nb arat cpb hw_pstate npt lbrv svm_lock nrip_save tsc_scale vmcb_clean
flushbyasid decodeassists pausefilter pfthreshold bmi1
bogomips    : 3794.12
TLB size    : 1536 4K pages
clflush size    : 64
cache_alignment    : 64
address sizes    : 48 bits physical, 48 bits virtual
power management: ts ttp tm 100mhzsteps hwpstate cpb eff_freq_ro

processor    : 1
vendor_id    : AuthenticAMD
cpu family    : 21
model        : 16
model name    : AMD A8-4500M APU with Radeon(tm) HD Graphics   
stepping    : 1
microcode    : 0x6001119
cpu MHz        : 1400.000
cache size    : 2048 KB
physical id    : 0
siblings    : 4
core id        : 1
cpu cores    : 2
apicid        : 17
initial apicid    : 1
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb
rdtscp lm constant_tsc rep_good nopl nonstop_tsc extd_apicid aperfmperf pni
pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 popcnt aes xsave avx f16c
lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch
osvw ibs xop skinit wdt lwp fma4 tce nodeid_msr tbm topoext perfctr_core
perfctr_nb arat cpb hw_pstate npt lbrv svm_lock nrip_save tsc_scale vmcb_clean
flushbyasid decodeassists pausefilter pfthreshold bmi1
bogomips    : 3794.12
TLB size    : 1536 4K pages
clflush size    : 64
cache_alignment    : 64
address sizes    : 48 bits physical, 48 bits virtual
power management: ts ttp tm 100mhzsteps hwpstate cpb eff_freq_ro

processor    : 2
vendor_id    : AuthenticAMD
cpu family    : 21
model        : 16
model name    : AMD A8-4500M APU with Radeon(tm) HD Graphics   
stepping    : 1
microcode    : 0x6001119
cpu MHz        : 1400.000
cache size    : 2048 KB
physical id    : 0
siblings    : 4
core id        : 2
cpu cores    : 2
apicid        : 18
initial apicid    : 2
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb
rdtscp lm constant_tsc rep_good nopl nonstop_tsc extd_apicid aperfmperf pni
pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 popcnt aes xsave avx f16c
lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch
osvw ibs xop skinit wdt lwp fma4 tce nodeid_msr tbm topoext perfctr_core
perfctr_nb arat cpb hw_pstate npt lbrv svm_lock nrip_save tsc_scale vmcb_clean
flushbyasid decodeassists pausefilter pfthreshold bmi1
bogomips    : 3794.12
TLB size    : 1536 4K pages
clflush size    : 64
cache_alignment    : 64
address sizes    : 48 bits physical, 48 bits virtual
power management: ts ttp tm 100mhzsteps hwpstate cpb eff_freq_ro

processor    : 3
vendor_id    : AuthenticAMD
cpu family    : 21
model        : 16
model name    : AMD A8-4500M APU with Radeon(tm) HD Graphics   
stepping    : 1
microcode    : 0x6001119
cpu MHz        : 1400.000
cache size    : 2048 KB
physical id    : 0
siblings    : 4
core id        : 3
cpu cores    : 2
apicid        : 19
initial apicid    : 3
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb
rdtscp lm constant_tsc rep_good nopl nonstop_tsc extd_apicid aperfmperf pni
pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 popcnt aes xsave avx f16c
lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch
osvw ibs xop skinit wdt lwp fma4 tce nodeid_msr tbm topoext perfctr_core
perfctr_nb arat cpb hw_pstate npt lbrv svm_lock nrip_save tsc_scale vmcb_clean
flushbyasid decodeassists pausefilter pfthreshold bmi1
bogomips    : 3794.12
TLB size    : 1536 4K pages
clflush size    : 64
cache_alignment    : 64
address sizes    : 48 bits physical, 48 bits virtual
power management: ts ttp tm 100mhzsteps hwpstate cpb eff_freq_ro

-- 
You are receiving this mail because:
You are the assignee for the bug.
