From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Subject: Re: [Query]: CPUFREQ: Affected and related cpus in cpufreq
Date: Wed, 10 Oct 2012 14:44:33 +0100
Message-ID: <50757BC1.3050401@arm.com>
References: <CAOh2x=mJUkRxwwTRh89-Xpm1WwB9ciDOXVohqoTu6B5k6meHdw@mail.gmail.com> <50756396.9040705@arm.com> <CAKohponw2kGOewdnyicPiup5pa1bqdSo2mWicHiuLM0F0_OREg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohponw2kGOewdnyicPiup5pa1bqdSo2mWicHiuLM0F0_OREg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, spear-devel <spear-devel@list.st.com>

On 10/10/12 14:26, Viresh Kumar wrote:
[...]
> I couldn't understand the difference b/w h/w and s/w coordination. What
> do we mean by them here.
>
> Following patch added related related_cpu stuff:
>
>
> commit e8628dd06d66f2e3965ec9742029b401d63434f1
> Author: Darrick J. Wong <djwong@us.ibm.com>
> Date:   Fri Apr 18 13:31:12 2008 -0700
>
>      [CPUFREQ] expose cpufreq coordination requirements regardless of
> coordination mechanism
>
>      Currently, affected_cpus shows which CPUs need to have their frequency
>      coordinated in software.  When hardware coordination is in use, the contents
>      of this file appear the same as when no coordination is required.  This can
>      lead to some confusion among user-space programs, for example, that do not
>      know that extra coordination is required to force a CPU core to a particular
>      speed to control power consumption.
>
>      To fix this, create a "related_cpus" attribute that always displays the
>      coordination map regardless of whatever coordination strategy the cpufreq
>      driver uses (sw or hw).  If the cpufreq driver does not provide a
> value, fall
>      back to policy->cpus.
>
>      Signed-off-by: Darrick J. Wong <djwong@us.ibm.com>
>      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>      Signed-off-by: Dave Jones <davej@redhat.com>
> ---
>
Here is my understanding on this patch. This change is closely related
to ACPI cpufreq driver(used mostly on Intel cores). This change was
introduced to keep track of the related cpus as returned by ACPI
firmware along with affected cpus as imposed by SW. I don't understand
the exact difference in Intel cores.
I believe it's just for tracking and not used much in the driver.

Regards,
Sudeep

