From: Elimar Riesebieter <riesebie@lxtec.de>
Subject: 2.6.22-rc2 built on ppc
Date: Sun, 20 May 2007 13:19:53 +0200
Message-ID: <20070520111953.GH3253@aragorn.home.lxtec.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2079766718=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk


--===============2079766718==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZFKeWUZP29EKQNE"
Content-Disposition: inline


--LZFKeWUZP29EKQNE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

FYI, building the kernel with
gcc (GCC) 4.1.3 20070514 (prerelease) (Debian 4.1.2-7)
on my powerbook (PPC) gives:

=2E..
drivers/cpufreq/cpufreq.c: In function 'cpufreq_add_dev':
drivers/cpufreq/cpufreq.c:829: warning: ignoring return value of 'sysfs_cre=
ate_file', declared with attribute warn_unused_result
drivers/cpufreq/cpufreq.c:833: warning: ignoring return value of 'sysfs_cre=
ate_file', declared with attribute warn_unused_result
drivers/cpufreq/cpufreq.c:835: warning: ignoring return value of 'sysfs_cre=
ate_file', declared with attribute warn_unused_result
=2E..

If more info is needed, please contact me via PM, as I am not
subscribed.

Thanks for your patience
Elimar

--=20
  Never make anything simple and efficient when a way=20
  can be found to make it complex and wonderful ;-)

--LZFKeWUZP29EKQNE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGUC7Z3Ig8bsVPf7ARAiNBAJwPJllzeCiOJ3tpuSR6SEK4vTfcSACcCtmC
DhriZ7IA09R+NcRoXA1p1zw=
=ZU+/
-----END PGP SIGNATURE-----

--LZFKeWUZP29EKQNE--


--===============2079766718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============2079766718==--

