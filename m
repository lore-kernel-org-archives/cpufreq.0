From: "wconbs-driver@yahoo.de" <wconbs-driver@yahoo.de>
Subject: Z53T, Asus Notebook, ubuntu 12.04, kernel 3.2.0-44, cpufreq nur PERFORMANE
Date: Thu, 30 May 2013 09:43:36 +0100 (BST)
Message-ID: <1369903416.73004.YahooMailNeo@web172501.mail.ir2.yahoo.com>
References: <1369811251.58881.YahooMailNeo@web172501.mail.ir2.yahoo.com> <1369903258.92082.YahooMailNeo@web172506.mail.ir2.yahoo.com>
Reply-To: "wconbs-driver@yahoo.de" <wconbs-driver@yahoo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s1024; t=1369903416; bh=8yKKp24kniD90iTHYsmOHCmGwC6ZANROfiVy7shDEIs=; h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=a+McmMIXgzLksXFysRH5ZNG6Avxo5kJYKGBzmJ+BgO4fvR3NaCA02c8nTnty3jNj1T0QkXV7gROQ3e+ZzAFaY6nziW4AWwqkv9NVW0tvVLDKu9/o4VoJvySVJA2jlH0IvD+jNA6JkLYyWHYOdECvWb/zrNsX7buAqkp4g1bI21o=
In-Reply-To: <1369903258.92082.YahooMailNeo@web172506.mail.ir2.yahoo.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Betreff: Z53T, Asus Notebook, ubuntu 12.04, kernel 3.2.0-44, cpufreq nu=
r PERFORMANE




Hallo,

habe 3 Asus z53t und mehrere PCs mit Amd64(x2) und auf allen das Proble=
m, die laufen immer "auf vollen Touren" - Performance - mit maximal lau=
tem L=FCfter und maximalem Stromverbrauch, das nervt! Ein Zeit lang gin=
g es mit 11.10 und auch 12.04 teilweise, das Stepping, seit den letzten=
 zwei Kernelupdates, glaube ich, ist es total vorbei, keine Einstellung=
 m=F6glich, sei es automatisch oder =FCber manuelle Eingabe! Habe schon=
 cpufreq de- und reinstalliert und einige kleinere Dinge ausprobiert!


Sorry, so macht es keinen Spa=DF! Ubuntu Team hilft nicht weiter, mache=
 alles au=DFer Kernel selbst kompilieren, dann leider Win7!

Gibt es eine praktikable L=F6sung (nur einfache, wenn ich das bei jedem=
 Kernelupdate wiederholen muss).


System:

ubuntu Version 12.04 (precise) (64-Bit)

=A0Kernel Linux 3.2.0-44-generic

GNOME 3.4.2

AMD Turion(tm) 64 X2 Mobile
Technology TL-56 =D7 2=20

cpufreq-info aus Terminal siehe unten

MFG


J=FCrgen Wippler


Handy: 0049(0)175-7854253

-----------------------------------------------------------------------=
-----------------------------------------------------------

Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
analysiere CPU 0:
=A0 Treiber: powernow-k8
=A0 Folgende CPUs laufen mit der gleichen Hardware-Taktfrequenz: 0 1
=A0 Die Taktfrequenz folgender CPUs werden per Software koordiniert: 0 =
1
=A0 Maximale Dauer eines Taktfrequenzwechsels: 109 us.
=A0 Hardwarebedingte Grenzen der Taktfrequenz: 800 MHz - 1.80 GHz
=A0 m=F6gliche Taktfrequenzen: 1.80 GHz, 1.60 GHz, 800 MHz
=A0 m=F6gliche Regler: conservative, ondemand, userspace, powersave, pe=
rformance
=A0 momentane Taktik: die Frequenz soll
innerhalb 1.80 GHz und 1.80 GHz.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 liegen. Der R=
egler "performance" kann frei entscheiden,
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 welche Taktfr=
equenz innerhalb dieser Grenze verwendet wird.
=A0 momentane Taktfrequenz ist 1.80 GHz.
=A0 Statistik:1.80 GHz:70,01%, 1.60 GHz:29,96%, 800 MHz:0,03%=A0 (2309)
analysiere CPU 1:
=A0 Treiber: powernow-k8
=A0 Folgende CPUs laufen mit der gleichen Hardware-Taktfrequenz: 0 1
=A0 Die Taktfrequenz folgender CPUs werden per Software koordiniert: 0 =
1
=A0 Maximale Dauer eines Taktfrequenzwechsels: 109 us.
=A0 Hardwarebedingte Grenzen der Taktfrequenz: 800 MHz - 1.80 GHz
=A0 m=F6gliche Taktfrequenzen: 1.80 GHz, 1.60 GHz, 800 MHz
=A0 m=F6gliche Regler: conservative, ondemand,
userspace, powersave, performance
=A0 momentane Taktik: die Frequenz soll innerhalb 1.80 GHz und 1.80 GHz=
=2E
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 liegen. Der R=
egler "performance" kann frei entscheiden,
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 welche Taktfr=
equenz innerhalb dieser Grenze verwendet wird.
=A0 momentane Taktfrequenz ist 1.80 GHz.
=A0 Statistik:1.80 GHz:70,01%, 1.60 GHz:29,96%, 800 MHz:0,03%=A0 (2309)
wipcon@wipcon-laptop:~$ sudo modprobe powernow-k8
[sudo] password for wipcon:=20
wipcon@wipcon-laptop:~$ cpufreq-info
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
analysiere CPU 0:
=A0 Treiber: powernow-k8
=A0 Folgende CPUs laufen mit der gleichen Hardware-Taktfrequenz: 0
1
=A0 Die Taktfrequenz folgender CPUs werden per Software koordiniert: 0 =
1
=A0 Maximale Dauer eines Taktfrequenzwechsels: 109 us.
=A0 Hardwarebedingte Grenzen der Taktfrequenz: 800 MHz - 1.80 GHz
=A0 m=F6gliche Taktfrequenzen: 1.80 GHz, 1.60 GHz, 800 MHz
=A0 m=F6gliche Regler: conservative, ondemand, userspace, powersave, pe=
rformance
=A0 momentane Taktik: die Frequenz soll innerhalb 1.60 GHz und 1.60 GHz=
=2E
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 liegen. Der R=
egler "performance" kann frei entscheiden,
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 welche Taktfr=
equenz innerhalb dieser Grenze verwendet wird.
=A0 momentane Taktfrequenz ist 1.60 GHz.
=A0 Statistik:1.80 GHz:70,05%, 1.60 GHz:29,92%, 800 MHz:0,03%=A0 (2320)
analysiere CPU 1:
=A0 Treiber:
powernow-k8
=A0 Folgende CPUs laufen mit der gleichen Hardware-Taktfrequenz: 0 1
=A0 Die Taktfrequenz folgender CPUs werden per Software koordiniert: 0 =
1
=A0 Maximale Dauer eines Taktfrequenzwechsels: 109 us.
=A0 Hardwarebedingte Grenzen der Taktfrequenz: 800 MHz - 1.80 GHz
=A0 m=F6gliche Taktfrequenzen: 1.80 GHz, 1.60 GHz, 800 MHz
=A0 m=F6gliche Regler: conservative, ondemand, userspace, powersave, pe=
rformance
=A0 momentane Taktik: die Frequenz soll innerhalb 1.60 GHz und 1.60 GHz=
=2E
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 liegen. Der R=
egler "performance" kann frei entscheiden,
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 welche Taktfr=
equenz innerhalb dieser Grenze verwendet wird.
=A0 momentane Taktfrequenz ist 1.60 GHz.
=A0 Statistik:1.80 GHz:70,05%,
1.60 GHz:29,92%, 800 MHz:0,03%=A0 (2320)=A0=20
