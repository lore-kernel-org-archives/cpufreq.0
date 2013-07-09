From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH] intel_pstate: Add Haswell CPU models
Date: Tue, 09 Jul 2013 07:54:04 -0700
Message-ID: <51DC240C.3090404@intel.com>
References: <51CD8087.7030303@spicious.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=CmEC2nPP4qBuUevfKAAw19Gl0eU9sjpVTpM1agkVdaM=;
        b=NHADYiP6FywzO6IzCIeNnXE4iEu/dA3RI2K9SCAvJF8B0M4OxAW4V3oxgxovrE2mRC
         3b+YE9ijClPD/n37hbqCBiVkI7oRPHwbwuWqxunNqQcH+3p269R7vlPBlr2tJrEh/SE/
         JQTJIZRkvVRQmswTdxqxUXPM0CY0B9SijheX5C4KLxCV0foCJycDAVqwWCH1TtHHIDZF
         f4l+OlpqEElJ3Yj/rVnxoouoLXc7GNGY2XsRlNXZVsBfwuovsbl2aw6sLbykVWqwxVyo
         nCIQ3Fuct2+dxDdwBZwAbhM7f5+kg2VdDrA5yC4MeM3RsUvcYLzIxXQToywhCD6MhO61
         RCYA==
In-Reply-To: <51CD8087.7030303@spicious.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nell Hardcastle <nell@spicious.com>
Cc: cpufreq@vger.kernel.org, dirk.j.brandewie@intel.com

On 06/28/2013 05:24 AM, Nell Hardcastle wrote:
> Enable the intel_pstate driver for Haswell CPUs and one Ivy Bridge model not already included (0x3E). I've been testing this change on the Core i5-4200u (model 0x45) and I referenced the list of models in tools/power/x86/turbostat/turbostat.c:has_nehalem_turbo_ratio_limit to determine the others.
>
> Fixes https://bugzilla.kernel.org/show_bug.cgi?id=60211
>
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

Nak for now.

We have not completed our testing on these CPUs. I would like to
get my testing done before I start seeing issues from the field come
in.

If this patch were to hangout in testing for a while it would not
hurt my feelings there it could only hurt those that knew what
they were getting into :-)


--Dirk
>   	{}
>   };
>   MODULE_DEVICE_TABLE(x86cpu, intel_pstate_cpu_ids);
>

