From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: two test/debug/dump cpufreq modules
Date: Tue, 6 Apr 2004 23:34:36 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406213436.GA11147@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1350706563=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--===============1350706563==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've just uploaded cleaned-up versions of two test modules for cpufreq which
might be of interest for at least some of you. They're under the GPL, of
course, as the MODULE_LICENSE states...

cpufreq-acpi_pdump

Dump the ACPI P-States to be found in the _PSS section of the ACPI table, as
well as the contents of the _PCT registers. _PDC capability bits can be
passed as module parameter "pdc="

location: http://www.brodo.de/patches/2004-04-06/cpufreq-acpi_pdump.c


cpufreq-tsc_test

Verify that the TSC-based timing code continues to function as expected
after cpufreq transitions by dumping the difference between TSC reads and
PMTMR reads [ACPI Powermanagement-Aware Timer]. Needs ACPI to work properly.

location: http://www.brodo.de/patches/2004-04-06/cpufreq-tsc_test.c


	Dominik

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcyJsZ8MDCHJbN8YRAuNGAKCm4pVum6ZVLkfzIvny4lnrK9R3qgCfVX64
7gw0NY1ouhHGNUzIUUYwYi4=
=uSLA
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--


--===============1350706563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1350706563==--

