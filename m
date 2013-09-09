From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH V2] intel_pstate: Add Haswell CPU models
Date: Mon, 09 Sep 2013 09:39:27 -0700
Message-ID: <522DF9BF.3060900@gmail.com>
References: <51D0B831.3000707@spicious.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=yup+sjKBOfr1AfOUt7un4f6x8lPJ7CKLYDNuLELl0b4=;
        b=CYwuICdjKgXforKHCKkmUTBzFDJ/8e6MkAwzMdVc7/+YXXUoQh65cY+AawrigjJO1P
         uiJ6KDa0ZoTFsDdVGpMrSYgxmFouEEQ2ntnDN9/JEju8la4pHQV9QTnvnfAciZ48Q+Ii
         53oQ7qBunI3080n1TgdgNkqimDgZ3h+pPaouZtrRNqa1Htkgm3dBVlf5lRhUmWolDHEG
         OS1WfhIvxvBK9PkcFMTffDiVmuaqD4q179Xnhd01lQukj0AvYmwCHchLd+taWmhaalTB
         Au7aWimyvPJ0X5A2T1fPiYhft0PDvDBzHrNrLK2I6lulMoEauqLF8wLRCs41sR78eq/h
         kHpA==
In-Reply-To: <51D0B831.3000707@spicious.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nell Hardcastle <nell@spicious.com>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, dirk.j.brandewie@intel.com, dirk.brandewie@gmail.com

On 06/30/2013 03:58 PM, Nell Hardcastle wrote:
> Enable the intel_pstate driver for Haswell CPUs. One missing Ivy Bridge
> model (0x3E) is also included. Models referenced from
> tools/power/x86/turbostat/turbostat.c:has_nehalem_turbo_ratio_limit
>

Acked-by: Dirk Brandewie <dirk.j.brandewie@intel.com>

> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Nell Hardcastle <nell@spicious.com>
> ---
>   drivers/cpufreq/intel_pstate.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index 07f2840..dbd1032 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -522,6 +522,11 @@ static const struct x86_cpu_id intel_pstate_cpu_ids[] = {
>   	ICPU(0x2a, default_policy),
>   	ICPU(0x2d, default_policy),
>   	ICPU(0x3a, default_policy),
> +	ICPU(0x3c, default_policy),
> +	ICPU(0x3e, default_policy),
> +	ICPU(0x3f, default_policy),
> +	ICPU(0x45, default_policy),
> +	ICPU(0x46, default_policy),
>   	{}
>   };
>   MODULE_DEVICE_TABLE(x86cpu, intel_pstate_cpu_ids);
>

