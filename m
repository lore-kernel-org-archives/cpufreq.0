From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] cpufreq: s5pv210: make needlessly global symbols static
Date: Fri, 08 Jul 2011 16:47:34 +0900
Message-ID: <003201cc3d43$54b12360$fe136a20$%kim@samsung.com>
References: <1310106044.27158.0.camel@phoenix>
 <1310106276.27158.2.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1310106276.27158.2.camel@phoenix>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Axel Lin' <axel.lin@gmail.com>, linux-kernel@vger.kernel.org
Cc: 'Dave Jones' <davej@redhat.com>, cpufreq@vger.kernel.org

Axel Lin wrote:
> 
> The following symbols are needlessly defined global:
>   s5pv210_verify_speed
>   s5pv210_getspeed
> 
> Make them static.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
>  drivers/cpufreq/s5pv210-cpufreq.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index a7cb338..806408e 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -121,7 +121,7 @@ static void s5pv210_set_refresh(enum s5pv210_dmc_port
> ch, unsigned long freq)
>  	__raw_writel(tmp1, reg);
>  }
> 
> -int s5pv210_verify_speed(struct cpufreq_policy *policy)
> +static int s5pv210_verify_speed(struct cpufreq_policy *policy)
>  {
>  	if (policy->cpu)
>  		return -EINVAL;
> @@ -129,7 +129,7 @@ int s5pv210_verify_speed(struct cpufreq_policy *policy)
>  	return cpufreq_frequency_table_verify(policy, s5pv210_freq_table);
>  }
> 
> -unsigned int s5pv210_getspeed(unsigned int cpu)
> +static unsigned int s5pv210_getspeed(unsigned int cpu)
>  {
>  	if (cpu)
>  		return 0;
> --
> 1.7.4.1
