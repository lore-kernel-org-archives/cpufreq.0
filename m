From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: frequency scaling for desktop opteron?
Date: Fri, 16 Apr 2004 13:53:15 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040416115315.GS8953@poupinou.org>
References: <Pine.LNX.4.44.0404160359580.21826-100000@sasami.anime.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0404160359580.21826-100000@sasami.anime.net>
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
To: Dan Hollis <spamtrap3074431@anime.net>
Cc: Cpufreq@www.linux.org.uk

On Fri, Apr 16, 2004 at 04:05:03AM -0700, Dan Hollis wrote:
> Does desktop opteron support frequency scaling?
> 
> I have Opteron 140 in Tyan Tomcat K8S (S2850).

I think some are able (but I don't know if those are available yet).

> kernel 2.6.5:
> 
> $ cat /proc/cpuinfo 
> processor       : 0
> vendor_id       : AuthenticAMD
> cpu family      : 15
> model           : 5
> model name      : AMD Opteron(tm) Processor 140
> stepping        : 8
> cpu MHz         : 1403.198
> cache size      : 1024 KB
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 1
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext lm 3dnowext 3dnow
> bogomips        : 2760.70
> TLB size        : 1088 4K pages
> clflush size    : 64
> address sizes   : 40 bits physical, 48 bits virtual
> power management: ts ttp

Unfortunately, your processor do not support voltage/frequency scaling:
the power management say this processor do have "only" 'thermal
sensor' (the ts flag) and 'thermal trip point' (the ttp flag).

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
