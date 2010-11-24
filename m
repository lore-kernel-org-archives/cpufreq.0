From: David C Niemi <dniemi@verisign.com>
Subject: Re: Issues with ondemand governor
Date: Wed, 24 Nov 2010 09:12:19 -0500
Message-ID: <4CED1D43.6080900@verisign.com>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com>	<4CEA959F.9000505@verisign.com>	<AANLkTinByLn1HDEuRfYoOdZJtUsh3-_wunFP7zHOeOnn@mail.gmail.com>	<AANLkTimyNxZ8ZEG9Zgiu-HFQmO0nS=SrYSqwzDQXWj4n@mail.gmail.com> <AANLkTik3qRgq8EpffsusVk1puAgRdFQ7vKrf6FL=SULs@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTik3qRgq8EpffsusVk1puAgRdFQ7vKrf6FL=SULs@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vishwanath Sripathy <vishwanath.sripathy@linaro.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, linaro-dev@lists.linaro.org, cpufreq@vger.kernel.org


Thanks for running the tests, Vishwa.  Your results are what I'd expect
but it's good to see independent confirmation.  In my benchmarks I saw
95-100% of the performance governor's performance, but the conditions
were more favorable and the original ondemand governor was "only"
degrading performance 20-30% to begin with.

There should be absolutely no changes in power consumption at all for
the patch itself, as behavior does not change until you raise
sampling_down_factor above 1 (the default).  If you set it high, I would
expect higher power consumption (but also higher performance) under load
and no change in power consumption when idle or close to idle.  Setting
a high sampling_down_factor causes the governor to reevaluate load less
often when at max cpu speed, both to reduce overhead and to let it
remain at maximum performance more consistently.  Without this change,
the ondemand governor jitters a lot in and out of max clock speed when
under high loads, which is why its performance can be much worse than
the performance governor.  Reducing the number of transitions and load
evaluations should also improve performance per watt, though the details
of that depend on the relative efficiency of the CPU's respective clock
speeds.

If you want to balance power consumption and performance, a middle
setting of sampling_down_factor like "10" should make a noticeable
improvement in performance while not having as much impact on power. 
But if you want to match the performance governor's performance and are
less concerned about transient power consumption, you will want to set
it higher.

Another note: I recommend setting io_is_busy to 1 when using
sampling_down_factor above 1, as it improves responsiveness to quick
load transients involving some I/O.  It's also worth considering
lowering up_threshold to 50 or even down to 15-20.

David C Niemi

Vishwanath Sripathy wrote:
> Amit,
>
> On Tue, Nov 23, 2010 at 8:22 PM, Amit Kucheria <amit.kucheria@linaro.org> wrote:
>   
>> Vishwa,
>>
>> Have you had a chance to do some usetime tests with these changes?
>>     
> I did test USB performance with this and I see ondmeand is 90% close
> to performance.
>   
>> It would be interesting to measure the power consumption with and
>> without these changes.
>>     
> Power consumption impact can vary from usecase to usecase and extra
> performance will have some power impact.
> However in idle scenario, I feel this should not have much impact
> since ondemand timer is a deferrable timer which means that it does
> not prevent cpuidle. I will try to measure it for some usecase and
> compare the power impact.
>
> Vishwa
>   
