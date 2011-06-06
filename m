From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: switching to top frequency too frequent with ondemand governor
 and no_hz
Date: Mon, 6 Jun 2011 09:35:20 +0200
Message-ID: <BANLkTimB5OdiHhRKwB1KpuNnXD55MmXWjQ@mail.gmail.com>
References: <20110601160805.GA1775@x4.trippels.de>
	<4DE6783E.70508@verisign.com>
	<20110601180038.GA1780@x4.trippels.de>
	<20110602114113.GA1771@x4.trippels.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110602114113.GA1771@x4.trippels.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus Trippelsdorf <markus@trippelsdorf.de>
Cc: David C Niemi <dniemi@verisign.com>, cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org

On 2 June 2011 13:41, Markus Trippelsdorf <markus@trippelsdorf.de> wrot=
e:
> On 2011.06.01 at 20:00 +0200, Markus Trippelsdorf wrote:
>> On 2011.06.01 at 13:34 -0400, David C Niemi wrote:
>> > On 06/01/2011 12:08 PM, Markus Trippelsdorf wrote:
>> > > There seems to be a major difference in the behavior of the onde=
mand
>> > > governor depending on whether CONFIG_NO_HZ is set or not in the =
kernel
>> > > .config.
>> > >
>> > > In the NO_HZ case the ondemand governor spends too much time at =
the
>> > > highest frequency and is also very trigger happy.
>> > >
>> > > I have compared the two cases on my system:
>> > > powernow-k8: Found 1 AMD Phenom(tm) II X4 955 Processor (4 cpu c=
ores) (version 2.20.00)
>> > > powernow-k8: =A0 =A00 : pstate 0 (3200 MHz)
>> > > powernow-k8: =A0 =A01 : pstate 1 (2500 MHz)
>> > > powernow-k8: =A0 =A02 : pstate 2 (2100 MHz)
>> > > powernow-k8: =A0 =A03 : pstate 3 (800 MHz)
>> > >
>> > > When I run:
>> > > watch -n.1 'cat /proc/cpuinfo|grep MHz'
>> > > on an otherwise idle system, I can see that the frequency always=
 stays
>> > > at 800 MHz in the "CONFIG_NO_HZ not set" case. But it will very
>> > > frequently switch to 3200 MHz in the CONFIG_NO_HZ=3Dy case under=
 the same
>> > > conditions.
>> > >
>> > > This also manifests itself in the cpufreq/stats/time_in_state
>> > > statistics (again on a mostly idle system):
>> > >
>> > > First taken with:
>> > > echo 200 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_dow=
n_factor
>> > > (BTW wouldn't it make sense to use something like this as the de=
fault
>> > > value?)
>> > >
>> > > cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state
>> > >
>> > > CONFIG_NO_HZ not set:
>> > > 3200000 5845
>> > > 2500000 0
>> > > 2100000 5
>> > > 800000 31552
>> > >
>> > > CONFIG_NO_HZ=3Dy:
>> > > 3200000 17650
>> > > 2500000 0
>> > > 2100000 0
>> > > 800000 31129
>> > >
>> > >
>> > > And with the default sampling_down_factor=3D1
>> > >
>> > > CONFIG_NO_HZ not set:
>> > > 3200000 140
>> > > 2500000 2
>> > > 2100000 29
>> > > 800000 16614
>> > >
>> > > CONFIG_NO_HZ=3Dy:
>> > > 3200000 538
>> > > 2500000 9
>> > > 2100000 77
>> > > 800000 16287
>> > >
>> > > Now my question is, is this expected? And what could be done to =
make the
>> > > NO_HZ behavior more like the "CONFIG_NO_HZ not set" behavior.
>> >
>> > A very interesting bit of information. =A0What do you have set for
>> > up_threshold? =A0You may have to set it higher for CONFIG_NO_HZ th=
an
>> > without, based on your symptoms. =A0Another thing to look at is yo=
ur
>> > sampling_rate. =A0I'm guessing it differs between CONFIG_NO_HZ bei=
ng set
>> > or not.
>>
>> I've played with all those parameters, but unfortunately it didn't m=
ake
>> any difference.
>>
>> > And perhaps you need to set sampling_down_factor a bit lower. =A0I
>> > consider 100 a reasonable default, but a default of "1" was put in
>> > initially to make the behavior of the patch that enabled the facto=
r
>> > identical with not having the patch. =A0If you are more concerned =
with
>> > saving power than maximizing throughput, you might consider a much
>> > lower value like 5 or 10.
>>
>> Yes, I've tried different values and 200 turned out to be the best b=
ased
>> on my preferences (throughput over power saving). It makes a big
>> difference in the compile time of bigger projects, especially during=
 the
>> configuration phase.
>>
>> But I have found the root cause of symptoms described above by
>> bisection. It turned out that 2.6.39 is also affected, so I've bisec=
ted
>> down to 2.6.38.
>> This is the result:
>>
>> =A05cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a is the first bad commit
>> =A0commit 5cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a
>> =A0Author: Vincent Guittot <vincent.guittot@linaro.org>
>> =A0Date: =A0 Mon Feb 7 17:14:25 2011 +0100
>>
>> =A0 =A0 =A0[CPUFREQ] calculate delay after dbs_check_cpu
>>
>> When I revert the above in 3.0-rc1 the CONFIG_NO_HZ=3Dy symptoms van=
ish.
>

The patch, you have mentioned, solves a problem when ondemand governor
goes  from highest frequency to a lower one. Without the patch, the
governor uses the longest sampling period (sampling period * scaling
down factor) with a low frequency during the 1st period after
decreasing the frequency. This can lead to a large time frame
(sampling period * scaling down factor) with a low frequency but an
overloaded cpu.

The other correction of the patch is linked to the powersave bias
mode. The governor didn't use the right period for the low frequency
step (freq_lo_jiffies) but a larger one (sampling period * scaling
down factor). The ratio between low and high frequency was not the
right one.

Do you use the powersave bias mode ?

Could you give us more statistics : the number of state transition
could be an interesting value. Is there a difference with and without
CONFIG_NO_HZ ? What is your sampling rate ?

One difference with CONFIG_NO_HZ is the real sampling period which can
be greater than the timer configuration because of the deferrable
mode. The deferrable mode has nearly no effect when CONFIG_NO_HZ is
not set because the tick timer will ensure enough cpu activity to
trigger the governor. When CONFIG_NO_HZ is set, the ondemand governor
work is triggered at the beginning of a cpu activity so we have more
chance to have a short cpu load in one period instead of splitting it
into 2 differents periods. This behavior is quite useful for
responsiveness but can generates spurious frequency increase if the
sampling rate is too short.

Vincent

> Here are some numbers to back this claim:
>
> cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state
> (with sampling_down_factor=3D200)
>
> CONFIG_NO_HZ not set:
> 3200000 1766
> 2500000 0
> 2100000 1479
> 800000 30787
>
> CONFIG_NO_HZ=3Dy:
> 3200000 922
> 2500000 0
> 2100000 2313
> 800000 31217
>
> So the behavior in both cases is (roughly) the same again.
>

> --
> Markus
>
