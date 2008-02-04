From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: (ondemand) CPU governor  regression between 2.6.23 and 2.6.24
Date: Sun, 3 Feb 2008 16:32:55 -0800
Message-ID: <20080203163255.467256d4.akpm@linux-foundation.org>
References: <200801261506.28544.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755378AbYBDAcu@vger.kernel.org>
In-Reply-To: <200801261506.28544.toralf.foerster@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Toralf =?ISO-8859-1?B?RvZyc3Rlcg==?= <toralf.foerster@gmx.de>
Cc: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

On Sat, 26 Jan 2008 15:06:25 +0100 Toralf F=F6rster <toralf.foerster@gm=
x.de> wrote:

> I use a 1-liner for a simple performance check : "time factor 8197340=
28463158891"
> Here is the result for the new (Gentoo) kernel 2.6.24:
>=20
> With the  ondemand governor of the  I get:
>=20
> tfoerste@n22 ~/tmp $ time factor 819734028463158891
> 819734028463158891: 3 273244676154386297
>=20
> real    0m32.997s
> user    0m15.732s
> sys     0m0.014s
>=20
> With the ondemand governor the CPU runs at 600 MHz,
> whereas with the performance governor I get :
>=20
> tfoerste@n22 ~/tmp $ time factor 819734028463158891
> 819734028463158891: 3 273244676154386297
>=20
> real    0m10.893s
> user    0m5.444s
> sys     0m0.000s
>=20
> (~5.5 sec as I expected) b/c the CPU is set to 1.7 GHz.
>=20
> The ondeman governor of previous kernel versions however automaticall=
y increased
> the CPU speed from 600 MHz to 1.7 GHz.
>=20
> My system is a ThinkPad T41, I'll attach the .config=20
>=20

Let's cc the cpufreq list.

If nothing happens (often the case), please raise a report at
bugzilla.kernel.org so we can track the presence of the regression.

Thanks.
