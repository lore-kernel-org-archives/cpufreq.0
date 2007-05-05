From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 5 May 2007 20:42:18 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705052028560.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> 
 <200705042320.41278.dj@david-web.co.uk>  <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>
  <463C18C4.7030304@interia.pl> <5699f8f00705050144s5c00a455s8f7dba9258d83986@mail.gmail.com>
 <463CC380.3060603@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752897AbXEESox@vger.kernel.org>
In-Reply-To: <463CC380.3060603@interia.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: Wander Winkelhorst <w.winkelhorst@gmail.com>, David Johnson <dj@david-web.co.uk>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


On May 5 2007 19:48, Rafa=C5=82 Bilski wrote:
>
>I found one line which wasn't were it should be. Probably this will no=
t=20
>fix Your problem with powersave governor, but it is a bit related.=20
>Looks like Longhaul isn't skipping frequency transtition when it is as=
ked=20
>to set f which is already set. Now after first transition it will not=20
>try to set same frequency again. Second part contains some magic=20
>because I don't have CN400 datasheet. It is NDA protected :-( Should=20
>print You one byte in hex and will try to set one register. I don't=20
>know if anything will change but it is worth testing.

Did not help unfortunately. The output the printk line generated was
  longhaul: 0x0

(Strangely enough, %#02x with glibc outputs "00", not "0x0".
And I would have expected "0x00". Subtleties of the kernel=20
printk/glibc?)



Jan
--=20
