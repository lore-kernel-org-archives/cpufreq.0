From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: Pentium D 915 support
Date: Sun, 30 Jul 2006 19:33:40 +0400
Message-ID: <44CCD154.3080606@linux.intel.com>
References: <1154265136.21063.10.camel@skylla.slagter.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1154265136.21063.10.camel@skylla.slagter.name>
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
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

Do you have acpi support disabled in your kernel? Cpufreq driver should get information from it for new processors.
Regards,
Alex

Erik Slagter wrote:
> Hi,
> 
> I just bought a new motherboard and cpu and carefully checked whether
> both support EIST.
> 
> The motherboard is a ASUStek P5WDG2-WS, the cpu a Pentium D 915. This
> seems to be the only (besides the 945) from the 9xx series that has
> proper EIST support (new stepping), according to the intel
> processorfinder.
> 
> I already learned that I need to use speedstep-centrino (odd...) but the
> module doesn't load (not found message).
> 
> I guess this cpu is too new to have cpufreq support (I am running with
> kernel 2.6.18-rc2, btw), so I had a peek in the source file, and found a
> table with apparently cpuid values. The values of my D915 were not there
> (as expected). So I added it and changed two other places, and it looks
> (very superfluously) that this should be enough to make it work, at
> least to make the module recognise the cpu.
> 
> I don't dare to test it though, I don't know if I can break stuff this
> way (like really, permanently...).
> 
> Can you please have a look and give your comments?
> 
> cat /proc/cpuinfo:
> 
>> cpuinfo
>> processor       : 0
>> vendor_id       : GenuineIntel
>> cpu family      : 15
>> model           : 6
>> model name      :               Intel(R) Pentium(R) D CPU 2.80GHz
>> stepping        : 4
>> cpu MHz         : 2800.000
>> cache size      : 2048 KB
>> physical id     : 0
>> siblings        : 2
>> core id         : 0
>> cpu cores       : 2
>> fpu             : yes
>> fpu_exception   : yes
>> cpuid level     : 6
>> wp              : yes
>> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall nx lm constant_tsc pni monitor ds_cpl est cid cx16 xtpr lahf_lm
>> bogomips        : 5623.94
>> clflush size    : 64
>> cache_alignment : 128
>> address sizes   : 36 bits physical, 48 bits virtual
>> power management:
>>
>> processor       : 1
>> vendor_id       : GenuineIntel
>> cpu family      : 15
>> model           : 6
>> model name      :               Intel(R) Pentium(R) D CPU 2.80GHz
>> stepping        : 4
>> cpu MHz         : 2800.000
>> cache size      : 2048 KB
>> physical id     : 0
>> siblings        : 2
>> core id         : 1
>> cpu cores       : 2
>> fpu             : yes
>> fpu_exception   : yes
>> cpuid level     : 6
>> wp              : yes
>> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall nx lm constant_tsc pni monitor ds_cpl est cid cx16 xtpr lahf_lm
>> bogomips        : 5620.20
>> clflush size    : 64
>> cache_alignment : 128
>> address sizes   : 36 bits physical, 48 bits virtual
>> power management:
> 
> This is what I did to speedstep-centrino.c:
> 
> --- speedstep-centrino.c        2006-07-30 15:02:25.000000000 +0200
> +++ speedstep-centrino.c-ems    2006-07-30 15:01:04.000000000 +0200
> @@ -50,6 +50,7 @@
>         CPU_DOTHAN_B0,
>         CPU_MP4HT_D0,
>         CPU_MP4HT_E0,
> +       CPU_PD900,
>  };
> 
>  static const struct cpu_id cpu_ids[] = {
> @@ -59,6 +60,7 @@
>         [CPU_DOTHAN_B0] = { 6, 13, 6 },
>         [CPU_MP4HT_D0]  = {15,  3, 4 },
>         [CPU_MP4HT_E0]  = {15,  4, 1 },
> +       [CPU_PD900]             = {15,  6, 4 },
>  };
>  #define N_IDS  ARRAY_SIZE(cpu_ids)
> 
> @@ -226,6 +228,7 @@
>         { &cpu_ids[CPU_DOTHAN_B0], NULL, 0, NULL },
>         { &cpu_ids[CPU_MP4HT_D0], NULL, 0, NULL },
>         { &cpu_ids[CPU_MP4HT_E0], NULL, 0, NULL },
> +       { &cpu_ids[CPU_PD900], NULL, 0, NULL },
> 
>         { NULL, }
>  };
> 
> Thank you for your time.
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
