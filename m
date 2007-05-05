From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 5 May 2007 10:00:21 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705051000030.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> 
 <1178311052.6094.0.camel@localhost.localdomain> 
 <Pine.LNX.4.61.0705042259160.18504@yvahk01.tjqt.qr>
 <1178318978.6094.29.camel@localhost.localdomain>
 <Pine.LNX.4.61.0705050130090.18504@yvahk01.tjqt.qr> <463C01FA.8070206@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753875AbXEEIDF@vger.kernel.org>
In-Reply-To: <463C01FA.8070206@interia.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: john stultz <johnstul@us.ibm.com>, davej@codemonkey.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk


On May 5 2007 06:03, Rafa=C5=82 Bilski wrote:
>
>>>> Switching from acpi_pm+performance to acpi_pm+ondemand also
>>>> locks up after a few minutes.
>>> Yep. Sounds like an ondemand issue. Thanks for verifying this for m=
e.
>>=20
>> Nah, it also happens with cpufreq_powersave. I just need to check=20
>> through some archives and try booting with governor=3Dpowersave so t=
hat it=20
>> always stays low.=20
>
>You have a lockup when switching from other governor to powersave? Or =
if =20
>You are using it for some time?

After some time.



Jan
--=20
