From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [BUG] wrong report of frequency in cpuinfo.
Date: Mon, 9 Feb 2004 16:15:48 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209151548.GA8306@dominikbrodowski.de>
References: <20040209150047.GZ13262@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1847024826148882=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040209150047.GZ13262@poupinou.org>
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
Cc: cpufreq@www.linux.org.uk


--===============1847024826148882==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I cannot reproduce this with any of the speedstep-smi, acpi, p4-clockmod and
speedstep-centrino drivers... so I tend to suspect powernow-k7?

	Dominik

On Mon, Feb 09, 2004 at 04:00:47PM +0100, Bruno Ducrot wrote:
> With latest 2.6 bk I got that:
>=20
> ducrot@poupon:~> cat /proc/cpuinfo=20
> cpu MHz         : 0.000

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAJ6QjZ8MDCHJbN8YRAsuiAJoCb8UW3cunMCt1vzUOMQ1JLYLL9QCgps15
QphIbGHe3YJBaHqV6OcEKXc=
=ZzbI
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--


--===============1847024826148882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1847024826148882==--

