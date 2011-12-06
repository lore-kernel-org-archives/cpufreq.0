From: chao xie <xiechao.linux@gmail.com>
Subject: Re: cpufreq profiling timer
Date: Tue, 6 Dec 2011 13:15:26 +0800
Message-ID: <CAK9wHMTRxTK2i9x5-+v63MR79DpYNK-aB8SKnGnEzEGiC3dO1Q@mail.gmail.com>
References: <CAK9wHMSBw1H5pX=SiH=p0HT6BdO__8f5Q6+YS-aAirheS4aQaQ@mail.gmail.com>
	<A116F49F965F42489A209A96C91AAC6F0D56EDD5@BRN1WNEXMBX01.vcorp.ad.vrsn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=C/lQSsX+FMqgkT/XcHGmNEMaEDHpXSTpP1gSOST47L4=;
        b=PglgHBPZ/qgn8K0vvrYDQwp917odr4NsvJTsi585JQ23ONewEdNc9cqrjFSmJrBaPf
         VdjdJMJ3NI8iaAj2Kkmzd5gZxhUxi7UjfvNcaP+QgP7Pgdcd8pY8ckiZjwScw6taRXFz
         sNL5XRPwn7hWptYB5xTC4kaoeY9XJjZ0LdKLI=
In-Reply-To: <A116F49F965F42489A209A96C91AAC6F0D56EDD5@BRN1WNEXMBX01.vcorp.ad.vrsn.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Niemi, David" <dniemi@verisign.com>, cpufreq@vger.kernel.org, davej@redhat.com

hi
What make me confused is not the setting of CPUFreq.
It is the timer of CPUfreq governor which will invoke workload sample
function in period.
This timer is deferrable timer which will not be issued when NO_HZ is
enabled and the core is goting to long idle without any task running
at it.
I have a arm board with two cores. each one will have a cpufreq_policy
running at it. After boot up, the cores are all running at 800MHZ. At
this time, i switch the current cpufreq governor of the cores from
"userspace" to "ondemand". i can see that the sample function in CPU0
is running, and try to low down the frequncy of CPU0, while for CPU1,
the sample function is not called even once. So i checked the code,
and find that the timer for sampling is not issued at CPU1. The reason
is the timer is deferrable.
the task switching the governor at CPU1 will start "on-demand"
governor and set the timer to launch the sampling. Because the timer
is deferrable, and after the task is completed, there is no running
task in CPU1 now, and CPU1 will enter long idle. At this time it will
query the latest timer that will expire. In fact, the deferrable timer
is not considered. So the sampling of CPU1 will not start, and CPU1
will be 800MHZ for a long time even it is totaly idle.

2011/12/6 Niemi, David <dniemi@verisign.com>:
> What sort of settings have you tried? =A0This sort of situation shoul=
d be helped by going to a faster sampling interval, shouldn't it? =A0If=
 you go to a fast sampling interval and use sampling_down_interval grea=
ter than 1, it will check infrequently when busy but frequently when id=
le. =A0This is good if you are trying to maximize performance. =A0But i=
f you are trying to minimize power consumption on light loads, you want=
 to go in the opposite direction, set sampling_down_interval to 1, and =
possibly use powersave_bias.
>
> DCN
>
> -----Original Message-----
> From: cpufreq-owner@vger.kernel.org [mailto:cpufreq-owner@vger.kernel=
=2Eorg] On Behalf Of chao xie
> Sent: Monday, December 05, 2011 8:28 PM
> To: cpufreq@vger.kernel.org; davej@redhat.com
> Subject: cpufreq profiling timer
>
> hi
> Current CPUFreq governor will use deferrable timer to get the workloa=
d
> profiling run. But i think simply use this kind of timer will have
> some issue when the CPU comes to long idle. At this point, the CPUFre=
q
> governor for examaple, on-demand will not change the frequency lower.
> There is example,
> CPU1:
> profiling start 1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pro=
filing start =A02
> |------------------------------++++++++|+++++++----------------------=
----------------------|
> "+" means CPU is busy doing a task. "-" means CPU is in idle.
> So at "profiling start 2", it detect the CPU is busy, and will
> increase the CPU frequency, may be to highest one. then during the
> second period, the task is completed, and CPU has no task to run, so
> it will enter a long idle. At this point, the profiling timer set by
> CPU governor which is deferrable will not be considered by system. So
> the CPU frequency will maintain the highest one for a long time even
> this is no task running at the CPU.
> For UP mode, it is not obviously. Because the only CPU always has som=
e
> task to running in period.
> For SMP mode. The CPU0 will have task in period, while for other CPUs=
,
> they will be in idle for a long. The issue takes place frequently.
> So anyone in the mailist can give some suggestions?
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
