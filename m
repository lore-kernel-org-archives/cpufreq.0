From: Markus Trippelsdorf <markus@trippelsdorf.de>
Subject: Re: switching to top frequency too frequent with ondemand governor
 and no_hz
Date: Mon, 6 Jun 2011 21:43:21 +0200
Message-ID: <20110606194321.GA1773@x4.trippels.de>
References: <20110601160805.GA1775@x4.trippels.de>
 <4DE6783E.70508@verisign.com>
 <20110601180038.GA1780@x4.trippels.de>
 <20110602114113.GA1771@x4.trippels.de>
 <BANLkTimB5OdiHhRKwB1KpuNnXD55MmXWjQ@mail.gmail.com>
 <20110606112015.GA1776@x4.trippels.de>
 <BANLkTik0UeiieJDY7FHJHC9H4fwgBTh=PQ@mail.gmail.com>
 <20110606141625.GA1768@x4.trippels.de>
 <BANLkTinWQ1YBWHsCgK_JfHqXwETCy1mxEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=mail.ud10.udmedia.de; h=
	date:from:to:cc:subject:message-id:references:mime-version:
	content-type:content-transfer-encoding:in-reply-to; q=dns/txt; s=
	beta; bh=HJyp5m885GSMYXNm+EdasAALFaPj2ZdXBYxJsFE3tWI=; b=guPegtJ
	1n8R59hV8ucAAW9E6d5xuuAU4bN1vj2PwN67sHFKeI4kx0Wv3X+kuLrTa4y5nNlh
	Y/mg3FI9NpcOPAiQBq8yk1JkZrlS5jB+3UFITQtzk5OyCiqAnjRfSEyPp2VzpzDn
	cnEU8U4pmCxDn3gxeq1R2vyaID5tWo4VogY0=
Content-Disposition: inline
In-Reply-To: <BANLkTinWQ1YBWHsCgK_JfHqXwETCy1mxEQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: David C Niemi <dniemi@verisign.com>, cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org

On 2011.06.06 at 18:34 +0200, Vincent Guittot wrote:
> On 6 June 2011 16:16, Markus Trippelsdorf <markus@trippelsdorf.de> wr=
ote:
> > On 2011.06.06 at 15:11 +0200, Vincent Guittot wrote:
> >> On 6 June 2011 13:20, Markus Trippelsdorf <markus@trippelsdorf.de>=
 wrote:
> >> > On 2011.06.06 at 09:35 +0200, Vincent Guittot wrote:
> >> >> On 2 June 2011 13:41, Markus Trippelsdorf <markus@trippelsdorf.=
de> wrote:
> >> >> > On 2011.06.01 at 20:00 +0200, Markus Trippelsdorf wrote:
> >> >> >> But I have found the root cause of symptoms described above =
by
> >> >> >> bisection. It turned out that 2.6.39 is also affected, so I'=
ve bisected
> >> >> >> down to 2.6.38.
> >> >> >> This is the result:
> >> >> >>
> >> >> >> =A05cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a is the first bad=
 commit
> >> >> >> =A0commit 5cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a
> >> >> >> =A0Author: Vincent Guittot <vincent.guittot@linaro.org>
> >> >> >> =A0Date: =A0 Mon Feb 7 17:14:25 2011 +0100
> >> >> >>
> >> >> >> =A0 =A0 =A0[CPUFREQ] calculate delay after dbs_check_cpu
> >> >> >>
> >> >> >> When I revert the above in 3.0-rc1 the CONFIG_NO_HZ=3Dy symp=
toms vanish.
> >> >> >
> >> >>
> >> >> The patch, you have mentioned, solves a problem when ondemand g=
overnor
> >> >> goes =A0from highest frequency to a lower one. Without the patc=
h, the
> >> >> governor uses the longest sampling period (sampling period * sc=
aling
> >> >> down factor) with a low frequency during the 1st period after
> >> >> decreasing the frequency. This can lead to a large time frame
> >> >> (sampling period * scaling down factor) with a low frequency bu=
t an
> >> >> overloaded cpu.
> >> >
> >> > The problem with the patch is that it results in an ondemand beh=
avior
> >> > that almost totally ignores the middle frequencies (2100 and 250=
0 MHz in
> >> > my case) with CONFIG_NO_HZ. If you also set the sampling_down_fa=
ctor to
> >> > something like >=3D100 then the CPU will spend much of the time =
at the top
> >> > frequency even if there is no workload whatsoever.
> >> >
> >>
> >> In fact, one main goal of the ondemand governor is to switch to ma=
x
> >> frequency as soon as there is a cpu activity is detected to ensure=
 the
> >> responsiveness of the system. If your idle activity is made of bur=
st
> >> of cpu activity and your sampling period is small, =A0your sytems =
will
> >> switch between the highest and the lowest frequency. At the contra=
ry,
> >> the conservative governor modifies the frequency in a step by step
> >> manner.
> >
> > Understood. But this a change in behavior due to your patch.
> >
> >> >> The other correction of the patch is linked to the powersave bi=
as
> >> >> mode. The governor didn't use the right period for the low freq=
uency
> >> >> step (freq_lo_jiffies) but a larger one (sampling period * scal=
ing
> >> >> down factor). The ratio between low and high frequency was not =
the
> >> >> right one.
> >> >>
> >> >> Do you use the powersave bias mode ?
> >> >
> >> > No.
> >> >
> >> >> Could you give us more statistics : the number of state transit=
ion
> >> >> could be an interesting value. Is there a difference with and w=
ithout
> >> >> CONFIG_NO_HZ ? What is your sampling rate ?
> >> >
> >> > These are my settings:
> >> >
> >> > ignore_nice_load 0
> >> > io_is_busy 0
> >> > powersave_bias 0
> >> > sampling_down_factor 200
> >> > sampling_rate 10000
> >> > sampling_rate_min 10000
> >> > up_threshold 95
> >> >
> >> > cat sys/devices/system/cpu/cpu0/cpufreq/stats/* on an otherwise =
idle
> >> > machine with CONFIG_NO_HZ and 5cb2c3bd0c5e0f reverted:
> >> > 3200000 532
> >> > 2500000 172
> >> > 2100000 2703
> >> > 800000 20995
> >> > 153
> >> >
> >>
> >> With this configuration (without the patch), there is a period of =
2
> >> seconds with a low frequency when the governor comes back from the
> >> highest frequency. During these 2 seconds, you will not be able to=
 go
> >> back to max frequency. So, if your cpu is overloaded during this 2
> >> seconds period, you will not increase your frequency. For this use
> >> case, your cpufreq responsiveness is more then 2 seconds.
> >
> > I don't see these 2 second delays (being stuck on a low frequency) =
on my
> > system. On the contrary as soon as there is sufficient load it swit=
ches
> > to the highest frequency immediately.
> >
>=20
> Let assume that your system is at the highest frequency
>=20
> without the patch, you have the following sequence :
>=20
> ->do_dbs_timer
>     -> delay =3D usecs_to_jiffies(dbs_tuners_ins.sampling_rate *
> dbs_info->rate_mult); // delay will be equal to 10000*200=3D2000000us
>     -> dbs_check_cpu
>            Let assume that your cpu load is quite small
>           -> freq_next =3D max_load_freq / (dbs_tuners_ins.up_thresho=
ld
> - dbs_tuners_ins.down_differential); //freq_next is set to your lowes=
t
> frequency
>           -> __cpufreq_driver_target(policy, freq_next, CPUFREQ_RELAT=
ION_L);
>     -> 	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work, del=
ay);
>=20
> the delay value is set to sampling_rate * rate_mult but the frequency
> is the lowest one which is not the correct behavior of the
> sampling_down_factor feature.
> the patch only solves this issue.

>=20
> IMHO, the previous results were "good" because of the bug in the
> sampling_down_factor which was "filtering" some cpu activities after
> decreasing the frequency.

OK, this explains the issue that I was seeing.

To prove the point here are the "emerge" times of the ncurses library i=
n
Gentoo (unpacking, configuration, compiling and installing) for
different sampling_down_factors.

sampling_down_factor    merge time                                     =
                                                                       =
      =20
(with your patch)                                                      =
                                                                       =
      =20
1                       1 minute and 59 seconds.                       =
                                                                       =
      =20
20                      1 minute and 47 seconds.                       =
                                                                       =
      =20
100                     1 minute and 29 seconds.                       =
                                                                       =
      =20
150                     1 minute and 24 seconds.                       =
                                                                       =
      =20
200                     1 minute and 22 seconds.                       =
                                                                       =
      =20
300                     1 minute and 20 seconds.                       =
                                                                       =
      =20
500                     1 minute and 12 seconds.                       =
                                                                       =
      =20
1500                    1 minute and 7 seconds.                        =
                                                                       =
      =20
(with patch reverted)                                                  =
                                                                       =
      =20
1                       2 minutes and 4 seconds.                       =
                                                                       =
      =20
20                      1 minute and 55 seconds.                       =
                                                                       =
      =20
200                     1 minute and 41 seconds.                       =
                                                                       =
      =20

As you can see your patch always beats the reverted case. It also shows
that sampling_down_factor makes a huge difference in compilation
time.

--=20
Markus
