From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Dealing with faulty BIOS table
Date: Mon, 19 Jan 2004 10:35:20 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040119093520.GC11081@dominikbrodowski.de>
References: <1074482108.7978.232.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============038534731873556494=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <1074482108.7978.232.camel@localhost.localdomain>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Drew Varner <drew.varner@redops.org>
Cc: cpufreq@www.linux.org.uk


--===============038534731873556494==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Content-Disposition: inline


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> Is there a blueprint for how to deal with broken PST tables given their
> prevalence? I know that the ideal solution is for vendors to ship
> machines with the correct data in the BIOS.

There's some discussion of the next-to-ideal solution to use the information
in the ACPI tables instead of the PST tables when these are broken. Window$
uses the info in the ACPI tables, so we should be able to solve many issues
this way.

	Dominik

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAC6TYZ8MDCHJbN8YRAugJAJ9HjUnG4Hb20bVbWWy2nzII+38nCACgl1dN
puoccXXE2WK63axiRodhuZ0=
=QUGj
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--


--===============038534731873556494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============038534731873556494==--

