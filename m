From: Nathan Myers <ncm@cantrip.org>
Subject: Coppermine, more details
Date: Thu, 28 Jul 2005 22:22:33 -0700
Message-ID: <20050729052233.GA31636@tofu.dreamhost.com>
References: <20050727220035.GE27509@tofu.dreamhost.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050727220035.GE27509@tofu.dreamhost.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Following up (Coppermine/440BX) ...

I tried booting with cpufreq.debug=3.  With CONFIG_X86_ACPI_CPUFREQ 
enabled, I watched it try, and fail, to register:

 CPU: After all inits, caps: 0383f9ff 00000000 00000000 00000040 
    00000000 00000000 00000000
 [...]
 ACPI: CPU0 (power states: C1[C1] C2[C2])
 ACPI: Processor [C0D5] (supports 8 throttling states)
 [...]
 acpi-cpufreq: acpi_cpufreq_init 
 cpufreq-core: trying to register driver acpi-cpufreq
 cpufreq-core: adding CPU 0
 acpi-cpufreq: acpi_cpufreq_cpu_init
 acpi-cpufreq: acpi_processor_cpu_init_pdc
 cpufreq-core: initialization failed
 cpufreq-core: no CPU initialized for driver acpi-cpufreq
 cpufreq-core: unregistering CPU 0

... with nothing from the SMI driver.  With CONFIG_X86_SPEEDSTEP_SMI 
the only cpufreq driver, and with or without "smi_cmd=0x82 smi_port=0xb2 
smi_sig=1", I saw no reports about cpufreq at all; just the same 
speedstep-lib and speedstep-smi initialization lines quoted below.

The BIOS only offers choices of boot media.  Ideas, please?  
Is this supposed to work, or am I out on the ragged edge?

Nathan Myers
ncm@cantrip.org

On Wed, Jul 27, 2005 at 03:00:35PM -0700, Nathan Myers wrote:
> 
>  CONFIG_CPU_FREQ is on, but nothing shows up under 
> /sys/devices/system/cpu/cpu0/.   
> 
> Kernel is vanilla 2.6.12.3 built with gcc-3.3.6.
> Hardware is "PIII (Coppermine) stepping 03" with a 440BX, details below.
> Relevant /proc/config.gz entries below too; (summary: SMI, no modules).  
> 
> ACPI succeeds in setting the frequency, in eight steps.  
> Must one-or-other bit be in a module?  What am I doing wrong?
> (And, would it be OK to make them modules if I'm not using initrd?)
> 
> With debug=2, dmesg says only:
> 
>   speedstep-lib: x86: 6, model: 8
>   speedstep-lib: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x45080020, 0x0
>   speedstep-lib: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x23570000
>   speedstep-smi: signature:0x00008680, command:0x0000e6f5, event:0x00000000, perf_level:0x47534943.  
> 
> and 
> 
>   acpi-cpufreq: acpi_cpufreq_init
>   acpi-cpufreq: acpi_cpufreq_cpu_init
>   acpi-cpufreq: acpi_processor_cpu_init_pdc
> 
> Thanks,
> 
> Nathan Myers
> ncm@cantrip.org
> 
> -----------------------------------------------------------------
> 
>   #
>   # CPU Frequency scaling
>   #
>   CONFIG_CPU_FREQ=y
>   CONFIG_CPU_FREQ_TABLE=y
>   CONFIG_CPU_FREQ_DEBUG=y
>   CONFIG_CPU_FREQ_STAT=y
>   CONFIG_CPU_FREQ_STAT_DETAILS=y
>   # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
>   CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
>   CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
>   CONFIG_CPU_FREQ_GOV_POWERSAVE=y
>   CONFIG_CPU_FREQ_GOV_USERSPACE=y
>   CONFIG_CPU_FREQ_GOV_ONDEMAND=y
>   CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
> 
>   #
>   # CPUFreq processor drivers
>   #
>   CONFIG_X86_ACPI_CPUFREQ=y
>   # CONFIG_X86_POWERNOW_K6 is not set
>   # CONFIG_X86_POWERNOW_K7 is not set
>   # CONFIG_X86_POWERNOW_K8 is not set
>   # CONFIG_X86_GX_SUSPMOD is not set
>   # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
>   # CONFIG_X86_SPEEDSTEP_ICH is not set
>   CONFIG_X86_SPEEDSTEP_SMI=y
>   # CONFIG_X86_P4_CLOCKMOD is not set
>   # CONFIG_X86_CPUFREQ_NFORCE2 is not set
>   # CONFIG_X86_LONGRUN is not set
>   # CONFIG_X86_LONGHAUL is not set
> 
>   #
>   # shared options
>   #
>   # CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
>   CONFIG_X86_SPEEDSTEP_LIB=y
>   CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=y
> 
>   ...
>   CONFIG_ACPI_FAN=y
>   CONFIG_ACPI_PROCESSOR=y
>   CONFIG_ACPI_THERMAL=y
> 
> 
> $ cat /proc/cpuinfo
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 8
> model name      : Pentium III (Coppermine)
> stepping        : 3
> cpu MHz         : 547.405
> cache size      : 256 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 2
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca
> cmov pat pse36 mmx fxsr sse
> bogomips        : 1081.34
> 
> 0000:00:00.0 Host bridge: Intel Corp. 440BX/ZX/DX - 82443BX/ZX/DX Host
> bridge (rev 03)
>         Subsystem: Compaq Computer Corporation Armada M700/E500
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- SteppinG- sERR- FastB2B-
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort+ >SERR- <PERR+
>         Latency: 64
>         Region 0: Memory at 50000000 (32-bit, prefetchable) [size=64M]
>         Capabilities: <available only to root>
> 
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
