From: "Mohammed, Afzal" <afzal@ti.com>
Subject: RE: [PATCH 1/2] cpufreq:userspace: fix cpu_cur_freq updation
Date: Wed, 4 Jan 2012 07:51:01 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A9033954@DBDE01.ent.ti.com>
References: <1325654551-14169-1-git-send-email-afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1325654551-14169-1-git-send-email-afzal@ti.com>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Hi,

Forwarding as the original is not yet seen in cpufreq archives.

Regards
Afzal

On Wed, Jan 04, 2012 at 10:52:31, Mohammed, Afzal wrote:
> CPU frequency is guranteed to be changed on notifier callback with
> CPUFREQ_POSTCHANGE. Notifier callback with CPUFREQ_PRECHANGE does
> not gurantee a change in frequency; after it, if cpufreq driver is
> unable to change CPU to new frequency. This results in wrong
> information being fed to user (if setting CPU frequency fails)
> upon doing like,
> 
> cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> 
> Hence in userspace governer update cpu_cur_freq only if notifier
> has been called with POSTCHANGE.
> 
> Signed-off-by: Afzal Mohammed <afzal@ti.com>
> ---
>  drivers/cpufreq/cpufreq_userspace.c |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_userspace.c b/drivers/cpufreq/cpufreq_userspace.c
> index f231015..bedac1a 100644
> --- a/drivers/cpufreq/cpufreq_userspace.c
> +++ b/drivers/cpufreq/cpufreq_userspace.c
> @@ -47,9 +47,11 @@ userspace_cpufreq_notifier(struct notifier_block *nb, unsigned long val,
>  	if (!per_cpu(cpu_is_managed, freq->cpu))
>  		return 0;
>  
> -	pr_debug("saving cpu_cur_freq of cpu %u to be %u kHz\n",
> -			freq->cpu, freq->new);
> -	per_cpu(cpu_cur_freq, freq->cpu) = freq->new;
> +	if (val == CPUFREQ_POSTCHANGE) {
> +		pr_debug("saving cpu_cur_freq of cpu %u to be %u kHz\n",
> +				freq->cpu, freq->new);
> +		per_cpu(cpu_cur_freq, freq->cpu) = freq->new;
> +	}
>  
>  	return 0;
>  }
> -- 
> 1.7.1
> 
> 

