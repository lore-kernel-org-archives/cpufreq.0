From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: Help with Installation
Date: Sat, 3 Apr 2004 17:16:33 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040403171633.610cc960.frx@firenze.linux.it>
References: <200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0171607721=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040403145045.GV19001@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk

--===============0171607721==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Sat__3_Apr_2004_17_16_33_+0200_Qh=w=RfZ.5.IDu1J"

--Signature=_Sat__3_Apr_2004_17_16_33_+0200_Qh=w=RfZ.5.IDu1J
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Sat, 3 Apr 2004 16:50:45 +0200 Bruno Ducrot wrote:

> tar xzvfp cpufreq-...tar.gz
> cd cpufreq
> ./patchin.sh /path/to/kernel/sources
> 
> Do *not* remove the cpufreq directory that was unpacked.

Why did you set up such a strange procedure?
What are the advantages over a simple patch like the old ones found in
http://www.codemonkey.org.uk/projects/cpufreq/   ?

I'd say a gzipped (or bzip2ed) patch file would be much more easy to
apply (especially with automatic tools such as Debian kernel-package,
that is, make-kpkg), but of course I may be wrong...

Could you please explain the rationale behind such a choice?

-- 
             |  GnuPG Key ID = DD6DFCF4 | You're compiling a program
  Francesco  |        Key fingerprint = | and, all of a sudden, boom!
     Poli    | C979 F34B 27CE 5CD8 DC12 |         -- from APT HOWTO,
             | 31B5 78F4 279B DD6D FCF4 |             version 1.8.0

--Signature=_Sat__3_Apr_2004_17_16_33_+0200_Qh=w=RfZ.5.IDu1J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAbtVWePQnm91t/PQRAsOEAKCaTsRGADIo0kz6z2DqEwo20qlTYQCggb5d
XCoVaZAoibqHlg5TcGbOsYM=
=sdgs
-----END PGP SIGNATURE-----

--Signature=_Sat__3_Apr_2004_17_16_33_+0200_Qh=w=RfZ.5.IDu1J--


--===============0171607721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0171607721==--

