From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: userspace not supported for longrun?
Date: Wed, 2 Jun 2004 17:39:26 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040602173926.70a07dfb.frx@firenze.linux.it>
References: <6BE4F22C-B37D-11D8-B4AF-003065EE23A0@connact.com>
	<20040601093110.GE7926@poupinou.org>
	<005701c44833$71e8ca30$6900a8c0@DEVELOPER>
	<20040602121916.GA8781@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1716716453=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040602121916.GA8781@dominikbrodowski.de>
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

--===============1716716453==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Wed__2_Jun_2004_17_39_26_+0200_vqll2CJpisq/1YKf"

--Signature=_Wed__2_Jun_2004_17_39_26_+0200_vqll2CJpisq/1YKf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Wed, 2 Jun 2004 14:19:17 +0200 Dominik Brodowski wrote:

> > because I'm going to try to recommend how FC2 should support Crusoe
> > and processors with longrun support.
> 
> FC2 should not try to run cpuspeed on crusoe processors, but
> 
> select "powersave" as policy [a.k.a scaling_governor] when on battery,
> and select "performance" as policy [a.k.a scaling_governor] when on
> AC. 
> 
> That's all.

You can easily do this (and much more) with Cpufreqd:
http://sourceforge.net/projects/cpufreqd/

-- 
             |  GnuPG Key ID = DD6DFCF4 | You're compiling a program
  Francesco  |        Key fingerprint = | and, all of a sudden, boom!
     Poli    | C979 F34B 27CE 5CD8 DC12 |         -- from APT HOWTO,
             | 31B5 78F4 279B DD6D FCF4 |             version 1.8.0

--Signature=_Wed__2_Jun_2004_17_39_26_+0200_vqll2CJpisq/1YKf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAvfSyePQnm91t/PQRAn/vAJ0UaTVO3x1kB9rlMsVAXHzPMLiU+ACfV0n7
zo/kVbRBuVWtyzYSOFbrgtE=
=LN1o
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jun_2004_17_39_26_+0200_vqll2CJpisq/1YKf--


--===============1716716453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1716716453==--

