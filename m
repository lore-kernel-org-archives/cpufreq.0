From: Arjan van de Ven <arjanv@redhat.com>
Subject: Re: Speedstep on Intel Pentium M
Date: Tue, 01 Jun 2004 09:29:28 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1086074968.2706.0.camel@laptop.fenrus.com>
References: <8012937.1086037545966.SLOX.WebMail.wwwrun@thor.yiti.intern>
	<20040531233542.368b9da0.frx@firenze.linux.it>
	<5069769.1086059486121.SLOX.WebMail.wwwrun@thor.yiti.intern>
Reply-To: arjanv@redhat.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1468015509=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <5069769.1086059486121.SLOX.WebMail.wwwrun@thor.yiti.intern>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Frank Doege <frank@network-steps.de>
Cc: cpufreq@www.linux.org.uk, Francesco Poli <frx@firenze.linux.it>


--===============1468015509==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-XVUxiDkwH1w28ZT7MWmD"


--=-XVUxiDkwH1w28ZT7MWmD
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-06-01 at 05:11, Frank Doege wrote:
> Morning,
>=20
> thanks for your fast answering. I have an IBM X40 with Pentium M ULV, whe=
n i run Windows i can work over 8 ours but only 6 with linux. Does the Cent=
rino Driver offers voltage scaling ? May be thats the reason that the akku =
lifes longer under windows.

one thing to try:

echo 5 > /proc/sys/vm/laptop-mode

to enable the kernels laptop mode. That increases battery lifetime for
me quite a bit..

--=-XVUxiDkwH1w28ZT7MWmD
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAvDBXxULwo51rQBIRAiCnAJ9lFktA7Ssg20muCLYfff0NFa0qmQCdHjb7
mIXAUCqWNFFWUj2ECU3Z3B0=
=ofZg
-----END PGP SIGNATURE-----

--=-XVUxiDkwH1w28ZT7MWmD--



--===============1468015509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1468015509==--


