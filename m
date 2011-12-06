From: "Niemi, David" <dniemi@verisign.com>
Subject: RE: cpufreq profiling timer
Date: Tue, 6 Dec 2011 03:21:31 +0000
Message-ID: <A116F49F965F42489A209A96C91AAC6F0D56EDD5@BRN1WNEXMBX01.vcorp.ad.vrsn.com>
References: <CAK9wHMSBw1H5pX=SiH=p0HT6BdO__8f5Q6+YS-aAirheS4aQaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAK9wHMSBw1H5pX=SiH=p0HT6BdO__8f5Q6+YS-aAirheS4aQaQ@mail.gmail.com>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: chao xie <xiechao.linux@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "davej@redhat.com" <davej@redhat.com>

What sort of settings have you tried?  This sort of situation should be helped by going to a faster sampling interval, shouldn't it?  If you go to a fast sampling interval and use sampling_down_interval greater than 1, it will check infrequently when busy but frequently when idle.  This is good if you are trying to maximize performance.  But if you are trying to minimize power consumption on light loads, you want to go in the opposite direction, set sampling_down_interval to 1, and possibly use powersave_bias.

DCN

-----Original Message-----
From: cpufreq-owner@vger.kernel.org [mailto:cpufreq-owner@vger.kernel.org] On Behalf Of chao xie
Sent: Monday, December 05, 2011 8:28 PM
To: cpufreq@vger.kernel.org; davej@redhat.com
Subject: cpufreq profiling timer

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
--
To unsubscribe from this list: send the line "unsubscribe cpufreq" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
