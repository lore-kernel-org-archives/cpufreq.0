From: paul.devriendt@amd.com
Subject: RE: [PATCH] BUGFIX for powernow-k8
Date: Tue, 4 Nov 2003 11:29:15 -0600
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C080EF215@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
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
To: linux@brodo.de, davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, mark.langsdorf@amd.com

Ok, thanks Dominik. I am intending to fix the policy stuff to use
the callbacks in the next major rev of the driver, which I am hoping 
to get out in December. Paul.

> -----Original Message-----
> From: Dominik Brodowski [mailto:linux@brodo.de]
> Sent: Tuesday, November 04, 2003 8:51 AM
> To: davej@codemonkey.org.uk; Devriendt, Paul; cpufreq@www.linux.org.uk
> Subject: [PATCH] BUGFIX for powernow-k8
> 
> 
> Hi Dave, Paul,
> 
> Here is an important bugfix for powernow-k8.c in its current form
> (2.6.0-test9).
> 
> Problem description:
> As the powernow-k8 driver uses the ->target and not the 
> ->setpolicy callback, cpufreq_policy->policy is always zero. 
> Checking for it
> in the powernow-k8 driver always returned "false". So we can 
> easily remove
> this invalid check (and the #warning added to denote this).
> 
> diff -ruN 
> linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c 
> linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
> --- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	
> 2003-11-04 15:27:33.609957704 +0100
> +++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	
> 2003-11-04 15:39:36.410075384 +0100
> @@ -935,10 +935,8 @@
>  		return -ENODEV;
>  	}
>  
> -#warning pol->policy is in undefined state here
>  	res = find_match(&targ, &min, &max,
> -			 pol->policy == CPUFREQ_POLICY_POWERSAVE ?
> -			 SEARCH_DOWN : SEARCH_UP, 0, 0);
> +			 SEARCH_DOWN, 0, 0);
>  	if (!res) {
>  		pol->min = min * 1000;
>  		pol->max = max * 1000;
> 
