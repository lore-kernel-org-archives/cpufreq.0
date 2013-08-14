From: Xiaoguang Chen <chenxg.marvell@gmail.com>
Subject: Re: [PATCH 1/2] cpufreq: Add governor operation ongoing flag
Date: Wed, 14 Aug 2013 16:50:39 +0800
Message-ID: <CAFgnuDe1VwH2_xyyRN382=gGO8N6QKONKpGkLBGK8Hv2Zh1orA@mail.gmail.com>
References: <1376377766-2594-1-git-send-email-chenxg@marvell.com>
	<CAKohpo=QKPvqUcQVsbbSQdWOOi5L-P2CBFzcfMsobs8uGpLkVw@mail.gmail.com>
	<CAFgnuDes_F7Q5CHbXKC=ndrn9Gr3PJfGj0QvDXA-FuGcq41CHQ@mail.gmail.com>
	<CAKohponD2LdDsJy=UJCf-1yANjyPjmAyokV5a4HOSJn_DMJVhA@mail.gmail.com>
	<CAFgnuDetTVYayBABNPhME15b+b6qUtJX2hBaJ6y4+gOSgGFwdQ@mail.gmail.com>
	<CAKohpoksGB6bBtFF4DaqqLME2kpDve5uMycZDCXahaigdRhwKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=rQEY3+ru8bC4N0Oazr02EhNnLxO0+VKfdZpWMlXzPus=;
        b=cxpEBLP0Pp8aiYmLMfWdh+FuVGotJOT7DOdl8cVYmtJTziaWAm0S3OEcQ4M9W1kxnI
         enbYsV3H9agITdvAV/HhX0H+n+skYLp2YQ3mTxUbZj4cWGGeyYrwnWxWc/3hudIR6X/g
         4guBd7kt5d7Scos4ZyPLfR7t7c5SRpUN5UMTxkYU19Z/IIjchHdJe+AI0OgNk0LYXp6k
         2g0gI2q402jy74dnI49huOxaVIO0xgr2cKGXa1MyIGK/blIIpCkuvf92qpAUsdFP25K9
         ud96ZcvJjyfUFZ2kt5C/dK4YM6ue7Zq6jigR9g24FsMSwEq6qx53BeouFaf0j5wkqFVr
         ki5g==
In-Reply-To: <CAKohpoksGB6bBtFF4DaqqLME2kpDve5uMycZDCXahaigdRhwKQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Xiaoguang Chen <chenxg@marvell.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

2013/8/14 Viresh Kumar <viresh.kumar@linaro.org>:
> On 14 August 2013 13:49, Xiaoguang Chen <chenxg.marvell@gmail.com> wrote:
>> Yes, "START (If STOP passed)", this is important,  we don't have this
>> patch on our code base, So even Process B's STOP failed(as governor
>> enable flag is set to false by process A already ), it can still do
>> START operation, So my problem occurs.
>> My problem is that I see ondemand governor is started twice during
>> frequent governor switch and cpu hotplug stress test.
>>
>> The After seeing your patch for the return value checking, I think my
>> problem should not occur.
>> This issue really botherred me for a long time. :(
>
> Exactly, the problem was users of this API were abusing it as they didn't
> cared for its return value. I hope that is fixed widely now and in case
> some places are still left, they should be fixed as well.
>
> --
> viresh


Hi, Viresh
After checking your patch, I find that __cpufreq_set_policy function
doesn't check STOP and EXIT 's return value
is it on purpose? if not, I can provide a patch to add it.

Thanks
Xiaoguang
