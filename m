From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Fix exposure of ARM_EXYNOS4210_CPUFREQ
Date: Thu, 16 Feb 2012 16:02:50 +0000
Message-ID: <20120216160250.GP13673@n2100.arm.linux.org.uk>
References: <20120213094940.GA15338@n2100.arm.linux.org.uk> <4F3CF3DA.7000806@samsung.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=6EPTuE5MxO/EWhThFReLlZOqVOxmI62GuWebtaNqxg0=;
	b=RIDU2nqfTYAukxGthy7H2HbLSjTNzFTeUZkkgaRp294hUWTrIbBmFzeNcDnESl/2ybXaGvbKMFmy57KV/HVUZRESiBBxtAUFiBqoIVv+uHMvIeTDjntLnN7/pXuGOVGtJO+pPGOPo6rk1jRjrvVZw4qjbwrWhlLBObMbamnqm74=;
Content-Disposition: inline
In-Reply-To: <4F3CF3DA.7000806@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

On Thu, Feb 16, 2012 at 09:17:30PM +0900, Kukjin Kim wrote:
> On 02/13/12 18:49, Russell King - ARM Linux wrote:
>> From: Russell King<rmk+kernel@arm.linux.org.uk>
>>
>> exynos4210-cpufreq.c is not buildable on non-exynos builds, so it's
>> pointless allowing this option to be exposed.  Fix this by adding a
>> dependency on ARCH_EXYNOS.
>>
>> drivers/cpufreq/exynos4210-cpufreq.c:20:29: error: mach/regs-clock.h: No such file or directory
>> drivers/cpufreq/exynos4210-cpufreq.c:21:26: error: mach/cpufreq.h: No such file or directory
>>
>> Signed-off-by: Russell King<rmk+kernel@arm.linux.org.uk>
>> Cc: Dave Jones<davej@redhat.com>
>> Cc: cpufreq@vger.kernel.org
>> Cc: Kukjin Kim<kgene.kim@samsung.com>
>> ---
>>   drivers/cpufreq/Kconfig.arm |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
>> index e0664fe..c8bde43 100644
>> --- a/drivers/cpufreq/Kconfig.arm
>> +++ b/drivers/cpufreq/Kconfig.arm
>> @@ -34,6 +34,7 @@ config ARM_EXYNOS_CPUFREQ
>>
>>   config ARM_EXYNOS4210_CPUFREQ
>>   	bool "Samsung EXYNOS4210"
>> +	depends on ARCH_EXYNOS
>>   	help
>>   	  This adds the CPUFreq driver for Samsung EXYNOS4210
>>   	  SoC (S5PV310 or S5PC210).
>>
>
> Yes, you're right. Should be added it.
> BTW, how about following?
>
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index e0664fe..a5e0487 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -33,7 +33,7 @@ config ARM_EXYNOS_CPUFREQ
>           If in doubt, say N.
>
>  config ARM_EXYNOS4210_CPUFREQ
> -       bool "Samsung EXYNOS4210"
> +       bool
>         help
>           This adds the CPUFreq driver for Samsung EXYNOS4210
>           SoC (S5PV310 or S5PC210).
>
> I think, when selecting "ARM_EXYNOS_CPUFREQ", "ARM_EXYNOS4210_CPUFREQ"  
> will be selected on EXYNOS4210 with above changes.

I don't think so.  If you select this symbol you'll get a complaint
that CPU_FREQ is not selected.  What's probably much better is:

config ARM_EXYNOS4210_CPUFREQ
	def_bool ARCH_EXYNOS

because that ensures that if the CPU_FREQ dependencies change you don't
have to update numerous places for that too.
