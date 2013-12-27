From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: cpufreq ondemand governor debugobjects warning
Date: Fri, 27 Dec 2013 13:31:35 +0530
Message-ID: <CAKohpo=xxt2BRsiLkufkH7qdBeQrxw_SinRMyLWFiC6MTHUJWw@mail.gmail.com>
References: <52BCEA76.1020906@marvell.com>
	<52BCEEA3.4090107@marvell.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <52BCEEA3.4090107@marvell.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jane Li <jiel@marvell.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 27 December 2013 08:36, Jane Li <jiel@marvell.com> wrote:
> When gov_queue_work(), governor_enabled may be modified.  Following patch
> can fix it by adding cpufreq_governor_lock in gov_queue_work. But in this
> way, cpufreq_governor_lock also protects __gov_queue_work(). Do you think
> this is a good idea?

I don't see a alternative than this solution after the deadlock issue with timer
lock.

> diff --git a/drivers/cpufreq/cpufreq_governor.c
> b/drivers/cpufreq/cpufreq_governor.c
> index e6be635..a27246c 100644
> --- a/drivers/cpufreq/cpufreq_governor.c
> +++ b/drivers/cpufreq/cpufreq_governor.c
> @@ -118,9 +118,11 @@ void gov_queue_work(struct dbs_data *dbs_data,
> struct cpufreq_policy *policy,
>                   unsigned int delay, bool all_cpus)
>    {
>           int i;
> -

don't remove this.

> -       if (!policy->governor_enabled)
> +       mutex_lock(&cpufreq_governor_lock);
> +       if (!policy->governor_enabled) {
> +               mutex_unlock(&cpufreq_governor_lock);
>                   return;
> +       }
>
>           if (!all_cpus) {
>                   /*
> @@ -135,6 +137,7 @@ void gov_queue_work(struct dbs_data *dbs_data,
> struct cpufreq_policy *policy,
>                   for_each_cpu(i, policy->cpus)
>                           __gov_queue_work(i, dbs_data, delay);
>           }
> +       mutex_unlock(&cpufreq_governor_lock);
>    }
>    EXPORT_SYMBOL_GPL(gov_queue_work);

You also need to remove 'static' from lock's declaration.

--
viresh
