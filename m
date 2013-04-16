From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH] cpufreq: exynos5440: Protect opp search calls with rcu lock
Date: Tue, 16 Apr 2013 12:21:41 +0530
Message-ID: <CADGdYn6FJFWgx=8PGNwjmxVpsBU=QrvMKpPQMANuBwOHUPmt8w@mail.gmail.com>
References: <1366007087-12090-1-git-send-email-amit.daniel@samsung.com>
	<CAGo_u6qD5hO7x0fYwe+cZ5GHRA6tRG+vmhnf4GFjt9G0inQ0xA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=7mxpwFmkVTNFLGLjLjQKBF3HEw/ienv1XhhxXmePHUg=;
        b=i8pG01swNW6aOAp/3WI46cUwoJMSDNKH6hpTER7MsugpR9yNGFeVByjPnI7bl/2pKr
         zP3N3s6TCb8HVb7DVsR/GQHJ9A7WYKrYtdfxc1K6VoKXs2iFMGwmRr7pTi1gtoqlIGf2
         BaTJNUnWNlreV2BRAqCg3BBLkR+IVrOO62eJXnG3HK+L3MmvQtrrs2cvBisfLgkeMD8R
         cPjTwgDG+E3cceBhe9Z23tqxzpV+PHLHwtb3TAArqgs2rTlYf7e3H3oKlXXRPO7NJqbA
         z7ujAjhNxdtvVdRJLzDNnOvMGzJ5x0dPbfxA616rjezWSrs6tAnSfU5G/pc9nrwyYexS
         bWcw==
In-Reply-To: <CAGo_u6qD5hO7x0fYwe+cZ5GHRA6tRG+vmhnf4GFjt9G0inQ0xA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishanth Menon <nm@ti.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Nishanth,

Thanks for reviewing this patch.

On Mon, Apr 15, 2013 at 7:40 PM, Nishanth Menon <nm@ti.com> wrote:
> Daniel,
> On Mon, Apr 15, 2013 at 1:24 AM, Amit Daniel Kachhap
> <amit.daniel@samsung.com> wrote:
>> As per the OPP library documentation(Documentation/power/opp.txt) all
>> opp find/get calls should be protected by rcu locks.
>>
>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>> ---
>>
>> This patch is created against linux-next tree and is suggested by
>> Nishanth Menon. (https://lkml.org/lkml/2013/4/12/119)
>>
>>  drivers/cpufreq/exynos5440-cpufreq.c |    3 +++
>>  1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/cpufreq/exynos5440-cpufreq.c b/drivers/cpufreq/exynos5440-cpufreq.c
>> index ead7ed4..0c74018 100644
>> --- a/drivers/cpufreq/exynos5440-cpufreq.c
>> +++ b/drivers/cpufreq/exynos5440-cpufreq.c
>> @@ -120,11 +120,13 @@ static int init_div_table(void)
>>         int i = 0;
>>         struct opp *opp;
>>
>> +       rcu_read_lock();
>>         for (i = 0; freq_tbl[i].frequency != CPUFREQ_TABLE_END; i++) {
>>
>>                 opp = opp_find_freq_exact(dvfs_info->dev,
>>                                         freq_tbl[i].frequency * 1000, true);
>>                 if (IS_ERR(opp)) {
>> +                       rcu_read_unlock();
>>                         dev_err(dvfs_info->dev,
>>                                 "failed to find valid OPP for %u KHZ\n",
>>                                 freq_tbl[i].frequency);
>> @@ -159,6 +161,7 @@ static int init_div_table(void)
>>                 __raw_writel(tmp, dvfs_info->base + XMU_PMU_P0_7 + 4 * i);
>>         }
>>
>> +       rcu_read_unlock();
>
> Is it not possible to reduce the amount of code protected by RCU lock?
> something like this:
Yes it is possible but then this part of code is a loop of max 8
iteration so rcu_read_lock will be called those many times.
Also this code blocks are just register writes and not doing any time
consuming operations.

Thanks,
Amit Daniel
> +               rcu_read_lock();
>                 opp = opp_find_freq_exact(dvfs_info->dev,
>                                         freq_tbl[i].frequency * 1000, true);
>                 if (IS_ERR(opp)) {
> +                       rcu_read_unlock();
>                         dev_err(dvfs_info->dev,
>                                 "failed to find valid OPP for %u KHZ\n",
>                                 freq_tbl[i].frequency);
>                         return PTR_ERR(opp);
>                 }
> +               volt_id = opp_get_voltage(opp);
> +               rcu_unlock();
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
