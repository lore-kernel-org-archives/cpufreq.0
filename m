From: chao xie <xiechao.linux@gmail.com>
Subject: Re: cpufreq profiling timer
Date: Fri, 9 Dec 2011 09:46:11 +0800
Message-ID: <CAK9wHMTipvSvsZ22-=7n+ewiwu3+9Xop84ShV1rLCxqutQBo_g@mail.gmail.com>
References: <CAK9wHMSBw1H5pX=SiH=p0HT6BdO__8f5Q6+YS-aAirheS4aQaQ@mail.gmail.com>
	<201112090122.14639.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=9ZbbwOykx9NLDfqOEpf4ZZs3RCAnhqWYq5JX8HSiESE=;
        b=o8UEBBaA3Spzpy9BI5N5nzAGsLMdPGEsuF+cAwpXR4jwVXV/b3dLtLVj6YJzk5Qdtv
         FB4PoDOntYccb3BNJYlZ3YFUTOTMP2aiesd11oQubGrAKkd3uNE1L0wHhyFAH51Scy7A
         oGWuA4krsWWB0vFT8nB0AC2ROV7ri1j6GBunQ=
In-Reply-To: <201112090122.14639.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org, davej@redhat.com, Arjan van de Ven <arjan@linux.intel.com>

hi
Yes. The idle hook can handle this situation.
I have checked android's kernel source code. They add a new governor
named cpufreq_interactive. This goveror has add a hook for CPU idle,
and maintain a varibale named target_freq. So when system enter idle,
and the target_freq is not the policy->min, the timer will be set, or
the time will not.
I think this can handle the situation that the system uddenly go to
idle, and the governor does not issue profiling to detect it.

2011/12/9 Thomas Renninger <trenn@suse.de>:
> On Tuesday 06 December 2011 02:27:46 chao xie wrote:
>> hi
>> Current CPUFreq governor will use deferrable timer to get the worklo=
ad
>> profiling run. But i think simply use this kind of timer will have
>> some issue when the CPU comes to long idle. At this point, the CPUFr=
eq
>> governor for examaple, on-demand will not change the frequency lower=
=2E
>> There is example,
>> CPU1:
>> profiling start 1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr=
ofiling start =A02
>> |------------------------------++++++++|+++++++---------------------=
-----------------------|
>> "+" means CPU is busy doing a task. "-" means CPU is in idle.
>> So at "profiling start 2", it detect the CPU is busy, and will
>> increase the CPU frequency, may be to highest one. then during the
>> second period, the task is completed, and CPU has no task to run, so
>> it will enter a long idle. At this point, the profiling timer set by
>> CPU governor which is deferrable will not be considered by system. S=
o
>> the CPU frequency will maintain the highest one for a long time even
>> this is no task running at the CPU.
>> For UP mode, it is not obviously. Because the only CPU always has so=
me
>> task to running in period.
>> For SMP mode. The CPU0 will have task in period, while for other CPU=
s,
>> they will be in idle for a long. The issue takes place frequently.
>> So anyone in the mailist can give some suggestions?
>
> Afaik, voltage and frequency of the core is lowered when entering
> (deeper?) idle states on recent X86 CPUs,
> so I expect it's not an issue there.
>
> If this is an issue on ARM, I could imagine a hook could be added
> to the cpuidle callback entering deeper states?
>
> Beside powersaving there may also be a performance issue with the
> deferred timer approach. When the cpu is woken up, there may be
> CPU intensive work to do. But the cpufreq subsystem would lower
> frequency because it only knows about the history and does not know
> that a task is scheduled on this CPU now...
>
> There were discussions about a governor fed from the scheduler
> or say frequency switching directly triggered from the scheduler,
> instead of polling. But that's certainly not trivial...
>
> =A0 Thomas
