From: =?UTF-8?B?VG9yYWxmIEbDtnJzdGVy?= <toralf.foerster@gmx.de>
Subject: Re: 3.10-rcX: cpu governor ondemand doesn't scale well after s2ram
Date: Tue, 18 Jun 2013 22:27:15 +0200
Message-ID: <51C0C2A3.3060902@gmx.de>
References: <51C08370.4050906@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <51C08370.4050906@gmx.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

On 06/18/2013 05:57 PM, Toralf F=C3=B6rster wrote:
> At a stable 32bit Gentoo Linux with a i5 processor (2.6 GHZ max, 3.1 =
GHz
> boost) I've to change the governor after a s2ram all 4 cores from
> "ondemand" to "performance" and back to "ondemand", otherwise cpu1 ti=
ll
> cpu3 would stay after s2ram at 2.6 GHz (whilst cpu0 is at the expecte=
d
> 800 MHz if no load is at the system) - FWIW I do set ignore_nice to "=
1".
>=20
> 3.9.6 is ok, the bug was introduces somewhere in 3.10-rcX.
>=20
=46WIW the following  commands circumvents that issue :

# for i in $(seq 1 3); do echo performance > /sys/devices/system/cpu/cp=
u$i/cpufreq/scaling_governor; done
# for i in $(seq 1 3); do echo ondemand    > /sys/devices/system/cpu/cp=
u$i/cpufreq/scaling_governor; done

cpu0 is unaffected
--=20
MfG/Sincerely
Toralf F=C3=B6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
