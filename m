From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 2/7] cpufreq: Add boost frequency support in core
Date: Fri, 28 Jun 2013 09:10:53 +0530
Message-ID: <CAKohpomuGHQ53SohgN9UyF0ODJVq3TgiyTk6TaWFSotTEZm_9w@mail.gmail.com>
References: <1370502472-7249-1-git-send-email-l.majewski@samsung.com>
	<1371661969-7660-1-git-send-email-l.majewski@samsung.com>
	<1371661969-7660-3-git-send-email-l.majewski@samsung.com>
	<CAKohpon7GLGvrkFQdWpco5f9P7S8L-2-ETMu2-3dFEDwOgL1RQ@mail.gmail.com>
	<20130627175546.677d9f9b@amdc308.digital.local>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20130627175546.677d9f9b@amdc308.digital.local>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: "Rafael J. Wysocky" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>, Lukasz Majewski <l.majewski@majess.pl>, Andre Przywara <andre.przywara@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <eduardo.valentin@ti.com>

On 27 June 2013 21:25, Lukasz Majewski <l.majewski@samsung.com> wrote:
> On Wed, 26 Jun 2013 16:24:32 +0530, Viresh Kumar wrote:
>> > +       if (boost_enabled != state) {
>> > +               write_lock_irqsave(&cpufreq_driver_lock, flags);
>> > +               boost_enabled = state;
>> > +               if (cpufreq_driver->enable_boost)
>> > +                       ret = cpufreq_driver->enable_boost(state);
>> > +               else
>> > +                       ret = cpufreq_boost_trigger_state_sw();
>
> I will use only one call to cpufreq_driver->enable_boost(state) [*] with
> either cpufreq_boost_enable_sw() (function with SW boost handling) or
>  the one provided by cpufreq driver.
>
> Only when cpufreq driver doesn't provide [*], it will be filled with
> "default" cpufreq_boost_enable_sw().

I didn't get it completely. You are saying you will send a function pointer
now?
