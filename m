From: Andy Green <andy.green@linaro.org>
Subject: Re: Arndale power management
Date: Tue, 16 Jul 2013 09:48:53 +0100
Message-ID: <CAAfg0W4uD=ke6zWnC0bAauAJ=xg5L76oOcnUM8VRypxC7==S3A@mail.gmail.com>
References: <611CFE9D6FBBDC4B97935A5287A11345014441@XSERVER21B.campus.tue.nl>
	<CAKohpok=WAJs9FBQxEuo=nh4=b184hHyzpLAwEjVYMUZVnB+2g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpok=WAJs9FBQxEuo=nh4=b184hHyzpLAwEjVYMUZVnB+2g@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Comaschi, F." <fcomaschi@tue.nl>, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Linux PM List <linux-pm@lists.linux-foundation.org>, Chander Kashyap <chander.kashyap@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>

Hi -

On 16 July 2013 07:43, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Adding few more lists so that others can also help..
>
> On 15 July 2013 20:00, Comaschi, F. <fcomaschi@tue.nl> wrote:

>> 2) Recently I have read Andy Green=E2=80=99s presentation =E2=80=9CH=
ow to measure SoC power=E2=80=9D. However, by measuring power on the PM=
IC input side through the ARM Energy Probe, probably I won't be able to=
 see the effect of DVFS. Do you have any suggestions on how to measure =
the effect of DVFS, even through hardware measurements?
>
> You need probes on the voltage regulator which is feed the cores...
> But again, that is very much hardware specific. And I haven't worked
> on Exynos at all :)

Arndale has a lot of shunts on the board already, I counted 14 last
time I looked.

You will be able to see the power benefit of DVFS extremely clearly at
the input side of the regulator, but you won't see the voltage you
have set reported.

Since the AEP creates trouble on low voltage / high current rails with
its fullscale 165mV drop (you may only have 900mV on Vcore) measuring
current needs to be done on regulator input side.  Since you're
interested in power, you need to measure voltage also at the regulator
input to allow it to be calculated.

However nothing stops you sticking a second AEP channel on the output
side of the regulator just for monitoring its voltage.  You just need
to stick both wires of the pair on the output side for it to report
the voltage separately.  Because you're not using a shunt there, you
don't introduce any voltage drop.

Then you'll see power (+ regulator efficiency loss) one one channel
and actual DVFS voltage (and 0 for current) on the other.

-Andy
