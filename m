From: Vishwanath Sripathy <vishwanath.sripathy@linaro.org>
Subject: Re: Issues with ondemand governor
Date: Tue, 23 Nov 2010 17:59:11 +0530
Message-ID: <AANLkTinByLn1HDEuRfYoOdZJtUsh3-_wunFP7zHOeOnn@mail.gmail.com>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com>
	<4CEA959F.9000505@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4CEA959F.9000505@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David C Niemi <dniemi@verisign.com>
Cc: cpufreq@vger.kernel.org, linaro-dev@lists.linaro.org

Thanks David for the inputs.
I tried your patch. In addition to that I reduced transition_latency.
With these 2 changes, I do see much better results (worst case
performance of ondemand is 88%).

Vishwa


On Mon, Nov 22, 2010 at 9:39 PM, David C Niemi <dniemi@verisign.com> wr=
ote:
> The general problem here is that the ondemand governor is aimed more =
at
> power savings than performance. =A0In cases where the ondemand govern=
or
> performs worse than the performance governor, the "sampling_down_fact=
or"
> tunable is often useful. =A0I submitted the patch to add this tunable=
 a
> few weeks ago and it was acked by Venki, but I don't know what happen=
ed
> to it after that. =A0It helps in two ways:
>
> 1) the governor does not spend as much overhead on the governor when =
the
> CPU is truly busy
>
> 2) the governor is a lot less eager to downshift when the CPU is busy=
 --
> without this patch, even on a busy system ondemand will blip down in
> clock speed surprisingly often, hurting performance.
>
> This patch is all about improving peak load performance. =A0On quite =
a few
> loads I've tried this patch with a sampling_down_factor of 100 matche=
s
> the performance governor quite well while the original ondemand
> performance was poor. =A0On the other hand, it is not much help if yo=
u are
> trying to minimize power consumption on light to medium loads. =A0If =
you
> set sampling_down_factor to "1" it preserves default behavior.
>
> David C Niemi
>
> Vishwanath Sripathy wrote:
>> Hi,
>>
>> I was trying to investigate performance issues that we were seeing
>> with some usecases like Video playback on OMAP Platforms with ondema=
nd
>> governor.
>> As part of this, I found a tool called cpufreq-bench
>> (http://lwn.net/Articles/339862) which can be used determine the
>> performance impact of ondemand governor compared to performacne
>> governor.
>> When I ran this tool on OMAP3 (ZOOM3) platform using 2.6.36 kernel
>> with below command, the worstcase ondemand performance is 35% compar=
ed
>> to performance governor.
>> cpufreq-bench -l 50000 -s 100000 -x 50000 -y 100000 -g ondemand -r 5=
 -n 5 -v
>>
>> I tried the same on x86 platforms and there the worstcase performanc=
e
>> is around 88%.
>> Attached are the cpufreq-bench logs for x86 and omap3.
>>
>> Questions:
>> 1. Is this is known limitaiton of ondemand governor?
>> 2. How do we support system usecases (like video playback etc) with
>> ondemand governor if governor is not able to scale the frequencies i=
n
>> realtime? Are applications expected to play with scaling_min_freq to
>> increase mpu frequency?
>>
>> Regards
>> Vishwa
>
>
