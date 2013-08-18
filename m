From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH 13/37] cpufreq: exynos: don't initialize part of policy
 that is set by core too
Date: Sun, 18 Aug 2013 16:20:18 +0530
Message-ID: <CADGdYn5nPCOb=mqoJPXzbZzgnbfrhFX6+nsUO5h+PTc-M=2NFA@mail.gmail.com>
References: <cover.1376486713.git.viresh.kumar@linaro.org>
	<b3ef5357898c06aaccb2fcbaee4ef91a3d0fd7bb.1376486713.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=M2VK8Bpf1IdUikH9Y2TJnb6DYVKX6RMamLY74PhAqk8=;
        b=tHF+fGLn3UE/UQsHOqCoccaD5ZA9xlnq0rg5O4Nv+E1EQCgHieBVEwz4+jQINcDY2D
         3dCGh59srGAfb9te6snDpD4sIX7X/MqNVPS3B/UHvj0iT4IY1b/EesBFiXGNaq8Nl8Rv
         l9xeOXuAwIFqCtbJieYwyG5LaOZ9+irLFm9ce+ytvAi7t0AezkviLgerJQbTCsrv3BFt
         BwTCXRog0h7JdRUofkhOofcBQkBHkX3ol50cC88vHAauOb/p0vQBGyOK5ssIX1m7B5+H
         dJ6mXezgbgb2w8KQQUInd7OVoWtds9oe+pUMFy/jdN2/0yfJNPSCgWv9+hIuu310TkFc
         qGBw==
In-Reply-To: <b3ef5357898c06aaccb2fcbaee4ef91a3d0fd7bb.1376486713.git.viresh.kumar@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linaro-kernel <linaro-kernel@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>, cpufreq@vger.kernel.org, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On Wed, Aug 14, 2013 at 7:02 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Many common initializations of struct policy are moved to core now and hence
> this driver doesn't need to do it. This patch removes such code.
>
> Most recent of those changes is to call ->get() in the core after calling
> ->init().
>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
This consolidation work looks fine,
Acked-By: Amit Daniel Kachhap <amit.daniel@samsung.com>

Thanks,
Amit
> ---
>  drivers/cpufreq/exynos-cpufreq.c     | 2 --
>  drivers/cpufreq/exynos5440-cpufreq.c | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
> index 79b869b..b1db082 100644
> --- a/drivers/cpufreq/exynos-cpufreq.c
> +++ b/drivers/cpufreq/exynos-cpufreq.c
> @@ -226,8 +226,6 @@ static struct notifier_block exynos_cpufreq_nb = {
>
>  static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  {
> -       policy->cur = policy->min = policy->max = exynos_getspeed(policy->cpu);
> -
>         /* set the transition latency value */
>         policy->cpuinfo.transition_latency = 100000;
>
> diff --git a/drivers/cpufreq/exynos5440-cpufreq.c b/drivers/cpufreq/exynos5440-cpufreq.c
> index 9a5ed485..91a64d6 100644
> --- a/drivers/cpufreq/exynos5440-cpufreq.c
> +++ b/drivers/cpufreq/exynos5440-cpufreq.c
> @@ -316,7 +316,6 @@ static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
>                 return ret;
>         }
>
> -       policy->cur = dvfs_info->cur_frequency;
>         policy->cpuinfo.transition_latency = dvfs_info->latency;
>         cpumask_setall(policy->cpus);
>
> --
> 1.7.12.rc2.18.g61b472e
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
