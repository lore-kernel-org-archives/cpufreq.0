From: paul.devriendt@amd.com
Subject: RE: [PATCH 2.6] remove powernow-k8 warning
Date: Fri, 20 Feb 2004 13:29:06 -0600
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C1051569F@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: linux@dominikbrodowski.de, cpufreq@www.linux.org.uk

Hi Dominik,

Yes, it works fine on a preempt kernel. Sorry, should 
have thought to tell you. By the way, MP frequency
support and ACPI support will be coming your way soon
(I think the target date to release it to you for
comments is March 8th, or something like that).

Paul. 

> -----Original Message-----
> From: Dominik Brodowski [mailto:linux@dominikbrodowski.de] 
> Sent: Friday, February 20, 2004 7:25 AM
> To: cpufreq@www.linux.org.uk
> Cc: Devriendt, Paul
> Subject: [PATCH 2.6] remove powernow-k8 warning
> 
> It's been tested now -- thanks to Redeeman!
> 
> http://lkml.org/lkml/2004/2/19/192
> 
> diff -ruN 
> linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c 
> linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
> --- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	
> 2004-02-18 14:59:24.000000000 +0100
> +++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	
> 2004-02-19 22:00:54.187228808 +0100
> @@ -34,10 +34,6 @@
>  #define VERSION "version 1.00.08a"
>  #include "powernow-k8.h"
>  
> -#ifdef CONFIG_PREEMPT
> -#warning this driver has not been tested on a preempt system -#endif
> -
>  static u32 vstable;	/* voltage stabalization time, from 
> PSB, units 20 us */
>  static u32 plllock;	/* pll lock time, from PSB, units 1 us */
>  static u32 numps;	/* number of p-states, from PSB */
> 
