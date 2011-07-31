From: Juergen Rose <rose@rz.uni-potsdam.de>
Subject: Re: 'cpufreq-set -g performance -r' does not set all CPUs (AMD
 only?)
Date: Sun, 31 Jul 2011 14:55:01 +0200
Message-ID: <1312116901.13441.5.camel@thinkpad.homenet>
References: <CAEdQ38FJ+Gaa3SABCZEHUUybTdJKsJRnK_yU0nppv=5vvd=zMA@mail.gmail.com>
	 <20110731085706.GB19629@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110731085706.GB19629@comet.dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Matt Turner <mattst88@gentoo.org>, cpufreq@vger.kernel.org

Hey Dominik,

Am Sonntag, den 31.07.2011, 10:57 +0200 schrieb Dominik Brodowski:
> Hey,
> 
> On Sun, Jul 31, 2011 at 12:46:31AM -0400, Matt Turner wrote:
> > I've got a bug report about cpufreq-set -r not setting all related
> > CPUs. It appears to be a problem with AMD CPUs only.
> > 
> > https://bugs.gentoo.org/show_bug.cgi?id=376565
> > 
> > Any ideas what's going on?
> 
> What's the output of cpufreq-info on these systems? Might it be that the
> CPUs on this AMD system may be set to different frequencies? "-r" only sets
> the governor on all _related_ CPUs, not on all CPUs found on the system.
> 
> Best,
> 	Dominik

At the first systems cpufreq-info says:

root@caiman:/root(1)# cpufreq-info 
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 3.20 GHz
  available frequency steps: 3.20 GHz, 2.40 GHz, 1.60 GHz, 800 MHz
  available cpufreq governors: userspace, ondemand, performance
  current policy: frequency should be within 800 MHz and 3.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).
analyzing CPU 1:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 3.20 GHz
  available frequency steps: 3.20 GHz, 2.40 GHz, 1.60 GHz, 800 MHz
  available cpufreq governors: userspace, ondemand, performance
  current policy: frequency should be within 800 MHz and 3.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 3.20 GHz (asserted by call to hardware).
analyzing CPU 2:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 3.20 GHz
  available frequency steps: 3.20 GHz, 2.40 GHz, 1.60 GHz, 800 MHz
  available cpufreq governors: userspace, ondemand, performance
  current policy: frequency should be within 800 MHz and 3.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).
analyzing CPU 3:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 3.20 GHz
  available frequency steps: 3.20 GHz, 2.40 GHz, 1.60 GHz, 800 MHz
  available cpufreq governors: userspace, ondemand, performance
  current policy: frequency should be within 800 MHz and 3.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1.60 GHz (asserted by call to hardware).
analyzing CPU 4:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 4
  CPUs which need to have their frequency coordinated by software: 4
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 3.20 GHz
  available frequency steps: 3.20 GHz, 2.40 GHz, 1.60 GHz, 800 MHz
  available cpufreq governors: userspace, ondemand, performance
  current policy: frequency should be within 800 MHz and 3.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).
analyzing CPU 5:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 5
  CPUs which need to have their frequency coordinated by software: 5
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 3.20 GHz
  available frequency steps: 3.20 GHz, 2.40 GHz, 1.60 GHz, 800 MHz
  available cpufreq governors: userspace, ondemand, performance
  current policy: frequency should be within 800 MHz and 3.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).

root@caiman:/root(2)# cat /proc/cpuinfo 
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 16
model           : 10
model name      : AMD Phenom(tm) II X6 1090T Processor
stepping        : 0
cpu MHz         : 800.000
cache size      : 512 KB
physical id     : 0
siblings        : 6
core id         : 0
cpu cores       : 6
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 6
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext
fxsr_opt pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl
nonstop_tsc extd_apicid aperfmperf pni monitor cx16 popcnt lahf_lm
cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch
osvw ibs skinit wdt cpb npt lbrv svm_lock nrip_save pausefilter
bogomips        : 6421.34
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate [9]

processor       : 1
vendor_id       : AuthenticAMD
cpu family      : 16
model           : 10
model name      : AMD Phenom(tm) II X6 1090T Processor
stepping        : 0
cpu MHz         : 800.000
cache size      : 512 KB
physical id     : 0
siblings        : 6
core id         : 1
cpu cores       : 6
apicid          : 1
initial apicid  : 1
fpu             : yes
fpu_exception   : yes
cpuid level     : 6
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext
fxsr_opt pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl
nonstop_tsc extd_apicid aperfmperf pni monitor cx16 popcnt lahf_lm
cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch
osvw ibs skinit wdt cpb npt lbrv svm_lock nrip_save pausefilter
bogomips        : 6421.58
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate [9]
...


and on the second system:

root@impala:/root(1)# cpufreq-info 
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 3.40 GHz
  available frequency steps: 3.40 GHz, 2.70 GHz, 2.20 GHz, 800 MHz
  available cpufreq governors: ondemand, performance
  current policy: frequency should be within 800 MHz and 3.40 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).
analyzing CPU 1:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 3.40 GHz
  available frequency steps: 3.40 GHz, 2.70 GHz, 2.20 GHz, 800 MHz
  available cpufreq governors: ondemand, performance
  current policy: frequency should be within 800 MHz and 3.40 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).
analyzing CPU 2:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 3.40 GHz
  available frequency steps: 3.40 GHz, 2.70 GHz, 2.20 GHz, 800 MHz
  available cpufreq governors: ondemand, performance
  current policy: frequency should be within 800 MHz and 3.40 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).
analyzing CPU 3:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 8.0 us.
  hardware limits: 800 MHz - 3.40 GHz
  available frequency steps: 3.40 GHz, 2.70 GHz, 2.20 GHz, 800 MHz
  available cpufreq governors: ondemand, performance
  current policy: frequency should be within 800 MHz and 3.40 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 3.40 GHz (asserted by call to hardware).

root@impala:/root(2)# cat /proc/cpuinfo 
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 16
model           : 4
model name      : AMD Phenom(tm) II X4 965 Processor
stepping        : 3
cpu MHz         : 800.000
cache size      : 512 KB
physical id     : 0
siblings        : 4
core id         : 0
cpu cores       : 4
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext
fxsr_opt pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl
nonstop_tsc extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm
extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit
wdt npt lbrv svm_lock nrip_save
bogomips        : 6829.72
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate

processor       : 1
vendor_id       : AuthenticAMD
cpu family      : 16
model           : 4
model name      : AMD Phenom(tm) II X4 965 Processor
stepping        : 3
cpu MHz         : 800.000
cache size      : 512 KB
physical id     : 0
siblings        : 4
core id         : 1
cpu cores       : 4
apicid          : 1
initial apicid  : 1
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext
fxsr_opt pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl
nonstop_tsc extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm
extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit
wdt npt lbrv svm_lock nrip_save
bogomips        : 6830.40
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate
...

Regards 
Juergen

