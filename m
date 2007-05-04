From: =?UTF-8?B?UmFmYcWCIEJpbHNraQ==?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Fri, 04 May 2007 19:08:13 +0200
Message-ID: <463B687D.1020600@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1031438AbXEDRIg@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1254"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

> Hi,
Hello all
>=20
> I found that setting the cpufreq governor to ondemand making the box=20
> lock up solid in 2.6.20.2 and 2.6.21 after a few seconds.
> [...]

I can't explain this. Some motherboards are running fine, some don't.
I'm running longhaul too. It is working fine. No lockups at all.=20
So far I heard only about one Epia which had problems with longhaul.=20
It was almost like my Epia but older.
What is possible:
- some chipsets revisions are broken and aren't blocking DMA,
- special setup is required, some versions of BIOS are doing=20
necessary things, some don't,
- some chipsets revisions are broken and drivers are not aware. At=20
the beginning Unichrome driver was causing lockups on my machine, but=20
Openchrome was fine. Longhaul may trigger, somehow, other hardware bug.=
=20

Anyway I don't belive in Longhaul anymore. It is working for me. It is=20
working for others. And it isn't working for others. VIA isn't supporti=
ng=20
this driver. Support came only from Centaur and Dave Jones. If special=20
setup is required for north/southbridge then it is necessary to have=20
documentation. I will not receive it from VIA.

I'm asking about advice. Make it BROKEN again? Add "big fat warning" an=
d=20
"enable" option? I know that this is Dave Jones decision, but I would l=
ike=20
to heard what people are thinking, becuse I've been messing a lot with=20
this driver.

Btw. I've been writting many times: if You want to use ondemand with=20
Longhaul You don't need cpufreq at all. It is just one another cool=20
gadget for You. Longhaul wasn't designed to change frequency often.=20
It has big latency and requires so much preparation that it isn't worth=
=20
if You don't need to save power or cool down CPU.=20

Sorry for bad English
Rafa=C5=82


----------------------------------------------------------------------
NIE KUPUJ!!!
=2E..zanim nie porownasz cen >> http://link.interia.pl/f1a5e


