From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: Help with Installation
Date: Mon, 5 Apr 2004 22:20:15 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040405222015.4a560be1.frx@firenze.linux.it>
References: <200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<20040403172242.D5553@flint.arm.linux.org.uk>
	<20040404195730.6fac6745.frx@firenze.linux.it>
	<20040404211144.GA9552@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1831397863=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040404211144.GA9552@dominikbrodowski.de>
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

--===============1831397863==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Mon__5_Apr_2004_22_20_15_+0200_g3vXiIcBQAypxb7G"

--Signature=_Mon__5_Apr_2004_22_20_15_+0200_g3vXiIcBQAypxb7G
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Sun, 4 Apr 2004 23:11:44 +0200 Dominik Brodowski wrote:

> Well, it might be usefull for you and others if someone (you?) could
> provide such up-to-date patches, and keeps 2.4. cpufreq up-to-date
> with recent 2.6. developments, as far as the latter is possible.
> However, none of the people currently active in cpufreq development
> seem to have sufficient time to do so. In case _you_ want to do it [as
> you said, it shouldn't be so difficult], please do so.

Perhaps it would be useful to setup a little script that

1) downloads the latest 2.4.x kernel (maybe via rsync)
2) modifies it using latest cpufreq from
   http://ftp.linux.org.uk/pub/linux/cpufreq/
3) creates the patch against the unmodified kernel
4) gzips it and moves the resulting file in the right place

Such a script should be run daily (via cron) on ftp.linux.org.uk

This could perhaps work and provide up-to-date patches, as long as 2.4.x
cpufreq at http://ftp.linux.org.uk/pub/linux/cpufreq/ is kept up-to-date
with 2.6.x

Perhaps patchin.sh should be modified in order to use cp (or mv) rather
than ln -s

What do you think?

-- 
             |  GnuPG Key ID = DD6DFCF4 | You're compiling a program
  Francesco  |        Key fingerprint = | and, all of a sudden, boom!
     Poli    | C979 F34B 27CE 5CD8 DC12 |         -- from APT HOWTO,
             | 31B5 78F4 279B DD6D FCF4 |             version 1.8.0

--Signature=_Mon__5_Apr_2004_22_20_15_+0200_g3vXiIcBQAypxb7G
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcb+DePQnm91t/PQRAhMQAJ0UYSW2oJt3wIuj3FWJ0o8hTrZgsgCgqNrp
wjtZkLSyNENXDF6e6prI/Vc=
=tPhd
-----END PGP SIGNATURE-----

--Signature=_Mon__5_Apr_2004_22_20_15_+0200_g3vXiIcBQAypxb7G--


--===============1831397863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1831397863==--

