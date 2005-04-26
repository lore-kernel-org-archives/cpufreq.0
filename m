From: Thomas Renninger <mail@renninger.de>
Subject: Re: Problem recognizing P4-M
Date: Tue, 26 Apr 2005 10:17:07 +0200
Message-ID: <426DF903.5060203@renninger.de>
References: <1114490818.6148.15.camel@petra>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <1114490818.6148.15.camel@petra>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Paul Swartz <z3p@twistedmatrix.com>
Cc: cpufreq@lists.linux.org.uk

Paul Swartz wrote:
> I've checked all over the internet, but I've had no luck finding the
> answer to this problem.  I have what looks to be a Mobile Intel Pentium
> 4 at 2.66Ghz.  It's supported (sort of) by the p4-clockmod and
> acpi-cpufreq modules, but it seems like it should be supported by one of
> the speedstep modules.  However, whenever I try to insert the
> speedstep-ich module, I get this:
> 
> FATAL: Error inserting speedstep_ich
> (/lib/modules/2.6.10-5-686/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-ich.ko): No such device
> 
> I get the same error under 2.6.10 (Ubuntu) and 2.6.11 (from the tree).
> Attached are the output from 'cat /proc/cpuinfo' and 'x86info -a'.
> 
If acpi-cpufreq loads and works for you, everything is fine.
This is the module/driver supporting speedstep on your machine.
You should not take p4-clockmod Modul if acpi-cpufreq is working, it's not
speedstep and not that efficient.

    Thomas

> Thanks in advance for any advice you might have,
> -p
> 
> 
> ------------------------------------------------------------------------
> 
> processor	: 0
> vendor_id	: GenuineIntel
> cpu family	: 15
> model		: 2
> model name	: Mobile Intel(R) Pentium(R) 4     CPU 2.66GHz
> stepping	: 9
> cpu MHz		: 2658.563
> cache size	: 512 KB
> fdiv_bug	: no
> hlt_bug		: no
> f00f_bug	: no
> coma_bug	: no
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 2
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid xtpr
> bogomips	: 5242.88
> 
> 
> 
> ------------------------------------------------------------------------
> 
> x86info v1.12b.  Dave Jones 2001-2003
> Feedback to <davej@redhat.com>.
> 
> Found 1 CPU
> --------------------------------------------------------------------------
> eax in: 0x00000000, eax = 00000002 ebx = 756e6547 ecx = 6c65746e edx = 49656e69
> eax in: 0x00000001, eax = 00000f29 ebx = 00010808 ecx = 00004400 edx = bfebf9ff
> eax in: 0x00000002, eax = 665b5101 ebx = 00000000 ecx = 00000000 edx = 007b7040
> 
> eax in: 0x80000000, eax = 80000004 ebx = 00000000 ecx = 00000000 edx = 00000000
> eax in: 0x80000001, eax = 00000000 ebx = 00000000 ecx = 00000000 edx = 00000000
> eax in: 0x80000002, eax = 4d202020 ebx = 6c69626f ecx = 6e492065 edx = 286c6574
> eax in: 0x80000003, eax = 50202952 ebx = 69746e65 ecx = 52286d75 edx = 20342029
> eax in: 0x80000004, eax = 20202020 ebx = 20555043 ecx = 36362e32 edx = 007a4847
> 
> Family: 15 Model: 2 Stepping: 9 Type: 0 Brand: 8
> CPU Model: Pentium 4 (Northwood) [D1] Original OEM
> Processor name string: Mobile Intel(R) Pentium(R) 4     CPU 2.66GHz
> 
> Feature flags:
> 	Onboard FPU
> 	Virtual Mode Extensions
> 	Debugging Extensions
> 	Page Size Extensions
> 	Time Stamp Counter
> 	Model-Specific Registers
> 	Physical Address Extensions
> 	Machine Check Architecture
> 	CMPXCHG8 instruction
> 	SYSENTER/SYSEXIT
> 	Memory Type Range Registers
> 	Page Global Enable
> 	Machine Check Architecture
> 	CMOV instruction
> 	Page Attribute Table
> 	36-bit PSEs
> 	CLFLUSH instruction
> 	Debug Trace Store
> 	ACPI via MSR
> 	MMX support
> 	FXSAVE and FXRESTORE instructions
> 	SSE support
> 	SSE2 support
> 	CPU self snoop
> 	Hyper-Threading
> 	Automatic clock Control
> 	Pending Break Enable
> 
> Extended feature flags:
>  cntx-id
> Pentium 4 specific MSRs:
> 
> Instruction TLB: 4K, 2MB or 4MB pages, fully associative, 128 entries.
> Data TLB: 4KB or 4MB pages, fully associative, 64 entries.
> L1 Data cache:
> 	Size: 8KB	Sectored, 4-way associative.
> 	line size=64 bytes.
> No level 2 cache or no level 3 cache if valid 2nd level cache.
> Instruction trace cache:
> 	Size: 12K uOps	8-way associative.
> L2 unified cache:
> 	Size: 512KB	Sectored, 8-way associative.
> 	line size=64 bytes.
> Number of logical processors supported within the physical package: 0
> 
> Connector type: Socket478 (PGA478 Socket)
> 
> Datasheet: http://developer.intel.com/design/pentium4/datashts/24988703.pdf
> 	http://developer.intel.com/design/pentium4/datashts/29864304.pdf
> Errata: http://developer.intel.com/design/pentium4/specupdt/24919928.pdf
> 
> MTRR registers:
> MTRRcap (0xfe): MTRRphysBase0 (0x200): MTRRphysMask0 (0x201): MTRRphysBase1 (0x202): MTRRphysMask1 (0x203): MTRRphysBase2 (0x204): MTRRphysMask2 (0x205): MTRRphysBase3 (0x206): MTRRphysMask3 (0x207): MTRRphysBase4 (0x208): MTRRphysMask4 (0x209): MTRRphysBase5 (0x20a): MTRRphysMask5 (0x20b): MTRRphysBase6 (0x20c): MTRRphysMask6 (0x20d): MTRRphysBase7 (0x20e): MTRRphysMask7 (0x20f): MTRRfix64K_00000 (0x250): MTRRfix16K_80000 (0x258): MTRRfix16K_A0000 (0x259): MTRRfix4K_C8000 (0x269): MTRRfix4K_D0000 0x26a: MTRRfix4K_D8000 0x26b: MTRRfix4K_E0000 0x26c: MTRRfix4K_E8000 0x26d: MTRRfix4K_F0000 0x26e: MTRRfix4K_F8000 0x26f: MTRRdefType (0x2ff): 
> 
> 2.6Ghz processor (estimate).
> 
