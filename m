From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [patch 15/16] cpufreq: intel-pstate: Use del_timer_sync in intel_pstate_cpu_exit()
Date: Mon, 24 Mar 2014 10:15:02 +0530
Message-ID: <CAOh2x==n-TW4DizybTA5Y_b4Xfc_bX5ArnNjg4HhtaBBT2P98g@mail.gmail.com>
References: <20140323150557.288925975@linutronix.de>
	<20140323150754.272874059@linutronix.de>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=hzag8/haInPU2OJ0nimxS8yzz9zUgStywf/QqTmnQJc=;
        b=PxnulK4t6vMSMsf1MBbqTbGRwl/gavv1EUdiBfOHeR3CJ5WnyuwRDnczQnU1xN1162
         8RH2ZbtXsA4rvsWb6NZ1hE8KNHVViQfFy6bMLlxP8uZ+5Y93gEn69w0yB1UgJKYD2nID
         oAiCgPpn8ZYOmbON5P2z90bOkdvAbzPbDWBXylXpeRRld/HFoR3SMqRD4MQqQz6YDyJ7
         MK64Br+Q3izDj7LarjmBvK23zFC1PCL98AsIUw0T9tVPPbr2gqYlDESDiD3B27YBXTV8
         T8tfskQnjHP3Rb2hMMvRoqkiD38satK5oXl2QNmgrpN2hpzzeHM3IwiFiii9v8TJsaiS
         EnEQ==
In-Reply-To: <20140323150754.272874059@linutronix.de>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Andrew Morton <akpm@linux-foundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, cpufreq <cpufreq@vger.kernel.org>, pm <linux-pm@vger.kernel.org>

On Sun, Mar 23, 2014 at 8:39 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> We are about to free the data structure. Make sure no timer callback
> is running. I might be paranoid, but the ->exit callback can be
> invoked from so many places, that it is not entirely clear whether
> del_timer is always called on the cpu on which it is enqueued.

In normal cases it will be called only when CPU goes offline and I
hope that isn't called on the dying CPU.

> While looking through the call sites I noticed, that
> cpufreq_init_policy() can fail and invoke cpufreq_driver->exit() but
> it does not return the failure and the callsite happily proceeds.

Thanks for reporting this, will get it fixed.

> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: cpufreq <cpufreq@vger.kernel.org>
> Cc: pm <linux-pm@vger.kernel.org>
> ---
>
>  drivers/cpufreq/intel_pstate.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Index: tip/drivers/cpufreq/intel_pstate.c
> ===================================================================
> --- tip.orig/drivers/cpufreq/intel_pstate.c
> +++ tip/drivers/cpufreq/intel_pstate.c
> @@ -777,7 +777,7 @@ static int intel_pstate_cpu_exit(struct
>  {
>         int cpu = policy->cpu;
>
> -       del_timer(&all_cpu_data[cpu]->timer);
> +       del_timer_sync(&all_cpu_data[cpu]->timer);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
