From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Sat, 07 Aug 2004 15:03:42 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091905423.29221.1.camel@pc>
References: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc>
	<20040805195248.GA32045@redhat.com> <1091736171.10552.26.camel@pc>
	<20040805200857.GA28775@redhat.com> <1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
	<20040807132449.GA9569@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1717027684=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040807132449.GA9569@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk


--===============1717027684==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-jUFAADtq2FY/49qcwFZL"


--=-jUFAADtq2FY/49qcwFZL
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-08-07 at 15:24 +0200, Dominik Brodowski wrote:
>=20
> Might it be that interrupts are still disabled during the RESUME
> notification, and=20
>=20
> #define write_sequnlock_irq(lock)                                       \
>         do { write_sequnlock(lock); local_irq_enable(); } while(0)
>=20
> tries to enable them?

But that sounds like such a fundamental issue that surely I would not be
the first person to find it, especially considering how long even I was
seeing it before I found the time to work it up into a bug report.

Am I wrong?

b.


--=-jUFAADtq2FY/49qcwFZL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBFSeNl3EQlGLyuXARAvbOAJwMXh2KZPGeyGZlEwkncbhCSIarjQCgwRq3
XMtU5h0FSfxSMCu543xhO/0=
=hkDS
-----END PGP SIGNATURE-----

--=-jUFAADtq2FY/49qcwFZL--



--===============1717027684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1717027684==--


