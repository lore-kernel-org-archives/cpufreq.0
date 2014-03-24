From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH] intel_pstate:  Use del_timer_sync in intel_pstate_cpu_stop
Date: Mon, 24 Mar 2014 20:24:29 +0530
Message-ID: <53304725.3000900@linux.vnet.ibm.com>
References: <1395672089-19336-1-git-send-email-dirk.j.brandewie@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1395672089-19336-1-git-send-email-dirk.j.brandewie@intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, cpufreq <cpufreq@vger.kernel.org>

On 03/24/2014 08:11 PM, dirk.brandewie@gmail.com wrote:
> From: Dirk Brandewie <dirk.j.brandewie@intel.com>
> 
> Ensure that no timer callback is running since we are about to free
> the timer structure.  We cannot guarantee that the call back is called
> on the CPU where the timer is running.
> 
> Reported-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: cpufreq <cpufreq@vger.kernel.org>

Reviewed-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>

Regards,
Srivatsa S. Bhat

> ---
>  drivers/cpufreq/intel_pstate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index e9092fd..a4a9ba5 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -780,7 +780,7 @@ static int intel_pstate_cpu_stop(struct cpufreq_policy *policy)
> 
>  	pr_info("intel_pstate CPU %d exiting\n", cpu_num);
> 
> -	del_timer(&all_cpu_data[cpu_num]->timer);
> +	del_timer_sync(&all_cpu_data[cpu_num]->timer);
>  	intel_pstate_set_pstate(cpu, cpu->pstate.min_pstate);
>  	kfree(all_cpu_data[cpu_num]);
>  	all_cpu_data[cpu_num] = NULL;
> 

