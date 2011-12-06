From: chao xie <xiechao.linux@gmail.com>
Subject: cpufreq profiling timer
Date: Tue, 6 Dec 2011 09:27:46 +0800
Message-ID: <CAK9wHMSBw1H5pX=SiH=p0HT6BdO__8f5Q6+YS-aAirheS4aQaQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=vBbMyfwn+dQB2Bnqr7gZxS8vXn2J+0dM2NttZGV0Guo=;
        b=yEvtMcBUr+XCP7XyHu64vZzfZT2TwbAINNpSCySEx66HrohVzJAAHJQedqpwFHlr0E
         EWyLHcBe/GUWwFvA7qxno19mleuSgHLUZSq9gY1f9bZxl8MO5aI2X/qfZTq0lSp6eX0l
         YrvHqgwXet5ofy1rdIWZ5gc+38ZshAqAdzZtw=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, davej@redhat.com

hi
Current CPUFreq governor will use deferrable timer to get the workload
profiling run. But i think simply use this kind of timer will have
some issue when the CPU comes to long idle. At this point, the CPUFreq
governor for examaple, on-demand will not change the frequency lower.
There is example,
CPU1:
profiling start 1                         profiling start  2
|------------------------------++++++++|+++++++--------------------------------------------|
"+" means CPU is busy doing a task. "-" means CPU is in idle.
So at "profiling start 2", it detect the CPU is busy, and will
increase the CPU frequency, may be to highest one. then during the
second period, the task is completed, and CPU has no task to run, so
it will enter a long idle. At this point, the profiling timer set by
CPU governor which is deferrable will not be considered by system. So
the CPU frequency will maintain the highest one for a long time even
this is no task running at the CPU.
For UP mode, it is not obviously. Because the only CPU always has some
task to running in period.
For SMP mode. The CPU0 will have task in period, while for other CPUs,
they will be in idle for a long. The issue takes place frequently.
So anyone in the mailist can give some suggestions?
