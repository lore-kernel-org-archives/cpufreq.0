From: Toralf =?utf-8?q?F=C3=B6rster?= <toralf.foerster@gmx.de>
Subject: Re: is /sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load gone ?
Date: Tue, 5 Jul 2011 09:58:18 +0200
Message-ID: <201107050958.19282.toralf.foerster@gmx.de>
References: <201106251424.51860.toralf.foerster@gmx.de> <201107050938.56869.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201107050938.56869.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="utf-8"
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org


Thomas Renninger wrote at 09:38:56
> On Saturday, June 25, 2011 02:24:51 PM Toralf F=C3=B6rster wrote:
> > At my ThinkPad T400 I tried today kernel 3.0-rc4 but now I cannot u=
se
> > this command any longer :
> > echo 1> /sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load
> >=20
> > Furthermore I miss the files under
> > /sys/devices/system/cpu/cpu{0,1}/cpufreq
> >=20
> > Do I miss a (new ?) config option - I used the old kernel config an=
d
> > compared it carefully, but maybe ...
>=20
> Sounds as if the cpufreq driver is not loaded at all?
> For a T400 it should be the acpi_cpufreq driver.
>=20
>    Thomas
correct, I run into this pitfall:=20
https://bugs.gentoo.org/show_bug.cgi?id=3D373808#c4


--=20
MfG/Sincerely
Toralf F=C3=B6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
