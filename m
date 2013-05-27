From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Clarification on the DVFS capabilities
Date: Mon, 27 May 2013 09:37:12 +0530
Message-ID: <CAKohponVm1O228ck5Qr4khoa+bFUjHacs=i9njDrG7DpjXJo=Q@mail.gmail.com>
References: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com>
	<CAOh2x=nMpMhYAYjhW8vxrHaY=Y8gQP+T0T1PL_FVD-u5LMiacg@mail.gmail.com>
	<CAOuKo4kr_=AOeiBjsr-7VBNJOsZvrKEtfo45JooZgsgm9gvZ_A@mail.gmail.com>
	<CAKohpoma0Z_OQxEAOuKHXq+HBwPc830yx83ZVfORM3er335F1A@mail.gmail.com>
	<CAOuKo4=3kchjS1b+EQQgskUWfZ0A9Mmizpsbk+cdWnT_k0zW-Q@mail.gmail.com>
	<CAKohpomwm8Qv6_pmbegM0kpPwYzceHBc_16gzSoULA_OzocVyA@mail.gmail.com>
	<CAOuKo4mgOcMUvqohWNOXr1J=rJ9SLG3=r9z+5qxd6zm4CuAkow@mail.gmail.com>
	<CAKohponxigN=DqZiKfd6E+2i+Jot3tQUR=z0cU8d0xxATnxkMw@mail.gmail.com>
	<CAOuKo4k+LNz4Ff5N+VJ8k-_TtRwV+9nWXwXz-Jsi00sUEvhA0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAOuKo4k+LNz4Ff5N+VJ8k-_TtRwV+9nWXwXz-Jsi00sUEvhA0A@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: karthik vm <meetvm@gmail.com>
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, cpufreq <cpufreq@vger.kernel.org>

On 27 May 2013 05:50, karthik vm <meetvm@gmail.com> wrote:
> Thanks for your insights Viresh & Dirk. I really appreciate it.
>
> I read from the net that the p-state (Voltage/Frequency) pairs in
> Intel processors(e.g Nehalem) cannot be set for individual cores
> (http://web.archive.org/web/20130527001342/http://people.cs.pitt.edu/~kirk/cs3150spring2010/ShiminChen.pptx).

I don't really know how much we can trust this one..

> As Dirk pointed out, each core may request a p-state but ultimately
> all the whole processor's p-state is set to the minimum of the
> requested p-states. But in my Core2Duo processor, I see that two cores
> are in different frequencies(p-state) and it did not fit into the
> explanation above :-(. I think I am missing something.

How do you see that? cpufreq-info? That can be tricky as the cpufreq
driver might not have exposed this to core.. So, core thinks  cores can
run at separate frequencies but code in driver is taking care to pass
on the minimum of all cores to h/w.
