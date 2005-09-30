From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [patch 1/1] cpufreq_conservative: invert meaning of
	'ignore_nice'
Date: Fri, 30 Sep 2005 09:09:26 +0100
Message-ID: <20050930080926.GA3033@inskipp.digriz.org.uk>
References: <20050929084435.GC3169@inskipp.digriz.org.uk>
	<200509291346.33855.blaisorblade@yahoo.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0861799895=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200509291346.33855.blaisorblade@yahoo.it>
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
To: Blaisorblade <blaisorblade@yahoo.it>
Cc: Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk, LKML <linux-kernel@vger.kernel.org>, Dave Jones <davej@redhat.com>


--===============0861799895==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Blaisorblade <blaisorblade@yahoo.it> [20050929 13:46:33 +0200]:
>
> On Thursday 29 September 2005 10:44, Alexander Clouter wrote:
>=20
> > WARNING: this obvious breaks any userland tools that expect things to be
> > the other way round.  This patch clears up the confusion but should go =
in
> > ASAP as at the moment it seems very few tools even make use of this
> > functionality; all I could find was a Gentoo Wiki entry.
>=20
> My suggestion on this is to rename the flag too, as ignore_nice_load (or=
=20
> ignore_nice_tasks, choose your way). Don't forget to do it in docs too.
>=20
'ignore_nice_tasks' gets my vote..

> So userspace tools will error out rather than do the reverse of what they=
 were=20
> doing, and the user will fix the thing according to the (new) docs.
>=20
> This is the way we avoid problems in kernel code, when changing APIs (I r=
ead=20
> Linus talking about this), so I assume it's ok?
>=20
Makes a lot of sense.  I'll roll out some new patches this evening and subm=
it=20
them.

Regards

Alex

> --=20
> Inform me of my mistakes, so I can keep imitating Homer Simpson's "Doh!".
> Paolo Giarrusso, aka Blaisorblade (Skype ID "PaoloGiarrusso", ICQ 2156218=
94)
> http://www.user-mode-linux.org/~blaisorblade
>=20
>=20
> =09
>=20
> =09
> 	=09
> ___________________________________=20
> Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB=20
> http://mail.yahoo.it

--=20
 ________________________________________=20
< An idle mind is worth two in the bush. >
 ----------------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDPPK2Nv5Ugh/sRBYRAlcYAJ0Z9R2BQu1tkJphBvjm2weFh3wjTwCgjgis
sfKIC5ou8mMh4XlWM1fSAR4=
=OK3Q
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--


--===============0861799895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0861799895==--

