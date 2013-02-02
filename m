From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 5/6] cpufreq: balance out cpufreq_cpu_{get,put} for
 scaling drivers using setpolicy
Date: Sat, 2 Feb 2013 11:11:07 +0530
Message-ID: <CAOh2x=mU8+mJmr=BXjSLaz7Yxg--t2mPpsc_=Xry2ArNroB8Aw@mail.gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
	<1359744343-18690-9-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=/4wTmFZMCMAuF0qxWl1+T0dT+lmmFI5j4DUR7/0123Y=;
        b=XJhPjmSxzgEVYHYLVPgp+IGTnl9jd3Kh0KPq6j1YMfef3ybo0qL83k64H/N7C5Nrmn
         s+suDnt7SCH7vCzmlmg7zmVUsANg/5wTYd6/PHHuAjzn5d/w3miRLlItHNw5dxCsmDQb
         1Y+hGDdZrtI1+6sX07xU2bDaGu5kuHIJoOU8YIkVlYgjVV9tSyzK3+SE0vptdI52diQB
         tGMYKRY3CAAeR15lvMHT5Mj1RKtYnJVuW5bdovRoHmna4upYdnRzry8OuxFrKbLUIORY
         bnmzJ4mE2eC5MGEEQu/4PosE0fgjevz597ITxGpGMLbnSV6RbH1IoUQFbhAxX/HJbXyR
         3lbg==
In-Reply-To: <1359744343-18690-9-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Sat, Feb 2, 2013 at 12:15 AM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> There is an additional reference added to the driver in
> cpufreq_add_dev_policy() that is removed in__cpufreq_governor() if the
> driver implements target().  Remove the last reference when the driver
> implements setpolicy()
>
> Signed-off-by: Dirk Brandewie <dirk.brandewie@gmail.com>

Rebase it on latest work as cpufreq_add_dev_policy() doesn't exist anymore.

> ---
>  drivers/cpufreq/cpufreq.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index a4fd51e..ec103bf 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1119,6 +1119,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
>         if (cpufreq_driver->target)
>                 __cpufreq_governor(data, CPUFREQ_GOV_STOP);
>
> +       if (cpufreq_driver->setpolicy)
> +               cpufreq_cpu_put(data);
> +
>         kobj = &data->kobj;
>         cmp = &data->kobj_unregister;
>         unlock_policy_rwsem_write(cpu);
> --
> 1.7.7.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
