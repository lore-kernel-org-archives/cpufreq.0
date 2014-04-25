From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: 3.15-rc2: longhaul cpufreq stalls tasks for 120s+
Date: Fri, 25 Apr 2014 12:14:19 +0530
Message-ID: <CAKohponmd=o-W8+sNP6EiZEz09m6y1J27RQDLL-psLyb9HpNsA@mail.gmail.com>
References: <alpine.SOC.1.00.1404241249480.13595@math.ut.ee>
	<CAKohpoktwh=SgHTfEgT7vYRVWHssXw7==+a9qAdtmJXepjT2Tw@mail.gmail.com>
	<alpine.SOC.1.00.1404241316290.13595@math.ut.ee>
	<5358EBB9.3090809@linux.vnet.ibm.com>
	<alpine.SOC.1.00.1404242201190.6086@math.ut.ee>
	<535969A3.4070406@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <535969A3.4070406@linux.vnet.ibm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: Meelis Roos <mroos@linux.ee>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>

On 25 April 2014 01:14, Srivatsa S. Bhat
<srivatsa.bhat@linux.vnet.ibm.com> wrote:
> On 04/25/2014 12:33 AM, Meelis Roos wrote:
>>> I see traces of mutex_lock_slowpath() etc in your logs.. Can you please
>>> enable lockdep and sleep-inside-atomic-section check and let us know if
>>> it complains? Specifically, enable these config options:
>>>
>>> CONFIG_LOCKDEP_SUPPORT=y
>>> CONFIG_DEBUG_RT_MUTEXES=y
>>> CONFIG_DEBUG_PI_LIST=y
>>> CONFIG_DEBUG_SPINLOCK=y
>>> CONFIG_DEBUG_MUTEXES=y
>>> CONFIG_DEBUG_LOCK_ALLOC=y
>>> CONFIG_PROVE_LOCKING=y
>>> CONFIG_LOCKDEP=y
>>> CONFIG_DEBUG_ATOMIC_SLEEP=y
>>
>> At boot, nothing special was in dmesg. After running cpufreq-info (which
>> hangs indefinitely), I get the following dmesg with hangs and lock info:
>
>
> Thank you for the logs, but unfortunately they don't give us much
> further insight into this issue.
>
> Just to be sure that our suspicion is right, can you try reverting
> commit 12478cf0c55 (cpufreq: Make sure frequency transitions are
> serialized) and check whether reverting the patch solves the problem?

You need to revert these three patches in the mentioned order.

236a980 cpufreq: Make cpufreq_notify_transition &
cpufreq_notify_post_transition static
8fec051 cpufreq: Convert existing drivers to use
cpufreq_freq_transition_{begin|end}
12478cf cpufreq: Make sure frequency transitions are serialized
