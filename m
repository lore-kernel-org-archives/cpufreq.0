From: "Comaschi, F." <fcomaschi@tue.nl>
Subject: RE: Arndale power management
Date: Fri, 26 Jul 2013 06:06:16 +0000
Message-ID: <611CFE9D6FBBDC4B97935A5287A1134501FFB7@XSERVER21B.campus.tue.nl>
References: <611CFE9D6FBBDC4B97935A5287A11345014441@XSERVER21B.campus.tue.nl>
 <CAKohpok=WAJs9FBQxEuo=nh4=b184hHyzpLAwEjVYMUZVnB+2g@mail.gmail.com>
 <20130725015842.7598.97143@quantum>
 <611CFE9D6FBBDC4B97935A5287A1134501BB6D@XSERVER21B.campus.tue.nl>,<CAPtuhTg3YdTGy58UT9gVmp9EZNBwxaqv69A8nv_Gackyc5qc5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAPtuhTg3YdTGy58UT9gVmp9EZNBwxaqv69A8nv_Gackyc5qc5Q@mail.gmail.com>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Mike Turquette <mturquette@linaro.org>
Cc: "l.majewski@samsung.com" <l.majewski@samsung.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "chander.kashyap@linaro.org" <chander.kashyap@linaro.org>, "linux-pm@lists.linux-foundation.org" <linux-pm@lists.linux-foundation.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Yes of course!

Sorry for that ;)

Best,

=46rancesco
________________________________________
=46rom: Mike Turquette [mturquette@linaro.org]
Sent: Thursday, July 25, 2013 7:36 PM
To: Comaschi, F.
Subject: Re: Arndale power management

=46rancesco,

Can you reply to the list with your response? Please do not remove the
list when responding.

Regards,
Mike

On Wed, Jul 24, 2013 at 11:11 PM, Comaschi, F. <fcomaschi@tue.nl> wrote=
:
> Dear Mike,
>
> thank you very much for your reply!
>
> the hack that you suggest is indeed what I have done so far just for =
testing. However, I was thinking, if we have some knowledge about the s=
pecific application that we are running, from a functional point of vie=
w (e.g., we are scanning a scene through a camera and we see that there=
's no movement, therefore we decide to lower the frequency), wouldn't i=
t be useful to exploit this knowledge in order to implement our own DVF=
S policy in a more proactive way, rather than recurring to the availabl=
e governors which I think are working in a more reactive way?
> In that case, how would you suggest to interface with the OS from ins=
ide my application? Shall I make some "calls" to specific API's, or may=
be writing my own governor?
>
> Thanks in advance for your attention!
>
> Best,
>
> Francesco
> ________________________________________
> From: Mike Turquette [mturquette@linaro.org]
> Sent: Thursday, July 25, 2013 3:58 AM
> To: Viresh Kumar; Comaschi, F.
> Cc: Lukasz Majewski; Lists linaro-kernel; cpufreq@vger.kernel.org; Ch=
ander Kashyap; Linux PM List
> Subject: Re: Arndale power management
>
> Quoting Viresh Kumar (2013-07-15 23:43:03)
>> Adding few more lists so that others can also help..
>>
>> On 15 July 2013 20:00, Comaschi, F. <fcomaschi@tue.nl> wrote:
>> > Dear Viresh,
>> >
>> > I am Francesco Comaschi, a researcher at Eindhoven University of T=
echnology. My research group is interested in implementing custom power=
 management policies on ARM-based platform (at the moment we are using =
an Arndale 5250 board featuring Exynos5 dual). We would like  to make u=
se of DVFS and to be able to measure power consumption on the board.
>>
>> Ok.
>>
>> > First of all, congratulations for the work that you and the other =
guys form the power management team are doing within the Linaro communi=
ty, I always follow your progress, and so far you have been the only re=
liable source of information for everything I have been doing on the bo=
ard.
>>
>> Thanks :)
>>
>> > If you do not mind, I would like to ask you a few questions:
>> > 1) Is there a way to measure the board power consumption via softw=
are? I have read here: http://blogs.arm.com/software-enablement/925-lin=
ux-hwmon-power-management-and-arm-ds-5-streamline/ that it is possible =
with the ARM Versatile boards, through the hwmon framework and lm_senso=
rs. However, when I run lm_sensors on the Arndale board, no sensors wer=
e found. Do you know about any other possible ways to measure power in =
software? Maybe it is possible to communicate with the on-board PMIC? M=
aybe there are some registers where information about the power/voltage=
 provided to the processor and the other components is available?
>>
>> On ARM Versatile express boards and the coretiles that come with it,
>> we have sensors which are probed through hwmon framework in
>> Linux. So, we have hardware IPs present on board which let us
>> get some power figures per cluster for big LITTLE.
>>
>> I am not sure if Exynos have any such things on it.
>>
>> @Chander: Are you aware of any such features?
>>
>> > 2) Recently I have read Andy Green=92s presentation =93How to meas=
ure SoC power=94. However, by measuring power on the PMIC input side th=
rough the ARM Energy Probe, probably I won't be able to see the effect =
of DVFS. Do you have any suggestions on how to measure the effect of DV=
=46S, even through hardware measurements?
>>
>> You need probes on the voltage regulator which is feed the cores...
>> But again, that is very much hardware specific. And I haven't worked
>> on Exynos at all :)
>>
>> > 3) More in general, I do not know which is the best way to impleme=
nt custom policies of DVFS.
>>
>> I didn't get you here. Are you talking about tuning of governors her=
e?
>>
>> > Is it possible, maybe through appropriate API's, to access the cpu=
_idle and the cpu_freq framework from inside my application? Shall I wo=
rk directly with the drivers of the PMIC? Is it possible to set the vol=
tage directly from inside my application?
>
> Are you trying to create a DVFS policy from a userspace application?
> Lots of people hack together something using the CPUfreq "userspace"
> governor and writing to:
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
>
> This is not something that should be shipped on a product but is usef=
ul
> for learning and prototyping. It only affects the CPU and will not he=
lp
> you craft DVFS policies on other peripherals/devices.
>
> Regards,
> Mike
>
>>
>> Something on the board must provide this to kernel. Kernel can't
>> get it by itself.
>>
>> _______________________________________________
>> linaro-kernel mailing list
>> linaro-kernel@lists.linaro.org
>> http://lists.linaro.org/mailman/listinfo/linaro-kernel
