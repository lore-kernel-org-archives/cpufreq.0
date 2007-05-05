From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 5 May 2007 20:13:22 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705052011340.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> 
 <1178311052.6094.0.camel@localhost.localdomain> 
 <Pine.LNX.4.61.0705042259160.18504@yvahk01.tjqt.qr>
 <1178318978.6094.29.camel@localhost.localdomain>
 <Pine.LNX.4.61.0705050130090.18504@yvahk01.tjqt.qr> <463C01FA.8070206@interia.pl>
 <Pine.LNX.4.61.0705051000030.18504@yvahk01.tjqt.qr> <463C8D72.5070003@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934282AbXEESQD@vger.kernel.org>
In-Reply-To: <463C8D72.5070003@interia.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: john stultz <johnstul@us.ibm.com>, davej@codemonkey.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk


On May 5 2007 15:58, Rafa=C5=82 Bilski wrote:
>>>>>> Switching from acpi_pm+performance to acpi_pm+ondemand also
>>>>>> locks up after a few minutes.
>>>>> Yep. Sounds like an ondemand issue. Thanks for verifying this for=
 me.
>>>> Nah, it also happens with cpufreq_powersave. I just need to check=20
>>>> through some archives and try booting with governor=3Dpowersave so=
 that it=20
>>>> always stays low.=20
>>> You have a lockup when switching from other governor to powersave? =
Or if =20
>>> You are using it for some time?
>>=20
>> After some time.

>Don't understand me wrong, but this is very weird. I think that
>powersave is changing frequency only one time, when it is loaded. I
>will look into its code to be sure. Probably Longhaul is making
>something what isn't allowed or there is hardware bug somewhere.

I patched Kconfig and the kernel source so that powersave
is the only governor available at boot
(CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy, CPU_FREQ_DEFAULT_GOV_POWERSAVE=3Dy,
CONFIG_X86_LONGHAUL=3Dy) -- also locks up.

I'll keep you posted.


Jan
--=20
