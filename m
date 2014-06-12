From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 09:48:10 +0000
Message-ID: <bug-77201-12968-1iosalVTVc@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #56 from Mauro <registosites@hotmail.com> ---
(In reply to Viresh Kumar from comment #55)
> (In reply to Rafael J. Wysocki from comment #52)
> > (In reply to registosites from comment #50)
> > > (In reply to Srivatsa S. Bhat from comment #48)
> > > 
> > > Should I also test
> > > 
> > > e0b3165ba521 (cpufreq: add 'freq_table' in struct cpufreq_policy)
> > > 12478cf0c55e (cpufreq: Make sure frequency transitions are serialized)
> > > 
> > > in case the previous ones work/don't work?
> > 
> > Yes, please.
> 
> Actually no. These must have went into 3.15 and we are trying to debug 3.14
> here. Did I miss anything ?

I have finished testing the following:

6f1e4efd882 (cpufreq: Fix timer/workqueue corruption by protecting reading
governor_enabled)
87ae97f10c0 (cpufreq: s3c24xx: Staticize local variable)
result: both ok


1c0ca90207 (cpufreq: don't call cpufreq_update_policy() on CPU addition)
d9a789c7a0 (cpufreq: Refactor cpufreq_set_policy())
result: both bad


4e97b631f24 (cpufreq: Initialize governor for a new policy under policy->rwsem)
5a7e56a5d29 (cpufreq: Initialize policy before making it available for others
to use)
result: both bad

I have also tested setting the governor to userspace, setting the cpu to the
minimum speed, cpu offline/online, set an intermediate cpu speed and then
maximum speed.

The machine becomes unresponsive only when trying to set the cpu to the maximum
speed.

If I understand correctly, the suggestion to try next is to keep the patch from 
comment 32, keep the changes I've done to powernow-k8 (remove all pr_debug()),
keep the extra compile flags in drivers/cpufreq/Makefile and also add plenty of
pr_debug() to drivers/cpufreq/cpufreq.c.

I assume it is here I should add more debug output since target_index() can be
found only here. If I'm correct, in which places would it make more sense to
add debug output and which info should I try to output?

I'm ok with doing this as long as it doesn't get too complicated, the reason is
my programming skills are not that good and I have zero knowledge of the
kernel's internals.

-- 
You are receiving this mail because:
You are the assignee for the bug.
