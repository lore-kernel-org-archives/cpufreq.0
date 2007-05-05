From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 5 May 2007 22:50:05 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705052237580.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> 
 <200705042320.41278.dj@david-web.co.uk>  <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>
  <463C18C4.7030304@interia.pl> <5699f8f00705050144s5c00a455s8f7dba9258d83986@mail.gmail.com>
 <463CC380.3060603@interia.pl> <Pine.LNX.4.61.0705052028560.18504@yvahk01.tjqt.qr>
 <463CE1FB.4050305@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933330AbXEEUwh@vger.kernel.org>
In-Reply-To: <463CE1FB.4050305@interia.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: Wander Winkelhorst <w.winkelhorst@gmail.com>, David Johnson <dj@david-web.co.uk>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


On May 5 2007 21:58, Rafa=C5=82 Bilski wrote:

>:-/ Weird. Nothing new in datasheet. Longhaul MSR seems to be OK too.=20
>Would be good to check if PLL really can go downto x4,0. Can You=20
>limit minimal CPU multiplier to 5,0 and check if is stable? If it=20
>is check 4,5.

I directly wrote to /sys/devices/system/cpu/cpu0/cpufreq, which
worked better than `cpufreq -u xxx -d xxx`.

Lockup after 9 minutes. (Perhaps the longest time so far.)


Jan
--=20
