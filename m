From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: acpi module always loaded
Date: Sun, 25 Apr 2004 15:09:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040425130909.GA8513@dominikbrodowski.de>
References: <40898206.6080009@renninger.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1071335412=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <40898206.6080009@renninger.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Thomas Renninger <mail@renninger.de>
Cc: cpufreq@www.linux.org.uk


--===============1071335412==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2004 at 10:52:22PM +0200, Thomas Renninger wrote:
> Hi,
>=20
> why is the acpi module always successfully loaded even the system does=20
> not support P-states at all?
> Wouldn't it make sense to exit with ENODEV?

2.6.6-rc2 should do it already.

	Dominik

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAi7h1Z8MDCHJbN8YRAoDgAJ4mNpVsuq8RHZA0gjmNzyyNHDkdugCgh+Eb
P4IWrvrHCEgdsXVLsJb1Kbc=
=m2Yf
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--


--===============1071335412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1071335412==--

