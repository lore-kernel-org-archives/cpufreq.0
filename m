From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3] cpufreq: exynos:  Fix the compile error
Date: Sat, 17 May 2014 08:24:49 +0900
Message-ID: <53769E41.5050603@samsung.com>
References: <000001cf70f0$2e48f930$8adaeb90$@samsung.com> <037e01cf70f5$25b374d0$711a5e70$@samsung.com> <2553916.Pl2B0tVZGR@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=VRWvvJlp02H9bdS1vFZPiO94dyU/9zKLShtrt92wXMY=;
        b=UhDMTroponacDz4v/beZzzCqwHcaS0WXY4/jmk6VE9yjtvkVV7JRYZ36OV0mUr6jCX
         AtIWDM3heuQxv8fmO3kMNBhOZRuDPri5Y+P4swGznvDQ8+E8lVqh9bW5zFer1RWABYmf
         iBTYnLwL4vXJdfPTqspVsCyu6whAs5ZqFlDxMlSoJicBprz+hwyNbxjH7jr1QqNKI0nq
         WJV56oaDhR2XNKCux4safhWgvosHVdJz1GzbHaDsnGtHD4PyBCT8WvQGczQhiG+sJz9m
         DVlPCXy2p0EFNmkRAhtZm/pZQuzSSV3FTvtA5CkEOCOkr3UlQ7irhOzYCxlLoeSZoJD4
         FBxw==
In-Reply-To: <2553916.Pl2B0tVZGR@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Viresh Kumar' <viresh.kumar@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>, cpufreq@vger.kernel.org, 'Jonghwan Choi' <jhbird.choi@gmail.com>, 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-arm-kernel@lists.infradead.org

On 05/17/14 08:04, Rafael J. Wysocki wrote:
> On Friday, May 16, 2014 07:54:01 PM Kukjin Kim wrote:
>> Jonghwan Choi wrote:
>>>
>>> Commit 7da83a80 ("ARM: EXYNOS: Migrate Exynos specific macros from plat to
>>> mach") which lands in samsung tree causes build breakage
>>> for cpufreq-exynos like following:
>>>
>>> drivers/cpufreq/exynos-cpufreq.c: In function 'exynos_cpufreq_probe':
>>> drivers/cpufreq/exynos-cpufreq.c:166:2: error: implicit declaration of
>>> function 'soc_is_exynos4210'
>>> [-Werror=implicit-function-declaration]
>>> drivers/cpufreq/exynos-cpufreq.c:168:2: error: implicit declaration of
>>> function 'soc_is_exynos4212'
>>> [-Werror=implicit-function-declaration]
>>> drivers/cpufreq/exynos-cpufreq.c:168:2: error: implicit declaration of
>>> function 'soc_is_exynos4412'
>>> [-Werror=implicit-function-declaration]
>>> drivers/cpufreq/exynos-cpufreq.c:170:2: error: implicit declaration of
>>> function 'soc_is_exynos5250'
>>> [-Werror=implicit-function-declaration]
>>> cc1: some warnings being treated as errors
>>> make[2]: *** [drivers/cpufreq/exynos-cpufreq.o] Error 1
>>> make[2]: *** Waiting for unfinished jobs....
>>> drivers/cpufreq/exynos4x12-cpufreq.c: In function 'exynos4x12_set_clkdiv':
>>> drivers/cpufreq/exynos4x12-cpufreq.c:118:2: error: implicit declaration of
>>> function 'soc_is_exynos4212'
>>> [-Werror=implicit-function-declaration]
>>> cc1: some warnings being treated as errors
>>> make[2]: *** [drivers/cpufreq/exynos4x12-cpufreq.o] Error 1
>>> make[1]: *** [drivers/cpufreq] Error 2
>>> This fixes above error with getting SoC information via
>>> of_machine_is_compatible() instead of soc_is_exynosXXXX().
>>>
>>
>> Probably,
>> Suggested-by: Tomasz Figa ?
>>
>>> Signed-off-by: Jonghwan Choi<jhbird.choi@samsung.com>
>>
>> Looks better.
>>
>> Rafael, if you have no objection on this, shall I pick this into samsung
>> tree for 3.16 because of the current build breakage with enabling exynos
>> cpufreq?
>
> Please go ahead.
>
Done.

Thanks,
Kukjin
