From: Markus Trippelsdorf <markus@trippelsdorf.de>
Subject: Re: switching to top frequency too frequent with ondemand governor
 and no_hz
Date: Mon, 6 Jun 2011 16:16:25 +0200
Message-ID: <20110606141625.GA1768@x4.trippels.de>
References: <20110601160805.GA1775@x4.trippels.de>
 <4DE6783E.70508@verisign.com>
 <20110601180038.GA1780@x4.trippels.de>
 <20110602114113.GA1771@x4.trippels.de>
 <BANLkTimB5OdiHhRKwB1KpuNnXD55MmXWjQ@mail.gmail.com>
 <20110606112015.GA1776@x4.trippels.de>
 <BANLkTik0UeiieJDY7FHJHC9H4fwgBTh=PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=mail.ud10.udmedia.de; h=
	date:from:to:cc:subject:message-id:references:mime-version:
	content-type:content-transfer-encoding:in-reply-to; q=dns/txt; s=
	beta; bh=K9FBCXucF6JSQjB67XxiVBVX24dnefQ/BRzMHR72bE8=; b=bmt2hav
	H756OCimVWVPqYs9C2yYieELT3YkKCuXgA1Zc/00kFnH81pXxvkA9cpBjG6TG43U
	G0g6S6vn84ABcdquewQ5J6HjfvrlTXY7rOyU25OkThULYLPbUL7vpi0k3Pdc9QvG
	0E7pSWtK8aL7crFfa+WIp0rCXQjvafEvC54s=
Content-Disposition: inline
In-Reply-To: <BANLkTik0UeiieJDY7FHJHC9H4fwgBTh=PQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: David C Niemi <dniemi@verisign.com>, cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org

On 2011.06.06 at 15:11 +0200, Vincent Guittot wrote:
> On 6 June 2011 13:20, Markus Trippelsdorf <markus@trippelsdorf.de> wr=
ote:
> > On 2011.06.06 at 09:35 +0200, Vincent Guittot wrote:
> >> On 2 June 2011 13:41, Markus Trippelsdorf <markus@trippelsdorf.de>=
 wrote:
> >> > On 2011.06.01 at 20:00 +0200, Markus Trippelsdorf wrote:
> >> >> But I have found the root cause of symptoms described above by
> >> >> bisection. It turned out that 2.6.39 is also affected, so I've =
bisected
> >> >> down to 2.6.38.
> >> >> This is the result:
> >> >>
> >> >> =A05cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a is the first bad co=
mmit
> >> >> =A0commit 5cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a
> >> >> =A0Author: Vincent Guittot <vincent.guittot@linaro.org>
> >> >> =A0Date: =A0 Mon Feb 7 17:14:25 2011 +0100
> >> >>
> >> >> =A0 =A0 =A0[CPUFREQ] calculate delay after dbs_check_cpu
> >> >>
> >> >> When I revert the above in 3.0-rc1 the CONFIG_NO_HZ=3Dy symptom=
s vanish.
> >> >
> >>
> >> The patch, you have mentioned, solves a problem when ondemand gove=
rnor
> >> goes =A0from highest frequency to a lower one. Without the patch, =
the
> >> governor uses the longest sampling period (sampling period * scali=
ng
> >> down factor) with a low frequency during the 1st period after
> >> decreasing the frequency. This can lead to a large time frame
> >> (sampling period * scaling down factor) with a low frequency but a=
n
> >> overloaded cpu.
> >
> > The problem with the patch is that it results in an ondemand behavi=
or
> > that almost totally ignores the middle frequencies (2100 and 2500 M=
Hz in
> > my case) with CONFIG_NO_HZ. If you also set the sampling_down_facto=
r to
> > something like >=3D100 then the CPU will spend much of the time at =
the top
> > frequency even if there is no workload whatsoever.
> >
>=20
> In fact, one main goal of the ondemand governor is to switch to max
> frequency as soon as there is a cpu activity is detected to ensure th=
e
> responsiveness of the system. If your idle activity is made of burst
> of cpu activity and your sampling period is small,  your sytems will
> switch between the highest and the lowest frequency. At the contrary,
> the conservative governor modifies the frequency in a step by step
> manner.

Understood. But this a change in behavior due to your patch.

> >> The other correction of the patch is linked to the powersave bias
> >> mode. The governor didn't use the right period for the low frequen=
cy
> >> step (freq_lo_jiffies) but a larger one (sampling period * scaling
> >> down factor). The ratio between low and high frequency was not the
> >> right one.
> >>
> >> Do you use the powersave bias mode ?
> >
> > No.
> >
> >> Could you give us more statistics : the number of state transition
> >> could be an interesting value. Is there a difference with and with=
out
> >> CONFIG_NO_HZ ? What is your sampling rate ?
> >
> > These are my settings:
> >
> > ignore_nice_load 0
> > io_is_busy 0
> > powersave_bias 0
> > sampling_down_factor 200
> > sampling_rate 10000
> > sampling_rate_min 10000
> > up_threshold 95
> >
> > cat sys/devices/system/cpu/cpu0/cpufreq/stats/* on an otherwise idl=
e
> > machine with CONFIG_NO_HZ and 5cb2c3bd0c5e0f reverted:
> > 3200000 532
> > 2500000 172
> > 2100000 2703
> > 800000 20995
> > 153
> >
>=20
> With this configuration (without the patch), there is a period of 2
> seconds with a low frequency when the governor comes back from the
> highest frequency. During these 2 seconds, you will not be able to go
> back to max frequency. So, if your cpu is overloaded during this 2
> seconds period, you will not increase your frequency. For this use
> case, your cpufreq responsiveness is more then 2 seconds.

I don't see these 2 second delays (being stuck on a low frequency) on m=
y
system. On the contrary as soon as there is sufficient load it switches
to the highest frequency immediately.

> > and with your patch and also CONFIG_NO_HZ:
> > 3200000 11795
> > 2500000 0
> > 2100000 0
> > 800000 20620
> > 213
> >
> > Which shows the problem very nicely.
> >
>=20
> My understand is that your idle activity is made of cpu activities
> which are 10ms long and which trigs the increase of the frequency.

Could it be that the call to dbs_check_cpu(dbs_info) itself is the
reason for these activities?

> >> One difference with CONFIG_NO_HZ is the real sampling period which=
 can
> >> be greater than the timer configuration because of the deferrable
> >> mode. The deferrable mode has nearly no effect when CONFIG_NO_HZ i=
s
> >> not set because the tick timer will ensure enough cpu activity to
> >> trigger the governor. When CONFIG_NO_HZ is set, the ondemand gover=
nor
> >> work is triggered at the beginning of a cpu activity so we have mo=
re
> >> chance to have a short cpu load in one period instead of splitting=
 it
> >> into 2 differents periods. This behavior is quite useful for
> >> responsiveness but can generates spurious frequency increase if th=
e
> >> sampling rate is too short.
> >
> > Hm, my sampling rate (10000) is already the most minimal rate avail=
able.
> >
>=20
> It's seems that your sampling period is too small and the ondemand
> governor detects your idle activity as an increase of the cpu activit=
y
> and as a result, it increases the frequency. Have you tried to
> increase the sampling rate and decrease your sampling_down_factor
> which seems to be also quite high ?

Please note that these are all default values (with the exception of
sampling_down_factor). So why should I fiddle with the parameters when
everything was working fine before your patch went in? And even if I
increase the sampling rate and decrease the sampling_down_factor, I
cannot replicate the old behavior. So IMHO it's a regression.

Thanks.
--=20
Markus
