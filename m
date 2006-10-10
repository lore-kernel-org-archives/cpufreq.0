From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: Core 2 Duo Merom speedstep on 2.6.18
Date: Tue, 10 Oct 2006 15:23:32 +0400
Message-ID: <452B82B4.6020607@linux.intel.com>
References: <BAY18-F777056819FC27B3EA765583170@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <BAY18-F777056819FC27B3EA765583170@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"
To: Johannes Petersson <my_reflection@hotmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi Johannes,
acpi_cpufreq gets its frequencies from ACPI tables exported by BIOS,
so if you see wrong values -- it's BIOS bug, try to get proper BIOS
from your notebook/mainboard vendor.
On the other hand, lowest freq for Pentium M derivatives is 6 * FSB.
So either your BIOS set FSB to 100Mhz, or it forget to change FSB freq for
Merom (should be 166Mhz) -> 1200*1.66 => 2000 you are looking for.
This means that cpufreq framework is working properly even if you don't see
right numbers.

Anyway, update your BIOS! :)

Regards,
	Alex.

Johannes Petersson wrote:
> Hello
> 
> I've been struggling a while to get speedstepping to work correctly on a
> Core 2 Duo T7200 2Ghz (merom) processor with the 2.6.18 kernel. First I
> tried it on the 2.6.15.27 kernel, then I got recommended to try the
> 2.6.18 but I have the same problem on the latter kernel as well.
> 
> With the acpi-cpufreq module everything seems to work, the
> /sys/devices/system/cpu/cpu0(1)/cpufreq/
> folders gets populated but the thing is that the
> scaling_available_frequencies file only contains the following available
> speedstepping frequenzies:
> 1200000 1000000 800000 600000
> And the cpuinfo_max_freq only contains:
> 1200000
> Which is not true, the processor has a max speed of 2 Ghz.
> 
> When I start two burnP6 instances the processor scales from 600000 to
> 1200000 according to the scaling_cur_freq file.
> 
> If I instead try to load the speedstep-centrino module I get the
> following errors:
> modprobe -v speedstep-centrino
> insmod
> /lib/modules/2.6.18-686/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko
> 
> FATAL: Error inserting speedstep_centrino
> (/lib/modules/2.6.18-686/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko):
> No such device
> 
> But from what I read in the archives the speedstep-centrino is
> deprecated and all its functionallity is included in acpi-cpufreq in the
> 2.6.18 kernel.
> 
> So is there anyone that has a solution to get a C2D Merom T7200
> processor to speedstep up to it's full speed??
> 
> Here is /proc/cpuinfo during full load, this also shows 1.2 GHz
> 
> processor    : 0
> vendor_id    : GenuineIntel
> cpu family    : 6
> model        : 15
> model name    : Intel(R) Core(TM)2 CPU         T7200  @ 2.00GHz
> stepping    : 6
> cpu MHz        : 1200.000
> cache size    : 4096 KB
> physical id    : 0
> siblings    : 2
> core id        : 0
> cpu cores    : 2
> fdiv_bug    : no
> hlt_bug        : no
> f00f_bug    : no
> coma_bug    : no
> fpu        : yes
> fpu_exception    : yes
> cpuid level    : 10
> wp        : yes
> flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
> cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm
> constant_tsc pni monitor ds_cpl vmx est tm2 cx16 xtpr lahf_lm
> bogomips    : 3986.98
> 
> processor    : 1
> vendor_id    : GenuineIntel
> cpu family    : 6
> model        : 15
> model name    : Intel(R) Core(TM)2 CPU         T7200  @ 2.00GHz
> stepping    : 6
> cpu MHz        : 1200.000
> cache size    : 4096 KB
> physical id    : 0
> siblings    : 2
> core id        : 1
> cpu cores    : 2
> fdiv_bug    : no
> hlt_bug        : no
> f00f_bug    : no
> coma_bug    : no
> fpu        : yes
> fpu_exception    : yes
> cpuid level    : 10
> wp        : yes
> flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
> cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm
> constant_tsc pni monitor ds_cpl vmx est tm2 cx16 xtpr lahf_lm
> bogomips    : 3983.93
> 
> _________________________________________________________________
> Express yourself instantly with MSN Messenger! Download today it's FREE!
> http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
> 
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
