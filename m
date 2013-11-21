From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH V2] Cpufreq: Make governor data on nonboot cpus across system suspend/resume
Date: Thu, 21 Nov 2013 15:43:59 +0100
Message-ID: <2383693.rhJDd9X40m@vostro.rjw.lan>
References: <9847309.KdKOG5y1Zx@vostro.rjw.lan> <1384616184-6197-1-git-send-email-tianyu.lan@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1384616184-6197-1-git-send-email-tianyu.lan@intel.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lan Tianyu <tianyu.lan@intel.com>
Cc: viresh.kumar@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Saturday, November 16, 2013 11:36:24 PM Lan Tianyu wrote:
> Currently, governor of nonboot cpus will be put to EXIT when system suspend.
> Since all these cpus will be unplugged and the governor usage_count decreases
> to zero. The governor data and its sysfs interfaces will be freed or released.
> This makes user config of these governors loss during suspend and resume.
> 
> This doesn't happen on the governor covering boot cpu because it isn't
> unplugged during system suspend.
> 
> To fix this issue, skipping governor exit during system suspend and check
> policy governor data to determine whether the governor is really needed
> to be initialized when do init. If not, return EALREADY to indicate the
> governor has been initialized and should do nothing. __cpufreq_governor()
> convert EALREADY to 0 as return value for INIT event since governor is
> still under INIT state and can do START operation.
> 
> Signed-off-by: Lan Tianyu <tianyu.lan@intel.com>
> ---
> Change since v1:
> 	Change coding style.
> 
>  drivers/cpufreq/cpufreq.c          | 10 +++++++---
>  drivers/cpufreq/cpufreq_governor.c | 13 ++++++++++++-
>  2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 02d534d..73ad593 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1239,7 +1239,7 @@ static int __cpufreq_remove_dev_finish(struct device *dev,
>  
>  	/* If cpu is last user of policy, free policy */
>  	if (cpus == 1) {
> -		if (has_target()) {
> +		if (has_target() && !frozen) {
>  			ret = __cpufreq_governor(policy,
>  					CPUFREQ_GOV_POLICY_EXIT);
>  			if (ret) {
> @@ -1818,9 +1818,13 @@ static int __cpufreq_governor(struct cpufreq_policy *policy,
>  		mutex_unlock(&cpufreq_governor_lock);
>  	}
>  
> -	if (((event == CPUFREQ_GOV_POLICY_INIT) && ret) ||

The inner parens are not necessary.

> -			((event == CPUFREQ_GOV_POLICY_EXIT) && !ret))
> +	if ((event == CPUFREQ_GOV_POLICY_INIT) && ret) {

Same here.

> +		module_put(policy->governor->owner);
> +		if (ret == -EALREADY)
> +			return 0;
> +	} else if ((event == CPUFREQ_GOV_POLICY_EXIT) && !ret) {

Same here.

>  		module_put(policy->governor->owner);
> +	}

Can you please combine these checks with the checks made right after
calling policy->governor->governor() as indicated by Viresh?

Rafael

