From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Arndale power management
Date: Tue, 16 Jul 2013 12:13:03 +0530
Message-ID: <CAKohpok=WAJs9FBQxEuo=nh4=b184hHyzpLAwEjVYMUZVnB+2g@mail.gmail.com>
References: <611CFE9D6FBBDC4B97935A5287A11345014441@XSERVER21B.campus.tue.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <611CFE9D6FBBDC4B97935A5287A11345014441@XSERVER21B.campus.tue.nl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Comaschi, F." <fcomaschi@tue.nl>
Cc: cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Linux PM List <linux-pm@lists.linux-foundation.org>, Andy Green <andy.green@linaro.org>, Chander Kashyap <chander.kashyap@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>

Adding few more lists so that others can also help..

On 15 July 2013 20:00, Comaschi, F. <fcomaschi@tue.nl> wrote:
> Dear Viresh,
>
> I am Francesco Comaschi, a researcher at Eindhoven University of Tech=
nology. My research group is interested in implementing custom power ma=
nagement policies on ARM-based platform (at the moment we are using an =
Arndale 5250 board featuring Exynos5 dual). We would like  to make use =
of DVFS and to be able to measure power consumption on the board.

Ok.

> First of all, congratulations for the work that you and the other guy=
s form the power management team are doing within the Linaro community,=
 I always follow your progress, and so far you have been the only relia=
ble source of information for everything I have been doing on the board=
=2E

Thanks :)

> If you do not mind, I would like to ask you a few questions:
> 1) Is there a way to measure the board power consumption via software=
? I have read here: http://blogs.arm.com/software-enablement/925-linux-=
hwmon-power-management-and-arm-ds-5-streamline/ that it is possible wit=
h the ARM Versatile boards, through the hwmon framework and lm_sensors.=
 However, when I run lm_sensors on the Arndale board, no sensors were f=
ound. Do you know about any other possible ways to measure power in sof=
tware? Maybe it is possible to communicate with the on-board PMIC? Mayb=
e there are some registers where information about the power/voltage pr=
ovided to the processor and the other components is available?

On ARM Versatile express boards and the coretiles that come with it,
we have sensors which are probed through hwmon framework in
Linux. So, we have hardware IPs present on board which let us
get some power figures per cluster for big LITTLE.

I am not sure if Exynos have any such things on it.

@Chander: Are you aware of any such features?

> 2) Recently I have read Andy Green=92s presentation =93How to measure=
 SoC power=94. However, by measuring power on the PMIC input side throu=
gh the ARM Energy Probe, probably I won't be able to see the effect of =
DVFS. Do you have any suggestions on how to measure the effect of DVFS,=
 even through hardware measurements?

You need probes on the voltage regulator which is feed the cores...
But again, that is very much hardware specific. And I haven't worked
on Exynos at all :)

> 3) More in general, I do not know which is the best way to implement =
custom policies of DVFS.

I didn't get you here. Are you talking about tuning of governors here?

> Is it possible, maybe through appropriate API's, to access the cpu_id=
le and the cpu_freq framework from inside my application? Shall I work =
directly with the drivers of the PMIC? Is it possible to set the voltag=
e directly from inside my application?

Something on the board must provide this to kernel. Kernel can't
get it by itself.
