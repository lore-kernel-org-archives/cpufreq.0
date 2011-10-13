From: Toralf =?utf-8?q?F=C3=B6rster?= <toralf.foerster@gmx.de>
Subject: a "nice -19 <process>" affects overall systems performance
Date: Thu, 13 Oct 2011 21:34:28 +0200
Message-ID: <201110132134.29601.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

Under Gentoo I observed significantly longer compile times at a ThinkPa=
d T400=20
(Core2 Duo CPU P8600), if I run the BOINC software with nice level -19,=
 cpu=20
governor "ondemand", CONFIG_CGROUPS=3Dy and=20
/sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load=3D1

Powertop shows, that w/o BOINC software the CPU mostly (>90%)  runs at =
in=20
Turbo Mode (=3D=3D2.401 GHz), furthermore the CPU state of C0 takes abo=
ut 75% of=20
the time, "C3 mwait" about 25%.

As soon as the BOINC client is started (2 tasks) - the P-states goes do=
wn to=20
about 50% for the Turbo Mode and the 800 MHz CPU state takes about the =
other=20
50%, on the other hand C0 reaches about 90%, C3 goes down to few percen=
t.

In short - Is this the expected behaviour of the kernel 3.1.0-rc9+ ? (p=
revious=20
kernel versions gave simialr results).

--=20
MfG/Sincerely
Toralf F=C3=B6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
