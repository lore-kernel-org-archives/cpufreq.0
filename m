From: "Martin Skytte" <skytte@gmail.com>
Subject: Re: speedstep-centrino does not work on Core Duo T2400
Date: Mon, 17 Jul 2006 13:23:21 +0200
Message-ID: <ac5f76150607170423w57905cf1j576e549e53974f5e@mail.gmail.com>
References: <EB12A50964762B4D8111D55B764A84540D030D@scsmsx413.amr.corp.intel.com>
	<ac5f76150606101315r546af269qe76227100e7508b4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <ac5f76150606101315r546af269qe76227100e7508b4@mail.gmail.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, cpufreq@lists.linux.org.uk

I never got any replies to this one so I wonder if there is anything else I
can do about it?

2006/6/10, Martin Skytte <skytte@gmail.com>:
>
> I have CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI and CONFIG_ACPI_PROCESSOR
> buildin in the kernel.
> The BIOS setting is also enabled (and it works in windows)
>
> With a custom kernel I enabled CONFIG_CPU_FREQ_DEBUG, but with boot
> options cpufreq.debug=[1,2,4] (cpufreq.debug alone is not valid) I still
> get "no such device" when inserting speedstep-centrino. You might need to
> elaborate on this, I am not used to debugging hardware.
>
> The contents of kernel.log is courious I think.
>
> -Martin
>
> 2006/6/10, Pallipadi, Venkatesh < venkatesh.pallipadi@intel.com >:
>
> >
> >
> > Do you have CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI and CONFIG_ACPI_PROCESSOR
> >
> > selected in your config options? Check your BIOS have option to
> > Enable/Disable
> > Speedstep feature. It is typically called EIST/IST/Speedstep in BIOS
> > options.
> >
> > If it still it doesn't work, then we need to debug this further
> > 1) Enable CPUFREQ_DEBUG and pass appropriate boot option cpufreq.debug
> > and see what is the error you get while inserting speedstep_centrino
> > 2) Get the latest pmtools from here
> > http://www.kernel.org/pub/linux/kernel/people/lenb/acpi/utils/
> > And send acpidump output from your system to me.
> >
> > Thanks,
> > Venki
> >
> > >-----Original Message-----
> > >From: cpufreq-bounces@lists.linux.org.uk
> > >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Martin Skytte
> > >Sent: Saturday, June 10, 2006 1:12 AM
> > >To: cpufreq@lists.linux.org.uk
> > >Subject: speedstep-centrino does not work on Core Duo T2400
> > >
> > >Hi,
> > >When I try to load the speedstep-centrino module I get:
> > >FATAL: Error inserting speedstep_centrino
> > >(/lib/modules/2.6.16-beyond/kernel/arch/i386/kernel/cpu/cpufreq
> > >/speedstep-
> > >centrino.ko): No such device
> > >The same happens when loading acpi-cpufreq.
> > >
> > >I've been wrestling with this for quite some time now, but I
> > >really don't
> > >have no ideas as to how to solve this.
> > >
> > >-Martin
> > >
> > >cat /proc/cpuinfo
> > >processor    : 0
> > >vendor_id    : GenuineIntel
> > >cpu family    : 6
> > >model        : 14
> > >model name    : Genuine Intel(R) CPU           T2400  @ 1.83GHz
> > >stepping    : 8
> > >cpu MHz        : 1828.805
> > >cache size    : 2048 KB
> > >physical id    : 0
> > >siblings    : 2
> > >core id        : 0
> > >cpu cores    : 2
> > >fdiv_bug    : no
> > >hlt_bug        : no
> > >f00f_bug    : no
> > >coma_bug    : no
> > >fpu        : yes
> > >fpu_exception    : yes
> > >cpuid level    : 10
> > >wp        : yes
> > >flags        : fpu vme de pse tsc msr pae mce cx8 apic sep
> > >mtrr pge mca cmov
> > >pat clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx constant_tsc pni
> >
> > >monitor vmx est tm2 xtpr
> > >bogomips    : 3661.78
> > >
> > >processor    : 1
> > >vendor_id    : GenuineIntel
> > >cpu family    : 6
> > >model        : 14
> > >model name    : Genuine Intel(R) CPU           T2400  @ 1.83GHz
> > >stepping    : 8
> > >cpu MHz        : 1828.805
> > >cache size    : 2048 KB
> > >physical id    : 0
> > >siblings    : 2
> > >core id        : 1
> > >cpu cores    : 2
> > >fdiv_bug    : no
> > >hlt_bug        : no
> > >f00f_bug    : no
> > >coma_bug    : no
> > >fpu        : yes
> > >fpu_exception    : yes
> > >cpuid level    : 10
> > >wp        : yes
> > >flags        : fpu vme de pse tsc msr pae mce cx8 apic sep
> > >mtrr pge mca cmov
> > >pat clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx constant_tsc pni
> > >monitor vmx est tm2 xtpr
> > >bogomips    : 3657.40
> > >_______________________________________________
> > >Cpufreq mailing list
> > >Cpufreq@lists.linux.org.uk
> > > http://lists.linux.org.uk/mailman/listinfo/cpufreq
> > >
> >
>
>
>
