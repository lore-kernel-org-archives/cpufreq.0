From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH V5 1/4] cpufreq: exynos: Add cpufreq driver for exynos5440
Date: Mon, 8 Apr 2013 13:55:10 +0530
Message-ID: <CADGdYn7PCAPPuAe6Y+VTGq=98i0_6YvDdJsRiLcwMyfsoohbag@mail.gmail.com>
References: <1364457923-8499-1-git-send-email-amit.daniel@samsung.com>
	<1364457923-8499-2-git-send-email-amit.daniel@samsung.com>
	<CAKohpon5BYW0Ypx8SbBsSUuugUnmYU=rBCMizz-CxuHjCzObpQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=qY0FniIfyu1LqNiXJfJnhQvr/cjEETG1u23ZU8X7+FI=;
        b=VsIHh2of/+mSwFksfZ1XwUsfEERgrbSZjeT88TDdBVwMDg/Y6pLZAjT/+Oyj/IKKfg
         KFeCPW5UpMXXneOkvq+8icp+r15p/jggMH+BXXA8jJEbHln49Rgx05khtM1wLBG37jqf
         gDYDO0PIEUw5J2ts8cZJghTv3PY0lqHa9anhzZW9Bnx4kvX8BNUCrqvtKjnp3aRcizBd
         Xr+UASGUklx9y4DFGm9TteLChQk8h+aFTYdqAaWEgQvpPNseWWbqOfLWfUKWkgskJ8jk
         zN9VscgN1fXGfIwj8OJIV/yoEU65/zXbbWzervCqDmWK1uDAhjqytafNa1FdSkFPJy1w
         f2+w==
In-Reply-To: <CAKohpon5BYW0Ypx8SbBsSUuugUnmYU=rBCMizz-CxuHjCzObpQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org, Inderpal Singh <inderpal.singh@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>

On Thu, Mar 28, 2013 at 6:12 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 28 March 2013 13:35, Amit Daniel Kachhap <amit.daniel@samsung.com> wrote:
> > +++ b/drivers/cpufreq/exynos5440-cpufreq.c
> > +static int exynos_cpufreq_cpu_init(struct cpufreq_policy *policy)
> > +{
> > +       policy->cur = dvfs_info->cur_frequency;
> > +       cpufreq_frequency_table_get_attr(dvfs_info->freq_table, policy->cpu);
> > +
> > +       /* set the transition latency value */
> > +       policy->cpuinfo.transition_latency = dvfs_info->latency;
> > +
> > +       cpumask_setall(policy->cpus);
> > +
> > +       return cpufreq_frequency_table_cpuinfo(policy, dvfs_info->freq_table);
>
> I missed this earlier and saw this mistake in yet another driver.
> You need to call cpufreq_frequency_table_get_attr() only when
> cpufreq_frequency_table_cpuinfo() has passed.

ok. Submitted the V6 version with this change.

>
>
> > +}
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
