From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: speedstep won't load even with acpi tables
Date: Tue, 05 Oct 2004 14:21:39 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1097011299.4909.11.camel@localhost>
References: <4162DCE2.4030008@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <4162DCE2.4030008@comcast.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "W. Brown" <wbrownab@comcast.net>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Tue, 2004-10-05 at 13:41 -0400, W. Brown wrote:
> Hello Jeremy, I'm having a bit of trouble getting speedstep-centrino 
> loaded on my zt3000 notebook. The motherboard is intel 855pm based and 
> the cpu is a pentium m 1.7ghz (dothan).

I don't really know a lot about ACPI, so nothing sticks out.  You might
want to try the cpufreq list (which I'm cc: on the reply), and see if
someone there can help.  The full output of dmesg would be useful
though.

	J

> 
> With 2.6.8.1, I got the unsupported cpu found message. I've been trying 
> to follow the dothan developments. As I understand it was not recognized 
> here at all.
> 
> Now with 2.6.9-rc3 I get the message:
>     speedstep-centrino: no table support for CPU model "Intel(R) 
> Pentium(R) M processor 1.70GHz":
>     speedstep-centrino: try compiling with 
> CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled
> And here, the cpu is known, I'm sure you got plenty of emails full of 
> /proc/cpuinfo :)
> It should work with ACPI tables? I saw your post on the kernel mailing 
> list telling the one guy "...should be fine in 2.6.9-rc2..."
> 
> So, I compiled with CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI, and the module 
> just fails quietly. Not helpful output in /var/log/messages.
> 
> I tried:
> 
> (Get current frequency)
> # cat /proc/cpuinfo | grep "cpu MHz"
> 
> (Lists supported frequencies. This might fail.)
> # cd /sys/devices/system/cpu/cpu0/cpufreq/
> # cat scaling_available_frequencies
> 
> (Change frequency to 1 GHz (1000000 KHz)
> Replace with a frequency your laptop supports.)
> # echo -n userspace > scaling_governor
> # echo -n 1000000 > scaling_setspeed
> 
> (Verify frequency was changed)
> # cat /proc/cpuinfo | grep "cpu MHz"
> 
> 
> And it works fine. Apparently I can change speed manually, so ACPI must be working okay. 
> 
> 
> I'll provide all I know here... If I can provide more debugging info 
> somehow, I'd be glad to help.
> 
> Thanks,
> Will
> 
> Info:
> ////////////////////////////////////////////////// /proc/cpuinfo
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 13
> model name      : Intel(R) Pentium(R) M processor 1.70GHz
> stepping        : 6
> cpu MHz         : 1695.229
> cache size      : 2048 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 2
> wp              : yes
> flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov 
> pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe est tm2
> bogomips        : 3350.52
> 
> ////////////////////////////////////////////////// /proc/modules
> ipt_NOTRACK 1600 0 - Live 0xe09f5000
> iptable_raw 1536 0 - Live 0xe09f1000
> libcrc32c 2304 0 - Live 0xe09ea000
> ac 3340 0 - Live 0xe09e8000
> thermal 10512 0 - Live 0xe09ed000
> button 4888 0 - Live 0xe09e5000
> fan 2892 0 - Live 0xe09b6000
> battery 7244 0 - Live 0xe09c9000
> acpi 4684 0 - Live 0xe09cc000
> processor 13936 2 thermal,acpi, Live 0xe09cf000
> non_fatal 1540 0 [permanent], Live 0xe09b8000
> radeon 128164 0 - Live 0xe0a07000
> firmware_class 7616 0 - Live 0xe09ba000
> ds 14020 0 - Live 0xe09c4000
> pcmcia_core 50764 1 ds, Live 0xe09d4000
> 8139too 20352 0 - Live 0xe09be000
> 
> 
> 
> ////////////////////////////////////////////////// relevant .config portion
> 
> #
> # ACPI (Advanced Configuration and Power Interface) Support
> #
> CONFIG_ACPI=y
> CONFIG_ACPI_BOOT=y
> CONFIG_ACPI_INTERPRETER=y
> CONFIG_ACPI_SLEEP=y
> CONFIG_ACPI_SLEEP_PROC_FS=y
> CONFIG_ACPI_AC=m
> CONFIG_ACPI_BATTERY=m
> CONFIG_ACPI_BUTTON=m
> CONFIG_ACPI_FAN=m
> CONFIG_ACPI_PROCESSOR=m
> CONFIG_ACPI_THERMAL=m
> # CONFIG_ACPI_ASUS is not set
> # CONFIG_ACPI_TOSHIBA is not set
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_BUS=y
> CONFIG_ACPI_EC=y
> CONFIG_ACPI_POWER=y
> CONFIG_ACPI_PCI=y
> CONFIG_ACPI_SYSTEM=y
> # CONFIG_X86_PM_TIMER is not set
> 
> #
> # APM (Advanced Power Management) BIOS Support
> #
> # CONFIG_APM is not set
> 
> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=y
> # CONFIG_CPU_FREQ_PROC_INTF is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
> CONFIG_CPU_FREQ_GOV_POWERSAVE=y
> CONFIG_CPU_FREQ_GOV_USERSPACE=y
> CONFIG_CPU_FREQ_GOV_ONDEMAND=y
> # CONFIG_CPU_FREQ_24_API is not set
> CONFIG_CPU_FREQ_TABLE=y
> 
> #
> # CPUFreq processor drivers
> #
> CONFIG_X86_ACPI_CPUFREQ=m
> # CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
> # CONFIG_X86_POWERNOW_K6 is not set
> # CONFIG_X86_POWERNOW_K7 is not set
> # CONFIG_X86_POWERNOW_K8 is not set
> # CONFIG_X86_GX_SUSPMOD is not set
> CONFIG_X86_SPEEDSTEP_CENTRINO=m
> CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
> CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=y
> # CONFIG_X86_SPEEDSTEP_ICH is not set
> # CONFIG_X86_SPEEDSTEP_SMI is not set
> # CONFIG_X86_P4_CLOCKMOD is not set
> # CONFIG_X86_LONGRUN is not set
> # CONFIG_X86_LONGHAUL is not set
> 
> ////////////////////////////////////////////////// relevant modules autoload
> #cpu
> non-fatal
> acpi
> 
> #acpi
> battery
> fan
> button
> processor
> thermal
> ac
> 
> #cpu freq
> speedstep-centrino
> 
> 
> 
> ////////////////////////////////////////////////// x86info 1.11 output
> Found 1 CPU
> eax in: 0x00000000, eax = 00000002 ebx = 756e6547 ecx = 6c65746e edx = 
> 49656e69
> eax in: 0x00000001, eax = 000006d6 ebx = 00000816 ecx = 00000180 edx = 
> afe9f9bf
> eax in: 0x00000002, eax = 02b3b001 ebx = 000000f0 ecx = 00000000 edx = 
> 2c04307d
> 
> eax in: 0x80000000, eax = 80000004 ebx = 00000000 ecx = 00000000 edx = 
> 00000000
> eax in: 0x80000001, eax = 00000000 ebx = 00000000 ecx = 00000000 edx = 
> 00000000
> eax in: 0x80000002, eax = 20202020 ebx = 20202020 ecx = 65746e49 edx = 
> 2952286c
> eax in: 0x80000003, eax = 6e655020 ebx = 6d756974 ecx = 20295228 edx = 
> 7270204d
> eax in: 0x80000004, eax = 7365636f ebx = 20726f73 ecx = 30372e31 edx = 
> 007a4847
> 
> Family: 6 Model: 13 Stepping: 6 Type: 0
> CPU Model: Unknown CPU Original OEM
> Feature flags:
>         Onboard FPU
>         Virtual Mode Extensions
>         Debugging Extensions
>         Page Size Extensions
>         Time Stamp Counter
>         Model-Specific Registers
>         Machine Check Architecture
>         CMPXCHG8 instruction
>         SYSENTER/SYSEXIT
>         Memory Type Range Registers
>         Page Global Enable
>         Machine Check Architecture
>         CMOV instruction
>         Page Attribute Table
>         CLFLUSH instruction
>         Debug Trace Store
>         ACPI via MSR
>         MMX support
>         FXSAVE and FXRESTORE instructions
>         SSE support
>         SSE2 support
>         CPU self snoop
>         Automatic clock Control
>         Pending Break Enable
> 
> 
> unknown TLB/cache descriptor:
>         0xb0
> unknown TLB/cache descriptor:
>         0xb3
> Instruction TLB: 4MB pages, fully associative, 2 entries
> unknown TLB/cache descriptor:
>         0xf0
> unknown TLB/cache descriptor:
>         0x7d
> unknown TLB/cache descriptor:
>         0x30
> Data TLB: 4MB pages, 4-way associative, 8 entries
> unknown TLB/cache descriptor:
>         0x2c
> 
> 
> Number of reporting banks : 5
> 
> Erk, MCG_CTL not present! :5:
> 
> Bank: 0 (0x400)
> MC0CTL:    00000000 00000000 00000000 00000000
>            01000100 01001000 00000000 00000000
> MC0STATUS: 00010000 00000000 00000000 00000000
>            00000000 00000000 00000000 00000000
> MC0ADDR:   00000000 00000000 00000000 00000000
>            00000000 00000000 00000000 00000000
> 
> Bank: 1 (0x404)
> MC1CTL:    00000000 00000000 00000000 00000000
>            00000000 00000000 00000000 00000001
> MC1STATUS: 00000000 00000000 00000000 00000000
>            00000000 00000000 00000000 00000000
> MC1ADDR:   00000000 00000000 00000000 00000000
>            00000000 00000000 00000000 00000000
> 
> Bank: 2 (0x408)
> MC2CTL:    00000000 00000000 00000000 00000000
>            00000000 00000000 00000000 00000000
> MC2STATUS: 00000000 00000000 00000000 00000000
>            00000000 00000000 00000000 00000000
> MC2ADDR:   00000000 00000000 00000000 00000000
>            00000000 00000000 00000000 00000000
> 
> Bank: 3 (0x40c)
> MC3CTL:    00000000 00000000 00000000 00000001
>            00000000 00000000 00000000 00000001
> MC3STATUS: 00000000 00000000 00000000 00000000
>            00000000 00000000 00000000 00000000
> MC3ADDR:   Couldn't read MSR 0x40e
> 
> Bank: 4 (0x410)
> MC4CTL:    00000000 00000000 00000000 00001000
>            00000000 00000000 00000000 00001000
> MC4STATUS: 00000000 00000000 00000000 00000000
>            00000000 00000000 00000000 00010001
> MC4ADDR:   00000000 00000000 00000000 00000000
>            00000000 00000000 00000000 00000000
> 
> 
> MTRR registers:
> MTRRcap (0xfe): 0x0000000000000508
> MTRRphysBase0 (0x200): 0x0000000000000006
> MTRRphysMask0 (0x201): 0x0000000fe0000800
> MTRRphysBase1 (0x202): 0x00000000b0000001
> MTRRphysMask1 (0x203): 0x0000000ff0000800
> MTRRphysBase2 (0x204): 0x0000000000000000
> MTRRphysMask2 (0x205): 0x0000000f00000000
> MTRRphysBase3 (0x206): 0x0000000000000000
> MTRRphysMask3 (0x207): 0x0000000f00000000
> MTRRphysBase4 (0x208): 0x0000000000000000
> MTRRphysMask4 (0x209): 0x0000000f00000000
> MTRRphysBase5 (0x20a): 0x0000000000000000
> MTRRphysMask5 (0x20b): 0x0000000f00000000
> MTRRphysBase6 (0x20c): 0x0000000000000000
> MTRRphysMask6 (0x20d): 0x0000000f00000000
> MTRRphysBase7 (0x20e): 0x0000000000000000
> MTRRphysMask7 (0x20f): 0x0000000f00000000
> MTRRfix64K_00000 (0x250): 0x0606060606060606
> MTRRfix16K_80000 (0x258): 0x0606060606060606
> MTRRfix16K_A0000 (0x259): 0x0000000000000000
> MTRRfix4K_C8000 (0x269): 0x0000050505050505
> MTRRfix4K_D0000 0x26a: 0x0000000000000000
> MTRRfix4K_D8000 0x26b: 0x0000000000000000
> MTRRfix4K_E0000 0x26c: 0x0000000000000000
> MTRRfix4K_E8000 0x26d: 0x0000000000000000
> MTRRfix4K_F0000 0x26e: 0x0505050505050505
> MTRRfix4K_F8000 0x26f: 0x0505050505050505
> MTRRdefType (0x2ff): 0x0000000000000c00
> 
> 
> //////////////////////////////////////////////////  /var/log/messages snip
> Oct  5 12:30:29 shake ACPI: Processor [CPU0] (supports C1 C2 C3, 8 
> throttling states)
> Oct  5 12:30:29 shake cpufreq: CPU0 - ACPI performance management activated.
> Oct  5 12:30:29 shake cpufreq: *P0: 1700 MHz, 21000 mW, 100 uS
> Oct  5 12:30:29 shake cpufreq:  P1: 1400 MHz, 17500 mW, 100 uS
> Oct  5 12:30:29 shake cpufreq:  P2: 1200 MHz, 15000 mW, 100 uS
> Oct  5 12:30:29 shake cpufreq:  P3: 1000 MHz, 12500 mW, 100 uS
> Oct  5 12:30:29 shake cpufreq:  P4: 800 MHz, 10000 mW, 100 uS
> Oct  5 12:30:29 shake cpufreq:  P5: 600 MHz, 7500 mW, 100 uS
> Oct  5 12:30:29 shake ACPI: Battery Slot [C11F] (battery present)
> Oct  5 12:30:29 shake ACPI: Power Button (FF) [PWRF]
> Oct  5 12:30:29 shake ACPI: Lid Switch [C136]
> Oct  5 12:30:29 shake ACPI: AC Adapter [C134] (on-line)
> 
> 
> 
-- 
Jeremy Fitzhardinge <jeremy@goop.org>
