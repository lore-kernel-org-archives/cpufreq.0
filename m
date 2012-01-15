From: mark gross <markgross@thegnar.org>
Subject: Re: [PATCH v2 1/8] PM QoS: Simplify PM QoS expansion/merge
Date: Sat, 14 Jan 2012 20:37:02 -0800
Message-ID: <20120115043701.GA2409@mgross-G62>
References: <1326459559-5436-1-git-send-email-amiettinen@nvidia.com>
 <1326459559-5436-2-git-send-email-amiettinen@nvidia.com>
Reply-To: markgross@thegnar.org
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=QbkML3aYejXPzHKJ2U0ZesRpQTqXUJct8wbjfS24DNA=;
        b=BpxmdpY0XOZkUVFqSI81AVGy4xALh0vv0i7p+9BopEjtPswn8RgHgKbsrspFE2xQ/f
         7mvtVlq0MSbyIeqw7caA8+QBUjLDxonMiME9zgsrjuw0ck2gFuh+688S0+/eAItQ4Xgb
         nuI3bT3ZnEVaBRQqMYyBJct69do/KJ6eYSd/I=
Content-Disposition: inline
In-Reply-To: <1326459559-5436-2-git-send-email-amiettinen@nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti P Miettinen <amiettinen@nvidia.com>
Cc: davej@redhat.com, cpufreq@vger.kernel.org, pavel@ucw.cz, rjw@sisk.pl, len.brown@intel.com, linux-pm@vger.kernel.org, mgross@linux.intel.com


looks ok.
Signed-off-by: markgross <markgross@thegnar.org>

--mark

On Fri, Jan 13, 2012 at 02:59:12PM +0200, Antti P Miettinen wrote:
> From: Alex Frid <afrid@nvidia.com>
> 
> - Replace class ID #define with enumeration
> - Loop through PM QoS objects during initialization (rather than
>   initializing them one-by-one)
> 
> Signed-off-by: Alex Frid <afrid@nvidia.com>
> Reviewed-by: Antti Miettinen <amiettinen@nvidia.com>
> Reviewed-by: Diwakar Tundlam <dtundlam@nvidia.com>
> Reviewed-by: Scott Williams <scwilliams@nvidia.com>
> Reviewed-by: Yu-Huan Hsu <yhsu@nvidia.com>
> ---
>  include/linux/pm_qos.h |   14 +++++++++-----
>  kernel/power/qos.c     |   23 ++++++++++-------------
>  2 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/include/linux/pm_qos.h b/include/linux/pm_qos.h
> index e5bbcba..5ac91d8 100644
> --- a/include/linux/pm_qos.h
> +++ b/include/linux/pm_qos.h
> @@ -9,12 +9,16 @@
>  #include <linux/miscdevice.h>
>  #include <linux/device.h>
>  
> -#define PM_QOS_RESERVED 0
> -#define PM_QOS_CPU_DMA_LATENCY 1
> -#define PM_QOS_NETWORK_LATENCY 2
> -#define PM_QOS_NETWORK_THROUGHPUT 3
> +enum {
> +	PM_QOS_RESERVED = 0,
> +	PM_QOS_CPU_DMA_LATENCY,
> +	PM_QOS_NETWORK_LATENCY,
> +	PM_QOS_NETWORK_THROUGHPUT,
> +
> +	/* insert new class ID */
> +	PM_QOS_NUM_CLASSES,
> +};
>  
> -#define PM_QOS_NUM_CLASSES 4
>  #define PM_QOS_DEFAULT_VALUE -1
>  
>  #define PM_QOS_CPU_DMA_LAT_DEFAULT_VALUE	(2000 * USEC_PER_SEC)
> diff --git a/kernel/power/qos.c b/kernel/power/qos.c
> index 995e3bd..d6d6dbd 100644
> --- a/kernel/power/qos.c
> +++ b/kernel/power/qos.c
> @@ -469,21 +469,18 @@ static ssize_t pm_qos_power_write(struct file *filp, const char __user *buf,
>  static int __init pm_qos_power_init(void)
>  {
>  	int ret = 0;
> +	int i;
>  
> -	ret = register_pm_qos_misc(&cpu_dma_pm_qos);
> -	if (ret < 0) {
> -		printk(KERN_ERR "pm_qos_param: cpu_dma_latency setup failed\n");
> -		return ret;
> -	}
> -	ret = register_pm_qos_misc(&network_lat_pm_qos);
> -	if (ret < 0) {
> -		printk(KERN_ERR "pm_qos_param: network_latency setup failed\n");
> -		return ret;
> +	BUILD_BUG_ON(ARRAY_SIZE(pm_qos_array) != PM_QOS_NUM_CLASSES);
> +
> +	for (i = 1; i < PM_QOS_NUM_CLASSES; i++) {
> +		ret = register_pm_qos_misc(pm_qos_array[i]);
> +		if (ret < 0) {
> +			printk(KERN_ERR "pm_qos_param: %s setup failed\n",
> +			       pm_qos_array[i]->name);
> +			return ret;
> +		}
>  	}
> -	ret = register_pm_qos_misc(&network_throughput_pm_qos);
> -	if (ret < 0)
> -		printk(KERN_ERR
> -			"pm_qos_param: network_throughput setup failed\n");
>  
>  	return ret;
>  }
> -- 
> 1.7.4.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
