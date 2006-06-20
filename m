From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable
	Enchanced SpeedStep
Date: Tue, 20 Jun 2006 11:43:57 +0200
Message-ID: <20060620094357.GB3700@poupinou.org>
References: <200606191610.40597.ben.kevan@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200606191610.40597.ben.kevan@gmail.com>
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
Content-Transfer-Encoding: 7bit
To: Ben Kevan <ben.kevan@gmail.com>
Cc: cpufreq@lists.linux.org.uk, linux@brodo.de

On Mon, Jun 19, 2006 at 04:10:40PM -0700, Ben Kevan wrote:
> Hi, 
> 
> I copied both on this because I thought you both may be interested. My problem 
> is, my Toshiba Tecra M1 will only run at 598Mhz, and I can not use toshutils 
> or anything else to configure speedstep to run higher. Or in any other way 
> can I use it to run higher.  
> 
> Below are a bunch of commands to give you an idea of what's going on. Is this 
> a bug with the 2.6.16.x build? Or is it something else that I am just 
> oblivious too (ACPI?). 
> 

....


> LSHESU01004839:/home/bkevan # cat /proc/cpuinfo
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 9
> model name      : Intel(R) Pentium(R) M processor 1600MHz
> stepping        : 5
> cpu MHz         : 598.582
> cache size      : 1024 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 2
> wp              : yes
> flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov pat 
> clflush dts acpi mmx fxsr sse sse2 tm pbe est tm2
> bogomips        : 1198.30

That's strange.  Even if there is no processor object declared onto ACPI
tables it should work with CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE set since
it's a bania.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
