From: "Jeff Rickman" <jrickman@myamigos.us>
Subject: Kernel OOPS - FC13 cpuspeed AMD CPU
Date: Mon, 9 Aug 2010 02:08:00 -0500 (CDT)
Message-ID: <2831.75.142.172.231.1281337680.squirrel@webmail.myamigos.us>
Reply-To: jrickman@myamigos.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

When the 'cpuspeed" service is started by "service cpuspeed start" and the
corresponding 'chkconfig' line for 'cpuspeed' is set to "off" for all
levels, the system reboots. I run this system at "level 3".

I copied a kernel OOPS that displayed in my SSH session to the very bottom
of this email.

Is "cpuspeed" not supported on this processor? Is this a bug?

Please reply directly to me since I do not subscribe to any kernel mailing
lists.

Some Important Details
----------------------
Fedora Core 13: 2.6.33.6-147.2.4.fc13.x86_64

[root@xx ~]# cpuspeed -h
cpuspeed v1.5
[snip]

"/etc/sysconfig/cpuspeed" details:
GOVERNOR=ondemand
No "MIN_SPEED" or "MAX_SPEED" values are set (default), allowing the CPU
to report it's MIN and MAX values. When these values are set
(MIN_SPEED=1000000 MAX_SPEED=2800000) the system still reboots when the
"cpuspeed" service is started.

"/proc/cpuinfo" output:
[root@xx ~]# cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 107
model name      : AMD Athlon(tm) 64 X2 Dual Core Processor 5400+
stepping        : 2
cpu MHz         : 2813.053
cache size      : 512 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 2
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic mtrr pge mca
cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt
rdtscp lm 3dnowext 3dnow rep_good extd_apicid pni cx16 lahf_lm cmp_legacy
svm extapic cr8_legacy 3dnowprefetch
bogomips        : 5626.10
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management: ts fid vid ttp tm stc 100mhzsteps

processor       : 1
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 107
model name      : AMD Athlon(tm) 64 X2 Dual Core Processor 5400+
stepping        : 2
cpu MHz         : 2813.053
cache size      : 512 KB
physical id     : 0
siblings        : 2
core id         : 1
cpu cores       : 2
apicid          : 1
initial apicid  : 1
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic mtrr pge mca
cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt
rdtscp lm 3dnowext 3dnow rep_good extd_apicid pni cx16 lahf_lm cmp_legacy
svm extapic cr8_legacy 3dnowprefetch
bogomips        : 5625.63
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management: ts fid vid ttp tm stc 100mhzsteps

OOPS output:
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0 1
  maximum transition latency: 109 us.
  hardware limits: 1000 MHz - 2.80 GHz
  available frequency steps: 2.80 GHz, 2.60 GHz, 2.40 GHz, 2.20 GHz, 2.00
GHz, 1.80 GHz, 1000 MHz
  available cpufreq governors: ondemand, userspace, performance
  current policy: frequency should be within 1000 MHz and 2.80 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1000 MHz (asserted by call to hardware).
analyzing CPU 1:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0 1
  maximum transition latency: 109 us.
  hardware limits: 1000 MHz - 2.80 GHz
  available frequency steps: 2.80 GHz, 2.60 GHz, 2.40 GHz, 2.20 GHz, 2.00
GHz, 1.80 GHz, 1000 MHz
  available cpufreq governors: ondemand, userspace, performance
  current policy: frequency should be within 1000 MHz and 2.80 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1000 MHz (asserted by call to hardware).
[root@blackbox ~]#
Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:Oops: 0000 [#1] SMP

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:last sysfs file:
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:Stack:

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:Call Trace:

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:Code: 6a 22 e4 ff e8 66 0a 23 00 31 d2 be 7b 0b 00 00 48 c7 c7 24
45 79 81 e8 52 22 e4 ff e8 4e 0a 23 00 49 8b 04 24 8b 7d c4 45 31 ed <8b>
b0 70 04 00 00 e8 a8 5d ff ff 48 85 c0 49 89 c7 0f 84 e0 01

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:CR2: 0000000000000470

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:Oops: 0000 [#2] SMP

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:last sysfs file:
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:Stack:

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:Call Trace:

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:Code: e7 e8 54 ff ff ff 48 c7 43 18 00 00 00 00 5b 41 5c c9 c3 55
48 89 e5 41 55 41 54 53 48 83 ec 18 48 8b 1e 48 85 db 74 39 4c 8b 23 <49>
8b bc 24 20 03 00 00 48 89 75 d8 e8 d3 42 23 00 48 8b 75 d8

Message from syslogd@blackbox at Aug  9 01:49:40 ...
 kernel:CR2: 0000000000000320



