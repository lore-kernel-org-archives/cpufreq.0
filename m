From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 05 May 2007 21:58:51 +0200
Message-ID: <463CE1FB.4050305@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>  <200705042320.41278.dj@david-web.co.uk>  <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>  <463C18C4.7030304@interia.pl> <5699f8f00705050144s5c00a455s8f7dba9258d83986@mail.gmail.com> <463CC380.3060603@interia.pl> <Pine.LNX.4.61.0705052028560.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933219AbXEET7N@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0705052028560.18504@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Wander Winkelhorst <w.winkelhorst@gmail.com>, David Johnson <dj@david-web.co.uk>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

>> I found one line which wasn't were it should be. Probably this will =
not=20
>> fix Your problem with powersave governor, but it is a bit related.=20
>> Looks like Longhaul isn't skipping frequency transtition when it is =
asked=20
>> to set f which is already set. Now after first transition it will no=
t=20
>> try to set same frequency again. Second part contains some magic=20
>> because I don't have CN400 datasheet. It is NDA protected :-( Should=
=20
>> print You one byte in hex and will try to set one register. I don't=20
>> know if anything will change but it is worth testing.
>=20
> Did not help unfortunately. The output the printk line generated was
>   longhaul: 0x0
>=20
> (Strangely enough, %#02x with glibc outputs "00", not "0x0".
> And I would have expected "0x00". Subtleties of the kernel=20
> printk/glibc?)
:-/ Weird. Nothing new in datasheet. Longhaul MSR seems to be OK too.=20
Would be good to check if PLL really can go downto x4,0. Can You=20
limit minimal CPU multiplier to 5,0 and check if is stable? If it=20
is check 4,5.
Please send me below part of Your dmesg too:
CPU: After generic identify, caps: 0381b83f 00000000 00000000 00000000 =
00000000 00000000 00000000
CPU: L1 I Cache: 64K (32 bytes/line), D cache 64K (32 bytes/line)
CPU: L2 Cache: 64K (32 bytes/line)
CPU: After all inits, caps: 0381b93f 00000000 00000000 00000000 0000000=
0 000000dd 00000000

"dd" is very important here.
> Jan
Rafa=B3



----------------------------------------------------------------------
Kasia Cichopek eksponuje biust =20
>>> http://link.interia.pl/f1a6f
