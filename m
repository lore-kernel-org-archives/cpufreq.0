From: Petr =?utf-8?Q?=C5=A0abata?= <contyk@redhat.com>
Subject: Re: Fehler bei cpufreq-info
Date: Wed, 3 Apr 2013 09:53:04 +0200
Message-ID: <20130403075303.GA24986@rincewind.usersys.redhat.com>
References: <51558EDC.2040503@gmx.de>
 <3485704.XfQbseOPt4@skinner.arch.suse.de>
 <515B4DB3.9040507@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <515B4DB3.9040507@gmx.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Rainer Maier <RaMaier@gmx.de>
Cc: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2013 at 11:29:23PM +0200, Rainer Maier wrote:
> Hi Thomas,
> thanks for your info.
> I removed cpufrequtils, but when I tried to install cpupower by aptitude =
it didn't know the package.
> I searched for it, but couldn't find one.
> Would you perhaps know which packet to install ?
>=20
> Thanks
> Rainer

The cpupower utilities are part of the kernel tree now and
included in the kernel-tools package on Fedora.  I suppose it
will be something similar in your distribution.

Petr

>=20
> Am 02.04.2013 10:42, schrieb Thomas Renninger:
> >Hi,
> >
> >On Friday, March 29, 2013 01:53:48 PM Rainer Maier wrote:
> >>cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
> >cpufrequtils is outdated.
> >Please use cpupower which is the successor.
> >
> >>Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
> >>analysiere CPU 0:
> >>    Treiber: p4-clockmod
> >P4-clockmod is evil and does not save much/any power.
> >If you have trouble with it (lagging applications/performance), best
> >blacklist p4-clockmod driver.
> >
> >        Thomas
> >
>=20
> --=20
> Rainer Maier
> Fabriciusstr. 46
> 65933 Frankfurt
> T: +49 69 3904 7935
> M: +49 176 3472 4262
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iF4EAREIAAYFAlFb398ACgkQT+hZYwG3Kb4gNAD/U8FBVE1xR8LDNAcCYGmGNyPc
OgeQskJe1mnshS3jo3sA/RcJVTSBueWKOwkH6Iexe92wrXfYUZEfR4Co5EiGfTtJ
=rqS9
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
