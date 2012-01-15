From: mark gross <markgross@thegnar.org>
Subject: Re: [PATCH v2 2/8] PM QoS: Add CPU frequency minimum as PM QoS param
Date: Sat, 14 Jan 2012 20:46:06 -0800
Message-ID: <20120115044606.GB2409@mgross-G62>
References: <1326459559-5436-1-git-send-email-amiettinen@nvidia.com>
 <1326459559-5436-3-git-send-email-amiettinen@nvidia.com>
Reply-To: markgross@thegnar.org
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=6ufeeuRn+c9fVl4saOp3DD/RgD9YSNFU6tHVTCc8HTk=;
        b=h4qPLMt0JMPfLV1ih4nNUVG7Lm0RD+ubPOyktnnCK9i8Z2J+dD70mvmLmmjp1+mIlZ
         khIqxhQarW1wIeWDFB7wHXfsIXEighFDZM45LUrFeS15PYJMX+g0ARYxVINavANVScuI
         xH8Dn5HuMOznDd7qvDOA0RK5fzeTAd3bwgpcY=
Content-Disposition: inline
In-Reply-To: <1326459559-5436-3-git-send-email-amiettinen@nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti P Miettinen <amiettinen@nvidia.com>
Cc: davej@redhat.com, cpufreq@vger.kernel.org, pavel@ucw.cz, rjw@sisk.pl, len.brown@intel.com, linux-pm@vger.kernel.org, mgross@linux.intel.com

For some reason git am doesn't work with this so I had to use patch by
hand.



On Fri, Jan 13, 2012 at 02:59:13PM +0200, Antti P Miettinen wrote:
> Add minimum CPU frequency as PM QoS parameter.
> 
> Signed-off-by: Antti P Miettinen <amiettinen@nvidia.com>
> ---
>  include/linux/pm_qos.h |    3 +++
>  kernel/power/qos.c     |   17 ++++++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletions(-)
> 
> diff --git a/include/linux/pm_qos.h b/include/linux/pm_qos.h
> index 5ac91d8..54a0d00 100644
> --- a/include/linux/pm_qos.h
> +++ b/include/linux/pm_qos.h
> @@ -14,8 +14,10 @@ enum {
>  	PM_QOS_CPU_DMA_LATENCY,
>  	PM_QOS_NETWORK_LATENCY,
>  	PM_QOS_NETWORK_THROUGHPUT,
> +	PM_QOS_CPU_FREQ_MIN,
>  
>  	/* insert new class ID */
> +
>  	PM_QOS_NUM_CLASSES,
>  };
>  
> @@ -25,6 +27,7 @@ enum {
>  #define PM_QOS_NETWORK_LAT_DEFAULT_VALUE	(2000 * USEC_PER_SEC)
>  #define PM_QOS_NETWORK_THROUGHPUT_DEFAULT_VALUE	0
>  #define PM_QOS_DEV_LAT_DEFAULT_VALUE		0
> +#define PM_QOS_CPU_FREQ_MIN_DEFAULT_VALUE	0
Perhaps "#define PM_QOS_CPU_FREQ_MIN_DEFAULT_KHZ	0" might be
more descriptive.

Its nice to have the code a bit self documenting and we are missing any
comments on what units the FREQ are in.  (they are in the same units
that cpufreq uses.  KHz)

Also we need to update the Documentation/power/pm_qos_interface.txt
to explain cpu_freq_min's units.

other than this (and the git am issue) this looks good to me.

--mark
>  
>  struct pm_qos_request {
>  	struct plist_node node;
> diff --git a/kernel/power/qos.c b/kernel/power/qos.c
> index d6d6dbd..07d761a 100644
> --- a/kernel/power/qos.c
> +++ b/kernel/power/qos.c
> @@ -101,11 +101,26 @@ static struct pm_qos_object network_throughput_pm_qos = {
>  };
>  
>  
> +static BLOCKING_NOTIFIER_HEAD(cpu_freq_min_notifier);
> +static struct pm_qos_constraints cpu_freq_min_constraints = {
> +	.list = PLIST_HEAD_INIT(cpu_freq_min_constraints.list),
> +	.target_value = PM_QOS_CPU_FREQ_MIN_DEFAULT_VALUE,
> +	.default_value = PM_QOS_CPU_FREQ_MIN_DEFAULT_VALUE,
> +	.type = PM_QOS_MAX,
> +	.notifiers = &cpu_freq_min_notifier,
> +};
> +static struct pm_qos_object cpu_freq_min_pm_qos = {
> +	.constraints = &cpu_freq_min_constraints,
> +	.name = "cpu_freq_min",
> +};
> +
> +
>  static struct pm_qos_object *pm_qos_array[] = {
>  	&null_pm_qos,
>  	&cpu_dma_pm_qos,
>  	&network_lat_pm_qos,
> -	&network_throughput_pm_qos
> +	&network_throughput_pm_qos,
> +	&cpu_freq_min_pm_qos,
>  };
>  
>  static ssize_t pm_qos_power_write(struct file *filp, const char __user *buf,
> -- 
> 1.7.4.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
