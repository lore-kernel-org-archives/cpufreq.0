From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq/intel_pstate: Add kernel command line option
 disable intel_pstate.
Date: Fri, 15 Feb 2013 09:53:24 +0530
Message-ID: <CAOh2x=mH0k8ZB0Qq+q=2bxwHcMUVmj-cy-=N4dBf=6Q2xd6nMw@mail.gmail.com>
References: <6075901.uWCJMxDDFf@vostro.rjw.lan>
	<1360867132-13004-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=FA9WVZ8VCHqZBF6n7S+8YH+yjhgtgaKZ+kK+hxFo//o=;
        b=SSkv7lSIAVE3HpnSJCwwJamcxRc0KpcycraDB5jpsZ07Eb9KGv0OhrSkmCufLFyDyP
         0q7V+K6iQXqd0poj0p6/k5E1P4LbVwmaxIqyqpCYeiIf5/SERwN4xwYw7UAo6SYVpskk
         5hhnb8syGnLVifz5gafYA6PbV8tbT0ClRl6zDDaGpxWeXw7BR2ouwI9T8jFh0riwc9T5
         i4HyXKmYTqsZyYGlQaPwgw9W+xfVGfiDKYv5+U5fXMrqfXtM8uHRelsnNjlHMTrv216z
         Kb75CMoCAt2xXr9gnCU/9C5ovet9NgHNLMF3gdriK3hUR0sUbNi0VrU6yLSMG4qAjVUY
         av9w==
In-Reply-To: <1360867132-13004-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Fri, Feb 15, 2013 at 12:08 AM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> When intel_pstate is configured into the kernel it will become the
> perferred scaling driver for processors that is supports.  Allow the

s/perferred/preferred

s/is/it

> user to override this by adding:
>    intel_pstate=disable
> on the kernel command line.
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> ---
>  Documentation/kernel-parameters.txt |    5 +++++
>  drivers/cpufreq/intel_pstate.c      |   16 ++++++++++++++++
>  2 files changed, 21 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
> index 6c72381..41c5d9e 100644
> --- a/Documentation/kernel-parameters.txt
> +++ b/Documentation/kernel-parameters.txt
> @@ -1131,6 +1131,11 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
>                         0       disables intel_idle and fall back on acpi_idle.
>                         1 to 6  specify maximum depth of C-state.
>
> +       intel_pstate=  [X86]
> +                      disable
> +                        Do not enable intel_pstate as the default
> +                        scaling driver for the supported processors
> +
>         intremap=       [X86-64, Intel-IOMMU]
>                         on      enable Interrupt Remapping (default)
>                         off     disable Interrupt Remapping
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index e879963..9cbb733 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -773,11 +773,16 @@ static void intel_pstate_exit(void)
>  }
>  module_exit(intel_pstate_exit);
>
> +static int no_load;
> +
>  static int __init intel_pstate_init(void)
>  {
>         int rc = 0;
>         const struct x86_cpu_id *id;
>
> +       if (no_load)
> +               return -ENODEV;
> +
>         id = x86_match_cpu(intel_pstate_cpu_ids);
>         if (!id)
>                 return -ENODEV;
> @@ -802,6 +807,17 @@ out:
>  }
>  device_initcall(intel_pstate_init);
>
> +static int __init intel_pstate_setup(char *str)

Parameter to this is really not required. By default intel_pstate
driver is enabled, so just past disable_intel_pstate from command line
without any args.

> +{
> +       if (!str)
> +               return -EINVAL;
> +
> +       if (!strcmp(str, "disable"))
> +               no_load = 1;
> +       return 0;
> +}
> +early_param("intel_pstate", intel_pstate_setup);
