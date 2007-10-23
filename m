From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: Enabling CPU freq in a new CPU
Date: Tue, 23 Oct 2007 08:44:07 -0400
Message-ID: <471DEC97.4070705@redhat.com>
References: <9981749032FE174C9F521A11BDEEBDFC4C4774@jpsmsx411.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0513689271=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <9981749032FE174C9F521A11BDEEBDFC4C4774@jpsmsx411.gar.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: "Kwon, Owen" <owen.kwon@intel.com>
Cc: cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============0513689271==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigBEB5CE4276C516CDD2E8E06F"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigBEB5CE4276C516CDD2E8E06F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Kwon, Owen wrote:
> I am testing speedstep function with newer Intel CPU. Kernel option is
> enabled at compile time, but while booting, CPUID check seemed to fail.=

> The message is
>=20
> "p4-clockmod : Unknown p4-clockmod-capable CPU ~~~"
>=20
>=20
> Do I need to implement additional code to test this function? Or is it
> safe to bypass the CPUID check part?
>=20
>=20
> I don't know this is required, but Kernel version is 2.6.22.

p4-clockmod is for much older p4 processors, and even then, often isn't
recommended for use. What you want for any reasonably new intel
processor is acpi-cpufreq, not p4-clockmod.

--=20
Jarod Wilson
jwilson@redhat.com



--------------enigBEB5CE4276C516CDD2E8E06F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHHeyctO+bni+75QMRAsnpAJ41G2VmBP8aYhCczx7PJ4YiDOQLUgCgxZ6W
i73LDVlEOFMdwHkzKCuA3tM=
=Psr+
-----END PGP SIGNATURE-----

--------------enigBEB5CE4276C516CDD2E8E06F--


--===============0513689271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0513689271==--

