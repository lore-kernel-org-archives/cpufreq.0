From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 4/6] cpufreq_stats: Do not track policies without
 associated governors.
Date: Sat, 2 Feb 2013 11:08:33 +0530
Message-ID: <CAOh2x=k0=wqYqDwnoUNn0wAmh8f0FSPtaFgFSK49hkmyrAganQ@mail.gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
	<1359744343-18690-7-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=Q3Kr6nLhDARVIfSi3oL3FEnWBbrORqpxeB3WMGCNT8I=;
        b=nXdWJUijX24H7JHEy6Nk72iBQ9z0TPlCK6U2FZBPirEgha6tnmKRFTjbMhCqcqfzVG
         RmVHHaoWmA0MDT4iGNYQn+npRBOCQNDUFeKzoL44VTsH66/kNM0+CPIdTHQLbxWBGl+9
         INGZhrOaHG1fljKE2jV2amNxb0PaDaqCl2Z6JA4l5oNV4hjp8IZB90QOuiBaEVOnHqnw
         lSjBwvpJH1IrxCtLcFn830By0XHSyrrfo0dsDx0rgU9V01BzqgBZbPGrBpUMjoQIB1dj
         GfKI1V1mH8SYhFkThv2gK3Mw/xbQ02VdZ39IxJ4P/AD15fLcuzJPeDqLkjOMIAlUADrS
         iQRQ==
In-Reply-To: <1359744343-18690-7-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Sat, Feb 2, 2013 at 12:15 AM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Scaling drivers that implement internal governors do not have governor
> sturctures associated with them.  Do not create/remove statisitcs
> entries for polices that do not have governors associated with them.
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>

It is not based of latest work.

Why don't we want stats to be updated for these? What does stats have
to do with governor?

> ---
>  drivers/cpufreq/cpufreq_stats.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
> index 9d7732b..8a1daf4 100644
> --- a/drivers/cpufreq/cpufreq_stats.c
> +++ b/drivers/cpufreq/cpufreq_stats.c
> @@ -183,7 +183,7 @@ static void cpufreq_stats_free_table(unsigned int cpu)
>  static void cpufreq_stats_free_sysfs(unsigned int cpu)
>  {
>         struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> -       if (policy && policy->cpu == cpu)
> +       if (policy && policy->cpu == cpu && policy->governor)
>                 sysfs_remove_group(&policy->kobj, &stats_attr_group);
>         if (policy)
>                 cpufreq_cpu_put(policy);
> @@ -271,6 +271,8 @@ static int cpufreq_stat_notifier_policy(struct notifier_block *nb,
>         unsigned int cpu = policy->cpu;
>         if (val != CPUFREQ_NOTIFY)
>                 return 0;
> +       if (!policy->governor)
> +               return 0;
>         table = cpufreq_frequency_get_table(cpu);
>         if (!table)
>                 return 0;
> --
> 1.7.7.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
