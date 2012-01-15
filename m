From: mark gross <markgross@thegnar.org>
Subject: Re: [PATCH v2 5/8] cpufreq: Enforce PM QoS minimum limit
Date: Sat, 14 Jan 2012 20:51:01 -0800
Message-ID: <20120115045101.GC2409@mgross-G62>
References: <1326459559-5436-1-git-send-email-amiettinen@nvidia.com>
 <1326459559-5436-6-git-send-email-amiettinen@nvidia.com>
Reply-To: markgross@thegnar.org
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=iELKUfYvHENlPnBCsHgM5t4GOW4JeYAWVGyC5rf3dl8=;
        b=NgeIsCa0dvoN1d00JAgjP6JbbDwkcvVkttYqwYMj2xZoLfQIklD8Mu/YxDBEyjUB7f
         Ve64/nvJNRz9hgB1MbfvYhU3WTlWNnphurfeJws2QJRHE1shMC5wOrNjBK+tsyy9JI7/
         QGBR4NJLWrm0kTEAG2A7udXyfaf7OfuaDbhLU=
Content-Disposition: inline
In-Reply-To: <1326459559-5436-6-git-send-email-amiettinen@nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti P Miettinen <amiettinen@nvidia.com>
Cc: davej@redhat.com, cpufreq@vger.kernel.org, pavel@ucw.cz, rjw@sisk.pl, len.brown@intel.com, linux-pm@vger.kernel.org, mgross@linux.intel.com

git am doesn't work with most of your patchset for me.

Tested-by: markgross <markgross@thegnar.org>
seems to work on my i5 laptop.

Looks good to me.

--mark

On Fri, Jan 13, 2012 at 02:59:16PM +0200, Antti P Miettinen wrote:
> Observe PM QoS CPU frequency minimum in addition
> to policy settings.
> 
> Signed-off-by: Antti P Miettinen <amiettinen@nvidia.com>
> ---
>  drivers/cpufreq/cpufreq.c |   41 +++++++++++++++++++++++++++++++++++++++--
>  1 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 127e37a..c2c1c62 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -29,6 +29,7 @@
>  #include <linux/completion.h>
>  #include <linux/mutex.h>
>  #include <linux/syscore_ops.h>
> +#include <linux/pm_qos.h>
>  
>  #include <trace/events/power.h>
>  
> @@ -1633,9 +1634,16 @@ static int __cpufreq_set_policy(struct cpufreq_policy *data,
>  				struct cpufreq_policy *policy)
>  {
>  	int ret = 0;
> +	unsigned int pmin = policy->min;
> +	unsigned int pmax = policy->max;
> +	unsigned int qmin = min(pm_qos_request(PM_QOS_CPU_FREQ_MIN),
> +				data->max);
>  
> -	pr_debug("setting new policy for CPU %u: %u - %u kHz\n", policy->cpu,
> -		policy->min, policy->max);
> +	pr_debug("setting new policy for CPU %u: %u/%u - %u kHz\n",
> +		 policy->cpu, pmin, qmin, pmax);
> +
> +	/* clamp the new policy to PM QoS limits */
> +	policy->min = max(pmin, qmin);
>  
>  	memcpy(&policy->cpuinfo, &data->cpuinfo,
>  				sizeof(struct cpufreq_cpuinfo));
> @@ -1710,6 +1718,9 @@ static int __cpufreq_set_policy(struct cpufreq_policy *data,
>  	}
>  
>  error_out:
> +	/* restore the limits that the policy requested */
> +	policy->min = pmin;
> +	policy->max = pmax;
>  	return ret;
>  }
>  
> @@ -1903,9 +1914,32 @@ int cpufreq_unregister_driver(struct cpufreq_driver *driver)
>  }
>  EXPORT_SYMBOL_GPL(cpufreq_unregister_driver);
>  
> +static int cpu_freq_notify(struct notifier_block *b,
> +			   unsigned long l, void *v);
> +
> +static struct notifier_block min_freq_notifier = {
> +	.notifier_call = cpu_freq_notify,
> +};
> +
> +static int cpu_freq_notify(struct notifier_block *b,
> +			   unsigned long l, void *v)
> +{
> +	int cpu;
> +	pr_debug("PM QoS min %lu\n", l);
> +	for_each_online_cpu(cpu) {
> +		struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> +		if (policy) {
> +			cpufreq_update_policy(policy->cpu);
> +			cpufreq_cpu_put(policy);
> +		}
> +	}
> +	return NOTIFY_OK;
> +}
> +
>  static int __init cpufreq_core_init(void)
>  {
>  	int cpu;
> +	int rc;
>  
>  	for_each_possible_cpu(cpu) {
>  		per_cpu(cpufreq_policy_cpu, cpu) = -1;
> @@ -1915,6 +1949,9 @@ static int __init cpufreq_core_init(void)
>  	cpufreq_global_kobject = kobject_create_and_add("cpufreq", &cpu_subsys.dev_root->kobj);
>  	BUG_ON(!cpufreq_global_kobject);
>  	register_syscore_ops(&cpufreq_syscore_ops);
> +	rc = pm_qos_add_notifier(PM_QOS_CPU_FREQ_MIN,
> +				 &min_freq_notifier);
> +	BUG_ON(rc);
>  
>  	return 0;
>  }
> -- 
> 1.7.4.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
