From: Kronos <kronos@kronoz.cjb.net>
Subject: Re: fix latency for powernow-k7 (was Re: [2.6.9-rc2] ondemand
	governor not working)
Date: Mon, 20 Sep 2004 17:58:00 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040920155759.GA12369@dreamland.darkstar.lan>
References: <88056F38E9E48644A0F562A38C64FB6002E1C76C@scsmsx403.amr.corp.intel.com>
	<20040917191035.GA8529@dominikbrodowski.de>
	<20040920135641.GN16132@poupinou.org>
	<20040920141813.GA6864@dreamland.darkstar.lan>
	<20040920153729.GO16132@poupinou.org>
Reply-To: kronos@kronoz.cjb.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040920153729.GO16132@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

Il Mon, Sep 20, 2004 at 05:37:29PM +0200, Bruno Ducrot ha scritto: 
> I must go to sleep (latency and fsb are swapped in previous patch), sorry.
> 
> fix ->cpuinfo.transition_latency for powernow-k7
> 
> Signed-off-by: Bruno Ducrot <ducrot@poupinou.org>
> 
>  linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c |    2 +-
>  1 files changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/09/20 13:42:35	1.1
> +++ linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/09/20 13:46:51
> @@ -634,7 +634,7 @@ static int __init powernow_cpu_init (str
>  
>  	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
>  
> -	policy->cpuinfo.transition_latency = 20 * latency / fsb;
> +	policy->cpuinfo.transition_latency = cpufreq_scale(2000000UL, fsb, latency);
>  
>  	policy->cur = powernow_get(0);
>  

Ok, now latency is ~200usec, and ondemand governor is working fine.

Thanks!
Luca
-- 
Home: http://kronoz.cjb.net
"I've seen things you people wouldn't believe...
 Attack Ships on fire off the shores of Orion.
 I've watched C-beams glitter in the dark off of Tanhauser Gate.
 All those moments will be lost in time...like tears, in rain.
 Time to die." -- Roy Batty (played by Rutger Hauer)
