From: Kronos <kronos@kronoz.cjb.net>
Subject: Re: [2.6.9-rc2] ondemand governor not working
Date: Wed, 15 Sep 2004 21:23:55 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040915192355.GA30999@dreamland.darkstar.lan>
References: <88056F38E9E48644A0F562A38C64FB6002DC6069@scsmsx403.amr.corp.intel.com>
Reply-To: kronos@kronoz.cjb.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6002DC6069@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk

Il Wed, Sep 15, 2004 at 09:48:37AM -0700, Pallipadi, Venkatesh ha scritto: 
> How about this patch?
> 
>
> --- linux-2.6.9-rc2//drivers/cpufreq/cpufreq_ondemand.c.org	2004-09-15 11:32:38.000000000 -0700
> +++ linux-2.6.9-rc2//drivers/cpufreq/cpufreq_ondemand.c	2004-09-15 11:36:43.000000000 -0700
> @@ -344,8 +344,14 @@ static int cpufreq_governor_dbs(struct c
>  		 * is used for first time
>  		 */
>  		if (dbs_enable == 1) {
> +			unsigned int latency;
>  			/* policy latency is in nS. Convert it to uS first */
> -			def_sampling_rate = (policy->cpuinfo.transition_latency / 1000) *
> +
> +			latency = policy->cpuinfo.transition_latency;
> +			if (latency < 1000)
> +				latency = 1000;
> +
> +			def_sampling_rate = (latency / 1000) *
>  					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
>  			dbs_tuners_ins.sampling_rate = def_sampling_rate;

It fixes the sampling rate, but the governor isn't working as expected.
powernow_target gets called but even when the cpu usage is at 100% the
target frequency is 441877 (which is 535608 - 93731, cur_policy->cur -
freq_down_step). The governor tries to lower the frequency even when the
CPU is loaded.

Luca
-- 
Home: http://kronoz.cjb.net
Software is like sex; it's better when it's free.
Linus Torvalds
