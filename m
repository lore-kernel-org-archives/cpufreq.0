From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: Help with Installation
Date: Wed, 7 Apr 2004 22:26:21 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040407222621.090a0378.frx@firenze.linux.it>
References: <20040403171633.610cc960.frx@firenze.linux.it>
	<200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<20040403172242.D5553@flint.arm.linux.org.uk>
	<20040404195730.6fac6745.frx@firenze.linux.it>
	<20040404211144.GA9552@dominikbrodowski.de>
	<20040405222015.4a560be1.frx@firenze.linux.it>
	<20040405220654.D17303@flint.arm.linux.org.uk>
	<20040406230134.01c2e4b3.frx@firenze.linux.it>
	<20040407081133.B2196@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1846718619=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040407081133.B2196@flint.arm.linux.org.uk>
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

--===============1846718619==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Wed__7_Apr_2004_22_26_21_+0200_YI4q32xX97N+ccSk"

--Signature=_Wed__7_Apr_2004_22_26_21_+0200_YI4q32xX97N+ccSk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Wed, 7 Apr 2004 08:11:33 +0100 Russell King wrote:

> > Wouldn't some shell commands like
> > 
> >   tar xzvfp cpufreq-...tar.gz
> >   cd cpufreq
> >   ./patchin.sh /path/to/kernel/sources
> > 
> > suffice?
> > I am quoting Bruno Ducrot's instructions... but maybe I don't catch
> > something important...
> 
> That assumes that the CVS has been kept up to date with the latest 2.4
> kernel.

I see: so some manual adjustments could be necessary and that is why you
said this should be a manual operation.

TNX for the explanation!

-- 
             |  GnuPG Key ID = DD6DFCF4 | You're compiling a program
  Francesco  |        Key fingerprint = | and, all of a sudden, boom!
     Poli    | C979 F34B 27CE 5CD8 DC12 |         -- from APT HOWTO,
             | 31B5 78F4 279B DD6D FCF4 |             version 1.8.0

--Signature=_Wed__7_Apr_2004_22_26_21_+0200_YI4q32xX97N+ccSk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAdGPzePQnm91t/PQRAutLAJ9hkXp4ZueCyrWWzlMnFrN4hT4l1QCgqeBu
MpdXG2xVsWXrOpAFP5zzzN0=
=s2zS
-----END PGP SIGNATURE-----

--Signature=_Wed__7_Apr_2004_22_26_21_+0200_YI4q32xX97N+ccSk--


--===============1846718619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1846718619==--

