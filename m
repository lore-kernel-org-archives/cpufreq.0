From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH] cpufreq: Avoid double kobject_put() for the same kobject
 in error code path
Date: Fri, 02 Aug 2013 12:24:01 +0530
Message-ID: <51FB5789.6030401@linux.vnet.ibm.com>
References: <2204970.DYsqYi7YjZ@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <2204970.DYsqYi7YjZ@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Linux PM list <linux-pm@vger.kernel.org>, cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>

On 08/02/2013 03:01 AM, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> The only case triggering a jump to the err_out_unregister label in
> __cpufreq_add_dev() is when cpufreq_add_dev_interface() fails.
> However, if cpufreq_add_dev_interface() fails, it calls kobject_put()
> for the policy kobject in its error code path and since that causes
> the kobject's refcount to become 0, the additional kobject_put() for
> the same kobject under err_out_unregister and the
> wait_for_completion() following it are pointless, so drop them.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>

Regards,
Srivatsa S. Bhat

> ---
>  drivers/cpufreq/cpufreq.c |    3 ---
>  1 file changed, 3 deletions(-)
> 
> Index: linux-pm/drivers/cpufreq/cpufreq.c
> ===================================================================
> --- linux-pm.orig/drivers/cpufreq/cpufreq.c
> +++ linux-pm/drivers/cpufreq/cpufreq.c
> @@ -1109,9 +1109,6 @@ err_out_unregister:
>  	}
>  	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
> 
> -	kobject_put(&policy->kobj);
> -	wait_for_completion(&policy->kobj_unregister);
> -
>  err_set_policy_cpu:
>  	per_cpu(cpufreq_policy_cpu, cpu) = -1;
>  	cpufreq_policy_free(policy);
> 

