From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Query]: CPUFREQ: Affected and related cpus in cpufreq
Date: Wed, 10 Oct 2012 18:56:28 +0530
Message-ID: <CAKohponw2kGOewdnyicPiup5pa1bqdSo2mWicHiuLM0F0_OREg@mail.gmail.com>
References: <CAOh2x=mJUkRxwwTRh89-Xpm1WwB9ciDOXVohqoTu6B5k6meHdw@mail.gmail.com>
	<50756396.9040705@arm.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50756396.9040705@arm.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, spear-devel <spear-devel@list.st.com>

On 10 October 2012 17:31, Sudeep KarkadaNagesha
<Sudeep.KarkadaNagesha@arm.com> wrote:
> On 08/10/12 14:58, viresh kumar wrote:

>> affected_cpus(policy->cpus):
>> - List of CPUs that require software coordination of frequency.
>> - Processors part of affected_cpus share policy struct
>> - Policy limits the frequencies that the processor can work with.
>>
>> related_cpus(policy->related_cpus):
>> - List of CPUs that need some sort of frequency coordination, whether
>>    software or hardware.
>> - Processors part of related_cpus share governer.
>
> Which document states this ?

Code.

> As per my understanding and if you see in cpufreq.c, related_cpus are
> used only when adding back the hotplugged cpu to get the governor.
> Elsewhere affected_cpus is used.

Probably yes. I was wrong.

> Ideally it would be good if above statements is true.
> E.g. In SMP with 4 CPUs(with same OPPs), if 0-1 and 2-3 need h/w
> co-ordination, then:
> related_cpus: 0-1 and 2-3
> affected_cpus: case#1: 0-1 and 2-3 if we want to have different policies
>                case#2: 0-3 if we want to have same policy on all CPUS
> I believe this is not possible in current code.

I couldn't understand the difference b/w h/w and s/w coordination. What
do we mean by them here.

Following patch added related related_cpu stuff:


commit e8628dd06d66f2e3965ec9742029b401d63434f1
Author: Darrick J. Wong <djwong@us.ibm.com>
Date:   Fri Apr 18 13:31:12 2008 -0700

    [CPUFREQ] expose cpufreq coordination requirements regardless of
coordination mechanism

    Currently, affected_cpus shows which CPUs need to have their frequency
    coordinated in software.  When hardware coordination is in use, the contents
    of this file appear the same as when no coordination is required.  This can
    lead to some confusion among user-space programs, for example, that do not
    know that extra coordination is required to force a CPU core to a particular
    speed to control power consumption.

    To fix this, create a "related_cpus" attribute that always displays the
    coordination map regardless of whatever coordination strategy the cpufreq
    driver uses (sw or hw).  If the cpufreq driver does not provide a
value, fall
    back to policy->cpus.

    Signed-off-by: Darrick J. Wong <djwong@us.ibm.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Dave Jones <davej@redhat.com>
---
