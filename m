From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH v4 8/8] cpufreq: exynos: remove all exynos specific
 cpufreq driver support
Date: Wed, 14 May 2014 19:23:02 +0530
Message-ID: <CAJuA9ajVHivO1AdMDw3Ow=T2yV9QMw2sj0b72SN6a5HftNX5Kg@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-9-git-send-email-thomas.ab@samsung.com>
	<20140514092010.02e16520@amdc2363>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=WYHzQg/kCxt/NBpHV6iN4nNytr+5pXpF+hdy2yz6dPA=;
        b=ail2cGcoM6XjDQ4mBkdAjXQ22dRky479kNGs6Uqj487fLPHofz1E6fTx7qMz/Ufhy2
         m8LVtUWv9IKYWCXxJxEw82BCPGfG6Krs73Mnlp71JutdPA7MWocEJ66+QqgEhlUOl6P8
         qaFFhG14GlYoiOycJX9D9cjogTyZZwELbDukt5mpAV0T4MNtX4YdR0qWJbpkap+S3SX9
         sfPhdCm8RCa3vaEehzgBMTf8x4+uVgBAmTda7oQ+7HLsazXQCOiietPohbTeeZPOGaQj
         gwEI7uoRnpmSpjDE06QZKyCOYYiSUP2UDjQ9YOwz7r5I2/D1Sa247YQZp3o5XnwzhC6X
         BmRw==
In-Reply-To: <20140514092010.02e16520@amdc2363>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <t.figa@samsung.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>

Hi Lukasz,

On Wed, May 14, 2014 at 12:50 PM, Lukasz Majewski
<l.majewski@samsung.com> wrote:
> Hi Thomas,
>
>> -config ARM_EXYNOS_CPU_FREQ_BOOST_SW
>> -     bool "EXYNOS Frequency Overclocking - Software"
>> -     depends on ARM_EXYNOS_CPUFREQ
>> -     select CPU_FREQ_BOOST_SW
>> -     select EXYNOS_THERMAL
>> -     help
>> -       This driver supports software managed overclocking (BOOST).
>> -       It allows usage of special frequencies for Samsung Exynos
>> -       processors if thermal conditions are appropriate.
>> -
>> -       It reguires, for safe operation, thermal framework with
>> properly
>> -       defined trip points.
>> -
>> -       If in doubt, say N.
>> -
>
> If I might ask, where this switch,to enable BOOST, will be moved? All
> in all, I would like to be able to enable boost :-).

The intent was to have a separate boost config option for cpufreq-cpu0
driver, only available if cpufreq-cpu0 driver is selected, as done in
the other patch.

>
> In my opinion we should have the Kconfig option to enable/disable the
> CPU_FREQ_BOOST_SW and this may be used with cpufreq-cpu0 driver as I've
> pointed out in the other patch.

Okay, this is how this patch series handles CPU_FREQ_BOOST_SW config option.

Thanks,
Thomas.


>
> --
> Best regards,
>
> Lukasz Majewski
>
> Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
