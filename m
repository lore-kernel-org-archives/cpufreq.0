From: Amit Kachhap <amit.kachhap@gmail.com>
Subject: Re: [PATCH 2/2] cpufreq: Remove exynos_sort_descend_freq_table in exynos5440-cpufreq.c
Date: Tue, 29 Apr 2014 11:44:14 +0530
Message-ID: <CADGdYn7cA940sxPszP5TA5tMnXD_=QkH3U3Wedy2DoC++rwRkQ@mail.gmail.com>
References: <000701cf636b$3d1d13c0$b7573b40$@samsung.com>
	<CAKohpo=ei0v69iQtjd6cjmfUCo-+sd1JzNc4RDza92nxaPoiVg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=K5SjWVduyZTDqCs5bZRdhDNouxYmD9M5hJACoqFUmac=;
        b=XeOug7c5SifmR2k5TPA2YGKcpoEgY09FB54crv8TnxCXvhBzJQbAHNK83rBo5x4XjR
         lcHdDYJxHi0NOYeYu/RUD8nCpVUMJDM7bss2pIg3GbkprGVqudItO1Y13NIMQuCYBPEX
         KTzdLjBIXYQ0yPV+FSYIxGCGqugAsSESmuq8Hcgi1PUXiRroDuP8CcPMs5mMe1qwj4c/
         2EyoW79i6Ggnifc5aiHqg6+tebJotlkKchZsFxGRh++MPsgoCfht7Avm4Te02a0teSxH
         +clXcgCukCnoA8ZHA9q9SoZ2M16i8BMQnafGcxpkhtQ3rgYEMX3LP8qcH2w5S6C9i1qs
         sPwA==
In-Reply-To: <CAKohpo=ei0v69iQtjd6cjmfUCo-+sd1JzNc4RDza92nxaPoiVg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Jonghwan Choi <jhbird.choi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:CPU FREQUENCY DRI..." <cpufreq@vger.kernel.org>

On 4/29/14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 29 April 2014 10:54, Jonghwan Choi <jhbird.choi@samsung.com> wrote:
>> diff --git a/drivers/cpufreq/exynos5440-cpufreq.c
>> -static void exynos_sort_descend_freq_table(void)
>> -{
>> -       struct cpufreq_frequency_table *freq_tbl = dvfs_info->freq_table;
>> -       int i = 0, index;
>> -       unsigned int tmp_freq;
>> -       /*
>> -        * Exynos5440 clock controller state logic expects the cpufreq
>> table
>> to
>> -        * be in descending order. But the OPP library constructs the
>> table
>> in
>> -        * ascending order. So to make the table descending we just need
>> to
>> -        * swap the i element with the N - i element.
>> -        */
>
> What I am more focused is on: Why do we need to worry about order at
> all in the first place.
>
> Okay, above comment says something about it but I couldn't understand
> what's the logic behind that. Why do we need same order as of clock
> controller. Please point out relevant code pieces as well..
>
> @Amit: Your comments on this ?

Hi Viresh/Jonghwan,

In the frequency table dts file, the frequencies are arranged in
descending order which maps 1 to 1 with other frequency parameter to
be calculated and programmed in some registers.
But the OPP library works by generating the frequencies in ascending
order which breaks the above logic. Ideally i should expect frequency
values in same order as what is supplied.
So OPP library should not change the order or should take input flags
flags like,
dev_pm_opp_init_cpufreq_table(TABLE_ORDER_ASCEND|
TABLE_ORDER_DESCEND|TABLE_ORDER_ORIGINAL )

Thanks,
Amit Daniel
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
