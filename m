From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [PATCH] cpufreq_(ondemand|conservative)
Date: Sat, 29 Jan 2005 23:20:36 +0000
Message-ID: <20050129232036.GA5280@inskipp>
References: <20050123150000.GA3888@inskipp>
	<20050129200020.GA9542@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1522479386=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
In-Reply-To: <20050129200020.GA9542@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@lists.linux.org.uk


--===============1522479386==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dominik,

I was starting to wonder if anyone received my patches as so far _zero_
feekback :)

On Jan 29, Dominik Brodowski wrote:
> concerning patch #1:
>=20
> On Sun, Jan 23, 2005 at 03:00:01PM +0000, Alexander Clouter wrote:
> > @@ -398,10 +455,10 @@
> >  	=09
> >  			j_dbs_info->prev_cpu_idle_up =3D=20
> >  				kstat_cpu(j).cpustat.idle +
> > -				kstat_cpu(j).cpustat.iowait;
> > -			j_dbs_info->prev_cpu_idle_down =3D=20
> > -				kstat_cpu(j).cpustat.idle +
> > -				kstat_cpu(j).cpustat.iowait;
> > +				kstat_cpu(j).cpustat.iowait +
> > +				kstat_cpu(j).cpustat.nice;
>=20
> Why are you adding cpustat.nice here unconditionally? You don't do so in =
the
> sysfs write method, so I assume you should make this dependant on=20
> ignore_nice here as well.
>=20
Well by default 'ignore_nice =3D 0' so is there a need?  Look in the next h=
unk.

I probably have missed something, I am only a sysadmin/perl monkey with a
lpatop afterall :)

Cheers

Alex

--=20
 _________________________________________=20
/ It is wise to keep in mind that neither \
| success nor failure is ever final.      |
|                                         |
\ -- Roger Babson                         /
 -----------------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB/BpENv5Ugh/sRBYRAhEXAJ9aKbuCA9siEiEO8FOQ/nXuy/YsPwCdE23T
FYVPvz48Twu3vM93VY3O2p4=
=iUV6
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--


--===============1522479386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1522479386==--

