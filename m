From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Help with Installation
Date: Sun, 4 Apr 2004 23:11:44 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040404211144.GA9552@dominikbrodowski.de>
References: <200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<20040403172242.D5553@flint.arm.linux.org.uk>
	<20040404195730.6fac6745.frx@firenze.linux.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1825421461=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040403171633.610cc960.frx@firenze.linux.it>
	<20040404195730.6fac6745.frx@firenze.linux.it>
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


--===============1825421461==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 03, 2004 at 05:16:33PM +0200, Francesco Poli wrote:
> On Sat, 3 Apr 2004 16:50:45 +0200 Bruno Ducrot wrote:
>=20
> > tar xzvfp cpufreq-...tar.gz
> > cd cpufreq
> > ./patchin.sh /path/to/kernel/sources
> >=20
> > Do *not* remove the cpufreq directory that was unpacked.
>=20
> Why did you set up such a strange procedure?
> What are the advantages over a simple patch like the old ones found in
> http://www.codemonkey.org.uk/projects/cpufreq/   ?

The reason is that there are too few cpufreq developers. I'd done the
patches found at that site [and a lot more in the months before], but I lack
the time to continue providing these patches.=20
=20
> I'd say a gzipped (or bzip2ed) patch file would be much more easy to
> apply (especially with automatic tools such as Debian kernel-package,
> that is, make-kpkg), but of course I may be wrong...
>=20
> Could you please explain the rationale behind such a choice?

Number of active developers and time these can [not want!] spend on this
project.

> Well, I think that a patch against the latest 2.4.x kernel and one
> against the latest 2.4.x pre-release (2.4.x-prex or 2.4.x-rcx) would
> suffice.
>=20
> Adapting one such patch in order to apply it to some less recent 2.4.x
> kernel version is not so difficult.

Well, it might be usefull for you and others if someone (you?) could provide
such up-to-date patches, and keeps 2.4. cpufreq up-to-date with recent 2.6.
developments, as far as the latter is possible. However, none of the people
currently active in cpufreq development seem to have sufficient time to do
so. In case _you_ want to do it [as you said, it shouldn't be so difficult],
please do so.

	Dominik



--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcHoQZ8MDCHJbN8YRAmf7AJ0aNISLyIWMRmKXwkOYJb56YMOTAACgp7yQ
yAjCUYBJPttMdE7C9Wh46yE=
=YP/n
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--


--===============1825421461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1825421461==--

