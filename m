From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Sun, 20 Feb 2005 18:14:48 +0000
Message-ID: <20050220181448.GA5277@inskipp>
References: <20050220131518.GB4495@inskipp>
	<20050220145350.GD20702@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1433853105=="
In-Reply-To: <20050220145350.GD20702@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk, davej@redhat.com


--===============1433853105==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Morning,

On Feb 20, Dominik Brodowski wrote:
> On Sun, Feb 20, 2005 at 01:15:18PM +0000, Alexander Clouter wrote:
> > +			( !dbs_tuners_ins.ignore_nice
> > +			  ? kstat_cpu(j).cpustat.nice : NULL );
> NULL is a pointer, 0 is a number. You most probably want "0" here.
>=20
> > +				( !dbs_tuners_ins.ignore_nice
> > +				  ? kstat_cpu(j).cpustat.nice : NULL );
> dito.
>=20
NULL comes out as a nothing, there is no problem in adding NULL to a
variable; the c-compiler, I have been assured, drops this out (or rather it
should) as a NOOP.  Of course this is what I have been told, by my flatmate
whom works with a large number of different compilers for different
architectures from different software houses, and lives/breathes C
(concerningly :)

Along similar lines, I was told that initialising statics to zero *must* be
done and not assumed; friends have told me its a 'gcc specific extension'. =
=20
Last time I was told this was not necessary...

I'm happy for it to be changed on reasons of clarity, but technically there
should be no problems.  You're the kernel guys and I of course am wielding =
my
"talking out my ass" disclaimer, so correct me where necessary :)

Cheers

Alex

--=20
 _________________________________________=20
/  A horse breeder has his young colts    \
| bottle-fed after they're three days     |
| old. He heard that a foal and his mummy |
\ are soon parted.                        /
 -----------------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD4DBQFCGNOYNv5Ugh/sRBYRArKwAJUTPEJtAaT3XYOUT2ZmcZLKuJr+AJ9FnykO
yK3uvOg1SRusOblG2j7SdQ==
=MEKm
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--


--===============1433853105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1433853105==--

