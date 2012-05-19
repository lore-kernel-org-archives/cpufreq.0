From: Raphael Maville <raphael.maville@wanadoo.fr>
Subject: Celeron and cpufreq
Date: Sat, 19 May 2012 09:30:51 +0200
Message-ID: <20120519093051.7e64eefe@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

Good morning,


I am trying to run cpufrequtils on a netbook with Celeron.
Unfortunately, it seems to do not run.

Why doesn't it run, please ? Is Celeron unable to handle cpufreq ?

Thanks a lot



this have been posted in French here:
http://forums.archlinux.fr/post94289.html#p94289

$ sudo cpufreq-info
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Veuillez rapportez les erreurs et les bogues =E0 cpufreq@vger.kernel.or=
g,
s'il vous plait. analyse du CPU 0 :
  pas de pilotes cpufreq reconnu pour ce CPU
  maximum transition latency: 4294.55 ms.

$ sudo rc.d start cpufreq
:: Setting cpufreq governing
rules
[BUSY]
grep: /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors:
No such file or directory , cpu 0wrong, unknown or unhandled CPU? Error
setting new values. Common errors:
- Do you have proper administration rights? (super-user?)
- Is the governor you requested available and modprobed?
- Trying to set an invalid policy?
- Trying to set a specific frequency, but userspace governor is not
available, for example because of hardware which cannot be set to a
specific frequency or because the userspace governor isn't loaded?


$  sudo ls /lib/modules/$(uname -r)/kernel/drivers/cpufreq/
acpi-cpufreq.ko.gz          cpufreq_powersave.ko.gz
cpufreq_userspace.ko.gz  p4-clockmod.ko.gz  powernow-k8.ko.gz
cpufreq_conservative.ko.gz  cpufreq_stats.ko.gz
mperf.ko.gz              pcc-cpufreq.ko.gz  speedstep-lib.ko.gz


$ sudo modprobe p4-clockmod
ERROR: could not insert 'p4_clockmod': No such device


$ sudo cat /proc/cpuinfo
processor   : 0
vendor_id   : GenuineIntel
cpu family   : 6
model      : 23
model name   : Intel(R) Celeron(R) CPU          723  @ 1.20GHz

stepping   : 10
microcode   : 0xa0b
cpu MHz      : 1197.098
cache size   : 1024 KB
fpu      : yes
fpu_exception   : yes
cpuid level   : 13
wp      : yes
flags      : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss tm pbe syscall nx
lm constant_tsc up arch_perfmon pebs bts rep_good nopl aperfmperf pni
dtes64 monitor ds_cpl tm2 ssse3 cx16 xtpr pdcm xsave lahf_lm dts
bogomips   : 2395.95 clflush size   : 64 cache_alignment   : 64 address
sizes   : 36 bits physical, 48 bits virtual power management:


NOTE: vitual power management is EMPTY!
