From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH 1/1] cpufreq: intel_pstate: skip the driver if ACPI has
 power mgmt option
Date: Mon, 21 Oct 2013 09:03:07 -0700
Message-ID: <5265503B.7000804@gmail.com>
References: <1382333227-28231-1-git-send-email-adrian.huang@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=mA4jIgcEApCm9DflrrE8wVfYMKeL+oObkhcxeNsuYIM=;
        b=qZKPp+TudvaDddZpCj6z9G+kl9AYpZhp7rjXhObSgDXjSnjsASl0zXb3r3yvek1CPD
         1OG2rXCh9Jb7okKkh4BpWL9HCGvzW98GmEp7xguijv3avkxeMp52AKJIBj/Gjp9r1jOZ
         abeGX1pl+YOC5Cu/X2m5M31hokqPFAK5a1GL8CyJbCpWTQv0ymKsyyof/lZIZlF1fXIJ
         wYzy/L0iNCjnHiM9Ye6a5oTX5/z2E5MeqpTk4Mqb9hB/sObFyC4Bv645iXzjpOI421iX
         5AE327D0dkyYNiwsCzSMiGlN4Xdf2UPs0J4j/Xjcmr0+0JAUlcZcNqJbuw8VNof/KTQg
         d92g==
In-Reply-To: <1382333227-28231-1-git-send-email-adrian.huang@hp.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Huang <adrian.huang@hp.com>, rjw@rjwysocki.net, viresh.kumar@linaro.org
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linda.knippers@hp.com

On 10/20/2013 10:27 PM, Adrian Huang wrote:
>   static int __init intel_pstate_init(void)
>   {
>   	int cpu, rc = 0;
> @@ -708,6 +779,15 @@ static int __init intel_pstate_init(void)
>   	if (no_load)
>   		return -ENODEV;
>
> +	if (!acpi_disabled) {
> +		/*
> +		 * Check if the platform has its own power management modes.
> +		 * If so, the pstate cpufreq driver will be ignored.
> +		 */
> +		if (intel_pstate_platform_pwr_mgmt_exists())
> +			return 0;

Please return -ENODEV here instead of 0

> +	}
> +
>   	id = x86_match_cpu(intel_pstate_cpu_ids);
>   	if (!id)
>   		return -ENODEV;
>

