From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/3] cpufreq: exynos: Add exynos5420 cpufreq driver
Date: Tue, 17 Dec 2013 12:37:04 +0530
Message-ID: <CABb+yY0C50va5UAgv5QKGKK6qE1wiDwcUmn54CC7PVQ8vpoEmg@mail.gmail.com>
References: <1386323284-15646-1-git-send-email-arun.kk@samsung.com>
	<1386323284-15646-4-git-send-email-arun.kk@samsung.com>
	<20131209092324.1f8b6502@amdc2363>
	<CALt3h7-25_mW5SnnTbZWjoF0pOZxsU5Gg6FqOdoz1MgdH7gm5w@mail.gmail.com>
	<20131210173208.5083aa1f@amdc2363>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=o3ygdogJqmhXkzRYxmGWyiNr0wnThzlQJJcN/dAmbqY=;
        b=V28Qjw+73zn5OhD0Mws5vvEqQe8lFCHicWNeuMzN6Inerl4hCS6JAweafI+AaGyvrS
         Oe2PGzfV/9pxRP9R5TvtqWAGbiyCkoJHQmFQW8ktF3OLbo2eTn6C8mofz3B2b/4yvHQS
         /jXx0nNm2ZS8VOq4kAWN50PhTkF4adMaF2xVy9gLaEYSdb91ODvIHRFdrd8aVROkOU7d
         mA96/u4KoRnBaA3LnCJSW7aeAk7WBINGvt/9PHJ1BBS/FYZvweUb1O9LIuBzUGAxZuLg
         1CcArDG/tXQszAfvPz6F8Fk53lPMf4RmriMRTiaZOz/CP7XutfPgoVm6Fc5g+e2OW5Ku
         UnzQ==
In-Reply-To: <20131210173208.5083aa1f@amdc2363>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Arun Kumar K <arunkk.samsung@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, abrestic@chromium.org, Viresh Kumar <viresh.kumar@linaro.org>, rjw@rjwysocki.net, Tomasz Figa <tomasz.figa@gmail.com>, cpufreq@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, arjun.kv@samsung.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Dec 10, 2013 at 10:02 PM, Lukasz Majewski
<l.majewski@samsung.com> wrote:
>>
>> Actually these values are not for PLL, but for the dividers.
>> If you see below, the PLL rate setting is done through clk_set_rate()
>> going via CCF. But I found an issue if the divider values are set via
>> clk_set_rate API.
>> What I found is, the system goes into freeze if all the divider
>> values are not set in one shot. So we cannot call multiple
>> clk_set_rate()'s on each divider. Thats why I continued with non-CCF
>> way of setting the divider.
>
> I see. I'm not an expert on common clock framework (CCF), but for me
> conceptually clock dividers setting shall be handled by CCF.
>
> However, I've poked a bit at CCF. There isn't any out of the box
> solutions available.
>
> A "virtual" clock can be defined and inside its implementation we can
> atomically set dividers. Another solution would be to hack the current
> CCF to provide atomic clock operations
>
CCF isn't only for clocks that have single divider or gate control
register. One could define a clock that manipulates more than one
divider/gate in one CCF callback. It is already abstract enough. So
implementing a virtual clock is the solution, imho.
 BTW, on my platform linux needs to send a 'non-atomic' IPC message to
a master co-processor to scale up/down cpufreq. I just define a
virtual clock and use the generic bL cpufreq driver
drivers/cpufreq/arm_big_little.c
