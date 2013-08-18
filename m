From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH 03/44] cpufreq: exynos: call cpufreq_frequency_table_put_attr()
Date: Sun, 18 Aug 2013 15:30:50 +0530
Message-ID: <CADGdYn79B4d3joAF53E5MoeNB10RWm5fnQCs30-MbM38Jq2uhg@mail.gmail.com>
References: <cover.1376116344.git.viresh.kumar@linaro.org>
	<c2157d44d4933c5fa9cea06e0d621786a3d03671.1376116345.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=ma6krlxGs3upCtkCsRar4Pm47aD5EpYlhfgGE6+NYzU=;
        b=NcDW6WfMm40lsOVr46GBVwnYL9+bgVEhFf3R4B0RetBWAW5Pfvp9REiAdU4s/LY+7q
         26H9S9shNOQb61j9dqLFO8yVxGQm/SMVLUCHviR2SAsgX1jqjyDmVJBB9B7qt34+lkDi
         L6q9MAvAbfuQLriOhsEW9qj7s9TpDzYdwV+wBNXlXWsGG0gf5cmp5ILZHM4htH3hpGSy
         BNc74yHjGt6BATbbk3jOAnFH+nrCdWf67g1//cybfcPPToo3AJJYA92lvq6DDnlHpD3n
         XY4ONnmIrF8ZHHsGKytzIyoimnErItVndTf2RBUq4TZ3gb/SpS/JmPd6cRWu521zllh9
         bpPg==
In-Reply-To: <c2157d44d4933c5fa9cea06e0d621786a3d03671.1376116345.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linaro-kernel@lists.linaro.org, "patches@linaro.org" <patches@linaro.org>, cpufreq@vger.kernel.org, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On Sat, Aug 10, 2013 at 12:13 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Drivers which have an exit path must call cpufreq_frequency_table_put_attr() if
> they have called cpufreq_frequency_table_get_attr() in their init path.
>
> This driver was missing this part and is fixed with this patch.
>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
The changes looks fine, please free to add
Acked-By: Amit Daniel Kachhap <amit.daniel@samsung.com>

Thanks.
Amit Daniel


> ---
>  drivers/cpufreq/exynos5440-cpufreq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/cpufreq/exynos5440-cpufreq.c b/drivers/cpufreq/exynos5440-cpufreq.c
> index 1ac93e0..b9dfc91 100644
> --- a/drivers/cpufreq/exynos5440-cpufreq.c
> +++ b/drivers/cpufreq/exynos5440-cpufreq.c
> @@ -336,12 +336,18 @@ static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
>         return 0;
>  }
>
> +static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +       cpufreq_frequency_table_put_attr(policy->cpu);
> +}
> +
>  static struct cpufreq_driver exynos_driver = {
>         .flags          = CPUFREQ_STICKY,
>         .verify         = exynos_verify_speed,
>         .target         = exynos_target,
>         .get            = exynos_getspeed,
>         .init           = exynos_cpufreq_cpu_init,
> +       .exit           = exynos_cpufreq_cpu_exit,
>         .name           = CPUFREQ_NAME,
>  };
>
> --
> 1.7.12.rc2.18.g61b472e
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

On Sat, Aug 10, 2013 at 12:13 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Drivers which have an exit path must call cpufreq_frequency_table_put_attr() if
> they have called cpufreq_frequency_table_get_attr() in their init path.
>
> This driver was missing this part and is fixed with this patch.
>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/cpufreq/exynos5440-cpufreq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/cpufreq/exynos5440-cpufreq.c b/drivers/cpufreq/exynos5440-cpufreq.c
> index 1ac93e0..b9dfc91 100644
> --- a/drivers/cpufreq/exynos5440-cpufreq.c
> +++ b/drivers/cpufreq/exynos5440-cpufreq.c
> @@ -336,12 +336,18 @@ static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
>         return 0;
>  }
>
> +static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +       cpufreq_frequency_table_put_attr(policy->cpu);
> +}
> +
>  static struct cpufreq_driver exynos_driver = {
>         .flags          = CPUFREQ_STICKY,
>         .verify         = exynos_verify_speed,
>         .target         = exynos_target,
>         .get            = exynos_getspeed,
>         .init           = exynos_cpufreq_cpu_init,
> +       .exit           = exynos_cpufreq_cpu_exit,
>         .name           = CPUFREQ_NAME,
>  };
>
> --
> 1.7.12.rc2.18.g61b472e
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
