From: Mike Turquette <mturquette@linaro.org>
Subject: Re: Arndale power management
Date: Wed, 24 Jul 2013 18:58:42 -0700
Message-ID: <20130725015842.7598.97143@quantum>
References: <611CFE9D6FBBDC4B97935A5287A11345014441@XSERVER21B.campus.tue.nl>
 <CAKohpok=WAJs9FBQxEuo=nh4=b184hHyzpLAwEjVYMUZVnB+2g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpok=WAJs9FBQxEuo=nh4=b184hHyzpLAwEjVYMUZVnB+2g@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Viresh Kumar <viresh.kumar@linaro.org>, "Comaschi, F." <fcomaschi@tue.nl>
Cc: Lukasz Majewski <l.majewski@samsung.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, cpufreq@vger.kernel.org, Chander Kashyap <chander.kashyap@linaro.org>, Linux PM List <linux-pm@lists.linux-foundation.org>

Quoting Viresh Kumar (2013-07-15 23:43:03)
> Adding few more lists so that others can also help..
>=20
> On 15 July 2013 20:00, Comaschi, F. <fcomaschi@tue.nl> wrote:
> > Dear Viresh,
> >
> > I am Francesco Comaschi, a researcher at Eindhoven University of Te=
chnology. My research group is interested in implementing custom power =
management policies on ARM-based platform (at the moment we are using a=
n Arndale 5250 board featuring Exynos5 dual). We would like  to make us=
e of DVFS and to be able to measure power consumption on the board.
>=20
> Ok.
>=20
> > First of all, congratulations for the work that you and the other g=
uys form the power management team are doing within the Linaro communit=
y, I always follow your progress, and so far you have been the only rel=
iable source of information for everything I have been doing on the boa=
rd.
>=20
> Thanks :)
>=20
> > If you do not mind, I would like to ask you a few questions:
> > 1) Is there a way to measure the board power consumption via softwa=
re? I have read here: http://blogs.arm.com/software-enablement/925-linu=
x-hwmon-power-management-and-arm-ds-5-streamline/ that it is possible w=
ith the ARM Versatile boards, through the hwmon framework and lm_sensor=
s. However, when I run lm_sensors on the Arndale board, no sensors were=
 found. Do you know about any other possible ways to measure power in s=
oftware? Maybe it is possible to communicate with the on-board PMIC? Ma=
ybe there are some registers where information about the power/voltage =
provided to the processor and the other components is available?
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
How to measure SoC power=E2=80=9D. However, by measuring power on the P=
MIC input side through the ARM Energy Probe, probably I won't be able t=
o see the effect of DVFS. Do you have any suggestions on how to measure=
 the effect of DVFS, even through hardware measurements?
>=20
> You need probes on the voltage regulator which is feed the cores...
> But again, that is very much hardware specific. And I haven't worked
> on Exynos at all :)
>=20
> > 3) More in general, I do not know which is the best way to implemen=
t custom policies of DVFS.
>=20
> I didn't get you here. Are you talking about tuning of governors here=
?
>=20
> > Is it possible, maybe through appropriate API's, to access the cpu_=
idle and the cpu_freq framework from inside my application? Shall I wor=
k directly with the drivers of the PMIC? Is it possible to set the volt=
age directly from inside my application?

Are you trying to create a DVFS policy from a userspace application?
Lots of people hack together something using the CPUfreq "userspace"
governor and writing to:
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

This is not something that should be shipped on a product but is useful
for learning and prototyping. It only affects the CPU and will not help
you craft DVFS policies on other peripherals/devices.

Regards,
Mike

>=20
> Something on the board must provide this to kernel. Kernel can't
> get it by itself.
>=20
> _______________________________________________
> linaro-kernel mailing list
> linaro-kernel@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-kernel
