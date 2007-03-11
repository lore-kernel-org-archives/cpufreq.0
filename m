From: "Joshua Justice" <joshj777@gmail.com>
Subject: cpufreq on Debian, problems
Date: Sun, 11 Mar 2007 16:04:41 -0400
Message-ID: <553837380703111304m4aea8cbcufdc5da4261e41895@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type;
	b=OhaIRDTd+8vzJSIaAu9odeWA4isaXfK3YgZKb6AmgD8SijNu6RnB1ocwXxrlzmGw8wLBcecoXBzb8/SXJCoKPvHlKdfRbrmYZktVPzxay13evWZ49xtRV2Qj0HNAgH9LKfYalKPfIQXiTdsgBGjavy/Vr+f1smpVm0WCDQ3OXQI=
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

I'm running a Pentium 4, 3.40 gigahertz, on Debian Etch 2.6.18-4-686, and I
have issues with overheating because cpu throttling isn't working.


Here's some info, and if you want more feel free to e-mail me.

# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 4
model name      : Intel(R) Pentium(R) 4 CPU 3.40GHz
stepping        : 3
cpu MHz         : 3391.754
cache size      : 2048 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 1
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm
constant_tsc pni monitor ds_cpl est cid cx16 xtpr
bogomips        : 6789.19

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 15
model           : 4
model name      : Intel(R) Pentium(R) 4 CPU 3.40GHz
stepping        : 3
cpu MHz         : 3391.754
cache size      : 2048 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 1
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm
constant_tsc pni monitor ds_cpl est cid cx16 xtpr
bogomips        : 6783.67





# cpuid
 eax in    eax      ebx      ecx      edx
00000000 00000005 756e6547 6c65746e 49656e69
00000001 00000f43 01020800 0000649d bfebfbff
00000002 605b5001 00000000 00000000 007d7040
00000003 00000000 00000000 00000000 00000000
00000004 00004121 01c0003f 0000001f 00000000
00000005 00000040 00000040 00000000 00000000
80000000 80000008 00000000 00000000 00000000
80000001 00000000 00000000 00000000 20100000
80000002 20202020 20202020 20202020 6e492020
80000003 286c6574 50202952 69746e65 52286d75
80000004 20342029 20555043 30342e33 007a4847
80000005 00000000 00000000 00000000 00000000
80000006 00000000 00000000 08006040 00000000
80000007 00000000 00000000 00000000 00000000
80000008 00003024 00000000 00000000 00000000

Vendor ID: "GenuineIntel"; CPUID level 5

Intel-specific functions:
Version 00000f43:
Type 0 - Original OEM
Family 15 - Pentium 4
Extended family 0
Model 4 -
Stepping 3
Reserved 0

Extended brand string: "              Intel(R) Pentium(R) 4 CPU 3.40GHz"
CLFLUSH instruction cache line size: 8
Initial APIC ID: 1
Hyper threading siblings: 2

Feature flags bfebfbff:
FPU    Floating Point Unit
VME    Virtual 8086 Mode Enhancements
DE     Debugging Extensions
PSE    Page Size Extensions
TSC    Time Stamp Counter
MSR    Model Specific Registers
PAE    Physical Address Extension
MCE    Machine Check Exception
CX8    COMPXCHG8B Instruction
APIC   On-chip Advanced Programmable Interrupt Controller present and
enabled
SEP    Fast System Call
MTRR   Memory Type Range Registers
PGE    PTE Global Flag
MCA    Machine Check Architecture
CMOV   Conditional Move and Compare Instructions
FGPAT  Page Attribute Table
PSE-36 36-bit Page Size Extension
CLFSH  CFLUSH instruction
DS     Debug store
ACPI   Thermal Monitor and Clock Ctrl
MMX    MMX instruction set
FXSR   Fast FP/MMX Streaming SIMD Extensions save/restore
SSE    Streaming SIMD Extensions instruction set
SSE2   SSE2 extensions
SS     Self Snoop
HT     Hyper Threading
TM     Thermal monitor
31     reserved

TLB and cache info:
50: Instruction TLB: 4KB and 2MB or 4MB pages, 64 entries
5b: Data TLB: 4KB and 4MB pages, 64 entries
60: unknown TLB/cache descriptor
40: No 2nd-level cache, or if 2nd-level cache exists, no 3rd-level cache
70: Trace cache: 12K-micro-op, 4-way set assoc
7d: unknown TLB/cache descriptor
Processor serial: 0000-0F43-0000-0000-0000-0000
