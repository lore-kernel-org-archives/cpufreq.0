From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Sun, 24 Mar 2013 12:16:53 +0000 (UTC)
Message-ID: <20130324121653.5652511FB35@bugzilla.kernel.org>
References: <bug-55411-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55411-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55411





--- Comment #35 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-24 12:16:53 ---
On 24 March 2013 17:19, Duncan <1i5t5.duncan@cox.net> wrote:
> On Sun, 24 Mar 2013 15:32:39 +0530 Viresh Kumar <viresh.kumar@linaro.org> wrote:

>> Hmm.. Can you try one thing? Run 3.8 over your machine and give
>> output of cpufreq-info and ls -ld after boot and resume..
>>
>> I would like to see what's the original behavior.
>
> Good idea! =:^)  It now appears that your bug simply cascaded on a
> previously unreported bug in earlier kernels.

That made me happy, i am not the only culprit :)

> The 3.8 pre-suspend and post resume ls -dl are identical -- no missing
> dirs (and no symlinks):
>
> /sys/devices/system/cpu/cpu0/cpufreq/
> /sys/devices/system/cpu/cpu1/cpufreq/
> /sys/devices/system/cpu/cpu2/cpufreq/
> /sys/devices/system/cpu/cpu3/cpufreq/
> /sys/devices/system/cpu/cpu4/cpufreq/
> /sys/devices/system/cpu/cpu5/cpufreq/

They were all separate directories (instead of symlinks) earlier because
this only depended on policy->cpus earlier. And none of the cpus are
shared in policy->cpus, i.e. policy->cpus was always policy->cpu.

> 3.8 pre-suspend cpufreq-info excerpts (nicely paired, as are the
> pre-patch pre-suspend results for 3.9-rc):

No they are still not paired well. This is how we should read your analysis:
related-cpus: "same hardware freq"
affected-cpus or policy->cpus: "frequency coordinated by software"

> analyzing CPU 0:
>   CPUs which run at the same hardware frequency: 0 1

related cpus have correct pairs

>   CPUs which need to have their frequency coordinated by software: 0

but affected cpus doesn't

> 3.8 post-resume (screwed up pairing, so that bit's not a 3.9 thing

I told you earlier, this made me happy :)

> analyzing CPU 0:
>   CPUs which run at the same hardware frequency: 0 1
>   CPUs which need to have their frequency coordinated by software: 0
> analyzing CPU 1:
>   CPUs which run at the same hardware frequency: 0 1
>   CPUs which need to have their frequency coordinated by software: 1

These stayed as is as cpu 0 is non removable cpu and so doesn't get
unregistered from cpufreq at all.

> analyzing CPU 2:
>   CPUs which run at the same hardware frequency: 2
>   CPUs which need to have their frequency coordinated by software: 2
> analyzing CPU 3:
>   CPUs which run at the same hardware frequency: 3
>   CPUs which need to have their frequency coordinated by software: 3
> analyzing CPU 4:
>   CPUs which run at the same hardware frequency: 2 4

related cpus got corrupted here.

>   CPUs which need to have their frequency coordinated by software: 4
> analyzing CPU 5:
>   CPUs which run at the same hardware frequency: 3 5
>   CPUs which need to have their frequency coordinated by software: 5


Now back to the real issues:

@Rafael/Borislav/Thomas/Andre/Darrick:

"What do we mean by software AND hardware coordination for x86 ?"

Following are the sha-id's which had something to do with above statement.

3b2d99429e3386b6e2ac949fc72486509c8bbe36
46f18e3a28295a9e11a6ffa4478241c19bc93735
acd316248205d553594296f1895ba5196b89ffcc
e8628dd06d66f2e3965ec9742029b401d63434f1
8adcc0c674004c0f9467031a93dc639c2b01411f

On the platform i work (ARM) there are only two cases, cpus share clock line or
they don't. So, they share policy struct or they don't.


Fixing Duncan's issues shouldn't be a very big deal now as i was thinking too
much about what was broken without my patches too. And now that part is
pretty clear.

--
viresh

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
