From: "Mattias Flodin" <flodin@gmail.com>
Subject: Re: Failure on Gigabyte GA-965P-DS4 motherboard with Intel P965
	chipset& core 2 duo CPU
Date: Thu, 1 Feb 2007 00:43:39 +0100
Message-ID: <be6081710701311543rc015634s2281de8170ac5f79@mail.gmail.com>
References: <be6081710701311327i31f1fcb2h679c2a3a1675dba5@mail.gmail.com>
	<EB12A50964762B4D8111D55B764A845401331365@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A845401331365@scsmsx413.amr.corp.intel.com>
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

Thanks for your response.

I only got this board last week. It's hard to tell whether it's a
regression, if that is even a meaningful term; if I understand
correctly this motherboard did not boot at all with kernels before
2.6.18, due to incompatible IDE-controller behavior.

I am running the latest version of the BIOS, which was released
January 8th this year. The BIOS version that shipped with the hardware
(released 2006/10/12) had identical errors in dmesg, so nothing seems
to have changed there.

There is an option to enable the feature, called "CPU EIST Function",
which I set to enabled. If disabled, cpufreq reports failure obtaining
the ACPI info.

On 1/31/07, Pallipadi, Venkatesh <venkatesh.pallipadi@intel.com> wrote:
>
> Is this a regression with recent kernels and was working in earlier
> kernels?
> If it never worked on this platform, I would suggest to make sure you
> have the
> latest BIOS and also check whether there are any options in BIOS to
> enable this feature.
>
> Thanks,
> Venki
>
> >-----Original Message-----
> >From: cpufreq-bounces@lists.linux.org.uk
> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Mattias Flodin
> >Sent: Wednesday, January 31, 2007 1:28 PM
> >To: cpufreq@lists.linux.org.uk
> >Subject: Failure on Gigabyte GA-965P-DS4 motherboard with
> >Intel P965 chipset& core 2 duo CPU
> >
> >Hi,
> >
> >I tried to see if anyone else had the same problem but I couldn't find
> >any way to search the mailing-list archives. This is with vanilla
> >kernel on Gentoo 2006.1.
> >
> >Interesting dmesg bits:
> >cpufreq-core: trying to register driver centrino
> >cpufreq-core: adding CPU 0
> >speedstep-centrino: Invalid control/status registers (1 - 1)
> >speedstep-centrino: speedstep-centrino: invalid ACPI data
> >speedstep-centrino: found unsupported CPU with Enhanced
> >SpeedStep: send /proc/cp
> >uinfo to cpufreq@lists.linux.org.uk
> >cpufreq-core: initialization failed
> >
> >% uname -a
> >Linux zaphod 2.6.19.2 #1 SMP PREEMPT Thu Feb 1 22:00:51 CET 2007 i686
> >Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz GenuineIntel GNU/Linux
> >
> >% cat /proc/cpuinfo
> >processor       : 0
> >vendor_id       : GenuineIntel
> >cpu family      : 6
> >model           : 15
> >model name      : Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz
> >stepping        : 6
> >cpu MHz         : 2400.072
> >cache size      : 4096 KB
> >physical id     : 0
> >siblings        : 2
> >core id         : 0
> >cpu cores       : 2
> >fdiv_bug        : no
> >hlt_bug         : no
> >f00f_bug        : no
> >coma_bug        : no
> >fpu             : yes
> >fpu_exception   : yes
> >cpuid level     : 10
> >wp              : yes
> >flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
> >mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx
> >lm constant_tsc pni monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr lahf_lm
> >bogomips        : 4801.95
> >
> >processor       : 1
> >vendor_id       : GenuineIntel
> >cpu family      : 6
> >model           : 15
> >model name      : Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz
> >stepping        : 6
> >cpu MHz         : 2400.072
> >cache size      : 4096 KB
> >physical id     : 0
> >siblings        : 2
> >core id         : 1
> >cpu cores       : 2
> >fdiv_bug        : no
> >hlt_bug         : no
> >f00f_bug        : no
> >coma_bug        : no
> >fpu             : yes
> >fpu_exception   : yes
> >cpuid level     : 10
> >wp              : yes
> >flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
> >mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx
> >lm constant_tsc pni monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr lahf_lm
> >bogomips        : 4799.32
> >
> >Regards,
> >  Mattias Flodin
> >
> >_______________________________________________
> >Cpufreq mailing list
> >Cpufreq@lists.linux.org.uk
> >http://lists.linux.org.uk/mailman/listinfo/cpufreq
> >
>
