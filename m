From: karthik vm <meetvm@gmail.com>
Subject: Re: Clarification on the DVFS capabilities
Date: Sun, 26 May 2013 20:20:14 -0400
Message-ID: <CAOuKo4k+LNz4Ff5N+VJ8k-_TtRwV+9nWXwXz-Jsi00sUEvhA0A@mail.gmail.com>
References: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com>
 <CAOh2x=nMpMhYAYjhW8vxrHaY=Y8gQP+T0T1PL_FVD-u5LMiacg@mail.gmail.com>
 <CAOuKo4kr_=AOeiBjsr-7VBNJOsZvrKEtfo45JooZgsgm9gvZ_A@mail.gmail.com>
 <CAKohpoma0Z_OQxEAOuKHXq+HBwPc830yx83ZVfORM3er335F1A@mail.gmail.com>
 <CAOuKo4=3kchjS1b+EQQgskUWfZ0A9Mmizpsbk+cdWnT_k0zW-Q@mail.gmail.com>
 <CAKohpomwm8Qv6_pmbegM0kpPwYzceHBc_16gzSoULA_OzocVyA@mail.gmail.com>
 <CAOuKo4mgOcMUvqohWNOXr1J=rJ9SLG3=r9z+5qxd6zm4CuAkow@mail.gmail.com> <CAKohponxigN=DqZiKfd6E+2i+Jot3tQUR=z0cU8d0xxATnxkMw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=lXvDhOH8568fg3E3pF4BJc25QxZs3jJdEc3+C7YeAEU=;
        b=Xjzh4HeE19AL4h43eSZVXEawxHQRRXUQbB+PYTkTCJGhSTnKFPqqvLpIqy/oFdZodH
         RTqMpjQezczgXbhTI3ihWk74IKPVRWFFGF3u+iUhZ3+UvfwFaV02XQ2DUDNeDGm/JCa3
         /bT7C2dOnif2bFb/ek3VZ81/K/s/WXp+HgE3SvHSgBh5HgOyUYFUHU9FZXAN3dk0kVNb
         MkrVi/hPEIJynDtftjFN/zQXtbu0YgZOuEVLP3wNygoA3kJonfQ39e0NiZXgGDB92ryb
         zZ5KpK5pPy+MOjzbsUAhXAcjf3aQNYOhOuL3Eu9wEN5+zyXYFi/VOAPN+KOHAB/Fa74e
         4pOA==
In-Reply-To: <CAKohponxigN=DqZiKfd6E+2i+Jot3tQUR=z0cU8d0xxATnxkMw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, cpufreq <cpufreq@vger.kernel.org>

Thanks for your insights Viresh & Dirk. I really appreciate it.

I read from the net that the p-state (Voltage/Frequency) pairs in
Intel processors(e.g Nehalem) cannot be set for individual cores
(http://web.archive.org/web/20130527001342/http://people.cs.pitt.edu/~kirk/cs3150spring2010/ShiminChen.pptx).

As Dirk pointed out, each core may request a p-state but ultimately
all the whole processor's p-state is set to the minimum of the
requested p-states. But in my Core2Duo processor, I see that two cores
are in different frequencies(p-state) and it did not fit into the
explanation above :-(. I think I am missing something.

Regards,
karthik

On Sun, May 26, 2013 at 3:01 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 26 May 2013 05:30, karthik vm <meetvm@gmail.com> wrote:
>> Thanks for your insights Viresh. I really appreciate it!!
>>
>> Basically I wanted to know the DVFS granularity of a multi-core chip.
>> i.e I want to know whether every core can separately increase or
>> decrease its frequency or all the cores increase or decrease
>> simultaneously. I think cpufreq-info command's output "CPUs which need
>> to have their frequency coordinated by software" gives the answer. For
>> my core2duo processor it says either core 0 or core 1. Hence frequency
>> of each of my cores can be changed individually. Experimental results
>> also supports it. Please correct me if there is any fallacy in my
>> inference.
>
> Whether cores can have separate control of clks or not is decided by
> hardware implementation. On ARM normally all cores within a cluster
> have common control of clk lines.. On Intel, I am not sure.
>
> Now, the hardware can have interesting capabilities where they can
> manage separate clk lines themselves and software doesn't need to
> do anything special for them. And so that's what Dirk pointed out
> earlier.
>
> Your observation looks correct though.
