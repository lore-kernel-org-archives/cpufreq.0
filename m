From: =?ISO-8859-1?Q?Jaime_Pe=F1alba?= <jpenalbae@gmail.com>
Subject: Re: Coppermine, more details
Date: Thu, 4 Aug 2005 14:41:54 +0200
Message-ID: <edaeffdd050804054135264ed4@mail.gmail.com>
References: <20050727220035.GE27509@tofu.dreamhost.com>
	<20050729052233.GA31636@tofu.dreamhost.com>
Reply-To: =?ISO-8859-1?Q?Jaime_Pe=F1alba?= <jpenalbae@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050729052233.GA31636@tofu.dreamhost.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Im having similar problems also using coppermine with 440BX chipset,
acpi-freq doesnt work, and smi seems to load but doesnt find supported
freqs ;(

I hoppe someone knows what is happening with coppermines...


2005/7/29, Nathan Myers <ncm@cantrip.org>:
> Following up (Coppermine/440BX) ...
>=20
> I tried booting with cpufreq.debug=3D3.  With CONFIG_X86_ACPI_CPUFREQ
> enabled, I watched it try, and fail, to register:
>=20
>  CPU: After all inits, caps: 0383f9ff 00000000 00000000 00000040
>     00000000 00000000 00000000
>  [...]
>  ACPI: CPU0 (power states: C1[C1] C2[C2])
>  ACPI: Processor [C0D5] (supports 8 throttling states)
>  [...]
>  acpi-cpufreq: acpi_cpufreq_init
>  cpufreq-core: trying to register driver acpi-cpufreq
>  cpufreq-core: adding CPU 0
>  acpi-cpufreq: acpi_cpufreq_cpu_init
>  acpi-cpufreq: acpi_processor_cpu_init_pdc
>  cpufreq-core: initialization failed
>  cpufreq-core: no CPU initialized for driver acpi-cpufreq
>  cpufreq-core: unregistering CPU 0
>=20
> ... with nothing from the SMI driver.  With CONFIG_X86_SPEEDSTEP_SMI
> the only cpufreq driver, and with or without "smi_cmd=3D0x82 smi_port=3D0=
xb2
> smi_sig=3D1", I saw no reports about cpufreq at all; just the same
> speedstep-lib and speedstep-smi initialization lines quoted below.
>=20
> The BIOS only offers choices of boot media.  Ideas, please?
> Is this supposed to work, or am I out on the ragged edge?
>=20
> Nathan Myers
> ncm@cantrip.org
>=20
> On Wed, Jul 27, 2005 at 03:00:35PM -0700, Nathan Myers wrote:
> >
> >  CONFIG_CPU_FREQ is on, but nothing shows up under
> > /sys/devices/system/cpu/cpu0/.
> >
> > Kernel is vanilla 2.6.12.3 built with gcc-3.3.6.
> > Hardware is "PIII (Coppermine) stepping 03" with a 440BX, details below=
.
> > Relevant /proc/config.gz entries below too; (summary: SMI, no modules).
> >
> > ACPI succeeds in setting the frequency, in eight steps.
> > Must one-or-other bit be in a module?  What am I doing wrong?
> > (And, would it be OK to make them modules if I'm not using initrd?)
> >
> > With debug=3D2, dmesg says only:
> >
> >   speedstep-lib: x86: 6, model: 8
> >   speedstep-lib: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x45080020, 0x0
> >   speedstep-lib: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x23570000
> >   speedstep-smi: signature:0x00008680, command:0x0000e6f5, event:0x0000=
0000, perf_level:0x47534943.
> >
> > and
> >
> >   acpi-cpufreq: acpi_cpufreq_init
> >   acpi-cpufreq: acpi_cpufreq_cpu_init
> >   acpi-cpufreq: acpi_processor_cpu_init_pdc
> >
> > Thanks,
> >
> > Nathan Myers
> > ncm@cantrip.org
> >
> > -----------------------------------------------------------------
> >
> >   #
> >   # CPU Frequency scaling
> >   #
> >   CONFIG_CPU_FREQ=3Dy
> >   CONFIG_CPU_FREQ_TABLE=3Dy
> >   CONFIG_CPU_FREQ_DEBUG=3Dy
> >   CONFIG_CPU_FREQ_STAT=3Dy
> >   CONFIG_CPU_FREQ_STAT_DETAILS=3Dy
> >   # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> >   CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
> >   CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> >   CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> >   CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> >   CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> >   CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> >
> >   #
> >   # CPUFreq processor drivers
> >   #
> >   CONFIG_X86_ACPI_CPUFREQ=3Dy
> >   # CONFIG_X86_POWERNOW_K6 is not set
> >   # CONFIG_X86_POWERNOW_K7 is not set
> >   # CONFIG_X86_POWERNOW_K8 is not set
> >   # CONFIG_X86_GX_SUSPMOD is not set
> >   # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> >   # CONFIG_X86_SPEEDSTEP_ICH is not set
> >   CONFIG_X86_SPEEDSTEP_SMI=3Dy
> >   # CONFIG_X86_P4_CLOCKMOD is not set
> >   # CONFIG_X86_CPUFREQ_NFORCE2 is not set
> >   # CONFIG_X86_LONGRUN is not set
> >   # CONFIG_X86_LONGHAUL is not set
> >
> >   #
> >   # shared options
> >   #
> >   # CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
> >   CONFIG_X86_SPEEDSTEP_LIB=3Dy
> >   CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=3Dy
> >
> >   ...
> >   CONFIG_ACPI_FAN=3Dy
> >   CONFIG_ACPI_PROCESSOR=3Dy
> >   CONFIG_ACPI_THERMAL=3Dy
> >
> >
> > $ cat /proc/cpuinfo
> > processor       : 0
> > vendor_id       : GenuineIntel
> > cpu family      : 6
> > model           : 8
> > model name      : Pentium III (Coppermine)
> > stepping        : 3
> > cpu MHz         : 547.405
> > cache size      : 256 KB
> > fdiv_bug        : no
> > hlt_bug         : no
> > f00f_bug        : no
> > coma_bug        : no
> > fpu             : yes
> > fpu_exception   : yes
> > cpuid level     : 2
> > wp              : yes
> > flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca
> > cmov pat pse36 mmx fxsr sse
> > bogomips        : 1081.34
> >
> > 0000:00:00.0 Host bridge: Intel Corp. 440BX/ZX/DX - 82443BX/ZX/DX Host
> > bridge (rev 03)
> >         Subsystem: Compaq Computer Corporation Armada M700/E500
> >         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- Par=
Err- SteppinG- sERR- FastB2B-
> >         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbo=
rt- <TAbort- <MAbort+ >SERR- <PERR+
> >         Latency: 64
> >         Region 0: Memory at 50000000 (32-bit, prefetchable) [size=3D64M=
]
> >         Capabilities: <available only to root>
> >
> >
> > _______________________________________________
> > Cpufreq mailing list
> > Cpufreq@lists.linux.org.uk
> > http://lists.linux.org.uk/mailman/listinfo/cpufreq
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
