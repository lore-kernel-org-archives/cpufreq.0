From: mark gross <markgross@thegnar.org>
Subject: Re: [PATCH v2 7/8] PM QoS: Add CPU frequency maximum as PM QoS param
Date: Sat, 14 Jan 2012 20:51:43 -0800
Message-ID: <20120115045143.GD2409@mgross-G62>
References: <1326459559-5436-1-git-send-email-amiettinen@nvidia.com>
 <1326459559-5436-8-git-send-email-amiettinen@nvidia.com>
Reply-To: markgross@thegnar.org
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=PXfxiOybD9I3mY2Ez/Lzz0fe4lK3z4sXPTUUjPhNx7g=;
        b=flJWf8uP5BUFjUjGX8PNA39p+QiD786+twyJKZ/pHH6OJngcjnPe9cOjEPYnCpqlG6
         n9+Ne1Lut6+Vi/VctPMHIC44EOetu0fMGhynwh9k1W4gxU4Yt5bAS7vz23BKp1qQ0HK5
         PvbZjMLsJIvtG3ied1l6kONZ722AIq9/rG/xI=
Content-Disposition: inline
In-Reply-To: <1326459559-5436-8-git-send-email-amiettinen@nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti P Miettinen <amiettinen@nvidia.com>
Cc: davej@redhat.com, cpufreq@vger.kernel.org, pavel@ucw.cz, rjw@sisk.pl, len.brown@intel.com, linux-pm@vger.kernel.org, mgross@linux.intel.com


I don't think this belongs in cpufreq.
--mark

On Fri, Jan 13, 2012 at 02:59:18PM +0200, Antti P Miettinen wrote:
> Add maximum CPU frequency as PM QoS parameter.
> 
> Signed-off-by: Antti P Miettinen <amiettinen@nvidia.com>
> ---
>  include/linux/pm_qos.h |    2 ++
>  kernel/power/qos.c     |   15 +++++++++++++++
>  2 files changed, 17 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/pm_qos.h b/include/linux/pm_qos.h
> index 54a0d00..7b8d08b 100644
> --- a/include/linux/pm_qos.h
> +++ b/include/linux/pm_qos.h
> @@ -15,6 +15,7 @@ enum {
>  	PM_QOS_NETWORK_LATENCY,
>  	PM_QOS_NETWORK_THROUGHPUT,
>  	PM_QOS_CPU_FREQ_MIN,
> +	PM_QOS_CPU_FREQ_MAX,
>  
>  	/* insert new class ID */
>  
> @@ -28,6 +29,7 @@ enum {
>  #define PM_QOS_NETWORK_THROUGHPUT_DEFAULT_VALUE	0
>  #define PM_QOS_DEV_LAT_DEFAULT_VALUE		0
>  #define PM_QOS_CPU_FREQ_MIN_DEFAULT_VALUE	0
> +#define PM_QOS_CPU_FREQ_MAX_DEFAULT_VALUE	LONG_MAX
>  
>  struct pm_qos_request {
>  	struct plist_node node;
> diff --git a/kernel/power/qos.c b/kernel/power/qos.c
> index 07d761a..04b744b 100644
> --- a/kernel/power/qos.c
> +++ b/kernel/power/qos.c
> @@ -115,12 +115,27 @@ static struct pm_qos_object cpu_freq_min_pm_qos = {
>  };
>  
>  
> +static BLOCKING_NOTIFIER_HEAD(cpu_freq_max_notifier);
> +static struct pm_qos_constraints cpu_freq_max_constraints = {
> +	.list = PLIST_HEAD_INIT(cpu_freq_max_constraints.list),
> +	.target_value = PM_QOS_CPU_FREQ_MAX_DEFAULT_VALUE,
> +	.default_value = PM_QOS_CPU_FREQ_MAX_DEFAULT_VALUE,
> +	.type = PM_QOS_MIN,
> +	.notifiers = &cpu_freq_max_notifier,
> +};
> +static struct pm_qos_object cpu_freq_max_pm_qos = {
> +	.constraints = &cpu_freq_max_constraints,
> +	.name = "cpu_freq_max",
> +};
> +
> +
>  static struct pm_qos_object *pm_qos_array[] = {
>  	&null_pm_qos,
>  	&cpu_dma_pm_qos,
>  	&network_lat_pm_qos,
>  	&network_throughput_pm_qos,
>  	&cpu_freq_min_pm_qos,
> +	&cpu_freq_max_pm_qos,
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
