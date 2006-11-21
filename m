From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: Bug: Pentium M not always detected by CPUFREQ
Date: Tue, 21 Nov 2006 18:01:14 +0100
Message-ID: <1164128474.31358.682.camel@laptopd505.fenrus.org>
References: <200611211646.29488.hs4233@mail.mn-solutions.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200611211646.29488.hs4233@mail.mn-solutions.de>
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
To: Holger Schurig <hs4233@mail.mn-solutions.de>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Tue, 2006-11-21 at 16:46 +0100, Holger Schurig wrote:
> Hi !
> 
> One module thinks that I have a Pentium M, the other doesn't. 
> Which module is right?
> # cat /proc/cpuinfo
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 9
> model name      : Intel(R) Celeron(R) processor            600MHz

you don't have a pentium M

> stepping        : 5
> cpu MHz         : 598.093
> cache size      : 64 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 2
> wp              : yes
> flags           : fpu vme de pse tsc msr mce cx8 apic sep mtrr 
> pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 tm pbe
> bogomips        : 1196.88
> 
> 
> So far I can only say that speedstep-centrino doesn't have an 
> entry for a CPU with a mere 600 MHz. May this be the problem
> ?

as far as I know Celeron processors don't have actual frequency control
capabilities (and no p4-clockmod doesn't count, that doesn't save you
any energy realistically)....



-- 
if you want to mail me at work (you don't), use arjan (at) linux.intel.com
Test the interaction between Linux and your BIOS via http://www.linuxfirmwarekit.org
