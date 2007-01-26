From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: [Q] What patch can be applied to linux kernel 2.4.26?
Date: Fri, 26 Jan 2007 18:52:14 +0100
Message-ID: <20070126185214.3563467d.frx@firenze.linux.it>
References: <001501c7411e$43e76150$6f3e98a3@SMRLnotebook>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1207941224=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <001501c7411e$43e76150$6f3e98a3@SMRLnotebook>
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
To: cpufreq@lists.linux.org.uk

--===============1207941224==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__26_Jan_2007_18_52_14_+0100_usqzbPzsUuBRV78="

--Signature=_Fri__26_Jan_2007_18_52_14_+0100_usqzbPzsUuBRV78=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jan 2007 16:47:32 +0900 Jong Sung Lee wrote:

> Hello!~

Hi!

>=20
> Now I need cpufreq in linux kernel 2.4.26.

Version 2.4.26 is quite old, now.
The latest 2.4.x version is 2.4.34, if you cannot (or do not want to)
switch to 2.6.x...

> Thus I downloaded kernel 2.4.26 however I do not know what tarball is
> made for 2.4.26 from  ftp://ftp.linux.org.uk/pub/linux/cpufreq/
>=20
> someone can tell it to me?

The following patch should be able to apply more or less cleanly to
version 2.4.26:
ftp://ftp.poupinou.org/cpufreq/cpufreq-24-2004083101.diff.bz2

At least, it applies to recent 2.4.x Linux kernels (such as 2.4.34).


Disclaimer:
IANAKH (I Am Not A Kernel Hacker), just a cpufreq user; if anyone knows
better, I will be more than happy to be corrected!   ;-)


--=20
 http://frx.netsons.org/progs/scripts/releas-o-meter.html
 Try our amazing Releas-o-meter!
..................................................... Francesco Poli .
 GnuPG key fpr =3D=3D C979 F34B 27CE 5CD8 DC12  31B5 78F4 279B DD6D FCF4

--Signature=_Fri__26_Jan_2007_18_52_14_+0100_usqzbPzsUuBRV78=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFFuj/UePQnm91t/PQRAgWLAJ9REI/eTDWzQTisbTuDUirOvnkBBwCbBAQ0
ibpqxKGH3WIk7fb63X+2kjA=
=pDmj
-----END PGP SIGNATURE-----

--Signature=_Fri__26_Jan_2007_18_52_14_+0100_usqzbPzsUuBRV78=--


--===============1207941224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1207941224==--

