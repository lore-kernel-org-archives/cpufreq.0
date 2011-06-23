From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] S3C64xx: Notify transition complete as soon as
 frequency changed
Date: Thu, 23 Jun 2011 16:04:04 +0900
Message-ID: <015e01cc3173$bf01d470$3d057d50$%kim@samsung.com>
References: <1308751736-15879-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <1308751736-15879-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dave Jones' <davej@redhat.com>
Cc: cpufreq@vger.kernel.org

Mark Brown wrote:
> 
> The CPUFREQ_POSTCHANGE notification is used to update things that depend
> on
> the system clock rates. Since this may include the interfaces used to talk
> to the regulators do the notification before we try to update regulators
> to reflect lowered system clock rate.
> 
> The voltage scaling is just a power optimisation and may not happen at all
> so there's no concern about it not having completed.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
>  drivers/cpufreq/s3c64xx-cpufreq.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c
b/drivers/cpufreq/s3c64xx-cpufreq.c
> index c370935..b8d1d20 100644
> --- a/drivers/cpufreq/s3c64xx-cpufreq.c
> +++ b/drivers/cpufreq/s3c64xx-cpufreq.c
> @@ -114,6 +114,8 @@ static int s3c64xx_cpufreq_set_target(struct
> cpufreq_policy *policy,
>  		goto err;
>  	}
> 
> +	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
> +
>  #ifdef CONFIG_REGULATOR
>  	if (vddarm && freqs.new < freqs.old) {
>  		ret = regulator_set_voltage(vddarm,
> @@ -127,8 +129,6 @@ static int s3c64xx_cpufreq_set_target(struct
> cpufreq_policy *policy,
>  	}
>  #endif
> 
> -	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
> -
>  	pr_debug("cpufreq: Set actual frequency %lukHz\n",
>  		 clk_get_rate(armclk) / 1000);
> 
> --
> 1.7.5.4

