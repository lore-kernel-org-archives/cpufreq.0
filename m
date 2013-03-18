From: Bruce Dawson <bruced@valvesoftware.com>
Subject: RE: CPU power management bug -- CPU bound task fails to raise CPU
 frequency
Date: Mon, 18 Mar 2013 19:07:13 +0000
Message-ID: <2AC155A009400B4C8B05D518E4819AEF071D377E@exchange10.valvesoftware.com>
References: <2AC155A009400B4C8B05D518E4819AEF071D2E6B@exchange10.valvesoftware.com>
	<CAOh2x=kQqJVfFLAnW15mCUcUdrpM4nzTd75G=sAAHC7kgm5B-w@mail.gmail.com>
	<2AC155A009400B4C8B05D518E4819AEF071D3069@exchange10.valvesoftware.com>
	<CAKohpomLD+=YtsQm5B6PDOuvVOnBx1tpOXCUnoCY==8D-KhT-Q@mail.gmail.com>
 <CAKfTPtBbnTCV5cJ=2P+xiUzoKp0wvBcgfbWzE3pgcGKq2D1E3g@mail.gmail.com>
 <2AC155A009400B4C8B05D518E4819AEF071D34EE@exchange10.valvesoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <2AC155A009400B4C8B05D518E4819AEF071D34EE@exchange10.valvesoftware.com>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Bruce Dawson <bruced@valvesoftware.com>, 'Vincent Guittot' <vincent.guittot@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dave Jones <davej@redhat.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>

BTW, I just uploaded a screenshot of the shell script running. You can see it here:

http://www.cygnus-software.com/images/ZoomScreenshot_croppedbig.png

It was made using http://www.rotateright.com/zoom/. The red blocks are the bash process, the other ones are various invocations of expr.

-----Original Message-----
From: cpufreq-owner@vger.kernel.org [mailto:cpufreq-owner@vger.kernel.org] On Behalf Of Bruce Dawson
Sent: Monday, March 18, 2013 10:01 AM
To: 'Vincent Guittot'; Viresh Kumar
Cc: Dave Jones; cpufreq@vger.kernel.org; Rafael J. Wysocki; linaro-kernel@lists.linaro.org
Subject: RE: CPU power management bug -- CPU bound task fails to raise CPU frequency

I guess that makes sense for the scheduler to look for the idlest CPU in the system. That's good to know.

I had guessed that the scheduler would do something like that and that my test would run on two cores. However I find that bash alternates between two cores, which seems odd. Additionally, each invocation of expr starts on one core and moves to another, which seems odd that each invocation lives for a ms or less. The net effect is that six or more different cores get involved.

Anyway, it is a pathological case, so maybe it doesn't matter, but given the popularity of $(command) in shell scripts it may not be completely irrelevant either.

-----Original Message-----
From: Vincent Guittot [mailto:vincent.guittot@linaro.org]
Sent: Monday, March 18, 2013 4:07 AM
To: Viresh Kumar
Cc: Bruce Dawson; Dave Jones; cpufreq@vger.kernel.org; Rafael J. Wysocki; linaro-kernel@lists.linaro.org
Subject: Re: CPU power management bug -- CPU bound task fails to raise CPU frequency

On 18 March 2013 06:04, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Let me get in the scheduler expert from Linaro (Vincent Guittot, would 
> be available after few hours)
>
> Vincent, please start reading from this mail:
>
> http://permalink.gmane.org/gmane.linux.kernel.cpufreq/9675
>
> Now, we want to understand how to make this task perform better as 
> scheduler is using multiple cpus for it and hence all are staying at 
> low freqs, as load isn't enough..

Hi,

Your 1st test creates a task to evaluate each expr, and the fork sequence of the scheduler looks for the idlest CPU in the system.
That's explain why your test is evenly spread on all CPUs and the average load of each CPU is below the threshold of cpufreq At the opposite, your 2nd test uses only one task which stays on one CPU and trig the frequency increase.

I would say that the scheduler behavior is almost normal : spread to get best performance (even if in this use case, the threads run
sequentially) but you have this side effect on the cpufreq thats sees each core individually as not loaded. This example tends to push in favor of a better cooperation between scheduler and cpufreq for sharing statistics

Vincent

>
> --
> viresh
>
> On 18 March 2013 10:28, Bruce Dawson <bruced@valvesoftware.com> wrote:
>> This is with the Ondemand governor.
>>
>> The more I ponder this the more I think that the real issue is not the frequency drivers, but the kernel scheduler. The shell script involves two processes being alive at any given time, and one process running (since bash always waits for expr to finish). Therefore the entire task should run on either one core or on two. Instead I see (from looking at thread scheduling graphed using the Zoom profiler -- http://www.rotateright.com/) that it runs on six different cores. bash alternates between two cores, and each invocation of expr is started on one core and then moves to another. Given that it seems not surprising that the CPU frequency management doesn't trigger.
>>
>>> So, the frequency might not be increased if there are multiple cpus 
>>> running for a specific task and none of them has high enough load at 
>>> that time
>>
>> Yep, that's what I figured. Each cpu's load is quite low -- 20% or lower -- because the work is so spread out.
>>
>> If I run the entire thing under "taskset 1" then everything runs on one core, the frequency elevation happens, and the entire task runs roughly three times faster.
>>
>> Crazy/cool.
>>
>> -----Original Message-----
>> From: viresh.linux@gmail.com [mailto:viresh.linux@gmail.com] On 
>> Behalf Of Viresh Kumar
>> Sent: Sunday, March 17, 2013 9:32 PM
>> To: Bruce Dawson
>> Cc: Dave Jones; cpufreq@vger.kernel.org; Rafael J. Wysocki; 
>> linaro-kernel@lists.linaro.org
>> Subject: Re: CPU power management bug -- CPU bound task fails to 
>> raise CPU frequency
>>
>> On Sun, Mar 17, 2013 at 6:37 AM, Bruce Dawson <bruced@valvesoftware.com> wrote:
>>> Dave/others, I've come up with a simple (and real) scenario where a CPU bound task running on Ubuntu (and presumably other Linux flavors) fails to be detected as CPU bound by the Linux kernel, meaning that the CPU continues to run at low speed, meaning that this CPU bound task takes (on my machines) about three times longer to run than it should.
>>>
>>> I found these e-mail addresses in the MAINTAINERS list under CPU FREQUENCY DRIVERS which I'm hoping is the correct area.
>>
>> Yes, cpufreq mailing list is the right list for this.
>>
>>> The basic problem is that on a multi-core system if you run a shell script that spawns lots of sub processes then the workload ends up distributed across all of the CPUs. Therefore, since none of the CPUs are particularly busy, the Linux kernel doesn't realize that a CPU bound task is running, so it leaves the CPU frequency set to low. I have confirmed the behavior in multiple ways. Specifically, I have used "iostat 1" and "mpstat -P ALL 1" to confirm that a full core's worth of CPU work is being done. mpstat also showed that the work was distributed across multiple cores. Using the zoom profiler UI for perf showed the sub processes (and bash) being spread across multiple cores, and perf stat showed that the CPU frequency was staying low even though the task was CPU bound.
>>
>> There are few things which would be helpful to understand what's going on.
>> What governor is used in your case? Probably Ondemand (My ubuntu uses this).
>>
>> Ideally, cpu frequency is increased only if cpu load is very high (or 
>> above threshold,
>> 95 in my ubuntu). So, the frequency might not be increased if there are multiple cpus running for a specific task and none of them has high enough load at that time.
>>
>> Other stuff that i suspect here is a bug which was solved recently by 
>> below patch. If
>> policy->cpu (that might be cpu 0 for you) is sleeping, then load is
>> never evaluated even
>> if all other cpus are very busy. If you can try below patch then it might be helpful. BTW, you might not be able to apply it easily as it has got lots of dependencies.. and so you might need to pick all drivers/cpufreq patches from v3.9-rc1.
>>
>> commit 2abfa876f1117b0ab45f191fb1f82c41b1cbc8fe
>> Author: Rickard Andersson <rickard.andersson@stericsson.com>
>> Date:   Thu Dec 27 14:55:38 2012 +0000
>>
>>     cpufreq: handle SW coordinated CPUs
>>
>>     This patch fixes a bug that occurred when we had load on a secondary CPU
>>     and the primary CPU was sleeping. Only one sampling timer was spawned
>>     and it was spawned as a deferred timer on the primary CPU, so when a
>>     secondary CPU had a change in load this was not detected by the cpufreq
>>     governor (both ondemand and conservative).
>>
>>     This patch make sure that deferred timers are run on all CPUs in the
>>     case of software controlled CPUs that run on the same frequency.
>>
>>     Signed-off-by: Rickard Andersson <rickard.andersson@stericsson.com>
>>     Signed-off-by: Fabio Baltieri <fabio.baltieri@linaro.org>
>>     Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> ---
>>  drivers/cpufreq/cpufreq_conservative.c |  3 ++-
>>  drivers/cpufreq/cpufreq_governor.c     | 44
>> ++++++++++++++++++++++++++++++++++++++------
>>  drivers/cpufreq/cpufreq_governor.h     |  1 +
>>  drivers/cpufreq/cpufreq_ondemand.c     |  3 ++-
>>  4 files changed, 43 insertions(+), 8 deletions(-)
>>
>>
>>> I have only reproed this behavior on six-core/twelve-thread systems. I would assume that at least a two-core system would be needed to repro this bug, and perhaps more. The bug will not repro if the system is not relatively idle, since a background CPU hog will force the frequency up.
>>>
>>> The repro is exquisitely simple -- ExprCount() is a simplified version of the repro (portable looping in a shell script) and BashCount() is an optimized and less portable version that runs far faster and also avoids this power management problem -- the CPU frequency is raised appropriately. Running a busy loop in another process is another way to get the frequency up and this makes ExprCount() run ~3x faster. Here is the script:
>>>
>>> --------------------------------------
>>> #!/bin/bash
>>> function ExprCount() {
>>>         i=$1
>>>         while [ $i -gt 0 ]; do
>>>                 i=$(expr $i - 1)
>>
>> I may be wrong but one cpu is used to run this script and other one would be used to run expr program.. So, 2 cpus should be good enough to reproduce this setup.
>>
>> BTW, i have tried your scripts and was able to reproduce the setup 
>> here on a 2 cpu
>> 4 thread system.
>>
>> --
>> viresh
--
To unsubscribe from this list: send the line "unsubscribe cpufreq" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
