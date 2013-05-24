From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Clarification on the DVFS capabilities
Date: Fri, 24 May 2013 10:54:17 +0530
Message-ID: <CAKohpomwm8Qv6_pmbegM0kpPwYzceHBc_16gzSoULA_OzocVyA@mail.gmail.com>
References: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com>
	<CAOh2x=nMpMhYAYjhW8vxrHaY=Y8gQP+T0T1PL_FVD-u5LMiacg@mail.gmail.com>
	<CAOuKo4kr_=AOeiBjsr-7VBNJOsZvrKEtfo45JooZgsgm9gvZ_A@mail.gmail.com>
	<CAKohpoma0Z_OQxEAOuKHXq+HBwPc830yx83ZVfORM3er335F1A@mail.gmail.com>
	<CAOuKo4=3kchjS1b+EQQgskUWfZ0A9Mmizpsbk+cdWnT_k0zW-Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAOuKo4=3kchjS1b+EQQgskUWfZ0A9Mmizpsbk+cdWnT_k0zW-Q@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: karthik vm <meetvm@gmail.com>, Dirk Brandewie <dirk.j.brandewie@intel.com>
Cc: cpufreq <cpufreq@vger.kernel.org>

On 23 May 2013 22:21, karthik vm <meetvm@gmail.com> wrote:
> In the article (http://software.intel.com/en-us/articles/enhanced-intel-speedstepr-technology-and-demand-based-switching-on-linux/)
> the author says that voltage and frequency changes are separated. Does
> this mean that even though a chip has chip-wide DVFS where the voltage
> is changed simultaneously across all cores, the frequency of each core
> can be still changed individually? Kindly let me know your comments.

Dirk is an Intel expert and I am not :)

But, this is what is present at the link you gave:

"Separation between Voltage and Frequency Changes. By stepping voltage
up and down in small increments separately from frequency changes, the
processor is able to reduce periods of system unavailability (which
occur during frequency change). Thus, the system is able to transition
between voltage and frequency states more often, providing improved
power/performance balance.
"

And this probably means voltage/freq can be changed in small steps
independently to each other.. So that when you change freq you don't
necessarily change voltage..

eg: You want to go to a high freq..and you need high voltage for it..
- So increase voltage in small steps first.. so that freq line stays
stable and processor can work during that time..
- Now change freq and it may put cpu on idle for some time..

I couldn't make out if it said something about multiple cpus DVFS.
