From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: My latest powernow-k8.c
Date: Sat, 20 Mar 2004 09:28:44 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040320082844.GB8408@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1163C59A@txexmtae.amd.com>
	<20040319112429.GB5726@elf.ucw.cz>
	<20040319124122.GG28592@poupinou.org>
	<20040319133517.GA28122@dominikbrodowski.de>
	<20040319135605.GD248@elf.ucw.cz>
	<20040319143306.GA7246@dominikbrodowski.de>
	<20040319155220.GI28592@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0350759839=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040319155220.GI28592@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Cpufreq mailing list <cpufreq@www.linux.org.uk>, Pavel Machek <pavel@ucw.cz>


--===============0350759839==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2004 at 04:52:20PM +0100, Bruno Ducrot wrote:
> On Fri, Mar 19, 2004 at 03:33:06PM +0100, Dominik Brodowski wrote:
> >=20
> > 1.8 GHz * 0.88 =3D 1584000 kHz -- min and max are set to this value at =
first.
> > As there is no state the CPU can be set to in between min and max, the =
max
> > value is increased to the next higher state [see
> > cpufreq_frequency_table_verify()] So there's nothing strange here, IMHO.
>=20
> Agreed, but I expected that the % will change in fact.

1800000 kHz * 0.88 =3D 1584000 kHz
1600000 kHz / 1800000 kHz =3D 0.8888888... which is truncated to 0.88

	Dominik

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAXAC8Z8MDCHJbN8YRAvQFAJ42lt02ItZru+kflCXbMMrsNGHAWwCgiSEO
yzpF62NR+3XgpNHv+2ry1e8=
=fFkx
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--


--===============0350759839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0350759839==--

