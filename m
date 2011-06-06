From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: switching to top frequency too frequent with ondemand governor
 and no_hz
Date: Mon, 6 Jun 2011 15:11:58 +0200
Message-ID: <BANLkTik0UeiieJDY7FHJHC9H4fwgBTh=PQ@mail.gmail.com>
References: <20110601160805.GA1775@x4.trippels.de>
	<4DE6783E.70508@verisign.com>
	<20110601180038.GA1780@x4.trippels.de>
	<20110602114113.GA1771@x4.trippels.de>
	<BANLkTimB5OdiHhRKwB1KpuNnXD55MmXWjQ@mail.gmail.com>
	<20110606112015.GA1776@x4.trippels.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110606112015.GA1776@x4.trippels.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus Trippelsdorf <markus@trippelsdorf.de>
Cc: David C Niemi <dniemi@verisign.com>, cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org

On 6 June 2011 13:20, Markus Trippelsdorf <markus@trippelsdorf.de> wrot=
e:
> On 2011.06.06 at 09:35 +0200, Vincent Guittot wrote:
>> On 2 June 2011 13:41, Markus Trippelsdorf <markus@trippelsdorf.de> w=
rote:
>> > On 2011.06.01 at 20:00 +0200, Markus Trippelsdorf wrote:
>> >> On 2011.06.01 at 13:34 -0400, David C Niemi wrote:
>> >> > On 06/01/2011 12:08 PM, Markus Trippelsdorf wrote:
>> >> > > There seems to be a major difference in the behavior of the o=
ndemand
>> >> > > governor depending on whether CONFIG_NO_HZ is set or not in t=
he kernel
>> >> > > .config.
>> >> > >
>> >> > > In the NO_HZ case the ondemand governor spends too much time =
at the
>> >> > > highest frequency and is also very trigger happy.
>> >> > >
>> >> > > I have compared the two cases on my system:
>> >> > > powernow-k8: Found 1 AMD Phenom(tm) II X4 955 Processor (4 cp=
u cores) (version 2.20.00)
>> >> > > powernow-k8: =A0 =A00 : pstate 0 (3200 MHz)
>> >> > > powernow-k8: =A0 =A01 : pstate 1 (2500 MHz)
>> >> > > powernow-k8: =A0 =A02 : pstate 2 (2100 MHz)
>> >> > > powernow-k8: =A0 =A03 : pstate 3 (800 MHz)
>> >> > >
>> >> > > When I run:
>> >> > > watch -n.1 'cat /proc/cpuinfo|grep MHz'
>> >> > > on an otherwise idle system, I can see that the frequency alw=
ays stays
>> >> > > at 800 MHz in the "CONFIG_NO_HZ not set" case. But it will ve=
ry
>> >> > > frequently switch to 3200 MHz in the CONFIG_NO_HZ=3Dy case un=
der the same
>> >> > > conditions.
>> >> > >
>> >> > > This also manifests itself in the cpufreq/stats/time_in_state
>> >> > > statistics (again on a mostly idle system):
>> >> > >
>> >> > > First taken with:
>> >> > > echo 200 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_=
down_factor
>> >> > > (BTW wouldn't it make sense to use something like this as the=
 default
>> >> > > value?)
>> >> > >
>> >> > > cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state
>> >> > >
>> >> > > CONFIG_NO_HZ not set:
>> >> > > 3200000 5845
>> >> > > 2500000 0
>> >> > > 2100000 5
>> >> > > 800000 31552
>> >> > >
>> >> > > CONFIG_NO_HZ=3Dy:
>> >> > > 3200000 17650
>> >> > > 2500000 0
>> >> > > 2100000 0
>> >> > > 800000 31129
>> >> > >
>> >> > >
>> >> > > And with the default sampling_down_factor=3D1
>> >> > >
>> >> > > CONFIG_NO_HZ not set:
>> >> > > 3200000 140
>> >> > > 2500000 2
>> >> > > 2100000 29
>> >> > > 800000 16614
>> >> > >
>> >> > > CONFIG_NO_HZ=3Dy:
>> >> > > 3200000 538
>> >> > > 2500000 9
>> >> > > 2100000 77
>> >> > > 800000 16287
>> >> > >
>> >> > > Now my question is, is this expected? And what could be done =
to make the
>> >> > > NO_HZ behavior more like the "CONFIG_NO_HZ not set" behavior.
>> >> >
>> >> > A very interesting bit of information. =A0What do you have set =
for
>> >> > up_threshold? =A0You may have to set it higher for CONFIG_NO_HZ=
 than
>> >> > without, based on your symptoms. =A0Another thing to look at is=
 your
>> >> > sampling_rate. =A0I'm guessing it differs between CONFIG_NO_HZ =
being set
>> >> > or not.
>> >>
>> >> I've played with all those parameters, but unfortunately it didn'=
t make
>> >> any difference.
>> >>
>> >> > And perhaps you need to set sampling_down_factor a bit lower. =A0=
I
>> >> > consider 100 a reasonable default, but a default of "1" was put=
 in
>> >> > initially to make the behavior of the patch that enabled the fa=
ctor
>> >> > identical with not having the patch. =A0If you are more concern=
ed with
>> >> > saving power than maximizing throughput, you might consider a m=
uch
>> >> > lower value like 5 or 10.
>> >>
>> >> Yes, I've tried different values and 200 turned out to be the bes=
t based
>> >> on my preferences (throughput over power saving). It makes a big
>> >> difference in the compile time of bigger projects, especially dur=
ing the
>> >> configuration phase.
>> >>
>> >> But I have found the root cause of symptoms described above by
>> >> bisection. It turned out that 2.6.39 is also affected, so I've bi=
sected
>> >> down to 2.6.38.
>> >> This is the result:
>> >>
>> >> =A05cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a is the first bad comm=
it
>> >> =A0commit 5cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a
>> >> =A0Author: Vincent Guittot <vincent.guittot@linaro.org>
>> >> =A0Date: =A0 Mon Feb 7 17:14:25 2011 +0100
>> >>
>> >> =A0 =A0 =A0[CPUFREQ] calculate delay after dbs_check_cpu
>> >>
>> >> When I revert the above in 3.0-rc1 the CONFIG_NO_HZ=3Dy symptoms =
vanish.
>> >
>>
>> The patch, you have mentioned, solves a problem when ondemand govern=
or
>> goes =A0from highest frequency to a lower one. Without the patch, th=
e
>> governor uses the longest sampling period (sampling period * scaling
>> down factor) with a low frequency during the 1st period after
>> decreasing the frequency. This can lead to a large time frame
>> (sampling period * scaling down factor) with a low frequency but an
>> overloaded cpu.
>
> The problem with the patch is that it results in an ondemand behavior
> that almost totally ignores the middle frequencies (2100 and 2500 MHz=
 in
> my case) with CONFIG_NO_HZ. If you also set the sampling_down_factor =
to
> something like >=3D100 then the CPU will spend much of the time at th=
e top
> frequency even if there is no workload whatsoever.
>

In fact, one main goal of the ondemand governor is to switch to max
frequency as soon as there is a cpu activity is detected to ensure the
responsiveness of the system. If your idle activity is made of burst
of cpu activity and your sampling period is small,  your sytems will
switch between the highest and the lowest frequency. At the contrary,
the conservative governor modifies the frequency in a step by step
manner.

>> The other correction of the patch is linked to the powersave bias
>> mode. The governor didn't use the right period for the low frequency
>> step (freq_lo_jiffies) but a larger one (sampling period * scaling
>> down factor). The ratio between low and high frequency was not the
>> right one.
>>
>> Do you use the powersave bias mode ?
>
> No.
>
>> Could you give us more statistics : the number of state transition
>> could be an interesting value. Is there a difference with and withou=
t
>> CONFIG_NO_HZ ? What is your sampling rate ?
>
> These are my settings:
>
> ignore_nice_load 0
> io_is_busy 0
> powersave_bias 0
> sampling_down_factor 200
> sampling_rate 10000
> sampling_rate_min 10000
> up_threshold 95
>
> cat sys/devices/system/cpu/cpu0/cpufreq/stats/* on an otherwise idle
> machine with CONFIG_NO_HZ and 5cb2c3bd0c5e0f reverted:
> 3200000 532
> 2500000 172
> 2100000 2703
> 800000 20995
> 153
>

With this configuration (without the patch), there is a period of 2
seconds with a low frequency when the governor comes back from the
highest frequency. During these 2 seconds, you will not be able to go
back to max frequency. So, if your cpu is overloaded during this 2
seconds period, you will not increase your frequency. For this use
case, your cpufreq responsiveness is more then 2 seconds.

> and with your patch and also CONFIG_NO_HZ:
> 3200000 11795
> 2500000 0
> 2100000 0
> 800000 20620
> 213
>
> Which shows the problem very nicely.
>

My understand is that your idle activity is made of cpu activities
which are 10ms long and which trigs the increase of the frequency.

>> One difference with CONFIG_NO_HZ is the real sampling period which c=
an
>> be greater than the timer configuration because of the deferrable
>> mode. The deferrable mode has nearly no effect when CONFIG_NO_HZ is
>> not set because the tick timer will ensure enough cpu activity to
>> trigger the governor. When CONFIG_NO_HZ is set, the ondemand governo=
r
>> work is triggered at the beginning of a cpu activity so we have more
>> chance to have a short cpu load in one period instead of splitting i=
t
>> into 2 differents periods. This behavior is quite useful for
>> responsiveness but can generates spurious frequency increase if the
>> sampling rate is too short.
>
> Hm, my sampling rate (10000) is already the most minimal rate availab=
le.
>

It's seems that your sampling period is too small and the ondemand
governor detects your idle activity as an increase of the cpu activity
and as a result, it increases the frequency. Have you tried to
increase the sampling rate and decrease your sampling_down_factor
which seems to be also quite high ?

Vincent

> --
> Markus
>
