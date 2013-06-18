From: =?UTF-8?B?VG9yYWxmIEbDtnJzdGVy?= <toralf.foerster@gmx.de>
Subject: 3.10-rcX: cpu governor ondemand doesn't scale well after s2ram
Date: Tue, 18 Jun 2013 17:57:36 +0200
Message-ID: <51C08370.4050906@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

At a stable 32bit Gentoo Linux with a i5 processor (2.6 GHZ max, 3.1 GH=
z
boost) I've to change the governor after a s2ram all 4 cores from
"ondemand" to "performance" and back to "ondemand", otherwise cpu1 till
cpu3 would stay after s2ram at 2.6 GHz (whilst cpu0 is at the expected
800 MHz if no load is at the system) - FWIW I do set ignore_nice to "1"=
=2E

3.9.6 is ok, the bug was introduces somewhere in 3.10-rcX.

--=20
MfG/Sincerely
Toralf F=C3=B6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
