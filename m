From: "Mohammed, Afzal" <afzal@ti.com>
Subject: RE: [PATCH 2/2] cpufreq: update lpj only if frequency has changed
Date: Wed, 4 Jan 2012 07:51:53 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A9033965@DBDE01.ent.ti.com>
References: <1325654566-14217-1-git-send-email-afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1325654566-14217-1-git-send-email-afzal@ti.com>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Hi,

Forwarding as the original is not yet seen in cpufreq archives.

Regards
Afzal

On Wed, Jan 04, 2012 at 10:52:46, Mohammed, Afzal wrote:
> During scaling up of cpu frequency, loops_per_jiffy
> is updated upon invoking PRECHANGE notifier.
> If setting to new frequency fails in cpufreq driver,
> lpj is left at incorrect value.
> 
> Hence update lpj only if cpu frequency is changed,
> i.e. upon invoking POSTCHANGE notifier.
> 
> Penalty would be that during time period between
> changing cpu frequency & invocation of POSTCHANGE
> notifier, udelay(x) may not gurantee minimal delay
> of 'x' us for frequency scaling up operation.
> 
> Perhaps a better solution would be to define
> CPUFREQ_ABORTCHANGE & handle accordingly, but then
> it would be more intrusive (using ABORTCHANGE may
> help drivers also; if any has registered notifier
> and expect POST for a PRECHANGE, their needs can
> be taken care using ABORT)
> 
> Signed-off-by: Afzal Mohammed <afzal@ti.com>
> ---
>  drivers/cpufreq/cpufreq.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 987a165..2f5801a 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -204,8 +204,7 @@ static void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci)
>  		pr_debug("saving %lu as reference value for loops_per_jiffy; "
>  			"freq is %u kHz\n", l_p_j_ref, l_p_j_ref_freq);
>  	}
> -	if ((val == CPUFREQ_PRECHANGE  && ci->old < ci->new) ||
> -	    (val == CPUFREQ_POSTCHANGE && ci->old > ci->new) ||
> +	if ((val == CPUFREQ_POSTCHANGE  && ci->old != ci->new) ||
>  	    (val == CPUFREQ_RESUMECHANGE || val == CPUFREQ_SUSPENDCHANGE)) {
>  		loops_per_jiffy = cpufreq_scale(l_p_j_ref, l_p_j_ref_freq,
>  								ci->new);
> -- 
> 1.7.1
> 
> 

