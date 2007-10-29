From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: cpu governor ondemand issue
Date: Mon, 29 Oct 2007 00:02:43 -0700
Message-ID: <20071029000243.9101d363.akpm@linux-foundation.org>
References: <200710211316.14955.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755431AbXJ2HC7@vger.kernel.org>
In-Reply-To: <200710211316.14955.toralf.foerster@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Toralf =?ISO-8859-1?B?RvZyc3Rlcg==?= <toralf.foerster@gmx.de>
Cc: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

On Sun, 21 Oct 2007 13:16:14 +0200 Toralf F=F6rster <toralf.foerster@gm=
x.de> wrote:

> I use the following one liner for regression tests of the cpufreq gov=
ernor and
> friends:
>=20
> tfoerste@n22 ~ $ time factor 819734028463158891
>=20
> which usually needs 5.5 secs to complete at 1.7 GHz of my pentium M p=
rocessor.
>=20
> With the  current git sources (commit cfa76f0 at Sat Oct 20 20:19:15 =
2007 -0700)
> instead this command needs 3 times longer if I run the "distributed.n=
et client"
> as a background process with nice level 19 b/c the cpu frequency stil=
l stays
> at 600 MHz.
> After stopping dnetc the cpu frequency governor ondemand works as exp=
ected again.
>=20
> Tested at my ThinkPad T41 with stable Gentoo:
>=20
> tfoerste@n22 ~ $ grep -e ^CONFIG_ACPI -e ^CONFIG_CPU_FREQ_GOV_ ~/deve=
l/linux-2.6/.config
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> CONFIG_ACPI_PROCFS=3Dy
> CONFIG_ACPI_PROC_EVENT=3Dy
> CONFIG_ACPI_AC=3Dm
> CONFIG_ACPI_BATTERY=3Dm
> CONFIG_ACPI_BUTTON=3Dm
> CONFIG_ACPI_VIDEO=3Dm
> CONFIG_ACPI_FAN=3Dm
> CONFIG_ACPI_PROCESSOR=3Dm
> CONFIG_ACPI_THERMAL=3Dm
> CONFIG_ACPI_BLACKLIST_YEAR=3D0
> CONFIG_ACPI_EC=3Dy
> CONFIG_ACPI_POWER=3Dy
> CONFIG_ACPI_SYSTEM=3Dy
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
>=20

And 2.6.23 was OK?

Is this problem still present in Linus's current tree?

Thanks.
