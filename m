From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Fri, 06 Aug 2004 17:18:29 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091827110.10552.168.camel@pc>
References: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc>
	<20040805195248.GA32045@redhat.com> <1091736171.10552.26.camel@pc>
	<20040805200857.GA28775@redhat.com> <1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
	<20040806211347.GB30427@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0380583307=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040806211347.GB30427@redhat.com>
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
Cc: cpufreq@www.linux.org.uk


--===============0380583307==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-IGcjQrmcXEAICG/HI3xm"


--=-IGcjQrmcXEAICG/HI3xm
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-08-06 at 22:13 +0100, Dave Jones wrote:
> Why on _earth_ would that divide by zero ?!

You got me.  :-)

> I'd like to see an objdump -D output of that function.

How do I do that?

> What compiler was used?

Whatever is on rawhide at the moment...=20

$ gcc --version
gcc (GCC) 3.4.1 20040714 (Red Hat 3.4.1-7)
Copyright (C) 2004 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

b.


--=-IGcjQrmcXEAICG/HI3xm
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBE/Wll3EQlGLyuXARAv5PAJwOfB9tMuaH09CGJuYM+UwJePb1wACgsK+B
qS6YKAeZQLdgSfU/06wzD60=
=fLf3
-----END PGP SIGNATURE-----

--=-IGcjQrmcXEAICG/HI3xm--



--===============0380583307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0380583307==--


