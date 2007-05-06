From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sun, 6 May 2007 11:32:24 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705061125010.8623@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> 
 <200705042320.41278.dj@david-web.co.uk>  <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>
  <463C18C4.7030304@interia.pl> <5699f8f00705050144s5c00a455s8f7dba9258d83986@mail.gmail.com>
 <463CC380.3060603@interia.pl> <Pine.LNX.4.61.0705052028560.18504@yvahk01.tjqt.qr>
 <463CE1FB.4050305@interia.pl> <Pine.LNX.4.61.0705052237580.18504@yvahk01.tjqt.qr>
 <463D63D8.8010901@interia.pl> <Pine.LNX.4.61.0705060959200.23047@yvahk01.tjqt.qr>
 <463D9E8E.8040500@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754706AbXEFJfA@vger.kernel.org>
In-Reply-To: <463D9E8E.8040500@interia.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: Wander Winkelhorst <w.winkelhorst@gmail.com>, David Johnson <dj@david-web.co.uk>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


On May 6 2007 11:23, Rafa=C5=82 Bilski wrote:
>
>> <6>No local APIC present or hardware disabled
>> <7>mapped APIC to ffffd000 (011ea000)
>> <5>Local APIC not detected. Using dummy APIC emulation.
>
>I/O APIC is very bad thing with Longhaul, but You don't have=20
>local APIC, so it shouldn't be used.
>
>> <6>ACPI: Using PIC for interrupt routing
>
>Looks like it isn't.
>
>> <4>ACPI: PCI Interrupt Link [ALKA] (IRQs *20), disabled.
>> <4>ACPI: PCI Interrupt Link [ALKB] (IRQs *21)
>> <4>ACPI: PCI Interrupt Link [ALKC] (IRQs *22)
>> <4>ACPI: PCI Interrupt Link [ALKD] (IRQs *23), disabled.
>
>This is pointing to I/O APIC, but I don't see later that=20
>such high interrupts are used. And if I/O APIC would be in=20
>use You would have lockup in the moment of transition.

cn:~ # cat /proc/interrupts=20
           CPU0      =20
  0:    1745595    XT-PIC-XT        timer
  1:         29    XT-PIC-XT        i8042
  2:          0    XT-PIC-XT        cascade
  5:       1194    XT-PIC-XT        uhci_hcd:usb1, uhci_hcd:usb2, eth0
  7:          1    XT-PIC-XT        ehci_hcd:usb5
  8:          2    XT-PIC-XT        rtc
  9:          0    XT-PIC-XT        acpi
 12:          0    XT-PIC-XT        uhci_hcd:usb3, uhci_hcd:usb4, eth1
 14:      59882    XT-PIC-XT        libata
 15:          0    XT-PIC-XT        libata
NMI:          0=20
LOC:          0=20
ERR:          0
MIS:          0

So, just the regular 16.

>I was suspecting:
>> One of the 2.6.21 regressions was Guilherme's problem seeing his box
>> lock up when the system detected an unstable TSC and dropped back to
>> using the HPET.
>>=20
>> In digging deeper, we found the HPET is not actually incrementing on
>> this system. And in fact, the reason why this issue just cropped up =
was
>> because of Thomas's clocksource watchdog code was comparing the TSC =
to
>> the HPET (which wasn't moving) and thought the TSC was broken.
>
>because I know that VT8237 has HPET built in. But I don't see any line=
s=20
>starting with "hpet: enabled" or something similar. But I don't know=20
>what to search for. I didn't have contact with HPET earlier.
>It is very similar and Your problem with ondemand is starting right=20
>after
>
>> May  3 19:17:22 cn kernel: Clocksource tsc unstable (delta =3D -1364=
22685=20
>> ns)
>
>I don't see such message as long as "performance" governor is used.=20

Well this message pops up whenever the frequency changes, because
the CPU does not have constant_tsc. E.g.

<performance is default and active>
echo 598000 >/sys/devices/cpu/cpu0/cpufreq

spews out the clocksource message. I do not think the clocksource
is a culprit. The kernel just noticed the TSC jumped and hence
uses a new clocksource.

>Anyway adding "hpet=3Ddisable" at boot should confirm for sure that it=
=20
>isn't it. And I think that John already ruled this out by=20
>clocksource=3Dacpi_pm.
>
>Sorry=20
>Rafa=C5=82

Nevermind, it does not look like it gets any cooler at lower frequencie=
s,
so it's a nobrainer to run it at the default 733.


Jan
--=20
