From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 10:25:01 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040114092501.GA11381@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C080EF39F@txexmtae.amd.com>
	<20040114034237.GT14674@redhat.com>
	<20040114090138.GB260@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============88833636235763414=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040114090138.GB260@elf.ucw.cz>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Pavel Machek <pavel@ucw.cz>
Cc: Dave Jones <davej@redhat.com>, paul.devriendt@amd.com, mark.langsdorf@amd.com, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org


--===============88833636235763414==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2004 at 10:01:39AM +0100, Pavel Machek wrote:
> Hi!
>=20
> >  > >> Dave had a good idea of a minimal ACPI parser for trying to retri=
eve the
> >  > >> table of p-states from an ACPI BIOS without needing the full AML =
interpreter.
> >  > >> I will see if I can get that to work in powernow-k8-acpi=20
> >  > > =20
> >  > > If done properly, that parsing code could be shared by the K7=20
> >  > > driver too.
> >  >=20
> >  > Agreed. Function in a header file? Don't want the drivers attempting=
 to
> >  > call each other at runtime.
> >=20
> > Works for me, or shove it out into its own .c file, and have both drive=
rs link against it.
>=20
> Would acpi parsing be usefull for non-amd systems, too?

The acpi "performance library", whether it uses the CONFIG_ACPI parser or
some small independent parser, is (at least) also useful for

- ACPI 2.0 P-States using I/O-port access [current
  arch/i386/kernel/cpu/cpufreq/acpi.c driver -- it can be cleaned up by
  that. In fact, I'm currently working on it.]

- speedstep-centrino driver [can use ACPI info instead of built-in tables]
  [sample patch based on earlier acpi-perflib patch is in the cpufreq and
   acpi-devel archives]

	Dominik

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFABQrtZ8MDCHJbN8YRAjbnAJ0a+nBryCp+Kxopt++/el0K/IebvACggM4m
8xtkleb3YO6sF54QKzXUeGQ=
=oWEi
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--


--===============88833636235763414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============88833636235763414==--

