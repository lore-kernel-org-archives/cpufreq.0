From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Intel Clovertown vs. frequency scaling
Date: Thu, 11 Oct 2007 10:15:29 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F5017D897B@scsmsx415.amr.corp.intel.com>
References: <20071011150633.GL6058@cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20071011150633.GL6058@cern.ch>
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
To: Andras.Horvath@cern.ch, cpufreq@lists.linux.org.uk


With latest kernels (2.6.22 and beyond) you should use acpi-cpufreq and
not speedstep-centrino.

The frequencies supported depends on bus speed and voltages supported by
the CPU. I think the thing here is you have a low voltage part which is
already running at lowest possible voltage and does not support any more
frequency/voltage reduction.

You mentioned that cpufreq works fine on Woodcrest, Intel L5160.
What are the freqs supported and what is the max freq for this part?

Thanks,
Venki
 
>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk 
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of 
>Andras.Horvath@cern.ch
>Sent: Thursday, October 11, 2007 8:07 AM
>To: cpufreq@lists.linux.org.uk
>Subject: Intel Clovertown vs. frequency scaling
>
>Hi,
>
>I have a number of Clovertown (intel quadcore) machines and, even with
>the latest 2.6.23, it seems to me that frequency scaling is not
>supported (e.g. the /sys/devices/system/cpu/cpu0/cpufreq/* stuff does
>not appear even though CONFIG_X86_SPEEDSTEP_CENTRINO is "y").
>
>Is that as expected?
>
>This is what the CPU (one core in one of the two sockets) looks like:
>
># head -24 /proc/cpuinfo 
>processor       : 0
>vendor_id       : GenuineIntel
>cpu family      : 6
>model           : 15
>model name      : Intel(R) Xeon(R) CPU           L5335  @ 2.00GHz
>stepping        : 11
>cpu MHz         : 1995.105
>cache size      : 4096 KB
>physical id     : 0
>siblings        : 4
>core id         : 0
>cpu cores       : 4
>fdiv_bug        : no
>hlt_bug         : no
>f00f_bug        : no
>coma_bug        : no
>fpu             : yes
>fpu_exception   : yes
>cpuid level     : 10
>wp              : yes
>flags           : fpu vme de pse tsc msr pae mce cx8 apic sep 
>mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 
>ss ht tm pbe nx lm constant_tsc arch_perfmon pebs bts pni 
>monitor ds_cpl vmx tm2 ssse3 cx16 xtpr dca lahf_lm
>bogomips        : 3994.09
>clflush size    : 64
>
>
>also:
>
># cat /proc/acpi/processor/CPU0/info 
>processor id:            0
>acpi id:                 0
>bus mastering control:   no
>power management:        yes
>throttling control:      yes
>limit interface:         yes
>
># cat /proc/acpi/processor/CPU0/power 
>active state:            C2
>max_cstate:              C8
>bus master activity:     00000000
>maximum allowed latency: 20000 usec
>states:
>    C1:                  type[C1] promotion[C2] demotion[--] 
>latency[020] usage[00003940] duration[00000000000000000000]
>   *C2:                  type[C2] promotion[--] demotion[C1] 
>latency[040] usage[00013668] duration[00000000000359543325]
>
>
>FWIW, I also have some other Core-based (Woodcrest, Intel 
>L5160) systems
>and cpufreq works fine there.
>
>Any help or insight would be appreciated. 
>
>(I'm experimenting with ways to lower the average power 
>consumption of a
>large number of servers, working my way through 
>http://www.lesswatts.org
>etc.  I'm willing to patch kernels, run tests, and I have proper power
>meters to check the results.)
>
>Andras
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
