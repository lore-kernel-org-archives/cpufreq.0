From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Thu, 05 Aug 2004 17:26:05 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091741165.10552.38.camel@pc>
References: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc>
	<20040805195248.GA32045@redhat.com> <1091736171.10552.26.camel@pc>
	<20040805200857.GA28775@redhat.com> <1091737170.10552.32.camel@pc>
	<20040805202941.GB28775@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1097395324=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040805202941.GB28775@redhat.com>
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
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk


--===============1097395324==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Oq+0pSlrzvnAGY3MJWqh"


--=-Oq+0pSlrzvnAGY3MJWqh
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-08-05 at 21:29 +0100, Dave Jones wrote:
> Can you edit pentium4_get_frequency() in arch/i386/kernel/cpu/cpufreq/spe=
edstep-lib.c
> so that before the switch (fsb_code) {   add a
> 		printk ("FSB code =3D %d\n", fsb_code);
>=20
> Hopefully, Intel are predictable and this is going to be '4'.

You are not going to believe this.  It's 0:

...
TC classifier action (bugs to netdev@oss.sgi.com cc hadi@cyberus.ca)
vesafb: probe of vesafb0 failed with error -6
Simple Boot Flag at 0x79 set to 0x1
FSB code =3D 0
FSB code =3D 0
FSB code =3D 0
FSB code =3D 0
apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
apm: overridden by ACPI.
...

I put a bunch more debug in there too:

FSB code =3D 0, msr_lo =3D 372247062
fsb =3D 100000
mult =3D 372247062
pentium4_get_frequency() returns =3D 2200000

b.


--=-Oq+0pSlrzvnAGY3MJWqh
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBEqXtl3EQlGLyuXARAm/GAKCVmCkJy8+l8ZCDZ4XWmo00rnodwQCg8eUn
dGMbMj4N/37vbZtbtUgZ8JE=
=pioN
-----END PGP SIGNATURE-----

--=-Oq+0pSlrzvnAGY3MJWqh--



--===============1097395324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1097395324==--


