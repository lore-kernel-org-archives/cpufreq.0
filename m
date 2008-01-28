From: Christian Krafft <krafft@de.ibm.com>
Subject: Re: [Cbe-oss-dev] Subject: cell: add spu aware cpufreq governor
Date: Mon, 28 Jan 2008 11:26:20 +0100
Message-ID: <20080128112620.37c59f87@de.ibm.com>
References: <20080118171119.3faa4a6a@de.ibm.com>
	<60952.202.227.43.1.1200884963.squirrel@m.fixstars.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0116497139=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <60952.202.227.43.1.1200884963.squirrel@m.fixstars.com>
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
To: Akinobu Mita <mita@fixstars.com>
Cc: cpufreq@lists.linux.org.uk, cbe-oss-dev@ozlabs.org

--===============0116497139==
Content-Type: multipart/signed; boundary="Sig_/ma1+KADsn9PmxI=WHofA68K";
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_/ma1+KADsn9PmxI=WHofA68K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

First of all, sorry for the delayed answer.

I had no hardware access (and no mail) last week,
I'll provide an updated patch very soon.

And thanks for your comments ;-)

Cheers,
Christian

On Mon, 21 Jan 2008 12:09:23 +0900 (JST)
"Akinobu Mita" <mita@fixstars.com> wrote:

> > +/*
> > + * module init and destoy
> > + */
> > +
> > +static int __init spu_gov_init(void)
> > +{
> > +if (!machine_is(cell))
> > +return -ENODEV;
> > +
> > +kspugov_wq =3D create_workqueue("kspugov");
> > +if (!kspugov_wq) {
> > +printk(KERN_ERR "creation of kspugov failed\n");
> > +return -EFAULT;
> > +}
> > +
> > +return cpufreq_register_governor(&spu_governor);
>=20
> Missing an error handling. This line should be something like:
>=20
>     err =3D cpufreq_register_governor(&spu_governor);
>     if (err) {
>         destroy_workqueue(kspugov_wq);
>         return err;
>     }
>=20
>     return 0;
>=20
> It seems like this is copied from drivers/cpufreq/cpufreq_governor.c
> Althought this is not big problem, it would be nice to fix as well.
>=20
> > +}
>=20
>=20
>=20


--=20
Mit freundlichen Gruessen,
kind regards,

Christian Krafft
IBM Systems & Technology Group,
Linux Kernel Development
IT Specialist


Vorsitzender des Aufsichtsrats:	Martin Jetter
Geschaeftsfuehrung:		Herbert Kircher
Sitz der Gesellschaft:		Boeblingen
Registriergericht:		Amtsgericht Stuttgart, HRB 243294

--Sig_/ma1+KADsn9PmxI=WHofA68K
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFHna3O6rqK4qDx+dcRAtz2AKDikempBV66raRbYmPkMKZzDFDqLQCgq6/U
PDhkZ+2ERsIZSf/TsgXTCbo=
=4g5O
-----END PGP SIGNATURE-----

--Sig_/ma1+KADsn9PmxI=WHofA68K--


--===============0116497139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0116497139==--

