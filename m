From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: switching to top frequency too frequent with ondemand governor
 and no_hz
Date: Mon, 6 Jun 2011 18:34:35 +0200
Message-ID: <BANLkTinWQ1YBWHsCgK_JfHqXwETCy1mxEQ@mail.gmail.com>
References: <20110601160805.GA1775@x4.trippels.de>
	<4DE6783E.70508@verisign.com>
	<20110601180038.GA1780@x4.trippels.de>
	<20110602114113.GA1771@x4.trippels.de>
	<BANLkTimB5OdiHhRKwB1KpuNnXD55MmXWjQ@mail.gmail.com>
	<20110606112015.GA1776@x4.trippels.de>
	<BANLkTik0UeiieJDY7FHJHC9H4fwgBTh=PQ@mail.gmail.com>
	<20110606141625.GA1768@x4.trippels.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110606141625.GA1768@x4.trippels.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus Trippelsdorf <markus@trippelsdorf.de>
Cc: David C Niemi <dniemi@verisign.com>, cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org

On 6 June 2011 16:16, Markus Trippelsdorf <markus@trippelsdorf.de> wrot=
e:
> On 2011.06.06 at 15:11 +0200, Vincent Guittot wrote:
>> On 6 June 2011 13:20, Markus Trippelsdorf <markus@trippelsdorf.de> w=
rote:
>> > On 2011.06.06 at 09:35 +0200, Vincent Guittot wrote:
>> >> On 2 June 2011 13:41, Markus Trippelsdorf <markus@trippelsdorf.de=
> wrote:
>> >> > On 2011.06.01 at 20:00 +0200, Markus Trippelsdorf wrote:
>> >> >> But I have found the root cause of symptoms described above by
>> >> >> bisection. It turned out that 2.6.39 is also affected, so I've=
 bisected
>> >> >> down to 2.6.38.
>> >> >> This is the result:
>> >> >>
>> >> >> =A05cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a is the first bad c=
ommit
>> >> >> =A0commit 5cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a
>> >> >> =A0Author: Vincent Guittot <vincent.guittot@linaro.org>
>> >> >> =A0Date: =A0 Mon Feb 7 17:14:25 2011 +0100
>> >> >>
>> >> >> =A0 =A0 =A0[CPUFREQ] calculate delay after dbs_check_cpu
>> >> >>
>> >> >> When I revert the above in 3.0-rc1 the CONFIG_NO_HZ=3Dy sympto=
ms vanish.
>> >> >
>> >>
>> >> The patch, you have mentioned, solves a problem when ondemand gov=
ernor
>> >> goes =A0from highest frequency to a lower one. Without the patch,=
 the
>> >> governor uses the longest sampling period (sampling period * scal=
ing
>> >> down factor) with a low frequency during the 1st period after
>> >> decreasing the frequency. This can lead to a large time frame
>> >> (sampling period * scaling down factor) with a low frequency but =
an
>> >> overloaded cpu.
>> >
>> > The problem with the patch is that it results in an ondemand behav=
ior
>> > that almost totally ignores the middle frequencies (2100 and 2500 =
MHz in
>> > my case) with CONFIG_NO_HZ. If you also set the sampling_down_fact=
or to
>> > something like >=3D100 then the CPU will spend much of the time at=
 the top
>> > frequency even if there is no workload whatsoever.
>> >
>>
>> In fact, one main goal of the ondemand governor is to switch to max
>> frequency as soon as there is a cpu activity is detected to ensure t=
he
>> responsiveness of the system. If your idle activity is made of burst
>> of cpu activity and your sampling period is small, =A0your sytems wi=
ll
>> switch between the highest and the lowest frequency. At the contrary=
,
>> the conservative governor modifies the frequency in a step by step
>> manner.
>
> Understood. But this a change in behavior due to your patch.
>
>> >> The other correction of the patch is linked to the powersave bias
>> >> mode. The governor didn't use the right period for the low freque=
ncy
>> >> step (freq_lo_jiffies) but a larger one (sampling period * scalin=
g
>> >> down factor). The ratio between low and high frequency was not th=
e
>> >> right one.
>> >>
>> >> Do you use the powersave bias mode ?
>> >
>> > No.
>> >
>> >> Could you give us more statistics : the number of state transitio=
n
>> >> could be an interesting value. Is there a difference with and wit=
hout
>> >> CONFIG_NO_HZ ? What is your sampling rate ?
>> >
>> > These are my settings:
>> >
>> > ignore_nice_load 0
>> > io_is_busy 0
>> > powersave_bias 0
>> > sampling_down_factor 200
>> > sampling_rate 10000
>> > sampling_rate_min 10000
>> > up_threshold 95
>> >
>> > cat sys/devices/system/cpu/cpu0/cpufreq/stats/* on an otherwise id=
le
>> > machine with CONFIG_NO_HZ and 5cb2c3bd0c5e0f reverted:
>> > 3200000 532
>> > 2500000 172
>> > 2100000 2703
>> > 800000 20995
>> > 153
>> >
>>
>> With this configuration (without the patch), there is a period of 2
>> seconds with a low frequency when the governor comes back from the
>> highest frequency. During these 2 seconds, you will not be able to g=
o
>> back to max frequency. So, if your cpu is overloaded during this 2
>> seconds period, you will not increase your frequency. For this use
>> case, your cpufreq responsiveness is more then 2 seconds.
>
> I don't see these 2 second delays (being stuck on a low frequency) on=
 my
> system. On the contrary as soon as there is sufficient load it switch=
es
> to the highest frequency immediately.
>

Let assume that your system is at the highest frequency

without the patch, you have the following sequence :

->do_dbs_timer
    -> delay =3D usecs_to_jiffies(dbs_tuners_ins.sampling_rate *
dbs_info->rate_mult); // delay will be equal to 10000*200=3D2000000us
    -> dbs_check_cpu
           Let assume that your cpu load is quite small
          -> freq_next =3D max_load_freq / (dbs_tuners_ins.up_threshold
- dbs_tuners_ins.down_differential); //freq_next is set to your lowest
frequency
          -> __cpufreq_driver_target(policy, freq_next, CPUFREQ_RELATIO=
N_L);
    -> 	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work, delay=
);

the delay value is set to sampling_rate * rate_mult but the frequency
is the lowest one which is not the correct behavior of the
sampling_down_factor feature.
the patch only solves this issue.

>> > and with your patch and also CONFIG_NO_HZ:
>> > 3200000 11795
>> > 2500000 0
>> > 2100000 0
>> > 800000 20620
>> > 213
>> >
>> > Which shows the problem very nicely.
>> >
>>
>> My understand is that your idle activity is made of cpu activities
>> which are 10ms long and which trigs the increase of the frequency.
>
> Could it be that the call to dbs_check_cpu(dbs_info) itself is the
> reason for these activities?
>
>> >> One difference with CONFIG_NO_HZ is the real sampling period whic=
h can
>> >> be greater than the timer configuration because of the deferrable
>> >> mode. The deferrable mode has nearly no effect when CONFIG_NO_HZ =
is
>> >> not set because the tick timer will ensure enough cpu activity to
>> >> trigger the governor. When CONFIG_NO_HZ is set, the ondemand gove=
rnor
>> >> work is triggered at the beginning of a cpu activity so we have m=
ore
>> >> chance to have a short cpu load in one period instead of splittin=
g it
>> >> into 2 differents periods. This behavior is quite useful for
>> >> responsiveness but can generates spurious frequency increase if t=
he
>> >> sampling rate is too short.
>> >
>> > Hm, my sampling rate (10000) is already the most minimal rate avai=
lable.
>> >
>>
>> It's seems that your sampling period is too small and the ondemand
>> governor detects your idle activity as an increase of the cpu activi=
ty
>> and as a result, it increases the frequency. Have you tried to
>> increase the sampling rate and decrease your sampling_down_factor
>> which seems to be also quite high ?
>
> Please note that these are all default values (with the exception of
> sampling_down_factor). So why should I fiddle with the parameters whe=
n
> everything was working fine before your patch went in? And even if I
> increase the sampling rate and decrease the sampling_down_factor, I
> cannot replicate the old behavior. So IMHO it's a regression.
>

IMHO, the previous results were "good" because of the bug in the
sampling_down_factor which was "filtering" some cpu activities after
decreasing the frequency.

The best cpufreq statistic should be achieved in idle when the
sampling_down_factor is set to 1 because the sampling_down_factor
feature has been done to "improve performance by reducing the overhead
of load evaluation and helping the CPU stay at its top speed"
(Documentation/cpu-freq/governors.txt).

Could you make some measurements with sampling_down_factor set to 1
and sampling_down_factor set to 200 ? The cpufreq statistic starts at
system boot but we are interested in idle use case result so we should
use the delta between 2 statistics outputs in order to remove boot
measurements. Using the following command in idle should be enough #
cat /sys/devices/system/cpu/cpu0/cpufreq/stats/* && sleep 60 && cat
/sys/devices/system/cpu/cpu0/cpufreq/stats/*

I have tested different configuration on my dual core Arm platform (
sampling_down_factor=3D1, 10; CONFIG_NO_HZ set or not) but I don't have
any difference.

my settings are :
ignore_nice_load 0
io_is_busy 0
powersave_bias 0
sampling_down_factor 10
sampling_rate 20000
sampling_rate_min 20000
up_threshold 95

Thanks,

Vincent

> Thanks.
> --
> Markus
>
