From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] intel_pstate: Use del_timer_sync in intel_pstate_cpu_stop
Date: Tue, 25 Mar 2014 09:58:46 +0530
Message-ID: <CAOh2x=m9C77gYFbxQ1fn-ebQdL58OhY60rXq6WHyTR4Wau7_QA@mail.gmail.com>
References: <1395672089-19336-1-git-send-email-dirk.j.brandewie@intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=YSIQRFmkRq7qOucNU7soqDDjUrdrJ4rktvi8zvHIAFA=;
        b=bZ58juq029vUArbapYrUebXXiqwKXx0TSzYTFqJdAKtrY4xsP45WqJy0YJn0FzForJ
         p4X7fKq702aV1VDdZbXBe3OyHZ/DFgEMgaoZ4lQ6CreDG5uOhyNWHcDOtfcQU3Etvqu7
         L0FCi/cydbvcTgbJwGf4JDf9gRxBcqVxS9kQfzKBfIfFoIwEKqcmqDUS/96RnZLXvcvv
         8pXvcXGUZ1XS2ACCOkuxZuC/Y3QNKc/fHZmOweRKiltfJ57cE3LUbAsS8BiISpt/Vl6P
         yiBqbT15WzlpXxKOefGd7RkaE7hR8CC474AB2OtnNBLeJ1d1taaCZNcFkMtbeO192L7W
         e/6w==
In-Reply-To: <1395672089-19336-1-git-send-email-dirk.j.brandewie@intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dirk Brandewie <dirk.j.brandewie@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, cpufreq <cpufreq@vger.kernel.org>

On Mon, Mar 24, 2014 at 8:11 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.j.brandewie@intel.com>
>
> Ensure that no timer callback is running since we are about to free
> the timer structure.  We cannot guarantee that the call back is called
> on the CPU where the timer is running.
>
> Reported-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: cpufreq <cpufreq@vger.kernel.org>
> ---
>  drivers/cpufreq/intel_pstate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index e9092fd..a4a9ba5 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -780,7 +780,7 @@ static int intel_pstate_cpu_stop(struct cpufreq_policy *policy)
>
>         pr_info("intel_pstate CPU %d exiting\n", cpu_num);
>
> -       del_timer(&all_cpu_data[cpu_num]->timer);
> +       del_timer_sync(&all_cpu_data[cpu_num]->timer);
>         intel_pstate_set_pstate(cpu, cpu->pstate.min_pstate);
>         kfree(all_cpu_data[cpu_num]);
>         all_cpu_data[cpu_num] = NULL;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
