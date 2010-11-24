From: Vishwanath Sripathy <vishwanath.sripathy@linaro.org>
Subject: Re: Issues with ondemand governor
Date: Wed, 24 Nov 2010 17:27:59 +0530
Message-ID: <AANLkTik3qRgq8EpffsusVk1puAgRdFQ7vKrf6FL=SULs@mail.gmail.com>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com>
	<4CEA959F.9000505@verisign.com>
	<AANLkTinByLn1HDEuRfYoOdZJtUsh3-_wunFP7zHOeOnn@mail.gmail.com>
	<AANLkTimyNxZ8ZEG9Zgiu-HFQmO0nS=SrYSqwzDQXWj4n@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTimyNxZ8ZEG9Zgiu-HFQmO0nS=SrYSqwzDQXWj4n@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: David C Niemi <dniemi@verisign.com>, linaro-dev@lists.linaro.org, cpufreq@vger.kernel.org

Amit,

On Tue, Nov 23, 2010 at 8:22 PM, Amit Kucheria <amit.kucheria@linaro.or=
g> wrote:
> Vishwa,
>
> Have you had a chance to do some usetime tests with these changes?
I did test USB performance with this and I see ondmeand is 90% close
to performance.
>
> It would be interesting to measure the power consumption with and
> without these changes.
Power consumption impact can vary from usecase to usecase and extra
performance will have some power impact.
However in idle scenario, I feel this should not have much impact
since ondemand timer is a deferrable timer which means that it does
not prevent cpuidle. I will try to measure it for some usecase and
compare the power impact.

Vishwa
>
> /Amit
>
> On Tue, Nov 23, 2010 at 5:59 PM, Vishwanath Sripathy
> <vishwanath.sripathy@linaro.org> wrote:
>> Thanks David for the inputs.
>> I tried your patch. In addition to that I reduced transition_latency=
=2E
>> With these 2 changes, I do see much better results (worst case
>> performance of ondemand is 88%).
>>
>> Vishwa
>>
>>
>> On Mon, Nov 22, 2010 at 9:39 PM, David C Niemi <dniemi@verisign.com>=
 wrote:
>>> The general problem here is that the ondemand governor is aimed mor=
e at
>>> power savings than performance. =A0In cases where the ondemand gove=
rnor
>>> performs worse than the performance governor, the "sampling_down_fa=
ctor"
>>> tunable is often useful. =A0I submitted the patch to add this tunab=
le a
>>> few weeks ago and it was acked by Venki, but I don't know what happ=
ened
>>> to it after that. =A0It helps in two ways:
>>>
>>> 1) the governor does not spend as much overhead on the governor whe=
n the
>>> CPU is truly busy
>>>
>>> 2) the governor is a lot less eager to downshift when the CPU is bu=
sy --
>>> without this patch, even on a busy system ondemand will blip down i=
n
>>> clock speed surprisingly often, hurting performance.
>>>
>>> This patch is all about improving peak load performance. =A0On quit=
e a few
>>> loads I've tried this patch with a sampling_down_factor of 100 matc=
hes
>>> the performance governor quite well while the original ondemand
>>> performance was poor. =A0On the other hand, it is not much help if =
you are
>>> trying to minimize power consumption on light to medium loads. =A0I=
f you
>>> set sampling_down_factor to "1" it preserves default behavior.
>>>
>>> David C Niemi
>>>
>>> Vishwanath Sripathy wrote:
>>>> Hi,
>>>>
>>>> I was trying to investigate performance issues that we were seeing
>>>> with some usecases like Video playback on OMAP Platforms with onde=
mand
>>>> governor.
>>>> As part of this, I found a tool called cpufreq-bench
>>>> (http://lwn.net/Articles/339862) which can be used determine the
>>>> performance impact of ondemand governor compared to performacne
>>>> governor.
>>>> When I ran this tool on OMAP3 (ZOOM3) platform using 2.6.36 kernel
>>>> with below command, the worstcase ondemand performance is 35% comp=
ared
>>>> to performance governor.
>>>> cpufreq-bench -l 50000 -s 100000 -x 50000 -y 100000 -g ondemand -r=
 5 -n 5 -v
>>>>
>>>> I tried the same on x86 platforms and there the worstcase performa=
nce
>>>> is around 88%.
>>>> Attached are the cpufreq-bench logs for x86 and omap3.
>>>>
>>>> Questions:
>>>> 1. Is this is known limitaiton of ondemand governor?
>>>> 2. How do we support system usecases (like video playback etc) wit=
h
>>>> ondemand governor if governor is not able to scale the frequencies=
 in
>>>> realtime? Are applications expected to play with scaling_min_freq =
to
>>>> increase mpu frequency?
>>>>
>>>> Regards
>>>> Vishwa
>>>
>>>
>>
>> _______________________________________________
>> linaro-dev mailing list
>> linaro-dev@lists.linaro.org
>> http://lists.linaro.org/mailman/listinfo/linaro-dev
>>
>
