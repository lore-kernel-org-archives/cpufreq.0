From: John Frankish <frankish@dubai.oilfield.slb.com>
Subject: Re: Problems Compiling cpufreq in 2.4.26
Date: Thu, 07 Dec 2006 14:58:16 +0400
Message-ID: <7.0.1.0.2.20061207144440.040f2e60@dubai.oilfield.slb.com>
References: <7.0.1.0.2.20061129084245.040034e0@dubai.oilfield.slb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-reply-to: <7.0.1.0.2.20061129084245.040034e0@dubai.oilfield.slb.com>
References: <7.0.1.0.2.20061129084245.040034e0@dubai.oilfield.slb.com>
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

I managed to make some progress on this - the compile problem was due 
to a bug related to the drmP.h file in /drivers/char/drm of the 2.4.26 sources.

After applying the cpufreq patch and recompiling, I am unable to load 
the speedstep-centrino module (dmesg states the cpu is unsupported) 
but am able to load the p4-clockmod module although it does not 
appear to be working.

Given that the speedstep-centrino module loads and works in 2.6.12, I 
am puzzled as to why the module with the same name will not load 
under 2.4.26 - is this related to the processor type in the .config file maybe?


At 09:13 29-11-06, you wrote:
>Hi,
>
>I've been using cpufreq without problems under the DSL-N distro 
>(2.6.12 based on knoppix 4.0.2) but have so far been unable to 
>re-compile cpufreq into the DSL distro (2.4.26 based on knoppix 3.4) 
>on the same machine.
>
>I've tried with both the cpufreq-LINUX_2_4-20040813.tar.gz cvs file 
>and the cpufreq-24-2004083101.diff.gz patch (kernel sources from 
>linux-2.4.26.tar.gz) - are these the most recent cpufreq versions for 2.4.x?
>
>1. Apply the patch, load existing .config file with menuconfig, 
>chose the relevent cpufreq options (CONFIG_CPU_FREQ=y, 
>CONFIG_CPU_FREQ_TABLE=y, CONFIG_CPU_FREQ_GOV_USERSPACE=y, 
>CONFIG_X86_SPEEDSTEP_CENTRINO=m). This compiles the kernel modules 
>(built-in.o, cpufreq.o, freq_table.o, proc_intf.o, userspace.o) but 
>not the loadable module speedstep-centrino.o. If I boot the new 
>kernel image and manually copy speedstep-centrino.o from 2 below, I 
>get an error message that my cpu is not supported when I try to load 
>the module.
>
>2. As a test - apply the patch, use make oldconfig, chose the 
>relevent cpufreq options and save. This compiles the kernel modules 
>and the loadable module but I cannot boot from the new kernel image 
>as the default config with the kernel source does not match my 
>system. If I modify the config to suit my system then the loadable 
>module does not compile.
>
>Does anyone have an idea what the problem might be?
>
>cat /proc/cpuinfo
>------------------------
>processor      : 0
>vendor_id       : GenuineIntel
>cpu family      : 6
>model            : 13
>model name   : Intel(R) Pentium(R) M processor 1.60GHz
>stepping        : 6
>cpu MHz        : 1594.847
>cache size     : 64 KB (2048KB under 2.6.12)
>fdiv_bug        : no
>hlt_bug         : no
>f00f_bug        : no
>coma_bug     : no
>fpu                : yes
>fpu_exception   : yes
>cpuid level     : 2
>wp              : yes
>flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca 
>cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe tm2 est
>bogomips        : 3185.04
>
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
