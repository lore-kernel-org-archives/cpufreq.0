From: realded@mail.ru
Subject: Re: Intel Core2Quad Q6600 2,4 GHz Socket775 FSB1066
Date: Fri, 28 Sep 2007 01:14:06 +0400
Message-ID: <1373497972.20070928011406@mail.ru>
References: <200709272259.18445.ederstefan@gmx.de>
Reply-To: realded@mail.ru
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200709272259.18445.ederstefan@gmx.de>
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
To: cpufreq@lists.linux.org.uk

Hi, I have the same question. Tryed all powersaving modules, but
no one worked.
Stefan> Hallo everyone,
Stefan> ist there a chance for powersaving with the following CPU? And if so, what are
Stefan> the related modules to load?

Stefan> Thanks a lot

Stefan> cpuid | grep SpeedStep
Stefan> Enhanced Intel SpeedStep Technology    = true


Stefan> cat /proc/cpuinfo
Stefan> processor       : 0
Stefan> vendor_id       : GenuineIntel
Stefan> cpu family      : 6
Stefan> model           : 15
Stefan> model name      : Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz
Stefan> stepping        : 11
Stefan> cpu MHz         : 2393.984
Stefan> cache size      : 4096 KB
Stefan> physical id     : 0
Stefan> siblings        : 4
Stefan> core id         : 0
Stefan> cpu cores       : 4
Stefan> fdiv_bug        : no
Stefan> hlt_bug         : no
Stefan> f00f_bug        : no
Stefan> coma_bug        : no
Stefan> fpu             : yes
Stefan> fpu_exception   : yes
Stefan> cpuid level     : 10
Stefan> wp              : yes
Stefan> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
Stefan> cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm 
Stefan> constant_tsc pni monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr lahf_lm
Stefan> bogomips        : 4791.85
Stefan> clflush size    : 64
