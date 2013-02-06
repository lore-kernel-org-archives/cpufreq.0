From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 5/7] cpufreq: balance out cpufreq_cpu_{get,put} for
 scaling drivers using setpolicy
Date: Wed, 6 Feb 2013 21:49:40 +0530
Message-ID: <CAKohpo=9G+ebAxfOxkhQneEz2Vc_rfnR=he65WiZ4ERfmy-erg@mail.gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
	<1360088646-19104-6-git-send-email-dirk.brandewie@gmail.com>
	<CAOh2x=kJPFyhkG3y_q=a5ciG1HRAn-JkoVYy9OZ9POA+-isbCQ@mail.gmail.com>
	<5111BB2E.2090505@gmail.com>
	<CAKohpokoG16S8uft0nSFSoejipS8X=zhhg6goJs4mBSt3tAwxw@mail.gmail.com>
	<51128097.9000801@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <51128097.9000801@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 6 February 2013 21:41, Dirk Brandewie <dirk.brandewie@gmail.com> wrote:
> our files are clearly out of sync :-)  The code in cpufreq_add_dev() is

I was at latest bleeding-edge then, but i still have below code in my HEAD.

> #ifdef CONFIG_SMP
>         /* check whether a different CPU already registered this
>          * CPU because it is in the same boat. */
>         policy = cpufreq_cpu_get(cpu);
>         if (unlikely(policy)) {
>                 cpufreq_cpu_put(policy);
>                 return 0;
>         }
>
> The reference added by this cpufreq_cpu_get() is finally dropped in
> __cpufreq_remove_dev() with the call to __cpufreq_governor()

__cpufreq_governor() is not calling cpufreq_cpu_put() at all and is dropping
reference for the governor only, not for policy.

>         if (driver->target)
>                 __cpufreq_governor(data, CPUFREQ_GOV_STOP);
>
> Without this change I hang at:
>                 pr_debug("waiting for dropping of refcount\n");
>                 wait_for_completion(cmp);

Below should have fixed it for you i believe.

	pr_debug("%s: removing link, cpu: %d\n", __func__, cpu);
	cpufreq_cpu_put(data);
	unlock_policy_rwsem_write(cpu);

--
viresh
