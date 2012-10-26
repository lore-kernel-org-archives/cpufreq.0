From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq: Avoid calling cpufreq driver's target() routine if target_freq == policy->cur
Date: Fri, 26 Oct 2012 13:17:12 +0200
Message-ID: <5056958.0bPciFrxt5@vostro.rjw.lan>
References: <1d7b6e421a335255da956804b43ce3517538409c.1351244153.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1d7b6e421a335255da956804b43ce3517538409c.1351244153.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org, pdsw-power-team@arm.com

On Friday, October 26, 2012 03:06:26 PM Viresh Kumar wrote:
> Avoid calling cpufreq driver's target() routine if new frequency is same as
> policies current frequency.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Looks reasonable.

Any objection from anyone?

Rafael


> ---
>  drivers/cpufreq/cpufreq.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 261ef65..28dc134 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1476,6 +1476,10 @@ int __cpufreq_driver_target(struct cpufreq_policy *policy,
>  
>  	pr_debug("target for CPU %u: %u kHz, relation %u\n", policy->cpu,
>  		target_freq, relation);
> +
> +	if (target_freq == policy->cur)
> +		return 0;
> +
>  	if (cpu_online(policy->cpu) && cpufreq_driver->target)
>  		retval = cpufreq_driver->target(policy, target_freq, relation);
>  
> 
-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
