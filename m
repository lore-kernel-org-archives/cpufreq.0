From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 10:11:28 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040114091128.GA11159@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C080EF39F@txexmtae.amd.com>
	<20040114034237.GT14674@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============74623004435525964=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040114034237.GT14674@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Dave Jones <davej@redhat.com>, paul.devriendt@amd.com, pavel@ucw.cz, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org, mark.langsdorf@amd.com


--===============74623004435525964==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2004 at 03:42:37AM +0000, Dave Jones wrote:
> On Tue, Jan 13, 2004 at 09:39:53PM -0600, paul.devriendt@amd.com wrote:
>  > >> Dave had a good idea of a minimal ACPI parser for trying to retriev=
e the
>  > >> table of p-states from an ACPI BIOS without needing the full AML in=
terpreter.
>  > >> I will see if I can get that to work in powernow-k8-acpi=20
>  > > =20
>  > > If done properly, that parsing code could be shared by the K7=20
>  > > driver too.
>  >=20
>  > Agreed. Function in a header file? Don't want the drivers attempting to
>  > call each other at runtime.
>=20
> Works for me, or shove it out into its own .c file, and have both drivers=
 link against it.

Guys, do you remember my acpi-perflib?[1] Currently, I'm rewriting it so th=
at
it isn't so invasive and can be merged more easily during 2.x.[2] It's exac=
tly
what you want as base for powernow-k7-acpi and powernow-k8-acpi driver.

However, as it relies on CONFIG_ACPI, an acpi-perflib-no-acpi module which
exports the same functions, but includes a minimal parser could be added.
But let's do the easy part (CONFIG_ACPI) first.

[1] http://marc.theaimsgroup.com/?l=3Dacpi4linux&m=3D106547064228222&w=3D2
[patches are taken down from the website, though...]

[2] http://marc.theaimsgroup.com/?l=3Dacpi4linux&m=3D107398568612489&w=3D2 =
is a
first step, another one will be sent out later today.

	Dominik

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFABQfAZ8MDCHJbN8YRAgjBAJ0RVZwuo+hjsICIAIhxSYigpiLjbgCfcypp
LmgK8LUme7UY88V/3e8D+yU=
=d9Tz
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--


--===============74623004435525964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============74623004435525964==--

