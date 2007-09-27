From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: Intel Core2Quad Q6600 2,4 GHz Socket775 FSB1066
Date: Thu, 27 Sep 2007 17:18:54 -0400
Message-ID: <46FC1E3E.6070200@redhat.com>
References: <200709272259.18445.ederstefan@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1835015109=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200709272259.18445.ederstefan@gmx.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Stefan Eder <ederstefan@gmx.de>
Cc: cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============1835015109==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigC787DDD151A69BD6E89F5D4E"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC787DDD151A69BD6E89F5D4E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Stefan Eder wrote:
> Hallo everyone,
> ist there a chance for powersaving with the following CPU?

Yes.

> And if so, what are=20
> the related modules to load?

acpi-cpufreq for freq scaling support, cpufreq-ondemand for your
governor (may be built-in though)

--=20
Jarod Wilson
jwilson@redhat.com



--------------enigC787DDD151A69BD6E89F5D4E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFG/B5CtO+bni+75QMRAjhOAJ9RHOxMKUzoIczjBCRFpR9hGw2nxQCfdtFF
0kAV+k/37V9PJ59fd1bMWKo=
=6vpK
-----END PGP SIGNATURE-----

--------------enigC787DDD151A69BD6E89F5D4E--


--===============1835015109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1835015109==--

