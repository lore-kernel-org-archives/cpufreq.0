From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Speedstep detection fails
Date: Sat, 20 Dec 2003 09:23:07 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031220082307.GA4195@dominikbrodowski.de>
References: <20031219225936.D41E43FB2@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031219225936.D41E43FB2@latitude.mynet.no-ip.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aeriksson@fastmail.fm
Cc: cpufreq@www.linux.org.uk

Veto. See the comment above:
		/*
		 * If the processor is a mobile version,
		 * platform ID has bit 50 set
		 * it has SpeedStep technology if either
		 * bit 56 or 57 is set
		 */
So, we'd get false positives here -- and that might even cause hardware
damage on other systems.

Can you please enable debugging output in speedstep-lib, and send me a dmesg
as well as /proc/cpuinfo?

Thanks,
	Dominik



On Fri, Dec 19, 2003 at 11:59:35PM +0100, aeriksson@fastmail.fm wrote:
> 
> Hi all,
> 
> Running with the latest cvs, I need to apply the following 
> patch to speedstep-lib to get it to detect properly on my 
> Dell Latitude 400. Anyone see anything wrong with it, or can
> it be applied to the cvs?
> 
> BR,
> /Anders 
> 
> 
> 
> 
> 
> --- ../../cf-2.6/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c 2003-08-19 15:38:33.000000000 +0200
> +++ arch/i386/kernel/cpu/cpufreq/speedstep-lib.c        2003-11-10 21:41:12.325084272 +0100
> @@ -200,7 +200,7 @@
>                  */
>                 rdmsr(MSR_IA32_PLATFORM_ID, msr_lo, msr_hi);
>                 dprintk(KERN_DEBUG "cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x%x, 0x%x\n", msr_lo, msr_hi);
> -               if ((msr_hi & (1<<18)) && (msr_hi & (3<<24))) {
> +               if ((msr_hi & (1<<18)) ) {
>                         if (c->x86_mask == 0x01)
>                                 return SPEEDSTEP_PROCESSOR_PIII_C_EARLY;
>                         else
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
