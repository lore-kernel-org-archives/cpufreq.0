From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: Arndale power management
Date: Tue, 16 Jul 2013 09:23:45 +0200
Message-ID: <20130716092345.28c8d655@amdc308.digital.local>
References: <611CFE9D6FBBDC4B97935A5287A11345014441@XSERVER21B.campus.tue.nl>
 <CAKohpok=WAJs9FBQxEuo=nh4=b184hHyzpLAwEjVYMUZVnB+2g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <CAKohpok=WAJs9FBQxEuo=nh4=b184hHyzpLAwEjVYMUZVnB+2g@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Comaschi, F." <fcomaschi@tue.nl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Linux PM List <linux-pm@lists.linux-foundation.org>, Andy Green <andy.green@linaro.org>, Chander Kashyap <chander.kashyap@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Francesco,

> Adding few more lists so that others can also help..
>=20
> On 15 July 2013 20:00, Comaschi, F. <fcomaschi@tue.nl> wrote:
> > Dear Viresh,
> >
> > I am Francesco Comaschi, a researcher at Eindhoven University of
> > Technology. My research group is interested in implementing custom
> > power management policies on ARM-based platform (at the moment we
> > are using an Arndale 5250 board featuring Exynos5 dual). We would
> > like  to make use of DVFS and to be able to measure power
> > consumption on the board.
>=20
> Ok.
>=20
> > First of all, congratulations for the work that you and the other
> > guys form the power management team are doing within the Linaro
> > community, I always follow your progress, and so far you have been
> > the only reliable source of information for everything I have been
> > doing on the board.
>=20
> Thanks :)
>=20
> > If you do not mind, I would like to ask you a few questions:
> > 1) Is there a way to measure the board power consumption via
> > software? I have read here:
> > http://blogs.arm.com/software-enablement/925-linux-hwmon-power-mana=
gement-and-arm-ds-5-streamline/
> > that it is possible with the ARM Versatile boards, through the
> > hwmon framework and lm_sensors. However, when I run lm_sensors on
> > the Arndale board, no sensors were found. Do you know about any
> > other possible ways to measure power in software?

I don't know if it will work for you, but for a reference (per-process
not per-task) you can look into the following proposal
http://lwn.net/Articles/557822/

"Per-process power consumption measurement facility"
Konstantin Krivyakin <k.krivyakin@samsung.com>



> > Maybe it is
> > possible to communicate with the on-board PMIC?=20

You can look into the PMIC spec if some detailed informations are
exposed. Moreover each battery shall be described by a model, which
PMIC uses e.g. for accurate charging.

PMICs at Exynos4 are communicating via I2C and provide information
about battery state of charge (SoC). You can monitor this value over
time and on this basis get (very coarse) estimation of power
consumption. =20

> > Maybe there are
> > some registers where information about the power/voltage provided
> > to the processor and the other components is available?
>=20
> On ARM Versatile express boards and the coretiles that come with it,
> we have sensors which are probed through hwmon framework in
> Linux. So, we have hardware IPs present on board which let us
> get some power figures per cluster for big LITTLE.
>=20
> I am not sure if Exynos have any such things on it.
>=20
> @Chander: Are you aware of any such features?
>=20
> > 2) Recently I have read Andy Green=E2=80=99s presentation =E2=80=9C=
How to measure
> > SoC power=E2=80=9D. However, by measuring power on the PMIC input s=
ide
> > through the ARM Energy Probe, probably I won't be able to see the
> > effect of DVFS. Do you have any suggestions on how to measure the
> > effect of DVFS, even through hardware measurements?
>=20
> You need probes on the voltage regulator which is feed the cores...
> But again, that is very much hardware specific. And I haven't worked
> on Exynos at all :)

I can only give you a hint there (since I didn't worked with Arndale ..=
=2E
yet) - measure current and voltage provided for SoC core Vdd plane.

>=20
> > 3) More in general, I do not know which is the best way to
> > implement custom policies of DVFS.
>=20
> I didn't get you here. Are you talking about tuning of governors here=
?
>=20
> > Is it possible, maybe through appropriate API's, to access the
> > cpu_idle and the cpu_freq framework from inside my application?

As fair as I see it (probably Viresh will correct me :-) ) the cpu_idle
and cpufreq work in different direction. They provide a response [*] on
the load change caused by the user (by starting heavy load task).

By the response [*] I mean change frequency and voltage level.

> > Shall I work directly with the drivers of the PMIC? Is it possible
> > to set the voltage directly from inside my application?
>=20
> Something on the board must provide this to kernel. Kernel can't
> get it by itself.


--=20
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
