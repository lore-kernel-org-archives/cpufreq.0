From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 8/8] patch cpupower_ivy_bridge_support.patch
Date: Sat, 24 Nov 2012 10:49:52 +0100
Message-ID: <3559687.YhYd0sZzjh@vostro.rjw.lan>
References: <1349788867-65962-1-git-send-email-trenn@suse.de> <1349788867-65962-9-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1349788867-65962-9-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org, linux@dominikbrodowski.net

Please add (1) a useful subject, (2) a changelog and (3) a sign-off tag.

Thanks,
Rafael


On Tuesday, October 09, 2012 03:21:07 PM Thomas Renninger wrote:
> ---
>  tools/power/cpupower/utils/idle_monitor/snb_idle.c |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/power/cpupower/utils/idle_monitor/snb_idle.c b/tools/power/cpupower/utils/idle_monitor/snb_idle.c
> index a1bc07c..9913a60 100644
> --- a/tools/power/cpupower/utils/idle_monitor/snb_idle.c
> +++ b/tools/power/cpupower/utils/idle_monitor/snb_idle.c
> @@ -150,9 +150,15 @@ static struct cpuidle_monitor *snb_register(void)
>  	    || cpupower_cpu_info.family != 6)
>  		return NULL;
>  
> -	if (cpupower_cpu_info.model != 0x2A
> -	    && cpupower_cpu_info.model != 0x2D)
> +	switch (cpupower_cpu_info.model) {
> +	case 0x2A: /* SNB */
> +	case 0x2D: /* SNB Xeon */
> +	case 0x3A: /* IVB */
> +	case 0x3D: /* IVB Xeon */
> +		break;
> +	default:
>  		return NULL;
> +	}
>  
>  	is_valid = calloc(cpu_count, sizeof(int));
>  	for (num = 0; num < SNB_CSTATE_COUNT; num++) {
> 
-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
