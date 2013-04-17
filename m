From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Apr 9 [cpufreq: NULL pointer deref]
Date: Wed, 17 Apr 2013 16:04:46 +0200
Message-ID: <CA+icZUVsNG66_v8QA17LQ27z1tjRjDqzB148OSV9WQP0_NkRKA@mail.gmail.com>
References: <CA+icZUU_K9PiFMqMsOEk1+c2DX8LrUojZptPiRVarv4dcB2qFA@mail.gmail.com>
	<CA+icZUUsAqJ3kyCZivYeTpY7n=EDMv1UcC2VNwQro4h7NHDWag@mail.gmail.com>
	<CA+icZUW+TB3q58bL+d=A355S4vtRhwMq8AV+tqjv6MgDtHRCaA@mail.gmail.com>
	<1923819.6Nb81T2TR8@vostro.rjw.lan>
	<CA+icZUXUGOjGUAFxgQk0780pcBB-YjiujDLXF+gJFegi+pd+dA@mail.gmail.com>
	<516C25AE.4050503@intel.com>
	<CAKohpo=OOPBYCD_K6RLw2YrJxhMokwrOww4QM2t2T4SnGObyQQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:reply-to:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=J0eAH/MZ7DoOA6RiJs0Wh217TsQbUbm/Cm7QmFQqC9g=;
        b=ShKYqymjwMmA/ShxDQZfEuhDsxUS9ffjUEicPUT++2gmc0JkubB5o9QBxFdWe/fr59
         jZx56LNzqcYAw60h0XrhbJWNKezS60yRrIeu541bneAykMTEOIr8/MfD1k9Ru+xx8EI4
         XN0WjblQvhXG3tiyoA93jsU/ka/0rZv5l2nuGrMMhvJ9SFmtkw+FFj4Z4H3+hk757HxY
         bPgsRL4oXviXANIPz053TxEr1eslhXQR68d7hVN+H+EeaYgxC0G3rPBVrR7ULn6PvEEm
         GSRSlshI9fX0AqRywJMkXYRKEE8sz4Y0OmLj/vgzFykeiQB6fH1RLOq2Sx3HRbLipPDu
         /gjw==
In-Reply-To: <CAKohpo=OOPBYCD_K6RLw2YrJxhMokwrOww4QM2t2T4SnGObyQQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Dirk Brandewie <dirk.j.brandewie@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Nathan Zimmer <nzimmer@sgi.com>

On Mon, Apr 15, 2013 at 7:22 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 15 April 2013 21:37, Dirk Brandewie <dirk.brandewie@gmail.com> wrote:
>> If the intel_pstate driver is being used __cpufreq_governor() should NOT be
>> called intel_pstate does not implement the target() callback.
>>
>> Nathan's commit 5800043b2 changed the fence around the call to
>> __cpufreq_governor() in __cpufreq_remove_dev() here is the relevant hunk.
>
> No it isn't.
>
>> +       if (has_target)
>>                 __cpufreq_governor(data, CPUFREQ_GOV_STOP);
>
> As it has taken care of this limitation.
>
> BUT some of my earlier patches haven't. :(
> Here is the fix (Sedat please try this and give your tested-by, use the attached
> patch as gmail might break what i am copying in mail)..
>
> Sorry for being late in fixing this issue, i am still down with Tonsil infection
> and fever.. Today only i got some power to fix it after seeing Dirk's mail.
>
> Your tested-by may help me to recover quickly :)
>
> @Rafael: I will probably be down for one more week and so not doing any
> reviews for now... I do check important mails sent directly to me though.
>

Hi Viresh,

can you sent a separate patch on this (with Reported/Tested-by#s)?
AFAICS this is not in pm.git#linux-next?

Regards,
- Sedat -

> ------------x----------------------x------------------
>
> From: Viresh Kumar <viresh.kumar@linaro.org>
> Date: Mon, 15 Apr 2013 22:43:57 +0530
> Subject: [PATCH] cpufreq: Don't call __cpufreq_governor() for drivers without
>  target()
>
> Some cpufreq drivers implement their own governor and so don't need us to call
> generic governors interface via __cpufreq_governor(). Few recent commits haven't
> obeyed this law well and we saw some regressions.
>
> This patch tries to fix this issue.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/cpufreq/cpufreq.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 3564947..a6f6595 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -858,13 +858,18 @@ static int cpufreq_add_policy_cpu(unsigned int
> cpu, unsigned int sibling,
>                                   struct device *dev)
>  {
>         struct cpufreq_policy *policy;
> -       int ret = 0;
> +       int ret = 0, has_target = 0;
>         unsigned long flags;
>
>         policy = cpufreq_cpu_get(sibling);
>         WARN_ON(!policy);
>
> -       __cpufreq_governor(policy, CPUFREQ_GOV_STOP);
> +       rcu_read_lock();
> +       has_target = !!rcu_dereference(cpufreq_driver)->target;
> +       rcu_read_unlock();
> +
> +       if (has_target)
> +               __cpufreq_governor(policy, CPUFREQ_GOV_STOP);
>
>         lock_policy_rwsem_write(sibling);
>
> @@ -877,8 +882,10 @@ static int cpufreq_add_policy_cpu(unsigned int
> cpu, unsigned int sibling,
>
>         unlock_policy_rwsem_write(sibling);
>
> -       __cpufreq_governor(policy, CPUFREQ_GOV_START);
> -       __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
> +       if (has_target) {
> +               __cpufreq_governor(policy, CPUFREQ_GOV_START);
> +               __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
> +       }
>
>         ret = sysfs_create_link(&dev->kobj, &policy->kobj, "cpufreq");
>         if (ret) {
> @@ -1146,7 +1153,8 @@ static int __cpufreq_remove_dev(struct device
> *dev, struct subsys_interface *sif
>
>         /* If cpu is last user of policy, free policy */
>         if (cpus == 1) {
> -               __cpufreq_governor(data, CPUFREQ_GOV_POLICY_EXIT);
> +               if (has_target)
> +                       __cpufreq_governor(data, CPUFREQ_GOV_POLICY_EXIT);
>
>                 lock_policy_rwsem_read(cpu);
>                 kobj = &data->kobj;
