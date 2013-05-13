From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH] cpufreq / intel_pstate: use vzalloc() instead of vmalloc()/memset(0)
Date: Mon, 13 May 2013 07:44:49 -0700
Message-ID: <5190FC61.8090709@gmail.com>
References: <CAPgLHd9Z99KvdBghVqr++9G5eBx5hKA13LmPUpc=K_X3N+uhiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=i6sgYPAHFamSU1NwkD6wHWs2s/YM+snBHIueVrKNggc=;
        b=j+bAfUKLe68WIgaFVzij4FBnohJ4lKPXq1gL02ecnobTj8fyUpCJy8ndJURxRxWUEy
         aQ7dq/FXl+GxaKB23TVfwPqVaWLguStI6GCpR0czYDN8utyFyxJ3fpogmfeF1DjtP3+2
         8TTsQY4mup5n6WBwOlMmJ1yWMEPszIG6pdZYv3ZzfEiq0E96Tfa24SPgzCwaIqgRInld
         WpOA8X6T3ME5R/MhyL+Rvk6BXaRR+xHYCaFXaD0mi45FLtEsrwX4bWP8bN+pBQdizEBs
         wwVLLy9GLDridgWXMRXHABDu9+CeH6fMNjuRz71mrDrPDDXSMbezkL3dQgaONqjbHH+F
         0fBA==
In-Reply-To: <CAPgLHd9Z99KvdBghVqr++9G5eBx5hKA13LmPUpc=K_X3N+uhiQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: rjw@sisk.pl, viresh.kumar@linaro.org, yongjun_wei@trendmicro.com.cn, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, dirk.brandewie@gmail.com

On 05/13/2013 01:03 AM, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Use vzalloc() instead of vmalloc() and memset(0).
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Acked-by: Dirk Brandewie <dirk.j.brandewie@intel.com>

> ---
>   drivers/cpufreq/intel_pstate.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index cc3a8e6..f59aecb 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -788,10 +788,9 @@ static int __init intel_pstate_init(void)
>
>   	pr_info("Intel P-state driver initializing.\n");
>
> -	all_cpu_data = vmalloc(sizeof(void *) * num_possible_cpus());
> +	all_cpu_data = vzalloc(sizeof(void *) * num_possible_cpus());
>   	if (!all_cpu_data)
>   		return -ENOMEM;
> -	memset(all_cpu_data, 0, sizeof(void *) * num_possible_cpus());
>
>   	rc = cpufreq_register_driver(&intel_pstate_driver);
>   	if (rc)
>
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

