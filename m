From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Mobile Intel Celeron 2.0 GHz with ICH4 bridge
Date: Tue, 24 Feb 2004 09:22:22 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040224082222.GA8123@dominikbrodowski.de>
References: <20040223213619.GA4634@rap.rap.dk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============56251472389651536=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040223213619.GA4634@rap.rap.dk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Keld =?iso-8859-1?Q?J=F8rn?= Simonsen <keld@dkuug.dk>
Cc: cpufreq@www.linux.org.uk


--===============56251472389651536==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2004 at 10:36:19PM +0100, Keld J=F8rn Simonsen wrote:
> Hi
>=20
> I have an Acer Travelmate 233 and I am trying to save some battery
> power. Is that possible with cpufreq?=20
>=20
> The CPU is a Mobile Intel Celeron 2.0 GHz and the southbridge is an
> Intel 82801DB 845G/GL Chipset ISA Bridge (ICH4)
>=20
> I run Mandrake 10.0 RC1 with kernel 2.6.2 and cpufreq 1.0.1,
> unfortunately I get the following message:
> cpufreq: Intel(R) SpeedStep(TM) for this chipset not (yet) available.
> Is this because I am running an outdated version of cpufreq,
> or just because the CPU is not recognized properly?

The problem is that you have a Mobile Celeron which does not support
SpeedStep. All you could get from cpufreq is Clock Throttling,
(p4-clockmod), but this won't save you much in terms of battery power.

> Are there other ways to save power with this machine, on the CPU?
ACPI processor support with working C1 and C2 idle states [check
/proc/acpi/processor/*/power ]

	Dominik

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAOwm+Z8MDCHJbN8YRAtPwAJ9Qrssc4SVWJigo625eijR2htKFNQCeJMhv
h82pn+oWbgFrf7c0PKRnuFs=
=l56m
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--


--===============56251472389651536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============56251472389651536==--

