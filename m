From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH 2.6] powernow-k7 acpi support.
Date: Mon, 9 Feb 2004 19:05:53 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209180553.GA30914@dominikbrodowski.de>
References: <20040209132659.GY13262@poupinou.org>
	<20040209150519.GA6531@dominikbrodowski.de>
	<20040209175000.GE13262@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============54593163437071723=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040209175000.GE13262@poupinou.org>
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
Cc: davej@redhat.com, cpufreq@www.linux.org.uk


--===============54593163437071723==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 09, 2004 at 06:50:00PM +0100, Bruno Ducrot wrote:
>=20
> How about that one?

Looks much better, IMO.

>  By now, I'm a little puzzled with the fsb stuff,
> though.  A first idea may be to look into what say ACPI about the
> frequency, and deduce the fsb from, but I don't like it.

So you wouldn't like

	fsb =3D (acpi_processor_perf->states[i].core_frequency * 10) / fid_codes[f=
id]

? Why?

	Dominik

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAJ8wBZ8MDCHJbN8YRAg6oAJ0cZnUGWg1ovaFMmaQhZPOJAKHBKQCgjP4R
3+prJytRj55/dSwcGjn1yAA=
=D4TV
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--


--===============54593163437071723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============54593163437071723==--

