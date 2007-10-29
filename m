From: Toralf =?iso-8859-1?q?F=F6rster?= <toralf.foerster@gmx.de>
Subject: Re: cpu governor ondemand issue
Date: Mon, 29 Oct 2007 09:30:18 +0100
Message-ID: <200710290930.19449.toralf.foerster@gmx.de>
References: <200710211316.14955.toralf.foerster@gmx.de> <20071029000243.9101d363.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1556381.PV3mO3gBx5";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757404AbXJ2Iah@vger.kernel.org>
In-Reply-To: <20071029000243.9101d363.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

--nextPart1556381.PV3mO3gBx5
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Montag, 29. Oktober 2007 schrieb Andrew Morton:
> On Sun, 21 Oct 2007 13:16:14 +0200 Toralf F=F6rster <toralf.foerster@gmx.=
de> wrote:
>=20
> > I use the following one liner for regression tests of the cpufreq gover=
nor and
> > friends:
> >=20
> > tfoerste@n22 ~ $ time factor 819734028463158891
> >=20
> > which usually needs 5.5 secs to complete at 1.7 GHz of my pentium M pro=
cessor.
> >=20
> > With the  current git sources (commit cfa76f0 at Sat Oct 20 20:19:15 20=
07 -0700)
> > instead this command needs 3 times longer if I run the "distributed.net=
 client"
> > as a background process with nice level 19 b/c the cpu frequency still =
stays
> > at 600 MHz.
> > After stopping dnetc the cpu frequency governor ondemand works as expec=
ted again.
> >=20
> > Tested at my ThinkPad T41 with stable Gentoo:
> >=20
> > tfoerste@n22 ~ $ grep -e ^CONFIG_ACPI -e ^CONFIG_CPU_FREQ_GOV_ ~/devel/=
linux-2.6/.config
> > CONFIG_ACPI=3Dy
> > CONFIG_ACPI_SLEEP=3Dy
> > CONFIG_ACPI_PROCFS=3Dy
> > CONFIG_ACPI_PROC_EVENT=3Dy
> > CONFIG_ACPI_AC=3Dm
> > CONFIG_ACPI_BATTERY=3Dm
> > CONFIG_ACPI_BUTTON=3Dm
> > CONFIG_ACPI_VIDEO=3Dm
> > CONFIG_ACPI_FAN=3Dm
> > CONFIG_ACPI_PROCESSOR=3Dm
> > CONFIG_ACPI_THERMAL=3Dm
> > CONFIG_ACPI_BLACKLIST_YEAR=3D0
> > CONFIG_ACPI_EC=3Dy
> > CONFIG_ACPI_POWER=3Dy
> > CONFIG_ACPI_SYSTEM=3Dy
> > CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> > CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
> > CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> >=20
>=20
> And 2.6.23 was OK?
>=20
> Is this problem still present in Linus's current tree?
>=20
> Thanks.
>=20
Hello,
with -rc1 the problem went away :-)

=2D-=20
MfG/Sincerely

Toralf F=F6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3

--nextPart1556381.PV3mO3gBx5
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBHJZobhyrlCH22naMRArIeAKC9qg+zT1LdfXIlepELPzGJlJyYTgCeLHAO
4Ake8WKp4nl1lo8pE82JBno=
=6oOK
-----END PGP SIGNATURE-----

--nextPart1556381.PV3mO3gBx5--
