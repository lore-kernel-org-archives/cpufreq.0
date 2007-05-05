From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 5 May 2007 22:30:53 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705052224360.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> 
 <200705042320.41278.dj@david-web.co.uk>  <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>
  <463C18C4.7030304@interia.pl> <5699f8f00705050144s5c00a455s8f7dba9258d83986@mail.gmail.com>
 <463CC380.3060603@interia.pl> <Pine.LNX.4.61.0705052028560.18504@yvahk01.tjqt.qr>
 <463CE1FB.4050305@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933297AbXEEUd2@vger.kernel.org>
In-Reply-To: <463CE1FB.4050305@interia.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: Wander Winkelhorst <w.winkelhorst@gmail.com>, David Johnson <dj@david-web.co.uk>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


On May 5 2007 21:58, Rafa=C5=82 Bilski wrote:
>
>>> I found one line which wasn't were it should be. Probably this will=
 not=20
>>> fix Your problem with powersave governor, but it is a bit related.=20
>>> Looks like Longhaul isn't skipping frequency transtition when it is=
 asked=20
>>> to set f which is already set. Now after first transition it will n=
ot=20
>>> try to set same frequency again. Second part contains some magic=20
>>> because I don't have CN400 datasheet. It is NDA protected :-( Shoul=
d=20
>>> print You one byte in hex and will try to set one register. I don't=
=20
>>> know if anything will change but it is worth testing.
>>=20
>> Did not help unfortunately. The output the printk line generated was
>>   longhaul: 0x0
>>=20
>> (Strangely enough, %#02x with glibc outputs "00", not "0x0".
>> And I would have expected "0x00". Subtleties of the kernel=20
>> printk/glibc?)
>
>:-/ Weird. Nothing new in datasheet. Longhaul MSR seems to be OK too.=20
>Would be good to check if PLL really can go downto x4,0. Can You=20
>limit minimal CPU multiplier to 5,0 and check if is stable? If it=20
>is check 4,5.

How do I do that? I tried `cpufreq-set -d 665 -u 665` (x5.0), but that
changed the frequency to 532 (x4.0).

I can set the CPU frequency in the BIOS, from x3.0 to x16.0, in x0.5
steps (base frequency is 133, DIMM freq is 266).

[ Actually, the values are a bit off,

cn:~ # cpufreq-info=20
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to http://bugs.opensuse.org, please.
analyzing CPU 0:
  driver: longhaul
  CPUs which need to switch frequency at the same time: 0
  hardware limits: 532 MHz - 731 MHz
  available frequency steps: 532 MHz, 598 MHz, 731 MHz, 665 MHz
  available cpufreq governors: performance
  current policy: frequency should be within 532 MHz and 731 MHz.
                  The governor "performance" may decide which speed to =
use
                  within this range.
  current CPU frequency is 731 MHz (asserted by call to hardware).

]

The BIOS default is x5.5, producing 733 MHz. With longhaul/cpufreq,
I can then choose from between 533 MHz (x4.0) and the value that was
set in the BIOS.



>Please send me below part of Your dmesg too:
>CPU: After generic identify, caps: 0381b83f 00000000 00000000 00000000=
 00000000 00000000 00000000
>CPU: L1 I Cache: 64K (32 bytes/line), D cache 64K (32 bytes/line)
>CPU: L2 Cache: 64K (32 bytes/line)
>CPU: After all inits, caps: 0381b93f 00000000 00000000 00000000 000000=
00 000000dd 00000000

CPU: After generic identify, caps:
0381b03f 00000000 00000000 00000000 00000000 00000000 00000000
CPU: L1 I Cache: 64K (32 bytes/line), D cache 64K (32 bytes/line)
CPU: L2 Cache: 64K (32 bytes/line)
CPU: After all inits, caps: 0381b13f 00000000 00000000 00000000 0000000=
0
000000dd 00000000



Jan
--=20
