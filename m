From: matthias brill <matthias.brill@akamail.com>
Subject: Re: banias with different (unusual?) model_name
Date: Sat, 21 Aug 2004 13:53:16 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040821115316.GA2582@akamail.com>
References: <20040820093344.GA2923@akamail.com>
	<1093008335.30968.32.camel@localhost.localdomain>
Reply-To: matthias.brill@akamail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1542165239=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1093008335.30968.32.camel@localhost.localdomain>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, Jeremy Fitzhardinge <jeremy@goop.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, cpufreq list <cpufreq@www.linux.org.uk>


--===============1542165239==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi alan, jeremy

On Fri, Aug 20, 2004 at 02:25:36PM +0100, Alan Cox wrote:
> > i've found a pentium-m banias which reports "Mobile Genuine Intel(R)
> > processor       1400MHz" in /proc/cpuinfo.  this (strange?) signature
> > prevents speedstep-centrino.c from working properly.
>=20
> Signatures appear to be BIOS set so that would make sense.

that fact wasn't obvious to me -- i've updated the BIOS and the strange
banias signature is now gone.  it reports the expected "Intel(R)
Pentium(R) M processor 1400MHz" string now.

in excess the "ACPI-behaviour" changes from "totally broken" to "not
working" which is kind of a progress... 8-}


On Fri, Aug 20, 2004 at 07:19:31PM -0700, Jeremy Fitzhardinge wrote:
> Yeah, there seem to be a few of these around.  I'm just not certain that
> they're identical to "normal" Banias as far as operating points go.

it seems that the reported value depends on the mental health of the
BIOS-programmer at hand, therefore the suplied string might not be
trustworthy.

if i understand correctly, the type of the cpu can be determined by
looking at the family, model and stepping -- assuming that these values
are reported directly  by the CPUID (0FA2) instruction.=20

the BIOS supplied model_name string in speedstep-centrino.c is parsed to
get the clock cycle time of the cpu.  is this actually supposed to be
the "right" way (or worse: the only way) to get this information?


thias

--=20
Matthias Brill <matthias.brill@akamail.com>

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBJzes15PQg+xdZ4cRAjSeAJ9VmtjiMrdtbNl/3kWXDfWuakjM0QCg32V4
3YG4FoaJu2AQ715gSyNxZ4A=
=7430
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--


--===============1542165239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1542165239==--

