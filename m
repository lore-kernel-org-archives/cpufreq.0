From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH] powernow-k8: Don't try to transition if the
 pstate is incorrect or there is no freq for it.
Date: Thu, 16 Jun 2011 19:06:11 +0200
Message-ID: <20110616170611.GA18407@gere.osrc.amd.com>
References: <1308164520-14145-1-git-send-email-konrad.wilk@oracle.com>
 <20110616142829.GB5576@dumpdata.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110616142829.GB5576@dumpdata.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-kernel@vger.kernel.org, davej@redhat.com, x86@kernel.org, cpufreq@vger.kernel.org, bp@alien8.de, andre.przywara@amd.com, Mark.Langsdorf@amd.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com

On Thu, Jun 16, 2011 at 10:28:29AM -0400, Konrad Rzeszutek Wilk wrote:
> 
> And as mentioned, the other patch that just deals with pstates.
> 
> From 0f3bc30b6bc7dad62e3b77063b69df44ca9a9f8e Mon Sep 17 00:00:00 2001
> From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Date: Wed, 15 Jun 2011 11:08:02 -0400
> Subject: [PATCH] [CPUFREQ] powernow-k8: Don't try to transition if the pstate is incorrect or there is no freq for it.
> 
> This patch auguments the pstate transition code to error out

	     augments

> (instead of returning 0) when a incorrect pstate is provided.

				an

> It also checks whether the frequency for the pstate is
> incorrect and if so errors out.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> CC: andre.przywara@amd.com
> CC: Mark.Langsdorf@amd.com
> Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> ---
>  drivers/cpufreq/powernow-k8.c |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
> index fe53572..047c7b11 100644
> --- a/drivers/cpufreq/powernow-k8.c
> +++ b/drivers/cpufreq/powernow-k8.c
> @@ -1103,11 +1103,15 @@ static int transition_frequency_pstate(struct powernow_k8_data *data,
>  	/* get MSR index for hardware pstate transition */
>  	pstate = index & HW_PSTATE_MASK;
>  	if (pstate > data->max_hw_pstate)
> -		return 0;
> +		return -EINVAL;
> +

Hehe, this was a bug, actually, good catch!

powernowk8_target is actually considering ret = 0 a success and ret != 0
a failure but we were returning a 0 when our target pstate is bogus.

>  	freqs.old = find_khz_freq_from_pstate(data->powernow_table,
>  			data->currpstate);
>  	freqs.new = find_khz_freq_from_pstate(data->powernow_table, pstate);
>  
> +	if (freqs.new == CPUFREQ_ENTRY_INVALID)
> +		return -EINVAL;
> +

No need for that since freqs.new is determined from pstate and you're
checking pstate above.

>  	for_each_cpu(i, data->available_cores) {
>  		freqs.cpu = i;
>  		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);

Thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632
