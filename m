From: Vishwanath Sripathy <vishwanath.sripathy@linaro.org>
Subject: Re: Issues with ondemand governor
Date: Thu, 25 Nov 2010 17:35:49 +0530
Message-ID: <AANLkTintd_5LMEPS5OGK0Zh0ydQp-X4D9=kFEpbRFTsg@mail.gmail.com>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com>
	<4CEA959F.9000505@verisign.com>
	<AANLkTinByLn1HDEuRfYoOdZJtUsh3-_wunFP7zHOeOnn@mail.gmail.com>
	<AANLkTimyNxZ8ZEG9Zgiu-HFQmO0nS=SrYSqwzDQXWj4n@mail.gmail.com>
	<AANLkTik3qRgq8EpffsusVk1puAgRdFQ7vKrf6FL=SULs@mail.gmail.com>
	<4CED1D43.6080900@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4CED1D43.6080900@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David C Niemi <dniemi@verisign.com>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, linaro-dev@lists.linaro.org, cpufreq@vger.kernel.org

Thanks David.
If I would like to fine tune up_threshold and sampling_down_factor for
say OMAP platform, is there any way to do it in kernel itself?
I know these are configurable via sysfs entries. But if I want to
optimize them in kernel itself, is there anyway? I see that default
values are set in cpufreq-ondemand.c which is common kernel file. I
would like to know if these can be set in platform specific code?

Vishwa
On Wed, Nov 24, 2010 at 7:42 PM, David C Niemi <dniemi@verisign.com> wr=
ote:
>
> Thanks for running the tests, Vishwa. =A0Your results are what I'd ex=
pect
> but it's good to see independent confirmation. =A0In my benchmarks I =
saw
> 95-100% of the performance governor's performance, but the conditions
> were more favorable and the original ondemand governor was "only"
> degrading performance 20-30% to begin with.
>
> There should be absolutely no changes in power consumption at all for
> the patch itself, as behavior does not change until you raise
> sampling_down_factor above 1 (the default). =A0If you set it high, I =
would
> expect higher power consumption (but also higher performance) under l=
oad
> and no change in power consumption when idle or close to idle. =A0Set=
ting
> a high sampling_down_factor causes the governor to reevaluate load le=
ss
> often when at max cpu speed, both to reduce overhead and to let it
> remain at maximum performance more consistently. =A0Without this chan=
ge,
> the ondemand governor jitters a lot in and out of max clock speed whe=
n
> under high loads, which is why its performance can be much worse than
> the performance governor. =A0Reducing the number of transitions and l=
oad
> evaluations should also improve performance per watt, though the deta=
ils
> of that depend on the relative efficiency of the CPU's respective clo=
ck
> speeds.
>
> If you want to balance power consumption and performance, a middle
> setting of sampling_down_factor like "10" should make a noticeable
> improvement in performance while not having as much impact on power.
> But if you want to match the performance governor's performance and a=
re
> less concerned about transient power consumption, you will want to se=
t
> it higher.
>
> Another note: I recommend setting io_is_busy to 1 when using
> sampling_down_factor above 1, as it improves responsiveness to quick
> load transients involving some I/O. =A0It's also worth considering
> lowering up_threshold to 50 or even down to 15-20.
>
> David C Niemi
>
> Vishwanath Sripathy wrote:
>> Amit,
>>
>> On Tue, Nov 23, 2010 at 8:22 PM, Amit Kucheria <amit.kucheria@linaro=
=2Eorg> wrote:
>>
>>> Vishwa,
>>>
>>> Have you had a chance to do some usetime tests with these changes?
>>>
>> I did test USB performance with this and I see ondmeand is 90% close
>> to performance.
>>
>>> It would be interesting to measure the power consumption with and
>>> without these changes.
>>>
>> Power consumption impact can vary from usecase to usecase and extra
>> performance will have some power impact.
>> However in idle scenario, I feel this should not have much impact
>> since ondemand timer is a deferrable timer which means that it does
>> not prevent cpuidle. I will try to measure it for some usecase and
>> compare the power impact.
>>
>> Vishwa
>>
>
