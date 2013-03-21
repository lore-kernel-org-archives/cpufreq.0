From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq/intel_pstate: Add function to check that all
 MSR's are valid
Date: Thu, 21 Mar 2013 08:50:09 +0530
Message-ID: <CAOh2x=nb8GgUoSLnepo5R9Q+MR81QFe3zH+cmdg5kO87dkGnAg@mail.gmail.com>
References: <1363796244-6658-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=HmO6nh2IWI9XAYzPNXsbqJKf30vZJL6Rv1hSGAv22hQ=;
        b=q9AqSsNHg3DNDU7mJrFGKlD5B/+mOk+gZ/rt3KZIU3aWVvHDRART6ekQ2FH4nR/EZN
         9LJeJby+K4InBeuTdubkHx94WVZwoiuBhvwfTfm/8mdYA/2djoND49FrIo53VlIXkYj1
         HnRQY60ldSqdqRPHTe2JK8NLm+QXWi4RJMA0PCtOBiYzsfVL0yntv5svpXZmDIGXH1wM
         QJt1poyKnOoC6TvsY0fSb9HB7WW7NC3xK9HV5kFe7A28IgiyGDkO95Jo8GP3RN4kmVii
         8dKZEaXX+oiZoeZrEv43hlKBho3LhTzj+KHO1wITei26dZNqpLkK54rDOPYp/8TwURqj
         jgkA==
In-Reply-To: <1363796244-6658-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Wed, Mar 20, 2013 at 9:47 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Some VMs seem to try to implement some MSRs but not all the registers
> the driver needs.  Check to make sure all the MSR that we need are
> available. If any of the required MSRs are not available refuse to
> load.
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> ---
>  drivers/cpufreq/intel_pstate.c |   26 ++++++++++++++++++++++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index f6dd1e7..cd9c5f4 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -752,6 +752,29 @@ static struct cpufreq_driver intel_pstate_driver = {
>
>  static int __initdata no_load;
>
> +static int intel_pstate_msrs_not_valid(void)
> +{
> +       /* Check that all the msr's we are using are valid. */
> +       u64 aperf, mperf, tmp;
> +
> +       rdmsrl(MSR_IA32_APERF, aperf);
> +       rdmsrl(MSR_IA32_MPERF, mperf);
> +
> +       if (!intel_pstate_min_pstate() ||
> +               !intel_pstate_max_pstate() ||
> +               !intel_pstate_turbo_pstate())
> +               return -ENODEV;
> +
> +       rdmsrl(MSR_IA32_APERF, tmp);
> +       if (!(tmp - aperf))
> +               return -ENODEV;
> +
> +       rdmsrl(MSR_IA32_MPERF, tmp);
> +       if (!(tmp - mperf))
> +               return -ENODEV;
> +
> +       return 0;
> +}

Add blank line here.

>  static int __init intel_pstate_init(void)
>  {
>         int cpu, rc = 0;
> @@ -764,6 +787,9 @@ static int __init intel_pstate_init(void)
>         if (!id)
>                 return -ENODEV;
>
> +       if (intel_pstate_msrs_not_valid())
> +               return -ENODEV;
> +
>         pr_info("Intel P-state driver initializing.\n");
>
>         all_cpu_data = vmalloc(sizeof(void *) * num_possible_cpus());

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
