From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [BUG] 2.6.0: ARM won't build without
	CONFIG_CPU_FREQ_GOV_USERSPACE=y
Date: Sun, 28 Dec 2003 22:51:15 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031228215115.GB3962@dominikbrodowski.de>
References: <E1AZojC-00049i-00@mrelay00.kundenservices.net>
	<20031226102517.B8980@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9818874013185952=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20031226102517.B8980@flint.arm.linux.org.uk>
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


--===============9818874013185952==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2003 at 10:25:17AM +0000, Russell King wrote:
> On Fri, Dec 26, 2003 at 10:57:54AM +0100, linux@brodo.de wrote:
> > IMO this should cause the default governor to be forced to "userspace",
> > and the deprecated 2.4. API [including cpufreq_get()] to be activated as
> > well.
>=20
> Well, we can't deprecate "cpufreq_get()" because it is one of the
> fundamental reasons for the CPUFREQ infrastructure was created.  It
> should be moved out of this file to somewhere it can live permanently
> rather in a file marked as "deprecated".

Agreed, as long as we can decide what to return on Transmeta CPUs which are
set to a frequency _range_.

	Dominik

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQE/71BTZ8MDCHJbN8YRAiuDAJ9T3bQNXEQ9RRVJ1fOCGW+BMFvzWgCeNdEK
o33b7MiJU26LsIXvEWorEUY=
=uydz
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--


--===============9818874013185952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============9818874013185952==--

