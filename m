From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.5,
	1.6 cpu-sa1110.c, 1.12, 1.13
Date: Thu, 26 Aug 2004 15:10:34 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040826151034.E21364@flint.arm.linux.org.uk>
References: <E1C0KGF-0006od-0A@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <E1C0KGF-0006od-0A@flint.arm.linux.org.uk>;
	from ducrot@arm.linux.org.uk on Thu, Aug 26, 2004 at 02:25:51PM
	+0100
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
To: cpufreq@www.linux.org.uk

On Thu, Aug 26, 2004 at 02:25:51PM +0100, Ducrot Bruno wrote:
> Update of /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100
> In directory flint:/tmp/cvs-serv26017/linux/arch/arm/mach-sa1100
> @@ -329,8 +329,12 @@
>  }
>  
>  static struct cpufreq_driver sa1110_driver = {
> +	.flags		= CPUFREQ_STICKY |

> +			  CPUFREQ_PANIC_OUTOFSYNC | 		<<<<
> +			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,	<<<<

Erm, _why_ ?

This makes very little sense.  If you put the system to sleep at
147MHz and it normally boots at 206.4MHz, you'll resume at 206.4MHz.

It's up to the kernel to reset the clock rate itself.  This is nothing
new - cpufreq has always done this, so why are we adding this new
restriction?

It makes zero sense.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
