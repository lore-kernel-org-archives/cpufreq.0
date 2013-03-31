From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: [PATCH 6/9] cpufreq: pxa3xx: move cpufreq driver to drivers/cpufreq
Date: Sun, 31 Mar 2013 13:24:06 +0800
Message-ID: <CAMPhdO9WbCdJq8NdoOjW2Jreka2dSRrNyit_7xrAbX_haEqNGQ@mail.gmail.com>
References: <cover.1364205812.git.viresh.kumar@linaro.org> <2aa937c3d81776f01c2c1d6fcfcb08ba74163b53.1364205812.git.viresh.kumar@linaro.org>
 <CAKohpokq+JJF2Ec3=_QF5dk_w9tMuKZ0trtcgXbC1if=HXEBRg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=pvNWNlOtU8YRLn2KQp3NmBEuU7Kk546PCnyi6zD5FfY=;
        b=oE6sUi5SGt2d01iXoO63ASjL+yaRQF7x8gZMvTX+Qq25sm9eb6jSk/kO0aGSB0t/OK
         55SGckirEGlOJQrMJ6Fh8EQ7DP7le8mG5sITXGEtzE4MefTGGgP/zKWmVzimAQtSZgtu
         LCdq5GqmslHQKI/33rodmas3aNNXY2/FOKeXtAc6H7+OyvZNNoLhy9ZUeDPRNILK80Sd
         07tq3Mubf7YJBeHNwMNLNSVTleZ9BdetZFlLnsfxHBhwBsLOtm8ZZp2C0wyS7N60omMt
         ZFrq/A9C5ssNBWOEmDF77y+2AoLEM9z6y5lMnJJ1A3BCDM2Od5ZIuTU1x2v/DKiGk3Ou
         aeHg==
In-Reply-To: <CAKohpokq+JJF2Ec3=_QF5dk_w9tMuKZ0trtcgXbC1if=HXEBRg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, arvind.chauhan@arm.com, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, linaro-kernel@lists.linaro.org, Arnd Bergmann <arnd.bergmann@linaro.org>, Russell King <linux@arm.linux.org.uk>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Sun, Mar 31, 2013 at 11:52 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Eric/Haojian,
>
> On 25 March 2013 15:41, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> This patch moves cpufreq driver of ARM based pxa3xx platform to drivers/cpufreq.
>>
>> Cc: Eric Miao <eric.y.miao@gmail.com>

Acked-by: Eric Miao <eric.y.miao@gmail.com>

>> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>>  arch/arm/mach-pxa/Makefile                                           | 1 -
>>  arch/arm/mach-pxa/include/mach/generic.h                             | 1 +
>>  drivers/cpufreq/Makefile                                             | 1 +
>>  .../mach-pxa/cpufreq-pxa3xx.c => drivers/cpufreq/pxa3xx-cpufreq.c    | 5 +----
>>  4 files changed, 3 insertions(+), 5 deletions(-)
>>  create mode 100644 arch/arm/mach-pxa/include/mach/generic.h
>>  rename arch/arm/mach-pxa/cpufreq-pxa3xx.c => drivers/cpufreq/pxa3xx-cpufreq.c (98%)
>
> Can i have your Ack or views about 6/9 and 7/9 Patch?
