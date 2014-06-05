From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] cpufreq: ppc-corenet-cpu-freq: do_div use quotient
Date: Thu, 05 Jun 2014 23:55:30 +0200
Message-ID: <1457259.ncDXvapaxe@vostro.rjw.lan>
References: <1398701898-68201-1-git-send-email-tim.gardner@canonical.com> <1401917713-20792-1-git-send-email-Ed.Swarthout@freescale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1401917713-20792-1-git-send-email-Ed.Swarthout@freescale.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ed Swarthout <Ed.Swarthout@freescale.com>
Cc: viresh.kumar@linaro.org, linux-pm@lists.ozlabs.org, cpufreq@vger.kernel.org, scottwood@freescale.com

On Wednesday, June 04, 2014 04:35:13 PM Ed Swarthout wrote:
> 6712d2931933ada259b82f06c03a855b19937074 (cpufreq:
> ppc-corenet-cpufreq: Fix __udivdi3 modpost error) used the remainder
> from do_div instead of the quotient. Fix that and add one to ensure
> minimum is met.
> 
> Signed-off-by: Ed Swarthout <Ed.Swarthout@freescale.com>

Can you please resend this and CC linux-pm@vger.kernel.org, so that
Patchwork can pick it up?

Rafael


> ---
> 
> Tested on t4240qds and p4080ds.
> 
> https://patchwork.kernel.org/patch/4296811/
> http://patchwork.ozlabs.org/patch/356096/
> 
>  drivers/cpufreq/ppc-corenet-cpufreq.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/ppc-corenet-cpufreq.c b/drivers/cpufreq/ppc-corenet-cpufreq.c
> index 0af618a..3607070 100644
> --- a/drivers/cpufreq/ppc-corenet-cpufreq.c
> +++ b/drivers/cpufreq/ppc-corenet-cpufreq.c
> @@ -138,7 +138,7 @@ static int corenet_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	struct cpufreq_frequency_table *table;
>  	struct cpu_data *data;
>  	unsigned int cpu = policy->cpu;
> -	u64 transition_latency_hz;
> +	u64 u64temp;
>  
>  	np = of_get_cpu_node(cpu, NULL);
>  	if (!np)
> @@ -206,9 +206,10 @@ static int corenet_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	for_each_cpu(i, per_cpu(cpu_mask, cpu))
>  		per_cpu(cpu_data, i) = data;
>  
> -	transition_latency_hz = 12ULL * NSEC_PER_SEC;
> -	policy->cpuinfo.transition_latency =
> -		do_div(transition_latency_hz, fsl_get_sys_freq());
> +	/* Minimum transition latency is 12 platform clocks */
> +	u64temp = 12ULL * NSEC_PER_SEC;
> +	do_div(u64temp, fsl_get_sys_freq());
> +	policy->cpuinfo.transition_latency = u64temp + 1;
>  
>  	of_node_put(np);
>  
> 

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
