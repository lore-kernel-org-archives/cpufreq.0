From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Sun, 06 May 2007 11:23:26 +0200
Message-ID: <463D9E8E.8040500@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>  <200705042320.41278.dj@david-web.co.uk>  <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>  <463C18C4.7030304@interia.pl> <5699f8f00705050144s5c00a455s8f7dba9258d83986@mail.gmail.com> <463CC380.3060603@interia.pl> <Pine.LNX.4.61.0705052028560.18504@yvahk01.tjqt.qr> <463CE1FB.4050305@interia.pl> <Pine.LNX.4.61.0705052237580.18504@yvahk01.tjqt.qr> <463D63D8.8010901@interia.pl> <Pine.LNX.4.61.0705060959200.23047@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933470AbXEFJXx@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0705060959200.23047@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Wander Winkelhorst <w.winkelhorst@gmail.com>, David Johnson <dj@david-web.co.uk>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

> <6>No local APIC present or hardware disabled
> <7>mapped APIC to ffffd000 (011ea000)
> <5>Local APIC not detected. Using dummy APIC emulation.
I/O APIC is very bad thing with Longhaul, but You don't have=20
local APIC, so it shouldn't be used.
> <6>ACPI: Using PIC for interrupt routing
Looks like it isn't.
> <4>ACPI: PCI Interrupt Link [ALKA] (IRQs *20), disabled.
> <4>ACPI: PCI Interrupt Link [ALKB] (IRQs *21)
> <4>ACPI: PCI Interrupt Link [ALKC] (IRQs *22)
> <4>ACPI: PCI Interrupt Link [ALKD] (IRQs *23), disabled.
This is pointing to I/O APIC, but I don't see later that=20
such high interrupts are used. And if I/O APIC would be in=20
use You would have lockup in the moment of transition.

I was suspecting:
> One of the 2.6.21 regressions was Guilherme's problem seeing his box
> lock up when the system detected an unstable TSC and dropped back to
> using the HPET.
>=20
> In digging deeper, we found the HPET is not actually incrementing on
> this system. And in fact, the reason why this issue just cropped up w=
as
> because of Thomas's clocksource watchdog code was comparing the TSC t=
o
> the HPET (which wasn't moving) and thought the TSC was broken.
because I know that VT8237 has HPET built in. But I don't see any lines=
=20
starting with "hpet: enabled" or something similar. But I don't know=20
what to search for. I didn't have contact with HPET earlier.
It is very similar and Your problem with ondemand is starting right=20
after
> May  3 19:17:22 cn kernel: Clocksource tsc unstable (delta =3D -13642=
2685=20
> ns)
I don't see such message as long as "performance" governor is used.=20

Anyway adding "hpet=3Ddisable" at boot should confirm for sure that it=20
isn't it. And I think that John already ruled this out by=20
clocksource=3Dacpi_pm.

Sorry=20
Rafa=B3

-----------------------------------------------------------------------=
 Linda jako gospodyni domowa - zobacz!!!
>>> http://link.interia.pl/f1a79
