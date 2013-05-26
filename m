From: karthik vm <meetvm@gmail.com>
Subject: Re: Clarification on the DVFS capabilities
Date: Sat, 25 May 2013 20:00:27 -0400
Message-ID: <CAOuKo4mgOcMUvqohWNOXr1J=rJ9SLG3=r9z+5qxd6zm4CuAkow@mail.gmail.com>
References: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com>
 <CAOh2x=nMpMhYAYjhW8vxrHaY=Y8gQP+T0T1PL_FVD-u5LMiacg@mail.gmail.com>
 <CAOuKo4kr_=AOeiBjsr-7VBNJOsZvrKEtfo45JooZgsgm9gvZ_A@mail.gmail.com>
 <CAKohpoma0Z_OQxEAOuKHXq+HBwPc830yx83ZVfORM3er335F1A@mail.gmail.com>
 <CAOuKo4=3kchjS1b+EQQgskUWfZ0A9Mmizpsbk+cdWnT_k0zW-Q@mail.gmail.com> <CAKohpomwm8Qv6_pmbegM0kpPwYzceHBc_16gzSoULA_OzocVyA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=Ih8a0u9/ouj08g9s7/NvOITftbrDG6K1ZdASA2LmzUg=;
        b=QPTjK81g5FW/JH4wiJzVv7jSr9tlhACaHvxC7VWNpzSnV8t260qgiQULG7Eiwa2TWw
         Vqoxu2QfbPr2xtYMuxM69P3OyReW/t9kqnNau5pd6VqZLZpkW/eotdxqDvab7sxgygOM
         jUwto0IEcTHfBA+Z+IXrEuLsJ3KF/q+GgvOa5YGjbLL33K5lFcgcE0C/eLUnqJCmIPAF
         IPa6a0YlzoGuEaPdOYTeVr/otMJzsKDEeGk8nLo0CHl9Qvk375KoDL3nKu3fpbnlR2Mp
         GaaNjuKN4ZQXljf2P5dUT6SzS6NBTRkuXPbmNbdQtA7ifnNO0uSIJO8TrlcEMLUDUV7X
         cP6g==
In-Reply-To: <CAKohpomwm8Qv6_pmbegM0kpPwYzceHBc_16gzSoULA_OzocVyA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, cpufreq <cpufreq@vger.kernel.org>

Thanks for your insights Viresh. I really appreciate it!!

Basically I wanted to know the DVFS granularity of a multi-core chip.
i.e I want to know whether every core can separately increase or
decrease its frequency or all the cores increase or decrease
simultaneously. I think cpufreq-info command's output "CPUs which need
to have their frequency coordinated by software" gives the answer. For
my core2duo processor it says either core 0 or core 1. Hence frequency
of each of my cores can be changed individually. Experimental results
also supports it. Please correct me if there is any fallacy in my
inference.

Regards,
karthik

On Fri, May 24, 2013 at 1:24 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 23 May 2013 22:21, karthik vm <meetvm@gmail.com> wrote:
>> In the article (http://software.intel.com/en-us/articles/enhanced-intel-speedstepr-technology-and-demand-based-switching-on-linux/)
>> the author says that voltage and frequency changes are separated. Does
>> this mean that even though a chip has chip-wide DVFS where the voltage
>> is changed simultaneously across all cores, the frequency of each core
>> can be still changed individually? Kindly let me know your comments.
>
> Dirk is an Intel expert and I am not :)
>
> But, this is what is present at the link you gave:
>
> "Separation between Voltage and Frequency Changes. By stepping voltage
> up and down in small increments separately from frequency changes, the
> processor is able to reduce periods of system unavailability (which
> occur during frequency change). Thus, the system is able to transition
> between voltage and frequency states more often, providing improved
> power/performance balance.
> "
>
> And this probably means voltage/freq can be changed in small steps
> independently to each other.. So that when you change freq you don't
> necessarily change voltage..
>
> eg: You want to go to a high freq..and you need high voltage for it..
> - So increase voltage in small steps first.. so that freq line stays
> stable and processor can work during that time..
> - Now change freq and it may put cpu on idle for some time..
>
> I couldn't make out if it said something about multiple cpus DVFS.
