From: Fredrik Rambris <fredrik@rambris.com>
Subject: p4-clockmod: Unknown CPU
Date: Tue, 1 Mar 2011 22:25:52 +0100
Message-ID: <AANLkTinJ--hJmv4uGqW2_Ldg8t6q=EOzXNJ6hKLH5-CZ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi

I'm running Ubuntu something something (moms laptop) 2.6.35-25-generic
#44-Ubuntu SMP Fri Jan 21 17:40:44 UTC 2011 x86_64 GNU/Linux
This is a Compaq Presario CQ71 and the fans are running top speed all
the time. I therefor tried to run cpufreqd but the kernel does not
recognize the CPU.

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 23
model name	: Celeron(R) Dual-Core CPU       T3000  @ 1.80GHz
stepping	: 10
cpu MHz		: 1795.493
cache size	: 1024 KB
physical id	: 0
siblings	: 2
core id		: 0
cpu cores	: 2
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
lm constant_tsc arch_perfmon pebs bts rep_good aperfmperf pni dtes64
monitor ds_cpl tm2 ssse3 cx16 xtpr pdcm xsave lahf_lm dts
bogomips	: 3590.98
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 23
model name	: Celeron(R) Dual-Core CPU       T3000  @ 1.80GHz
stepping	: 10
cpu MHz		: 1795.493
cache size	: 1024 KB
physical id	: 0
siblings	: 2
core id		: 1
cpu cores	: 2
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
lm constant_tsc arch_perfmon pebs bts rep_good aperfmperf pni dtes64
monitor ds_cpl tm2 ssse3 cx16 xtpr pdcm xsave lahf_lm dts
bogomips	: 3112.96
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:


-- 
Fredrik Rambris <fredrik@rambris.com> (also GoogleTalk)
