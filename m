From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Clarification on the DVFS capabilities
Date: Sun, 26 May 2013 12:31:30 +0530
Message-ID: <CAKohponxigN=DqZiKfd6E+2i+Jot3tQUR=z0cU8d0xxATnxkMw@mail.gmail.com>
References: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com>
	<CAOh2x=nMpMhYAYjhW8vxrHaY=Y8gQP+T0T1PL_FVD-u5LMiacg@mail.gmail.com>
	<CAOuKo4kr_=AOeiBjsr-7VBNJOsZvrKEtfo45JooZgsgm9gvZ_A@mail.gmail.com>
	<CAKohpoma0Z_OQxEAOuKHXq+HBwPc830yx83ZVfORM3er335F1A@mail.gmail.com>
	<CAOuKo4=3kchjS1b+EQQgskUWfZ0A9Mmizpsbk+cdWnT_k0zW-Q@mail.gmail.com>
	<CAKohpomwm8Qv6_pmbegM0kpPwYzceHBc_16gzSoULA_OzocVyA@mail.gmail.com>
	<CAOuKo4mgOcMUvqohWNOXr1J=rJ9SLG3=r9z+5qxd6zm4CuAkow@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAOuKo4mgOcMUvqohWNOXr1J=rJ9SLG3=r9z+5qxd6zm4CuAkow@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: karthik vm <meetvm@gmail.com>
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, cpufreq <cpufreq@vger.kernel.org>

On 26 May 2013 05:30, karthik vm <meetvm@gmail.com> wrote:
> Thanks for your insights Viresh. I really appreciate it!!
>
> Basically I wanted to know the DVFS granularity of a multi-core chip.
> i.e I want to know whether every core can separately increase or
> decrease its frequency or all the cores increase or decrease
> simultaneously. I think cpufreq-info command's output "CPUs which need
> to have their frequency coordinated by software" gives the answer. For
> my core2duo processor it says either core 0 or core 1. Hence frequency
> of each of my cores can be changed individually. Experimental results
> also supports it. Please correct me if there is any fallacy in my
> inference.

Whether cores can have separate control of clks or not is decided by
hardware implementation. On ARM normally all cores within a cluster
have common control of clk lines.. On Intel, I am not sure.

Now, the hardware can have interesting capabilities where they can
manage separate clk lines themselves and software doesn't need to
do anything special for them. And so that's what Dirk pointed out
earlier.

Your observation looks correct though.
