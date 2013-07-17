From: Mark Brown <broonie@kernel.org>
Subject: Re: Arndale power management
Date: Wed, 17 Jul 2013 12:33:52 +0100
Message-ID: <20130717113352.GQ22506@sirena.org.uk>
References: <611CFE9D6FBBDC4B97935A5287A11345014441@XSERVER21B.campus.tue.nl>
 <CAKohpok=WAJs9FBQxEuo=nh4=b184hHyzpLAwEjVYMUZVnB+2g@mail.gmail.com>
 <20130716092345.28c8d655@amdc308.digital.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+9uAEI//NVSmpZEF"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130716092345.28c8d655@amdc308.digital.local>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: "Comaschi, F." <fcomaschi@tue.nl>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Chander Kashyap <chander.kashyap@linaro.org>, Linux PM List <linux-pm@lists.linux-foundation.org>


--+9uAEI//NVSmpZEF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2013 at 09:23:45AM +0200, Lukasz Majewski wrote:

> > > Maybe it is
> > > possible to communicate with the on-board PMIC?=20

> You can look into the PMIC spec if some detailed informations are
> exposed. Moreover each battery shall be described by a model, which
> PMIC uses e.g. for accurate charging.

> PMICs at Exynos4 are communicating via I2C and provide information
> about battery state of charge (SoC). You can monitor this value over
> time and on this basis get (very coarse) estimation of power
> consumption. =20

There are enormous difficulties in getting useful information from
batteries and chargers - due to things like the battery chemistry
changing over time and thermal dependencies what you get back is so
coarse grained it's of very little use for power metering.  There's also
the fact that on the Arndale the charger isn't wired up accessibly.

Power monitoring is generally done with test equipment rather than on
board features - Versatile Express is very unusual here.  The usual
strategy at system level is to put an ammeter or power meter in line
with the main power supply; otherwise you need the board to have test
access to allow you to hook into individual supplies (typically done
with jumpers in line with the supplies).

> I can only give you a hint there (since I didn't worked with Arndale ...
> yet) - measure current and voltage provided for SoC core Vdd plane.

I've not checked the schematics but there's nothing visible on the board
that I'd associate with current monitoring except the wall supply.

--+9uAEI//NVSmpZEF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5oEdAAoJELSic+t+oim9quMP/ApuAllYjkYABVamSltyGThr
HX2McmdGwqi48nJNjFH3H+v048j9l7aJclQhNemWCSFVleMG4C6VPEdW7/NXBNqW
D2ZNnx5rMyRuyQ+d3eyHj1nAc5USWRu6p1NVhEMQuqKQ7yADeuKXnYxgNML2OpEA
COrz8gpkcNUrrzdy/hhXpY+L+Mg0Quqngb51f6djmfyhPOQ63dSqsSqREGAWg8Cd
zCqWwTDU1JkzAAVuaZUkOrHFh5fsQH6Y2n2YTkX6GVsrfj+2U1Ec830kYzQUJ5ua
3xDvtcYhvIUfRYuf8+jShB96exU6ABC2xdgwGKv+aSsFIQQydqwzMa8JGNt9Tw39
BMlq67DdoIMK1RsWUKifCB8OQ+WsTRhiOf+ARP+0x1rfqOj9IiVYRBp5RL6Cn+Jl
L+2o2Z3Py+PGexSjtJB+Y3xfYLYlMpg3TJ81ymEeQFyVLfkHo1qUWZ8xJUAA1NV1
kGY3ddwy2DzFFJvUlN/w/yhHLEDICmfJqFdR6rjHCKBIHch9txVIZWeR/92qE18K
n1Oi1Bp8rbHUUTWJSzb6PO6xrJDyWx/XsTAnM0xw1l+p10AXc8b/tjAgdH3IcEOL
JO1DJq8RVfijNMdzbu15jgqpJ9ujmQy3FHMnzbfiQ2Ib+0IlOShUKpQLWNfcft6D
9BBvY6M/3+EJOLCQsJuc
=Jgmp
-----END PGP SIGNATURE-----

--+9uAEI//NVSmpZEF--
