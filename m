From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] cpufreq/intel_pstate: Fix intel_pstate_init() error path
Date: Thu, 7 Mar 2013 10:31:38 +0800
Message-ID: <CAOh2x=kGz6i8qZhGvwtXUMo_GQfMNAvUiFVmgKMwsgZzKOZusw@mail.gmail.com>
References: <1362587768-29250-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=UMXdtJbhX177JbC0HwsUJGbqWhmZ1I0J9BxbG4OowcQ=;
        b=NtY0jGwlYtLUJ0dpkpxnXSqHN8Eo74+o0c0RA73naLu0b9nSz4CmIM+A7te5OLPSqG
         nE0E9ECeMHOBc/SYv6OYrAJSCWozL3Z1NnHjoQPWk0z5Re6s0NljjJZ6C7tKsDHYgUVK
         lhQSR6gAX/WvF1MeMc8BY+jl4kQcrjig0hkY0iAUDln7prupPRNfcGoQWbV9D4xNOAEw
         TkPT8jOHltKbi57j8HRSJcbEqq4yTsXUyaFcG2KM2NE1UJaCA1vBdyh5/zrLtltlRZgL
         0NP7FHUFWc+58tdO63ulhwN3RH6aaQwzxbwejlHqA6LFQjBpWGKoFiTtXY37Z0PT5bfp
         ebsQ==
In-Reply-To: <1362587768-29250-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Thu, Mar 7, 2013 at 12:36 AM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> If cpufreq_register_driver() fails just free memory that has been
> allocated and return. intel_pstate_exit() function is removed since we
> are built-in only now there is no reason for a module exit procedure.
>
> Reported-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
