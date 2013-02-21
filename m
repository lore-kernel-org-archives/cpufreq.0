From: Valerio Pachera <sirio81@gmail.com>
Subject: Unable to load the rihgt module for Xeon L5420
Date: Thu, 21 Feb 2013 11:38:02 +0100
Message-ID: <CAHS0cb-nsuAoK=hjiYMRHDQNH1zYPGcQHx_9mx9s0+q7tig45A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=v7C05tvC7P+TYXiaYkIruvZs+L9w8GuGHvv9bJnW+cY=;
        b=uz9ARlWXp/UsKen/81IgWAxNpdU43g44NQx1QreBuyojeb+Bm63BBqRuVM2fZatiQW
         c/4Ff66Dshb5JkSi/LSAcnfR+7aTa3VUrWMpHI0S9d7lCtEEJBsYulxPNvly9oBMgfcf
         1elPoDoR6i1dQZwNbEESfMjpO8fnBhNdrLi1bst8+Bh8S1RbATjgJYtibZLw8DRn6NVi
         dRGG7n92rf2CXWdJBAYjVKB+2Z5kx/4OqSnNLzopKAwFcUr/y04nnggQlhxWJEI8P/6p
         /MZlyZPtcopMPTSYjl20OFbl0bukljpAznMYT247fnq6glZlu5Ga0Q76cJEPYwIG0uvc
         AaLA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

cpufreq-info
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Per favore, comunicare errori e malfunzionamenti a cpufreq@vger.kernel.org.
analisi della CPU 0:
  nessun modulo o modulo cpufreq sconosciuto per questa CPU
  latenza massima durante la transizione: 4294.55 ms.
analisi della CPU 1:
  nessun modulo o modulo cpufreq sconosciuto per questa CPU
  latenza massima durante la transizione: 4294.55 ms.
analisi della CPU 2:
  nessun modulo o modulo cpufreq sconosciuto per questa CPU
  latenza massima durante la transizione: 4294.55 ms.
analisi della CPU 3:
  nessun modulo o modulo cpufreq sconosciuto per questa CPU
  latenza massima durante la transizione: 4294.55 ms.
analisi della CPU 4:
  nessun modulo o modulo cpufreq sconosciuto per questa CPU
  latenza massima durante la transizione: 4294.55 ms.
analisi della CPU 5:
  nessun modulo o modulo cpufreq sconosciuto per questa CPU
  latenza massima durante la transizione: 4294.55 ms.
analisi della CPU 6:
  nessun modulo o modulo cpufreq sconosciuto per questa CPU
  latenza massima durante la transizione: 4294.55 ms.
analisi della CPU 7:
  nessun modulo o modulo cpufreq sconosciuto per questa CPU
  latenza massima durante la transizione: 4294.55 ms.

Xeon L5420
http://ark.intel.com/products/33929/Intel-Xeon-Processor-L5420-12M-Cache-2_50-GHz-1333-MHz-FSB

Linux servername 3.2.0-4-amd64 #1 SMP Debian 3.2.35-2 x86_64 GNU/Linux

cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 23
model name      : Intel(R) Xeon(R) CPU           L5420  @ 2.50GHz
stepping        : 6
microcode       : 0x60f
cpu MHz         : 2494.231
cache size      : 6144 KB
physical id     : 0
siblings        : 4
core id         : 3
cpu cores       : 4
apicid          : 3
initial apicid  : 3
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx lm constant_tsc arch_perfmon pebs bts rep_good nopl
aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm
dca sse4_1 lahf_lm dtherm tpr_shadow vnmi flexpriority
bogomips        : 4987.51
clflush size    : 64
cache_alignment : 64
address sizes   : 38 bits physical, 48 bits virtual
power management:
<repeated 7 more times>

lsmod | grep -i cpu
cpufreq_userspace      12576  0
cpufreq_powersave      12454  0
cpufreq_conservative    13147  0
cpufreq_stats          12866  0

modprobe acpi-cpufreq
ERROR: could not insert 'acpi_cpufreq': No such device
modprobe speedstep-centrino
ERROR: could not insert 'speedstep_centrino': No such device
modprobe p4-clockmod
ERROR: could not insert 'p4_clockmod': No such device

speedstep-lib is loaded.
