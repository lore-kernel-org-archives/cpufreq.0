From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Help with Installation
Date: Wed, 7 Apr 2004 00:00:16 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406220016.GB11611@dominikbrodowski.de>
References: <20040403171633.610cc960.frx@firenze.linux.it>
	<200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<20040403172242.D5553@flint.arm.linux.org.uk>
	<20040404195730.6fac6745.frx@firenze.linux.it>
	<20040404211144.GA9552@dominikbrodowski.de>
	<20040405222015.4a560be1.frx@firenze.linux.it>
	<20040405211131.GA7586@dominikbrodowski.de>
	<20040406234843.6104733f.frx@firenze.linux.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1203254789=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040406234843.6104733f.frx@firenze.linux.it>
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


--===============1203254789==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2004 at 11:48:43PM +0200, Francesco Poli wrote:
> On Mon, 5 Apr 2004 23:11:31 +0200 Dominik Brodowski wrote:
>=20
> > IMHO, such a script can only work well if it is "being watched", e.g.
> > someone (you?) verifies the results equal what you expect. Also,
> > differences in the base kernel need to be tracked which might make
> > adjustments of the cpufreq files / patch necessary.
>=20
> OK, it's quite clear I misunderstood the role of
> http://ftp.linux.org.uk/pub/linux/cpufreq/ tar archives...  :-(
> I thought that these archives were there to provide the latest cpufreq
> backport for 2.4.x kernels, and that one (following Bruno Ducrot's
> instructions) would be able to use them to modify a 2.4.x kernel (and be
> happy).
> That is why I said that a kernel patch would be easier to apply.

You _are_ able to use them 2.4. kernels, but the 2.4. backport may contain
errors and bugs which are fixed in 2.6. If I'd find out a way so that the=
=20
day had 72 hours for me, I'd update the 2.4. backport...=20

	Dominik
--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcyhwZ8MDCHJbN8YRAsmnAJ9fscmXBKsGo5wVyQirzbAwJ9oEGACgppRw
yjGmkUXLrA5gN8NRTA8UWDI=
=RWK+
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--


--===============1203254789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1203254789==--

