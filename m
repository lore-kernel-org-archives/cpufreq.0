From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Centrino question
Date: Sat, 8 May 2004 19:54:41 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040508175441.GA7624@dominikbrodowski.de>
References: <20040508133527.69aae7b8.neurowork@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0130401452=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040508133527.69aae7b8.neurowork@free.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Cyril Wattebled <neurowork@free.fr>
Cc: cpufreq@www.linux.org.uk


--===============0130401452==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 08, 2004 at 01:35:27PM +0000, Cyril Wattebled wrote:
> Hi there,
>=20
> I'm wondering if all Pentium M processor support C1 C2 and C3 ?
> Because I have a Sony Vaio Z1 with a Pentium M 1.7ghz and it only support=
s C1
> and C2. I have a friend who has a Toshiba Tecra with a Pentium M 1.4ghz a=
nd it
> supports C3.
> So that's it, if any of you have time to answer =3D]

AFAIK, all Pentium M _processors_ do support C1, C2, C3 and C4; it may be a
chipset or platform-specific problem so that C3 is disabled. FYI, the
ipw2100 driver sometimes fails if the CPU is in C3; maybe a related/similar
problem has caused some vendor to disable C3. Also, C4 (and possibly C3 in
your case) can also be specified in a 2.0 extension to the ACPI tables which
is not yet used by the acpi processor driver (drivers/acpi/processor.c) --
but there is a patch on bugzilla.kernel.org to fix that already.

Please direct future mails about Cx states to the acpi development list, as
it has nothing to do with CPU frequency scaling.

	Dominik

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAnR7hZ8MDCHJbN8YRAgSGAKCNeOIS1+ZGhZxwXvNo0U7QmetR7QCdGfDC
mkUZLjktLNGovfc1l3S8cl8=
=wiXb
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--


--===============0130401452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0130401452==--

