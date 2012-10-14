From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq, powernow-k8: Remove usage of smp_processor_id() in preemptible code
Date: Sun, 14 Oct 2012 10:27:22 +0200
Message-ID: <27008283.MeT6T60WP8@vostro.rjw.lan>
References: <20121009193844.GC7724@alberich> <20121010124839.GA22448@alberich> <20121012151841.GA4571@alberich>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20121012151841.GA4571@alberich>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Herrmann <andreas.herrmann3@amd.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-pm@vger.kernel.org

Hi,

Thanks for the patch!  I'll queue it up for v3.7 when I get back home from
the current trip (around the -rc3 time frame I suppose).

In future please don't send patches directly to stable@vger.kernel.org.
That doesn't make -stable pick them up anyway and confuses things.

Thanks,
Rafael


On Friday 12 of October 2012 17:18:41 Andreas Herrmann wrote:
> 
> Commit 6889125b8b4e09c5e53e6ecab3433bed1ce198c9
> (cpufreq/powernow-k8: workqueue user shouldn't migrate the kworker to another CPU)
> causes powernow-k8 to trigger a preempt warning, e.g.:
> 
>   BUG: using smp_processor_id() in preemptible [00000000] code: cpufreq/3776
>   caller is powernowk8_target+0x20/0x49
>   Pid: 3776, comm: cpufreq Not tainted 3.6.0 #9
>   Call Trace:
>    [<ffffffff8125b447>] debug_smp_processor_id+0xc7/0xe0
>    [<ffffffff814877e7>] powernowk8_target+0x20/0x49
>    [<ffffffff81482b02>] __cpufreq_driver_target+0x82/0x8a
>    [<ffffffff81484fc6>] cpufreq_governor_performance+0x4e/0x54
>    [<ffffffff81482c50>] __cpufreq_governor+0x8c/0xc9
>    [<ffffffff81482e6f>] __cpufreq_set_policy+0x1a9/0x21e
>    [<ffffffff814839af>] store_scaling_governor+0x16f/0x19b
>    [<ffffffff81484f16>] ? cpufreq_update_policy+0x124/0x124
>    [<ffffffff8162b4a5>] ? _raw_spin_unlock_irqrestore+0x2c/0x49
>    [<ffffffff81483640>] store+0x60/0x88
>    [<ffffffff811708c0>] sysfs_write_file+0xf4/0x130
>    [<ffffffff8111243b>] vfs_write+0xb5/0x151
>    [<ffffffff811126e0>] sys_write+0x4a/0x71
>    [<ffffffff816319a9>] system_call_fastpath+0x16/0x1b
> 
> Fix this by by always using work_on_cpu().
> 
> Cc: Tejun Heo <tj@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>
> ---
>  drivers/cpufreq/powernow-k8.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
> index 129e80b..c16a3a5 100644
> --- a/drivers/cpufreq/powernow-k8.c
> +++ b/drivers/cpufreq/powernow-k8.c
> @@ -1052,14 +1052,7 @@ static int powernowk8_target(struct cpufreq_policy *pol,
>  	struct powernowk8_target_arg pta = { .pol = pol, .targfreq = targfreq,
>  					     .relation = relation };
>  
> -	/*
> -	 * Must run on @pol->cpu.  cpufreq core is responsible for ensuring
> -	 * that we're bound to the current CPU and pol->cpu stays online.
> -	 */
> -	if (smp_processor_id() == pol->cpu)
> -		return powernowk8_target_fn(&pta);
> -	else
> -		return work_on_cpu(pol->cpu, powernowk8_target_fn, &pta);
> +	return work_on_cpu(pol->cpu, powernowk8_target_fn, &pta);
>  }
>  
>  /* Driver entry point to verify the policy and range of frequencies */
> 
-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
