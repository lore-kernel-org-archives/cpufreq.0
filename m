From: David C Niemi <dniemi@verisign.com>
Subject: Re: Issues with ondemand governor
Date: Mon, 22 Nov 2010 11:09:03 -0500
Message-ID: <4CEA959F.9000505@verisign.com>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vishwanath Sripathy <vishwanath.sripathy@linaro.org>
Cc: cpufreq@vger.kernel.org, linaro-dev@lists.linaro.org

The general problem here is that the ondemand governor is aimed more at
power savings than performance.  In cases where the ondemand governor
performs worse than the performance governor, the "sampling_down_factor"
tunable is often useful.  I submitted the patch to add this tunable a
few weeks ago and it was acked by Venki, but I don't know what happened
to it after that.  It helps in two ways:

1) the governor does not spend as much overhead on the governor when the
CPU is truly busy

2) the governor is a lot less eager to downshift when the CPU is busy --
without this patch, even on a busy system ondemand will blip down in
clock speed surprisingly often, hurting performance.

This patch is all about improving peak load performance.  On quite a few
loads I've tried this patch with a sampling_down_factor of 100 matches
the performance governor quite well while the original ondemand
performance was poor.  On the other hand, it is not much help if you are
trying to minimize power consumption on light to medium loads.  If you
set sampling_down_factor to "1" it preserves default behavior.

David C Niemi

Vishwanath Sripathy wrote:
> Hi,
>
> I was trying to investigate performance issues that we were seeing
> with some usecases like Video playback on OMAP Platforms with ondemand
> governor.
> As part of this, I found a tool called cpufreq-bench
> (http://lwn.net/Articles/339862) which can be used determine the
> performance impact of ondemand governor compared to performacne
> governor.
> When I ran this tool on OMAP3 (ZOOM3) platform using 2.6.36 kernel
> with below command, the worstcase ondemand performance is 35% compared
> to performance governor.
> cpufreq-bench -l 50000 -s 100000 -x 50000 -y 100000 -g ondemand -r 5 -n 5 -v
>
> I tried the same on x86 platforms and there the worstcase performance
> is around 88%.
> Attached are the cpufreq-bench logs for x86 and omap3.
>
> Questions:
> 1. Is this is known limitaiton of ondemand governor?
> 2. How do we support system usecases (like video playback etc) with
> ondemand governor if governor is not able to scale the frequencies in
> realtime? Are applications expected to play with scaling_min_freq to
> increase mpu frequency?
>
> Regards
> Vishwa

