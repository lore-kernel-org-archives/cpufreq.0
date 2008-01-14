From: "Saru Addep" <saru.dpm@gmail.com>
Subject: Re: Overall picture of cpufreq..
Date: Mon, 14 Jan 2008 11:13:43 -0800
Message-ID: <9f79f7f50801141113q6a173362yddd65ffd89a6753d@mail.gmail.com>
References: <9f79f7f50801111415w354dc91fwfeec98b16a00fb74@mail.gmail.com>
	<1200264884.4157.16.camel@queen>
	<9f79f7f50801131812x6a68c202tb4c25fa2116b32e4@mail.gmail.com>
	<478B0A82.6050503@wpkg.org> <1200304310.23376.311.camel@queen.suse.de>
	<478B3695.1030406@wpkg.org> <1200306768.23376.332.camel@queen.suse.de>
	<478B4097.8010401@wpkg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <478B4097.8010401@wpkg.org>
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
To: Tomasz Chmielewski <mangoo@wpkg.org>
Cc: cpufreq@lists.linux.org.uk, Martin.Leisner@xerox.com

Can some one also please let me know the concept of operating points, and
where in the kernel tree I can see that code. Governors are pretty easily
locatable, but I have a little tough time locating operating points code.

Thanks
Saringni.

On 1/14/08, Tomasz Chmielewski <mangoo@wpkg.org> wrote:
>
> Thomas Renninger schrieb:
>
> (...)
>
> >>> could it be that you are using
> >>> p4-clockmode driver which is doing throttling, not frequency scaling,
> >>> better try with acpi-cpufreq then.
> >> Indeed, I am using p4-clockmod.
> > Sorry, but your bug report is invalid then.
> > p4-clockmod is using throttling (means the CPU ignores cycles/ticks) and
> > not CPU frequency/voltage reduction.
> > There is another interface for that:
> > /proc/acpi/processor/throttling
>
> Umm, do I need to build/insert some additional modules here?
>
> # cat /proc/acpi/processor/CPU0/throttling
> <not supported>
>
> (...)
>
>
> >> acpi-cpufreq doesn't work for me on that machine (p4-clockmod not
> loaded
> >> when I try to insert acpi-cpufreq):
> >>
> >> # modprobe acpi-cpufreq
> >> FATAL: Error inserting acpi_cpufreq
> >>
> (/lib/modules/2.6.23.12-pata-1/kernel/arch/i386/kernel/cpu/cpufreq/acpi-
> cpufreq.ko):
> >> No such device
> >
> > Have you checked whether that the CPU is cpufreq capable at all?
>
> According to Documentation/cpu-freq/user-guide.txt, Intel Xeon is
> supported by cpufreq. Are there exceptions to that (i.e., some Xeons are
> not supported)?
>
> Anyway, "cat /dev/zero >/dev/null" scales the frequency up; reading from
> a dm-crypt device doesn't.
>
>
> > If yes, you might want to upgrade the BIOS.
> >
> > Still, it looks strange that frequency (in this case throttling) is not
> > set to the highest state as measuring the idle time should be the same
> > mechanism and low-level driver independent. So this may be a valid bug,
> > but using p4-clockmode is not a good idea to work on it (p4-clockmode is
> > not a good idea to work on in general, IMO it should vanish totally...).
>
> In that case, it's not documented very clearly (in "make menuconfig").
> Basically, a P4 user can pick either:
>
> CONFIG_X86_ACPI_CPUFREQ:
>
> This driver adds a CPUFreq driver which utilizes the ACPI
>
>     Processor Performance States.
>
>
>
> This driver also supports Intel Enhanced Speedstep.
>
>
>
> or:
>
>
> CONFIG_X86_P4_CLOCKMOD:
>
>
> This adds the CPUFreq driver for Intel Pentium 4 / XEON
>
> processors.
>
>
>
> CONFIG_X86_P4_CLOCKMOD is more explicit and implies that is the
> preferred module for a P4 CPU.
>
>
>
> --
> Tomasz Chmielewski
> http://wpkg.org
>
>
>
