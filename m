From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Help with Installation
Date: Mon, 5 Apr 2004 23:11:31 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040405211131.GA7586@dominikbrodowski.de>
References: <200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<20040403172242.D5553@flint.arm.linux.org.uk>
	<20040404195730.6fac6745.frx@firenze.linux.it>
	<20040404211144.GA9552@dominikbrodowski.de>
	<20040405222015.4a560be1.frx@firenze.linux.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1450542784=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040405222015.4a560be1.frx@firenze.linux.it>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Francesco Poli <frx@firenze.linux.it>
Cc: cpufreq@www.linux.org.uk


--===============1450542784==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2004 at 10:20:15PM +0200, Francesco Poli wrote:
> On Sun, 4 Apr 2004 23:11:44 +0200 Dominik Brodowski wrote:
>=20
> > Well, it might be usefull for you and others if someone (you?) could
> > provide such up-to-date patches, and keeps 2.4. cpufreq up-to-date
> > with recent 2.6. developments, as far as the latter is possible.
> > However, none of the people currently active in cpufreq development
> > seem to have sufficient time to do so. In case _you_ want to do it [as
> > you said, it shouldn't be so difficult], please do so.
>=20
> Perhaps it would be useful to setup a little script that
>=20
> 1) downloads the latest 2.4.x kernel (maybe via rsync)
> 2) modifies it using latest cpufreq from
>    http://ftp.linux.org.uk/pub/linux/cpufreq/
> 3) creates the patch against the unmodified kernel
> 4) gzips it and moves the resulting file in the right place

IMHO, such a script can only work well if it is "being watched", e.g.
someone (you?) verifies the results equal what you expect. Also, differences
in the base kernel need to be tracked which might make adjustments of the
cpufreq files / patch necessary.

> Such a script should be run daily (via cron) on ftp.linux.org.uk
>=20
> This could perhaps work and provide up-to-date patches, as long as 2.4.x
> cpufreq at http://ftp.linux.org.uk/pub/linux/cpufreq/ is kept up-to-date
> with 2.6.x

But assuming that this CVS export is up-to-date [which it isn't], why is
your script necessary?

> Perhaps patchin.sh should be modified in order to use cp (or mv) rather
> than ln -s

Modifying the patchin.sh script to become more user friendly is something
which can be done -- but _please_ be aware that 2.4. cpufreq is, at best, in
"beta" state and not as up to date as 2.6.

	Dominik

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAccuDZ8MDCHJbN8YRAnpZAJ0VJT7jHu539qZHpqSm5nYX61EhjACfWpQn
at+vAnnAbo9CkQ5zh5SNzPA=
=nznF
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--


--===============1450542784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1450542784==--

