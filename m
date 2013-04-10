From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq / intel_pstate: Optimize intel_pstate_set_policy
Date: Wed, 10 Apr 2013 08:33:46 +0530
Message-ID: <CAOh2x=mYfWyaziR+L7sR2LPKiOLWd4kM1NUR9QLnJk5k0SKxuw@mail.gmail.com>
References: <1365547098-23847-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=h9GF2AXdcgJ+UqGKwzu2JeVfCxFaV8hKkvPpqGx+PYo=;
        b=yO5AaSZHbcu8MiYWYIs/Zn/thJbI17uFShHcfj1swGz4igBML5QcvClvZ3kMgko8HR
         GjLOVz31Xn971LR1etAPDHRvbP2x7X1hdd4B3FnqTmgNtz/kCN568gP2Df1ue155mkuO
         YM1An76pzcEPDOAGCF/P9k9uMejS6YiOqLYGi7a2OaAizCLHZWRNclaay/Ta9IQ3S8Qt
         3z2v24K2TNzPwBNV15V7YqaheDMJeLQIIgIDcRtG42Z2BluubAlVIhfodTEMkHSaMAEz
         ypu8MMRp2cXwbzZXQJjtdBL7PpizYUkwTv0uoU9FtQOg690N6nYTm3la9g2+kbhJHqJt
         3kfQ==
In-Reply-To: <1365547098-23847-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

On Wed, Apr 10, 2013 at 4:08 AM, Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
> This function is called quite often from other subsystems.
> Removed unused call to intel_pstate_get_min_max().
> Also when "policy->policy == CPUFREQ_POLICY_PERFORMANCE", then
> no need to do calculations as the limits will be forced anyway.

> Also corrected filename in the header.

Probably separate this out in a different patch.

> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  drivers/cpufreq/intel_pstate.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index f6dd1e7..f3729d4 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -1,5 +1,5 @@
>  /*
> - * cpufreq_snb.c: Native P state management for Intel processors
> + * intel_pstate.c: Native P state management for Intel processors
>   *
>   * (C) Copyright 2012 Intel Corporation
>   * Author: Dirk Brandewie <dirk.j.brandewie@intel.com>
> @@ -658,30 +658,27 @@ static unsigned int intel_pstate_get(unsigned int cpu_num)
>  static int intel_pstate_set_policy(struct cpufreq_policy *policy)
>  {
>         struct cpudata *cpu;
> -       int min, max;
>
>         cpu = all_cpu_data[policy->cpu];
>
>         if (!policy->cpuinfo.max_freq)
>                 return -ENODEV;
>
> -       intel_pstate_get_min_max(cpu, &min, &max);
> -
> -       limits.min_perf_pct = (policy->min * 100) / policy->cpuinfo.max_freq;
> -       limits.min_perf_pct = clamp_t(int, limits.min_perf_pct, 0 , 100);
> -       limits.min_perf = div_fp(int_tofp(limits.min_perf_pct), int_tofp(100));
> -
> -       limits.max_perf_pct = policy->max * 100 / policy->cpuinfo.max_freq;
> -       limits.max_perf_pct = clamp_t(int, limits.max_perf_pct, 0 , 100);
> -       limits.max_perf = div_fp(int_tofp(limits.max_perf_pct), int_tofp(100));
> -
>         if (policy->policy == CPUFREQ_POLICY_PERFORMANCE) {
>                 limits.min_perf_pct = 100;
>                 limits.min_perf = int_tofp(1);
>                 limits.max_perf_pct = 100;
>                 limits.max_perf = int_tofp(1);
>                 limits.no_turbo = 0;
> +               return 0;
>         }
> +       limits.min_perf_pct = (policy->min * 100) / policy->cpuinfo.max_freq;
> +       limits.min_perf_pct = clamp_t(int, limits.min_perf_pct, 0 , 100);
> +       limits.min_perf = div_fp(int_tofp(limits.min_perf_pct), int_tofp(100));
> +
> +       limits.max_perf_pct = policy->max * 100 / policy->cpuinfo.max_freq;
> +       limits.max_perf_pct = clamp_t(int, limits.max_perf_pct, 0 , 100);
> +       limits.max_perf = div_fp(int_tofp(limits.max_perf_pct), int_tofp(100));

Otherwise it looks fine:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
