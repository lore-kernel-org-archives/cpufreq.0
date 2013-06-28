From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 2/7] cpufreq: Add boost frequency support in core
Date: Fri, 28 Jun 2013 12:21:21 +0530
Message-ID: <CAKohpomKfHrzHpquN6adfb9r37Lf+FvDKnWBg_ebmuDcC-41Tw@mail.gmail.com>
References: <1370502472-7249-1-git-send-email-l.majewski@samsung.com>
	<1371661969-7660-1-git-send-email-l.majewski@samsung.com>
	<1371661969-7660-3-git-send-email-l.majewski@samsung.com>
	<CAKohpon7GLGvrkFQdWpco5f9P7S8L-2-ETMu2-3dFEDwOgL1RQ@mail.gmail.com>
	<20130627175546.677d9f9b@amdc308.digital.local>
	<CAKohpomuGHQ53SohgN9UyF0ODJVq3TgiyTk6TaWFSotTEZm_9w@mail.gmail.com>
	<20130628084939.1921a717@amdc308.digital.local>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20130628084939.1921a717@amdc308.digital.local>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: "Rafael J. Wysocky" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>, Lukasz Majewski <l.majewski@majess.pl>, Andre Przywara <andre.przywara@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <eduardo.valentin@ti.com>

On 28 June 2013 12:19, Lukasz Majewski <l.majewski@samsung.com> wrote:
> No, I will use:
>
> if (boost_enabled != state) {
>         write_lock_irqsave(&cpufreq_driver_lock, flags);
>         boost_enabled = state;
>
>         ret = cpufreq_driver->enable_boost(state);
>         ^^^^^^^^^^^^^^^^^^^^ only one callback call
>         if (ret)
>                 boost_enabled = 0;
>
>         write_unlock_irqrestore(&cpufreq_driver_lock, flags);
>
>         if (ret)
>                 pr_err("%s: BOOST cannot enable (%d)\n",
>                        __func__, ret);
> }
>
> and @ cpufreq_register_driver() I will add following line:
>
> if (!cpufreq_driver->enable_boost)
>         cpufreq_driver->enable_boost = &cpufreq_boost_enable_sw;
>
> When cpufreq driver doesn't define callback for enable_boost it will be
> filled with default SW cpufreq_boost_enable_sw callback.

That's some smart  code. Good. :)
