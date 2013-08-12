From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] cpufreq: cpufreq-cpu0: Use devm_regulator_get_optional()
Date: Mon, 12 Aug 2013 11:01:52 +0100
Message-ID: <20130812100152.GK6427@sirena.org.uk>
References: <1376071683-19013-1-git-send-email-broonie@kernel.org>
 <CAKohpomtoEFD0V-GHUxC+LrbVicpjF2Sep-97ED=gXiiHWMoXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OEp3pE+VUYV0MT2S"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpomtoEFD0V-GHUxC+LrbVicpjF2Sep-97ED=gXiiHWMoXQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Shawn Guo <shawn.guo@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linaro-kernel@lists.linaro.org


--OEp3pE+VUYV0MT2S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 12, 2013 at 10:52:00AM +0530, Viresh Kumar wrote:

> Over that it would have been useful if we could have this patch as part
> of the series you posted for defining devm_regulator_get_optional(),
> and so we could have seen what's that patch is doing..

It's in -next.  There's rather a lot of regulator users in the kernel.

--OEp3pE+VUYV0MT2S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCLKNAAoJELSic+t+oim9uLgP/2Yw/PbN/YVHMXuJ4OugPuBi
h0rz/1vRPqUrfjsHx53dTlb05zSoTLoEg5fMo+ALY/fMTxji3n7hnOjlEIMYp9aE
jlSEEBiIlgkHDxeCuQMxrEHN99bsAlBddtX+HoM12Vy79oALz2PLS1Ay/7Y3XUUL
VeAmOlYi4IyyNUO7ekWtCs8MzkZKpEIBvQuillhrXZpuHoRIzlkZbR6fSplFg1eo
tWtIOBIDcbp6JxRpmpCOlpDDV3mjcfOjarVFdTBOdrEspyj64ZDY4oehTz9MyaCQ
vLN78i/7r0w4fODXGMecZn1WikOf1bYktnnX7UkPJr6bqGr8dFqpRGAPXXMqdtAy
Op3ZHlXgiiNzp2TP2+zWbDDOhxfaSJHpz8PjjOgJZ6JUShdxpy4MDycrDyPkW4K7
w+LQz77pEITcnEBPgKmTMBgh7zbuoqkGWSfEGU57byHcqzZrxlYQs3n5RLVjmvJv
3s0SB5TE80A7do9EnNOenJr6JVLbU8iQC+moikFamFTyJ6cZhgrcgZP1vFr00DVa
PJeYfCy8X7wlgPIG1FfjMWu9SVW/Ws17sMNyAMNuTzOny726wKph8zMBpWR0NVih
pqYQDBHuDCHKwScPD37mfCWqoiTlbFtrHfWIFU66tuRP9BY3UpnIYlSQbAc7OYx0
PYw75Xi4+xQ8iYyzVcuv
=0Bbr
-----END PGP SIGNATURE-----

--OEp3pE+VUYV0MT2S--
