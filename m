From: Dave Jones <davej@redhat.com>
Subject: Re: cpufreq on ARM broken
Date: Tue, 01 Jun 2004 18:11:34 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1086109894.27727.24.camel@delerium.codemonkey.org.uk>
References: <20040529170151.B3799@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040529170151.B3799@flint.arm.linux.org.uk>
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
To: linux@brodo.de
Cc: cpufreq@www.linux.org.uk

Thoughts ?
I've forgotten why we introduced this flag, it appears that this
would be the first thing in the tree to actually use it,
which makes me sceptical.

	Dave


On Sat, 2004-05-29 at 17:01, Russell King wrote:

> cpufreq doesn't appear to initialise on ARM - cpufreq_register_driver()
> fails with -ENODEV.
> 
> This appears to be because we register cpus at subsys_initcall() time,
> and cpufreq drivers at arch_initcall() time.  We need cpufreq up and
> running before any drivers are initialised since their timings depend
> on the CPU clock rate.
> 
> The following patch appears to fix these problems.
> 
> --- linux-tolinus/arch/arm/mach-sa1100/cpu-sa1100.c	Fri May 21 00:05:46 2004
> +++ linux/arch/arm/mach-sa1100/cpu-sa1100.c	Sat May 29 16:19:51 2004
> @@ -230,8 +230,9 @@
>  }
>  
>  static struct cpufreq_driver sa1100_driver = {
> -	.flags		= (CPUFREQ_PANIC_OUTOFSYNC | 
> -			   CPUFREQ_PANIC_RESUME_OUTOFSYNC),
> +	.flags		= CPUFREQ_STICKY |
> +			  CPUFREQ_PANIC_OUTOFSYNC | 
> +			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
>  	.verify		= sa11x0_verify_speed,
>  	.target		= sa1100_target,
>  	.get		= sa11x0_getspeed,
> --- linux-tolinus/arch/arm/mach-sa1100/cpu-sa1110.c	Fri May 21 00:05:46 2004
> +++ linux/arch/arm/mach-sa1100/cpu-sa1110.c	Sat May 29 16:19:35 2004
> @@ -329,8 +329,9 @@
>  }
>  
>  static struct cpufreq_driver sa1110_driver = {
> -	.flags		= (CPUFREQ_PANIC_OUTOFSYNC | 
> -			   CPUFREQ_PANIC_RESUME_OUTOFSYNC),
> +	.flags		= CPUFREQ_STICKY |
> +			  CPUFREQ_PANIC_OUTOFSYNC | 
> +			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
>  	.verify		= sa11x0_verify_speed,
>  	.target		= sa1110_target,
>  	.get		= sa11x0_getspeed,
