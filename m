From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Cpufreq on AMD dual opteron 242
Date: Thu, 1 Jul 2004 20:11:36 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040701181136.GI5614@poupinou.org>
References: <200407011614.i61GENI29047@esemetz.metz.supelec.fr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200407011614.i61GENI29047@esemetz.metz.supelec.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Marc.Thierry" <thierry_mar@metz.supelec.fr>
Cc: cpufreq@www.linux.org.uk

On Thu, Jul 01, 2004 at 06:14:23PM +0200, Marc.Thierry wrote:
> Of course, 
> 
> Here you are:
> 
> dunette parser 399 % cat /proc/cpuinfo 
> processor	: 0
> vendor_id	: AuthenticAMD
> cpu family	: 15
> model		: 5
> model name	: AMD Opteron(tm) Processor 242
> stepping	: 1
> cpu MHz		: 1603.674
> cache size	: 1024 KB
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 1
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext lm 3dnowext 3dnow
> bogomips	: 3153.92
> TLB size	: 1088 4K pages
> clflush size	: 64
> cache_alignment	: 64
> address sizes	: 40 bits physical, 48 bits virtual
> power management: ts ttp
> 
> processor	: 1
> vendor_id	: AuthenticAMD
> cpu family	: 15
> model		: 5
> model name	: AMD Opteron(tm) Processor 242
> stepping	: 1
> cpu MHz		: 1603.674
> cache size	: 1024 KB
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 1
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext lm 3dnowext 3dnow
> bogomips	: 3203.07
> TLB size	: 1088 4K pages
> clflush size	: 64
> cache_alignment	: 64
> address sizes	: 40 bits physical, 48 bits virtual
> power management: ts ttp
> 
> 

Thanks.  The power management line do have only the 'ts' and 'ttp' flags
('thermal sensor' and 'thermal trip point') but there is no 'fid' nor
'vid' (fid is related to frequency control, and vid for voltage).

I'm afraid your processors do not support powernow technology.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
