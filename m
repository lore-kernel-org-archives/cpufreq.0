From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] fix cpufreq_update_policy
Date: Wed, 28 Jan 2004 23:16:36 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040128221636.GA5390@dominikbrodowski.de>
References: <20040128215249.GA4727@dominikbrodowski.de>
	<200401281712.30477.dtor_core@ameritech.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============52180072671430011=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200401281712.30477.dtor_core@ameritech.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dmitry Torokhov <dtor_core@ameritech.net>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk


--===============52180072671430011==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2004 at 05:12:30PM -0500, Dmitry Torokhov wrote:
> Why not change it to:
>=20
> 	policy =3D *data;
>=20
> ?

Because I doubt this works for whole structs. Or am I totally wrong (again)?

	Dominik

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAGDTEZ8MDCHJbN8YRAvW8AJ0RvE+Vs0qKy70Ak2QBT68iFhauJgCgjip3
qyjH3u0lVF1+DN3MXkAfaA8=
=w2dd
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--


--===============52180072671430011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============52180072671430011==--

