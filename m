From: "Roman V. Nikolaev" <rshadow@rambler.ru>
Subject: Unknown cpufreq driver
Date: Mon, 23 Aug 2010 21:08:41 +0400
Message-ID: <4C72AB19.6010907@rambler.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@vger.kernel.org

Hello. This is my bugreport.
I install cpufreqd buf it`s fail on daemon start.

# cpufreq-info

cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
   no or unknown cpufreq driver is active on this CPU
   maximum transition latency: 4294.55 ms.
analyzing CPU 1:
   no or unknown cpufreq driver is active on this CPU
   maximum transition latency: 4294.55 ms.

# cat /proc/cpuinfo
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 15
model        : 4
model name    : Intel(R) Pentium(R) D CPU 2.80GHz
stepping    : 7
cpu MHz        : 2810.101
cache size    : 1024 KB
physical id    : 0
siblings    : 2
core id        : 0
cpu cores    : 2
apicid        : 0
initial apicid    : 0
fpu        : yes
fpu_exception    : yes
cpuid level    : 5
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx lm constant_tsc pebs bts pni dtes64 monitor ds_cpl cid cx16 xtpr lahf_lm
bogomips    : 5620.20
clflush size    : 64
cache_alignment    : 128
address sizes    : 36 bits physical, 48 bits virtual
power management:

processor    : 1
vendor_id    : GenuineIntel
cpu family    : 15
model        : 4
model name    : Intel(R) Pentium(R) D CPU 2.80GHz
stepping    : 7
cpu MHz        : 2810.101
cache size    : 1024 KB
physical id    : 0
siblings    : 2
core id        : 1
cpu cores    : 2
apicid        : 1
initial apicid    : 1
fpu        : yes
fpu_exception    : yes
cpuid level    : 5
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx lm constant_tsc pebs bts pni dtes64 monitor ds_cpl cid cx16 xtpr lahf_lm
bogomips    : 5620.35
clflush size    : 64
cache_alignment    : 128
address sizes    : 36 bits physical, 48 bits virtual
power management:

Debian testing
Linux 2.6.32 amd64

How I can more help to resolve this bug?

Roman V. Nikolaev
