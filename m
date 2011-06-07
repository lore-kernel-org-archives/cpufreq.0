From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: switching to top frequency too frequent with ondemand governor
 and no_hz
Date: Tue, 7 Jun 2011 09:34:18 +0200
Message-ID: <BANLkTi=kN9qcOeRz3Dy--0aTMeLzs0shFA@mail.gmail.com>
References: <20110601160805.GA1775@x4.trippels.de>
	<4DE6783E.70508@verisign.com>
	<20110601180038.GA1780@x4.trippels.de>
	<20110602114113.GA1771@x4.trippels.de>
	<BANLkTimB5OdiHhRKwB1KpuNnXD55MmXWjQ@mail.gmail.com>
	<20110606112015.GA1776@x4.trippels.de>
	<BANLkTik0UeiieJDY7FHJHC9H4fwgBTh=PQ@mail.gmail.com>
	<20110606141625.GA1768@x4.trippels.de>
	<BANLkTinWQ1YBWHsCgK_JfHqXwETCy1mxEQ@mail.gmail.com>
	<20110606175104.GA1771@x4.trippels.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110606175104.GA1771@x4.trippels.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus Trippelsdorf <markus@trippelsdorf.de>
Cc: David C Niemi <dniemi@verisign.com>, cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org

On 6 June 2011 19:51, Markus Trippelsdorf <markus@trippelsdorf.de> wrot=
e:
> On 2011.06.06 at 18:34 +0200, Vincent Guittot wrote:
>> On 6 June 2011 16:16, Markus Trippelsdorf <markus@trippelsdorf.de> w=
rote:
>> > On 2011.06.06 at 15:11 +0200, Vincent Guittot wrote:
>> >> On 6 June 2011 13:20, Markus Trippelsdorf <markus@trippelsdorf.de=
> wrote:
>> >> > On 2011.06.06 at 09:35 +0200, Vincent Guittot wrote:
>> >> >> On 2 June 2011 13:41, Markus Trippelsdorf <markus@trippelsdorf=
=2Ede> wrote:
>> >> >> > On 2011.06.01 at 20:00 +0200, Markus Trippelsdorf wrote:
>> >> >> >> But I have found the root cause of symptoms described above=
 by
>> >> >> >> bisection. It turned out that 2.6.39 is also affected, so I=
've bisected
>> >> >> >> down to 2.6.38.
>> >> >> >> This is the result:
>> >> >> >>
>> >> >> >> =A05cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a is the first ba=
d commit
>> >> >> >> =A0commit 5cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a
>> >> >> >> =A0Author: Vincent Guittot <vincent.guittot@linaro.org>
>> >> >> >> =A0Date: =A0 Mon Feb 7 17:14:25 2011 +0100
>> >> >> >>
>> >> >> >> =A0 =A0 =A0[CPUFREQ] calculate delay after dbs_check_cpu
>> >> >> >>
>> >> >> >> When I revert the above in 3.0-rc1 the CONFIG_NO_HZ=3Dy sym=
ptoms vanish.
>> >> >> >
>> >> >>
>> >> >> The patch, you have mentioned, solves a problem when ondemand =
governor
>> >> >> goes =A0from highest frequency to a lower one. Without the pat=
ch, the
>> >> >> governor uses the longest sampling period (sampling period * s=
caling
>> >> >> down factor) with a low frequency during the 1st period after
>> >> >> decreasing the frequency. This can lead to a large time frame
>> >> >> (sampling period * scaling down factor) with a low frequency b=
ut an
>> >> >> overloaded cpu.
>> >> >
>> >> > The problem with the patch is that it results in an ondemand be=
havior
>> >> > that almost totally ignores the middle frequencies (2100 and 25=
00 MHz in
>> >> > my case) with CONFIG_NO_HZ. If you also set the sampling_down_f=
actor to
>> >> > something like >=3D100 then the CPU will spend much of the time=
 at the top
>> >> > frequency even if there is no workload whatsoever.
>> >> >
>> >>
>> >> In fact, one main goal of the ondemand governor is to switch to m=
ax
>> >> frequency as soon as there is a cpu activity is detected to ensur=
e the
>> >> responsiveness of the system. If your idle activity is made of bu=
rst
>> >> of cpu activity and your sampling period is small, =A0your sytems=
 will
>> >> switch between the highest and the lowest frequency. At the contr=
ary,
>> >> the conservative governor modifies the frequency in a step by ste=
p
>> >> manner.
>> >
>> > Understood. But this a change in behavior due to your patch.
>> >
>> >> >> The other correction of the patch is linked to the powersave b=
ias
>> >> >> mode. The governor didn't use the right period for the low fre=
quency
>> >> >> step (freq_lo_jiffies) but a larger one (sampling period * sca=
ling
>> >> >> down factor). The ratio between low and high frequency was not=
 the
>> >> >> right one.
>> >> >>
>> >> >> Do you use the powersave bias mode ?
>> >> >
>> >> > No.
>> >> >
>> >> >> Could you give us more statistics : the number of state transi=
tion
>> >> >> could be an interesting value. Is there a difference with and =
without
>> >> >> CONFIG_NO_HZ ? What is your sampling rate ?
>> >> >
>> >> > These are my settings:
>> >> >
>> >> > ignore_nice_load 0
>> >> > io_is_busy 0
>> >> > powersave_bias 0
>> >> > sampling_down_factor 200
>> >> > sampling_rate 10000
>> >> > sampling_rate_min 10000
>> >> > up_threshold 95
>> >> >
>> >> > cat sys/devices/system/cpu/cpu0/cpufreq/stats/* on an otherwise=
 idle
>> >> > machine with CONFIG_NO_HZ and 5cb2c3bd0c5e0f reverted:
>> >> > 3200000 532
>> >> > 2500000 172
>> >> > 2100000 2703
>> >> > 800000 20995
>> >> > 153
>> >> >
>> >>
>> >> With this configuration (without the patch), there is a period of=
 2
>> >> seconds with a low frequency when the governor comes back from th=
e
>> >> highest frequency. During these 2 seconds, you will not be able t=
o go
>> >> back to max frequency. So, if your cpu is overloaded during this =
2
>> >> seconds period, you will not increase your frequency. For this us=
e
>> >> case, your cpufreq responsiveness is more then 2 seconds.
>> >
>> > I don't see these 2 second delays (being stuck on a low frequency)=
 on my
>> > system. On the contrary as soon as there is sufficient load it swi=
tches
>> > to the highest frequency immediately.
>> >
>>
>> Let assume that your system is at the highest frequency
>>
>> without the patch, you have the following sequence :
>>
>> ->do_dbs_timer
>> =A0 =A0 -> delay =3D usecs_to_jiffies(dbs_tuners_ins.sampling_rate *
>> dbs_info->rate_mult); // delay will be equal to 10000*200=3D2000000u=
s
>> =A0 =A0 -> dbs_check_cpu
>> =A0 =A0 =A0 =A0 =A0 =A0Let assume that your cpu load is quite small
>> =A0 =A0 =A0 =A0 =A0 -> freq_next =3D max_load_freq / (dbs_tuners_ins=
=2Eup_threshold
>> - dbs_tuners_ins.down_differential); //freq_next is set to your lowe=
st
>> frequency
>> =A0 =A0 =A0 =A0 =A0 -> __cpufreq_driver_target(policy, freq_next, CP=
UFREQ_RELATION_L);
>> =A0 =A0 -> =A0 =A0 =A0 =A0queue_delayed_work_on(cpu, kondemand_wq, &=
dbs_info->work, delay);
>>
>> the delay value is set to sampling_rate * rate_mult but the frequenc=
y
>> is the lowest one which is not the correct behavior of the
>> sampling_down_factor feature.
>> the patch only solves this issue.
>>
>> >> > and with your patch and also CONFIG_NO_HZ:
>> >> > 3200000 11795
>> >> > 2500000 0
>> >> > 2100000 0
>> >> > 800000 20620
>> >> > 213
>> >> >
>> >> > Which shows the problem very nicely.
>> >> >
>> >>
>> >> My understand is that your idle activity is made of cpu activitie=
s
>> >> which are 10ms long and which trigs the increase of the frequency=
=2E
>> >
>> > Could it be that the call to dbs_check_cpu(dbs_info) itself is the
>> > reason for these activities?
>> >
>> >> >> One difference with CONFIG_NO_HZ is the real sampling period w=
hich can
>> >> >> be greater than the timer configuration because of the deferra=
ble
>> >> >> mode. The deferrable mode has nearly no effect when CONFIG_NO_=
HZ is
>> >> >> not set because the tick timer will ensure enough cpu activity=
 to
>> >> >> trigger the governor. When CONFIG_NO_HZ is set, the ondemand g=
overnor
>> >> >> work is triggered at the beginning of a cpu activity so we hav=
e more
>> >> >> chance to have a short cpu load in one period instead of split=
ting it
>> >> >> into 2 differents periods. This behavior is quite useful for
>> >> >> responsiveness but can generates spurious frequency increase i=
f the
>> >> >> sampling rate is too short.
>> >> >
>> >> > Hm, my sampling rate (10000) is already the most minimal rate a=
vailable.
>> >> >
>> >>
>> >> It's seems that your sampling period is too small and the ondeman=
d
>> >> governor detects your idle activity as an increase of the cpu act=
ivity
>> >> and as a result, it increases the frequency. Have you tried to
>> >> increase the sampling rate and decrease your sampling_down_factor
>> >> which seems to be also quite high ?
>> >
>> > Please note that these are all default values (with the exception =
of
>> > sampling_down_factor). So why should I fiddle with the parameters =
when
>> > everything was working fine before your patch went in? And even if=
 I
>> > increase the sampling rate and decrease the sampling_down_factor, =
I
>> > cannot replicate the old behavior. So IMHO it's a regression.
>> >
>>
>> IMHO, the previous results were "good" because of the bug in the
>> sampling_down_factor which was "filtering" some cpu activities after
>> decreasing the frequency.
>>
>> The best cpufreq statistic should be achieved in idle when the
>> sampling_down_factor is set to 1 because the sampling_down_factor
>> feature has been done to "improve performance by reducing the overhe=
ad
>> of load evaluation and helping the CPU stay at its top speed"
>> (Documentation/cpu-freq/governors.txt).
>>
>> Could you make some measurements with sampling_down_factor set to 1
>> and sampling_down_factor set to 200 ? The cpufreq statistic starts a=
t
>> system boot but we are interested in idle use case result so we shou=
ld
>> use the delta between 2 statistics outputs in order to remove boot
>> measurements. Using the following command in idle should be enough #
>> cat /sys/devices/system/cpu/cpu0/cpufreq/stats/* && sleep 60 && cat
>> /sys/devices/system/cpu/cpu0/cpufreq/stats/*
>
> OK.
>
> On a totally idle system:
>
> 1) With your patch:
>
> * sampling_down_factor=3D200
> cat /sys/devices/system/cpu/cpu0/cpufreq/stats/* && sleep 60 && cat /=
sys/devices/system/cpu/cpu0/cpufreq/stats/*
> 3200000 507
> 2500000 0
> 2100000 0
> 800000 903
> 13
> 3200000 533
> 2500000 0
> 2100000 0
> 800000 6876
> 14
>
> diff:
> 3200000 26
> 2500000 0
> 2100000 0
> 800000 5973
>
> * sampling_down_factor=3D1
> 3200000 1078
> 2500000 3
> 2100000 49
> 800000 15632
> 79
> 3200000 1078
> 2500000 3
> 2100000 49
> 800000 21632
> 79
>
> diff:
> 3200000 0
> 2500000 0
> 2100000 0
> 800000 6000
>
>
> 2) Without your patch (reverted):
>
> * sampling_down_factor=3D200
> 3200000 106
> 2500000 0
> 2100000 339
> 800000 1260
> 15
> 3200000 106
> 2500000 0
> 2100000 339
> 800000 7259
> 15
>
> diff:
> 3200000 0
> 2500000 0
> 2100000 0
> 800000 5999
>
> * sampling_down_factor=3D1
> 3200000 134
> 2500000 142
> 2100000 694
> 800000 13006
> 30
> 3200000 134
> 2500000 142
> 2100000 694
> 800000 19005
> 30
>
> diff:
> 3200000 0
> 2500000 0
> 2100000 0
> 800000 5999
>
>
> And now the same measurements while running:
> watch -n.1 'cat /proc/cpuinfo|grep MHz'
> in another terminal.
>
> 1) With your patch:
>
> * sampling_down_factor=3D200
> 3200000 1243
> 2500000 4
> 2100000 68
> 800000 36493
> 187
> 3200000 1373
> 2500000 4
> 2100000 68
> 800000 42363
> 192
>
> diff:
> 3200000 130
> 2500000 0
> 2100000 0
> 800000 5870
>
> * sampling_down_factor=3D1
> 3200000 1205
> 2500000 4
> 2100000 67
> 800000 27873
> 171
> 3200000 1209
> 2500000 4
> 2100000 67
> 800000 33869
> 179
>
> diff:
> 3200000 4
> 2500000 0
> 2100000 0
> 800000 5996
>
> 2) Without your patch (reverted):
>
> * sampling_down_factor=3D200
> 3200000 240
> 2500000 0
> 2100000 505
> 800000 12842
> 41
> 3200000 245
> 2500000 0
> 2100000 505
> 800000 18836
> 51
>
> diff:
> 3200000 5
> 2500000 0
> 2100000 0
> 800000 5994
>
> * sampling_down_factor=3D1
> 3200000 230
> 2500000 0
> 2100000 505
> 800000 5497
> 31
> 3200000 234
> 2500000 0
> 2100000 505
> 800000 11493
> 39
>
> diff:
> 3200000 4
> 2500000 0
> 2100000 0
> 800000 5996
>
> So, with sampling_down_factor=3D200 and "watch -n.1" running, the CPU
> spends 1300 msec on top speed vs. 50 msec without your patch.
>
> BTW what irritates me is that "watch -n.1 'cat /proc/cpuinfo|grep MHz=
'"
> shows way more frequency changes than what is reported in cpufreq/sta=
ts/.
>

OK, so the additional activity generated by watch is enough to trig
the ondemand governor and that explains your stats results

> --
> Markus
>
