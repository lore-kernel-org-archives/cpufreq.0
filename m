From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/1] cpufreq: exynos5440: Fix potential NULL pointer dereference
Date: Wed, 18 Sep 2013 11:06:38 +0530
Message-ID: <CAKohpokvAmNLvY1V7+MZtSVrGWvfSxvdXtt+mC5JGGiw89z-7Q@mail.gmail.com>
References: <1379481293-9003-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1379481293-9003-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Patch Tracking <patches@linaro.org>

On 18 September 2013 10:44, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> If 'dvfs_info' is NULL (due to devm_kzalloc failure) the failure
> error message would try to dereference it. Use 'pdev' instead.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/cpufreq/exynos5440-cpufreq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpufreq/exynos5440-cpufreq.c b/drivers/cpufreq/exynos5440-cpufreq.c
> index d514c15..be5380e 100644
> --- a/drivers/cpufreq/exynos5440-cpufreq.c
> +++ b/drivers/cpufreq/exynos5440-cpufreq.c
> @@ -457,7 +457,7 @@ err_free_table:
>         opp_free_cpufreq_table(dvfs_info->dev, &dvfs_info->freq_table);
>  err_put_node:
>         of_node_put(np);
> -       dev_err(dvfs_info->dev, "%s: failed initialization\n", __func__);
> +       dev_err(&pdev->dev, "%s: failed initialization\n", __func__);
>         return ret;
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
