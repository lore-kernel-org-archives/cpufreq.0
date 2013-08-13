From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq: cpufreq-cpu0: Use devm_regulator_get_optional()
Date: Tue, 13 Aug 2013 15:07:07 +0200
Message-ID: <3483292.v6fTkTpAqi@vostro.rjw.lan>
References: <1376071683-19013-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1376071683-19013-1-git-send-email-broonie@kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Brown <broonie@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On Friday, August 09, 2013 07:08:03 PM Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Since the cpufreq-cpu0 driver is capable of coping without a software
> controllable regulator and would be confused by a dummy one it should
> use devm_regulator_get_optional() to ensure no dummy is provided.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
> 
> devm_regulator_get_optional() is a new API in my tree for -next, is it
> OK to merge this patch via that branch?

Sure, please go ahead.

Thanks,
Rafael


>  drivers/cpufreq/cpufreq-cpu0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
> index 09cd3a7..b946ac7 100644
> --- a/drivers/cpufreq/cpufreq-cpu0.c
> +++ b/drivers/cpufreq/cpufreq-cpu0.c
> @@ -197,7 +197,7 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
>  	cpu_dev = &pdev->dev;
>  	cpu_dev->of_node = np;
>  
> -	cpu_reg = devm_regulator_get(cpu_dev, "cpu0");
> +	cpu_reg = devm_regulator_get_optional(cpu_dev, "cpu0");
>  	if (IS_ERR(cpu_reg)) {
>  		/*
>  		 * If cpu0 regulator supply node is present, but regulator is
> 
-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
