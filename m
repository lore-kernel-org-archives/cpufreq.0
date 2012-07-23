From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] conservative: Initialise the cpu field of the this_dbs_info
Date: Mon, 23 Jul 2012 12:23:04 +0200
Message-ID: <201207231223.04620.rjw@sisk.pl>
References: <1343028920-4712-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1343028920-4712-1-git-send-email-amit.daniel@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, amit.kachhap@linaro.org, linux-kernel@vger.kernel.org

On Monday, July 23, 2012, Amit Daniel Kachhap wrote:
> This patch initialises the cpu field of this_dbs_info structure. This
> change is similar to existing ondemand governor.

Why do you think the change is needed?

Rafael


> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
>  drivers/cpufreq/cpufreq_conservative.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
> index 235a340..a1563d7 100644
> --- a/drivers/cpufreq/cpufreq_conservative.c
> +++ b/drivers/cpufreq/cpufreq_conservative.c
> @@ -504,6 +504,7 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
>  				j_dbs_info->prev_cpu_nice =
>  						kcpustat_cpu(j).cpustat[CPUTIME_NICE];
>  		}
> +		this_dbs_info->cpu = cpu;
>  		this_dbs_info->down_skip = 0;
>  		this_dbs_info->requested_freq = policy->cur;
>  
> 

