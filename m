From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: Fix exposure of ARM_EXYNOS4210_CPUFREQ
Date: Wed, 28 Mar 2012 17:59:13 -0700
Message-ID: <4F73B3E1.4080807@samsung.com>
References: <20120213094940.GA15338@n2100.arm.linux.org.uk> <4F3CF3DA.7000806@samsung.com> <20120216160250.GP13673@n2100.arm.linux.org.uk> <00aa01ccf084$93c98a70$bb5c9f50$%kim@samsung.com> <20120327074931.GK5611@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=tiX69W67qHJQwBnOAzu5y82s+gshL/z7mCZBqJwXW0g=;
        b=M7cyvluV5fvVLhXw7a+ekER3Jgt0GauZDcTHnGvgomK+mcL9TqsXpGzmR0AkI/64IE
         CJR2MhHPbWVBeLLlJNoH0rnc70J+F1j3UKuaHoNTTBDZsy7yUjPXG039JuxoVvDxhZqF
         Wnk+WzD6OYidXIGhX1FuEve+5FJjqSX6xeeaI2R2468aVZE/20G1zp1tewnIcxQoLwiJ
         4Kbxpg0GGz0Z99asM08dkPkh0VAaxfwGvYdNvs2+BCDbPyOY7CCWSvLaK+P5tOcrHsUb
         1BSHS6t78g8Ezsr8oI1GPFoeoc+8wc0MaAlzPnKONm/IIjKXfqhS3qrIlMf/Jv6Py+az
         YUvA==
In-Reply-To: <20120327074931.GK5611@n2100.arm.linux.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Dave Jones' <davej@redhat.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Russell King wrote:
> On Tue, Feb 21, 2012 at 07:35:49PM +0900, Kukjin Kim wrote:
>> Russell King - ARM Linux wrote:
>>>
>>> On Thu, Feb 16, 2012 at 09:17:30PM +0900, Kukjin Kim wrote:
>>>> On 02/13/12 18:49, Russell King - ARM Linux wrote:
>>>>> From: Russell King<rmk+kernel@arm.linux.org.uk>
>>>>>
>>>>> exynos4210-cpufreq.c is not buildable on non-exynos builds, so it's
>>>>> pointless allowing this option to be exposed.  Fix this by adding a
>>>>> dependency on ARCH_EXYNOS.
>>>>>
>>>>> drivers/cpufreq/exynos4210-cpufreq.c:20:29: error: mach/regs-clock.h:
>>> No such file or directory
>>>>> drivers/cpufreq/exynos4210-cpufreq.c:21:26: error: mach/cpufreq.h: No
>>> such file or directory
>>>>>
>>>>> Signed-off-by: Russell King<rmk+kernel@arm.linux.org.uk>
>>>>> Cc: Dave Jones<davej@redhat.com>
>>>>> Cc: cpufreq@vger.kernel.org
>>>>> Cc: Kukjin Kim<kgene.kim@samsung.com>
>>>>> ---
>>>>>    drivers/cpufreq/Kconfig.arm |    1 +
>>>>>    1 files changed, 1 insertions(+), 0 deletions(-)
>>>>>
>>>>> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
>>>>> index e0664fe..c8bde43 100644
>>>>> --- a/drivers/cpufreq/Kconfig.arm
>>>>> +++ b/drivers/cpufreq/Kconfig.arm
>>>>> @@ -34,6 +34,7 @@ config ARM_EXYNOS_CPUFREQ
>>>>>
>>>>>    config ARM_EXYNOS4210_CPUFREQ
>>>>>    	bool "Samsung EXYNOS4210"
>>>>> +	depends on ARCH_EXYNOS
>>>>>    	help
>>>>>    	  This adds the CPUFreq driver for Samsung EXYNOS4210
>>>>>    	  SoC (S5PV310 or S5PC210).
>>>>>
>>>>
>>>> Yes, you're right. Should be added it.
>>>> BTW, how about following?
>>>>
>>>> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
>>>> index e0664fe..a5e0487 100644
>>>> --- a/drivers/cpufreq/Kconfig.arm
>>>> +++ b/drivers/cpufreq/Kconfig.arm
>>>> @@ -33,7 +33,7 @@ config ARM_EXYNOS_CPUFREQ
>>>>            If in doubt, say N.
>>>>
>>>>   config ARM_EXYNOS4210_CPUFREQ
>>>> -       bool "Samsung EXYNOS4210"
>>>> +       bool
>>>>          help
>>>>            This adds the CPUFreq driver for Samsung EXYNOS4210
>>>>            SoC (S5PV310 or S5PC210).
>>>>
>>>> I think, when selecting "ARM_EXYNOS_CPUFREQ", "ARM_EXYNOS4210_CPUFREQ"
>>>> will be selected on EXYNOS4210 with above changes.
>>>
>> Hi Russell,
>>
>>> I don't think so.  If you select this symbol you'll get a complaint
>>> that CPU_FREQ is not selected.
>>
>> Hmm..when I selected this symbol, I didn't get any warning about CPU_FREQ,
>> because the cpufreq/Kconfig.arm depends on CPU_FREQ. It means, when CPU_FREQ
>> is not selected, I can't select anything in cpufreq/Kconfig.arm.
>>
>>> What's probably much better is:
>>>
>> Yes, looks better than mine.
>>
>>> config ARM_EXYNOS4210_CPUFREQ
>>> 	def_bool ARCH_EXYNOS
>>
>> But, should be...
>> 	def_bool CPU_EXYNOS4210
>>
>> Because the ARM_EXYNOS4210_CPUFREQ is only for EXYNOS4210 and the
>> ARM_EXYNOS4X12_CPUFREQ will be added, actually submitted for other
>> SOC_EXYNOS4212 and SOC_EXYNOS4412.
>>
>>>
>>> because that ensures that if the CPU_FREQ dependencies change you don't
>>> have to update numerous places for that too.
>>
>> OK, I agree.
>>
>> So could you  please re-send/re-work this?
>
> As predicted, this is breaking other ARM platforms.  Please fix this
> yourself before your crappy code gets pushed into mainline.  Thanks.
>
I fixed it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
