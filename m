From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] powernow-k7: example use for powernow_acpi_init()
Date: Mon, 22 Mar 2004 19:25:17 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040322182517.GB7600@dominikbrodowski.de>
References: <20040322092543.GN28592@poupinou.org>
	<20040322093851.GO28592@poupinou.org>
	<20040322095135.GD29733@redhat.com>
	<20040322123614.GP28592@poupinou.org>
	<20040322142740.GG29733@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0458488233=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040322142740.GG29733@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk


--===============0458488233==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2004 at 02:27:40PM +0000, Dave Jones wrote:
> On Mon, Mar 22, 2004 at 01:36:14PM +0100, Bruno Ducrot wrote:
>=20
>  > Indeed.  And making ACPI perflib in case of known broken BIOS via
>  > DMI may be good (the ASUS should work with that patch, if I read
>  > correctly the DSDT).  There may be though one little annoying thing for
>  > the ASUS bug: FSB will be reported at 100MHz whereas it is at
>  > 133MHz, but it's only cosmetic, I hope.
>=20
> Hmm, won't that skew the calculated frequencies somewhat ?
>=20
>  > The real trouble is that I don't know how to retrieve FSB on a
>  > athlon/duron: MSR_IA32_EBL_CR_POWERON do not give it :(
>=20
> *nod*. I even looked through the powernow docs hoping that the fsb
> would be stored in one of those registers, but no.
>=20
> One thing that I did just find though that is interesting.
> In the powernow documents, they describe the current/maximum/startup FID
> and say "multiply by 100 to determine the frequency" which is very odd
> if there really are 133 bus parts out there.
>=20
> It does state in another part of the document that the FSB is either 100
> or 133 MHz, but in bold.. "For mobile applications the FSB is 100 MHz"
>=20
> Very odd.

At least it's not as broken as the ACPI spec: it's impossible to determine
anything with regard to current frequency settings...

	Dominik
--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAXy+NZ8MDCHJbN8YRArtVAJ9AR9hNEk8nyLz2oeQ/XwKrbmTO/ACeMDgQ
7qAQSwEt5uBqTq42hUvpgdU=
=dmBg
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--


--===============0458488233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0458488233==--

