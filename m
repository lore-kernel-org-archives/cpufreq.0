From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 05 May 2007 20:04:37 +0200
Message-ID: <463CC735.9080709@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> <200705042320.41278.dj@david-web.co.uk> <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr> <463C18C4.7030304@interia.pl> <Pine.LNX.4.61.0705051114130.18504@yvahk01.tjqt.qr> <463C9070.7020007@interia.pl> <Pine.LNX.4.61.0705051932210.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934212AbXEESEs@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0705051932210.18504@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: David Johnson <dj@david-web.co.uk>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, Wander Winkelhorst <w.winkelhorst@gmail.com>

> I just wonder why x86info says I have a C5XL while `modprobe longhaul=
`
> says it is a C5P.
I have changed names to names which VIA is using.=20
>=20
> cn:/dev/shm # ./x86info -v -v
You need to be root and use -a option. I'm interested in:
=46CR: MSR: 0x00001107=3D0x9e3f1ad6 : 10011110 00111111 00011010 110101=
10
Power management: Powersaver
MSR: 0x0000110a=3D0x07ff000d000280f0 : 00000111 11111111 00000000 00001=
101
           00000000 00000010 10000000 11110000

 RevisionID: 0 : Initial revision (Software clock multiplier only, no S=
oftVID)
 Software clock multiplier is disabled
Please send me below part of Your dmesg too:
CPU: After generic identify, caps: 0381b83f 00000000 00000000 00000000 =
00000000 00000000 00000000
CPU: L1 I Cache: 64K (32 bytes/line), D cache 64K (32 bytes/line)
CPU: L2 Cache: 64K (32 bytes/line)
CPU: After all inits, caps: 0381b93f 00000000 00000000 00000000 0000000=
0 000000dd 00000000
>=20
> And the BIOS announces it as a "Via Eden ESP 6000" (as does the manuf=
acturer).
Great. I think that I saw datasheet somewhere.
> Jan
Rafa=B3



----------------------------------------------------------------------
Wicie, rozumicie....
Zobacz >>> http://link.interia.pl/f1a74
