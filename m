From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] return error when failing to set minfreq
Date: Mon, 5 Jun 2006 20:31:48 +0200
Message-ID: <20060605183147.GD8603@inferi.kami.home>
References: <20060525223403.GA3908@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060525223403.GA3908@inferi.kami.home>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Hello,

no comment on the following?

On Fri, May 26, 2006 at 12:34:04AM +0200, Mattia Dongili wrote:
> Hello,
> I just stumbled on this bug/feature, this is how to reproduce it:
> 
> # echo 450000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
> # echo 450000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
> # echo powersave > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> # cpufreq-info -p
> 450000 450000 powersave
> # echo 1800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq ; echo $?
> 0
> # cpufreq-info -p             
> 450000 450000 powersave
> 
> Here it is. The kernel refuses to set a min_freq higher than the
> max_freq but it allows a max_freq lower than min_freq (lowering min_freq
> also).
> 
> I'm unsure if things could be improved here.  The offending instruction
> is in cpufreq_verify_within_limits (cpufreq.h:241):
> 
> 	if (policy->min > policy->max)
>                 policy->min = policy->max;
> 
> This behaviour is pretty straightforward (but undocumented) and it
> doesn't return an error altough failing to accomplish the requested
> action (set min_freq).
> The problem (IMO) is basically that userspace is not allowed to set a
> full policy atomically while the kernel always does that thus it must
> enforce an ordering on operations.
> 
> The attached patch returns -EINVAL if trying to increase frequencies
> starting from scaling_min_freq and documents the correct ordering of
> writes.
> 
> Signed-off-by: Mattia Dongili <malattia@linux.it>
> -- 
> mattia
> :wq!

> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 29b2fa5..a78967f 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1349,6 +1349,11 @@ static int __cpufreq_set_policy(struct c
>  
>  	memcpy(&policy->cpuinfo, &data->cpuinfo, sizeof(struct cpufreq_cpuinfo));
>  
> +	if (policy->min > data->min && policy->min > policy->max) {
> +		ret = -EINVAL;
> +		goto error_out;
> +	}
> +
>  	/* verify the cpu speed can be set within this limit */
>  	ret = cpufreq_driver->verify(policy);
>  	if (ret)
> diff --git a/Documentation/cpu-freq/user-guide.txt b/Documentation/cpu-freq/user-guide.txt
> index 7fedc00..555c8cf 100644
> --- a/Documentation/cpu-freq/user-guide.txt
> +++ b/Documentation/cpu-freq/user-guide.txt
> @@ -153,10 +153,13 @@ scaling_governor,		and by "echoing" the 
>  				that some governors won't load - they only
>  				work on some specific architectures or
>  				processors.
> -scaling_min_freq and 
> +scaling_min_freq and
>  scaling_max_freq		show the current "policy limits" (in
>  				kHz). By echoing new values into these
>  				files, you can change these limits.
> +				NOTE: when setting a policy you need to
> +				first set scaling_max_freq, then
> +				scaling_min_freq.
>  
>  
>  If you have selected the "userspace" governor which allows you to

> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq

-- 
mattia
:wq!
