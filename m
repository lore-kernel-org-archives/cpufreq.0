From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH v4 1/8] cpufreq: cpufreq-cpu0: allow use of optional boost
 mode frequencies
Date: Wed, 14 May 2014 19:13:21 +0530
Message-ID: <CAJuA9ajtCAGpBkSBH64bpTAbZKqPHTiDBFspuoXE1MSLyOyRPw@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-2-git-send-email-thomas.ab@samsung.com>
	<CAKohpo=-duhJ-4iaqBG+eUCkoV_qwAu93FgUxmYS5erNTpLoMA@mail.gmail.com>
	<20140514081739.0b66587e@amdc2363>
	<CAKohpomdjDDBjuPcAsaCcavvVgcX5977gDWyjeqmULadq_Pw8w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=wYmq2YRpotMeRiwY5DW8QulEXpbKtVold6alXXIwU0Q=;
        b=j1d1KieJTfTWYkXCyiYnbFn3uD4tBglfe439qXxm0TcRxiryl6NYhl682dnQwp6n4I
         vMOH3p1hD7CpEtpFppmHTkpSE+bGMVPdR2nVSASConfdsAgMsxFX1xyjqSrXPxclIHYs
         DuRRAWfioCvo0mISWtX7FEzwk7+/REEFAh3ME1v/41Kx8Oy+FTPeyybdTn8SLR9dGq25
         5CSKNcSIy+r0kkCYRXdFcP0qqdCJrZLJy3XA/ul7TMfeQnCRnHGl/+ZnFMvbKUqOfrMb
         ubuaz/JhWdzYX5QyEFY+Sb2u0CSJY8o1euHZ4V0sSfU+vEmH8/fU/HBcjXCGH57trc7K
         ISiQ==
In-Reply-To: <CAKohpomdjDDBjuPcAsaCcavvVgcX5977gDWyjeqmULadq_Pw8w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Lukasz Majewski <l.majewski@samsung.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>

Hi Lukasz, Viresh,

On Wed, May 14, 2014 at 11:50 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 14 May 2014 11:47, Lukasz Majewski <l.majewski@samsung.com> wrote:
>> I think that you can rely solely on the CPU_FREQ_BOOST_SW flag if the
>> original author of cpufreq-cpu0.c don't mind.
>
> We don't have to. struct cpufreq_driver: boost_supported is always available.
> Just update it without any ugly #ifdefs ..

Okay, so you are suggesting that Kconfig entry used to select
cpufreq-cpu0 should also enable CPU_FREQ_BOOST_SW config as well.
Considering that exynos4412 is the only user of this feature in
mainline, should we do this?
