From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: Help with Installation
Date: Sun, 4 Apr 2004 19:57:30 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040404195730.6fac6745.frx@firenze.linux.it>
References: <200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<20040403172242.D5553@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1129895716=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040403172242.D5553@flint.arm.linux.org.uk>
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

--===============1129895716==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Sun__4_Apr_2004_19_57_30_+0200_awUe_Q8AfUaWwjmm"

--Signature=_Sun__4_Apr_2004_19_57_30_+0200_awUe_Q8AfUaWwjmm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Sat, 3 Apr 2004 17:22:42 +0100 Russell King wrote:

> We don't have the (massive) resources to be able to generate a patch
> for every single kernel version which someone may want to apply the
> cpufreq code to from the CVS.

Well, I think that a patch against the latest 2.4.x kernel and one
against the latest 2.4.x pre-release (2.4.x-prex or 2.4.x-rcx) would
suffice.

Adapting one such patch in order to apply it to some less recent 2.4.x
kernel version is not so difficult.
At least, that was my personal experience: I successfully applied
cpufreq-2.4.22-pre6-1.gz (by hand-editing the diff file) to 2.4.22,
2.4.23, 2.4.24 and 2.4.25.
Adapting a hypothetical cpufreq-2.4.25-1.gz to the same kernel versions
should not be more challenging...

What's your opinion?

-- 
             |  GnuPG Key ID = DD6DFCF4 | You're compiling a program
  Francesco  |        Key fingerprint = | and, all of a sudden, boom!
     Poli    | C979 F34B 27CE 5CD8 DC12 |         -- from APT HOWTO,
             | 31B5 78F4 279B DD6D FCF4 |             version 1.8.0

--Signature=_Sun__4_Apr_2004_19_57_30_+0200_awUe_Q8AfUaWwjmm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcEygePQnm91t/PQRArvCAJ9GzZ4uBGBEHuIpbJT3XYg7s7miewCgtka6
w5xR3NG9GC4lrpLXymRXsQQ=
=cGw/
-----END PGP SIGNATURE-----

--Signature=_Sun__4_Apr_2004_19_57_30_+0200_awUe_Q8AfUaWwjmm--


--===============1129895716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1129895716==--

