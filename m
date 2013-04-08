From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH V6 1/4] cpufreq: exynos: Add cpufreq driver for exynos5440
Date: Mon, 8 Apr 2013 15:29:22 +0530
Message-ID: <CADGdYn63Ck-5GXctYyvzq2V2U7Su3aHqyhrA_TgsS_krtKRcAA@mail.gmail.com>
References: <1365409058-32643-1-git-send-email-amit.daniel@samsung.com>
	<1365409058-32643-2-git-send-email-amit.daniel@samsung.com>
	<CAKohpo=CFTo2UCnECeeuKdz34cuedV_tqn7zGA9bzU_PiJ46qg@mail.gmail.com>
	<CAKohpo=t_YTCTRCfnwQ+GPF=frsTGDigT3RZHJuVQ+R+YZU7Hg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=qbPsCdXgR89i/4eVr1T+42x1CdkuRAwJi6rzxbkP540=;
        b=EQDCtJazyfyJ0OMyD/y6pMejJTlWwXVLYS2PYhT6LZX4VBhn1Se6iGfFlp7CVnztj/
         j1qB3seWnDHOEnYeyp4fBOXFR/y6quzrEcXavnr8IrPgA6eVd9L8sS+PN4ARPXfRqtsR
         2nf67rGXHuoWJyLFy6B65DiT/u2sCK1KBi40gylyrX1U4fwKNd4MxMpYwrmn0+2wJPzb
         jmr7yWvBSvgxx1306I/3/T1JuugxN6Ko5N8U+A2/0cgsn1BcDCc0TsrHfxwWB8P2iqZe
         x+ZSNP6gBZCQGbsRVlNQL1oRdmXB0l80kZ2qZ+nZFziX3fmGEdbZiApEupCP1ayGkEkx
         ooZg==
In-Reply-To: <CAKohpo=t_YTCTRCfnwQ+GPF=frsTGDigT3RZHJuVQ+R+YZU7Hg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Inderpal Singh <inderpal.singh@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org

On Mon, Apr 8, 2013 at 2:46 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 8 April 2013 14:17, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> On 8 April 2013 13:47, Amit Daniel Kachhap <amit.daniel@samsung.com> wrote:
>>
>>> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
>>> index f3f3b14..bce2195 100644
>>> --- a/drivers/cpufreq/Kconfig.arm
>>> +++ b/drivers/cpufreq/Kconfig.arm
>>> @@ -42,6 +42,15 @@ config ARM_EXYNOS5250_CPUFREQ
>>>           This adds the CPUFreq driver for Samsung EXYNOS5250
>>>           SoC.
>>>
>>> +config ARM_EXYNOS5440_CPUFREQ
>>> +       def_bool SOC_EXYNOS5440
>>> +       depends on HAVE_CLK && PM_OPP && OF
>>
>> Don't you need a depend on your Soc or mach or arch? Don't send another
>> version for this now.. Just send a new patch over this patchset.
>
> Sorry, i overlooked def_bool... This comments stands invalid.
Ok, I resend this patch addressing all comments.

Thanks,
Amit
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
