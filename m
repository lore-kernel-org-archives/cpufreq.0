From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/6] cpufreq: Only query drivers that implement cpufreq_driver.target()
Date: Sat, 2 Feb 2013 08:52:55 +0530
Message-ID: <CAOh2x=mb0ffYoS70L_63T1YUG6a74EazyxM0R3ec2GTN2PPWTQ@mail.gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
	<1359744343-18690-3-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=e/ZhBYAs3ObbsNahjm0stcttbUAwXBrRVJW47PoZ3uQ=;
        b=Ywcz44j8+r+PkfRfzZ5+rq3BiVeKVd2xsCY8KyJuEiYG6y17jI9FUA/ByIhceuggOE
         c2Od4gHVb6er8JfE4Q2wyLmQFsh0rH7mh/Wwzna2fUfxVSttKNCAmQsgqyAjmcrslblQ
         D3LhDFc22W6VVBFxCwHAywgTrK8aYVN0rNEur+NGrBdLA+Eu1Ik0PvA2MZGNiGdSsoF/
         sBIIAMhtADZAbehnCELnmpykLtZxSvK9tUxpPRu+kHXcIl9wWhiST6EWroW6bcvsrptS
         /6jceDYZN50co7N2dnnDeIqtOxul798m27KSCQ5lD/avEHxp/ESY+pZMt++OqwIBkP6K
         N5bw==
In-Reply-To: <1359744343-18690-3-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Sat, Feb 2, 2013 at 12:15 AM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Scaling drivers that implement cpufreq_driver.setpolicy() have
> internal governors and may/will change the current operating frequency
> very frequently this will cause cpufreq_out_of_sync() to be called
> every time. Only call cpufreq_driver.get() for drivers that implement
> cpufreq_driver.target()
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 1c037f0..493cd50 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1794,7 +1794,7 @@ int cpufreq_update_policy(unsigned int cpu)
>
>         /* BIOS might change freq behind our back
>           -> ask driver for current freq and notify governors about a change */
> -       if (cpufreq_driver->get) {
> +       if (cpufreq_driver->get && cpufreq_driver->target) {

This would mean policy->cur has a garbage value. I don't really know
how would other routine behave on this. Would it make sense to make
policy->cur zero atleast?
