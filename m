From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Fri, 04 May 2007 22:11:44 +0200
Message-ID: <463B9380.5090503@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> <463B687D.1020600@interia.pl> <Pine.LNX.4.61.0705042042270.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1161581AbXEDUME@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0705042042270.18504@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

>> Btw. I've been writting many times: if You want to use ondemand with=
=20
>> Longhaul You don't need cpufreq at all.
>=20
> Does VIA Nehemiah do hardware-driven autoregulation like Transmeta
> Crusoe too? (I suspect no, have not seen that happen.)
No.
>> It is just one another cool gadget for You.
>> Longhaul wasn't designed to change frequency often.=20
>=20
> Is there a way I can start with a specific governor (powersave) right
> from the start so that all devices that Linux will initialize assume
> the CPU runs at <choose something> MHz?
You have to search cpufreq mail list archives. I think that I saw=20
patch recently.
>> It has big latency and requires so much preparation that it isn't wo=
rth=20
>> if You don't need to save power or cool down CPU.=20
>=20
> I found frequency switching on my VIA to be fast enough.
Timer frequency equal to 1000Hz?=20
> Jan
Rafa=B3



----------------------------------------------------------------------
Wicie, rozumicie....
Zobacz >>> http://link.interia.pl/f1a74
