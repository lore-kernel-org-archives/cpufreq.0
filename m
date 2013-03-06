From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] cpufreq/intel_pstate: Fix intel_pstate_init() error path
Date: Wed, 6 Mar 2013 21:37:18 +0800
Message-ID: <CAOh2x=n_eZFajyXg5E3GNmS_SOTGB30DLSXoE+wM=GZv-BLqvA@mail.gmail.com>
References: <1362521727-20666-1-git-send-email-dirk.brandewie@gmail.com>
	<1362521727-20666-3-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=COi2HYELax5CFH/TOT8L2dox3EVQfjLplfDZ0yt2Ojk=;
        b=vddE0bZJ/TidUByNFr21BK1T8jIlgyWOFZLXkVYdUySqVk5WFdUHzQqfA3Jc9WNtWB
         sR0r21rUIxmM4zDVsw8pGNrBNGcC/TClLBW+oqqjUTvuSgdbPnmyhlAHT2ERx8GLqsi9
         dA9cOrNHgyIo3mUGqo6+LWN9hPAAwOjCCdK14cNjEl8m/f9Mkws1heN3MX5NzAAuhQ0k
         Q8MZ0veFsCncT/YdxyC8FystPhzEqj8TvLxoyVt5qz0tzt4O1ghp/qo59hvPSziiEb1k
         OEkbzMpJfqn8vWW4D1hSOIRjeWydjnP9+P3SKWzdAmP17jAoy4w55HmZU3Sns3vpDZF0
         o/lw==
In-Reply-To: <1362521727-20666-3-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, konrad.wilk@oracle.com, jwboyer@redhat.com, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Wed, Mar 6, 2013 at 6:15 AM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> If cpufreq_register_driver() fails just free memory that has been
> allocated and return. intel_pstate_exit() function is removed sine we

s/sine/since

> are built-in only now there is no reason for a module exit proceedure.

s/proceedure/procedure

> Reported-by:Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> ---
>  drivers/cpufreq/intel_pstate.c |   39 +++++++++++----------------------------
>  1 files changed, 11 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index 2bfd083..f6dd1e7 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -750,37 +750,11 @@ static struct cpufreq_driver intel_pstate_driver = {
>         .owner          = THIS_MODULE,
>  };
>
> -static void intel_pstate_exit(void)
> -{
> -       int cpu;
> -
> -       sysfs_remove_group(intel_pstate_kobject,
> -                               &intel_pstate_attr_group);
> -       debugfs_remove_recursive(debugfs_parent);
> -
> -       cpufreq_unregister_driver(&intel_pstate_driver);
> -
> -       if (!all_cpu_data)
> -               return;
> -
> -       get_online_cpus();
> -       for_each_online_cpu(cpu) {
> -               if (all_cpu_data[cpu]) {
> -                       del_timer_sync(&all_cpu_data[cpu]->timer);
> -                       kfree(all_cpu_data[cpu]);
> -               }
> -       }
> -
> -       put_online_cpus();
> -       vfree(all_cpu_data);
> -}
> -module_exit(intel_pstate_exit);
> -
>  static int __initdata no_load;
>
>  static int __init intel_pstate_init(void)
>  {
> -       int rc = 0;
> +       int cpu, rc = 0;
>         const struct x86_cpu_id *id;
>
>         if (no_load)
> @@ -805,7 +779,16 @@ static int __init intel_pstate_init(void)
>         intel_pstate_sysfs_expose_params();
>         return rc;
>  out:
> -       intel_pstate_exit();
> +       get_online_cpus();
> +       for_each_online_cpu(cpu) {
> +               if (all_cpu_data[cpu]) {
> +                       del_timer_sync(&all_cpu_data[cpu]->timer);
> +                       kfree(all_cpu_data[cpu]);
> +               }
> +       }
> +
> +       put_online_cpus();
> +       vfree(all_cpu_data);
>         return -ENODEV;
>  }
>  device_initcall(intel_pstate_init);
> --
> 1.7.7.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
