From: Thomas Renninger <trenn@suse.de>
Subject: Re: cpufreq profiling timer
Date: Fri, 9 Dec 2011 01:22:14 +0100
Message-ID: <201112090122.14639.trenn@suse.de>
References: <CAK9wHMSBw1H5pX=SiH=p0HT6BdO__8f5Q6+YS-aAirheS4aQaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAK9wHMSBw1H5pX=SiH=p0HT6BdO__8f5Q6+YS-aAirheS4aQaQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: chao xie <xiechao.linux@gmail.com>
Cc: cpufreq@vger.kernel.org, davej@redhat.com, Arjan van de Ven <arjan@linux.intel.com>

On Tuesday 06 December 2011 02:27:46 chao xie wrote:
> hi
> Current CPUFreq governor will use deferrable timer to get the workload
> profiling run. But i think simply use this kind of timer will have
> some issue when the CPU comes to long idle. At this point, the CPUFreq
> governor for examaple, on-demand will not change the frequency lower.
> There is example,
> CPU1:
> profiling start 1                         profiling start  2
> |------------------------------++++++++|+++++++--------------------------------------------|
> "+" means CPU is busy doing a task. "-" means CPU is in idle.
> So at "profiling start 2", it detect the CPU is busy, and will
> increase the CPU frequency, may be to highest one. then during the
> second period, the task is completed, and CPU has no task to run, so
> it will enter a long idle. At this point, the profiling timer set by
> CPU governor which is deferrable will not be considered by system. So
> the CPU frequency will maintain the highest one for a long time even
> this is no task running at the CPU.
> For UP mode, it is not obviously. Because the only CPU always has some
> task to running in period.
> For SMP mode. The CPU0 will have task in period, while for other CPUs,
> they will be in idle for a long. The issue takes place frequently.
> So anyone in the mailist can give some suggestions?

Afaik, voltage and frequency of the core is lowered when entering
(deeper?) idle states on recent X86 CPUs,
so I expect it's not an issue there.

If this is an issue on ARM, I could imagine a hook could be added
to the cpuidle callback entering deeper states?

Beside powersaving there may also be a performance issue with the
deferred timer approach. When the cpu is woken up, there may be
CPU intensive work to do. But the cpufreq subsystem would lower
frequency because it only knows about the history and does not know
that a task is scheduled on this CPU now...

There were discussions about a governor fed from the scheduler
or say frequency switching directly triggered from the scheduler,
instead of polling. But that's certainly not trivial...

   Thomas
