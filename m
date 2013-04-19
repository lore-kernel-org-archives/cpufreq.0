From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] cpufreq: exynos: allow disabling cpufreq drivers
Date: Fri, 19 Apr 2013 23:12:13 +0200
Message-ID: <5171B32D.6030601@gmail.com>
References: <201304191554.29679.arnd@arndb.de> <201304192059.38606.arnd@arndb.de> <5171AB10.5070702@gmail.com> <201304192243.30430.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=tv6noCg9k6LRMCHwH5A5CnPuwhdSPMUX8RiE1CMlpKM=;
        b=JZqF0u6cXxY17yASZaSjoJ+/LAVxD0Ww4EiDV3iS9+tMEtSktgcz2al5YU1/juUKNP
         2xhtD8VUbzhU8dAVhfVDCYlvRM6kLnJf1hn/+M8KKjKCSkx7eVrjiH98g3RtG8fHokEb
         4Ny90qedztT5FUIMi5T330Jb8hB7bL6gjvebwRP7SqSM1j2AzNVoJbks2kQRwjyzqX+K
         zzD0LrOajwfgYd+8xH6q1Eayel+FjxvBgzf91bzrqQdnSUwJhxOr4cKUVTnYG97RMxKG
         ujqSKip7lO362EMOUwhYPmkZ8pZjH/t49bYqrh+hD3xhYwWRlaRhobqselww7IVisUam
         BLbg==
In-Reply-To: <201304192243.30430.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, cpufreq@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>

On 04/19/2013 10:43 PM, Arnd Bergmann wrote:
> On Friday 19 April 2013, Sylwester Nawrocki wrote:
>>> It could also be working by chance on EXYNOS4, since the register
>>> definitions were not actually removed from the regs-clk.h header
>>> for those.
>>
>> That's most likely what happened.
>
> Ok. I think I see the bigger picture now. The EXYNOS5 cpufreq driver was
> actually just merged now, so I assume that by the time Thomas did the clock
> changes, the register definitions for EXYNOS5 were actually unused and he
> subsequently removed them from the kernel.
>
> Since the driver now depends on them, I think the only way forward for 3.10
> is to revert the change that removed the definitions and put them back in
> place.

Yes, it sounds like a best thing to do. I was also considering that.

> We really should use the clock API from all the exynos cpufreq drivers, but it's
> too late for that change now in 3.10 and we will have to do it for 3.11 then.

Yes, the changes required to make the cpufreq driver using the clocks 
API would
be rather significant.

> This are not looking so good for exynos multiplatform support in 3.10 now, but
> if we get it in, that will mean we have to disable cpufreq when building
> multiplatform, but it can remain for the classic single-platform configurations.

Alright, let's hope eventually we get at least a minimum booting system. ;)

Thanks,
Sylwester
