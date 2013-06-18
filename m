From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: 3.10-rcX: cpu governor ondemand doesn't scale well after s2ram
Date: Wed, 19 Jun 2013 00:05:32 +0200
Message-ID: <1778593.ufLkNuJuaY@vostro.rjw.lan>
References: <51C08370.4050906@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <51C08370.4050906@gmx.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Toralf =?ISO-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>
Cc: cpufreq@vger.kernel.org

On Tuesday, June 18, 2013 05:57:36 PM Toralf F=C3=B6rster wrote:
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

Hmm.  This looks like something unrelated to the previous reports.

How do you check the frequencies?

Does that happen every time?  If so, any chance to bisect driver/cpufre=
q
changes between 3.9 and now?

Does it work without ignore_nice?

Rafael


--=20
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
