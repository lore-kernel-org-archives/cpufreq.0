From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [PATCH] cpufreq: cpufreq-cpu0: use the exact frequency for
 clk_set_rate()
Date: Wed, 27 Mar 2013 23:46:38 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1303272345260.9558@axis700.grange>
References: <Pine.LNX.4.64.1302251820431.3030@axis700.grange>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1302251820431.3030@axis700.grange>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>

Hi Shawn

On Mon, 25 Feb 2013, Guennadi Liakhovetski wrote:

> clk_set_rate() isn't supposed to accept approximate frequencies, instead
> a supported frequency should be obtained from clk_round_rate() and then
> used to set the clock.
> 
> Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>

Can I have your ack for this one, please?

Thanks
Guennadi

> ---
> 
> Applies on top of my previous patch to fix unsigned freq_Hz "cpufreq: fix 
> sign check of an unsigned variable in cpufreq-cpu0"
> 
>  drivers/cpufreq/cpufreq-cpu0.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
> index e7bad3c..6ce9b51 100644
> --- a/drivers/cpufreq/cpufreq-cpu0.c
> +++ b/drivers/cpufreq/cpufreq-cpu0.c
> @@ -45,7 +45,7 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
>  	struct cpufreq_freqs freqs;
>  	struct opp *opp;
>  	unsigned long volt = 0, volt_old = 0, tol = 0;
> -	long freq_Hz;
> +	long freq_Hz, freq_exact;
>  	unsigned int index, cpu;
>  	int ret;
>  
> @@ -60,6 +60,7 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
>  	freq_Hz = clk_round_rate(cpu_clk, freq_table[index].frequency * 1000);
>  	if (freq_Hz < 0)
>  		freq_Hz = freq_table[index].frequency * 1000;
> +	freq_exact = freq_Hz;
>  	freqs.new = freq_Hz / 1000;
>  	freqs.old = clk_get_rate(cpu_clk) / 1000;
>  
> @@ -96,7 +97,7 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
>  		}
>  	}
>  
> -	ret = clk_set_rate(cpu_clk, freqs.new * 1000);
> +	ret = clk_set_rate(cpu_clk, freq_exact);
>  	if (ret) {
>  		pr_err("failed to set clock rate: %d\n", ret);
>  		if (cpu_reg)
> -- 
> 1.7.2.5
> 
> 

---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
