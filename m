From: Christian Krafft <krafft@de.ibm.com>
Subject: Re: [Cbe-oss-dev] [Patch] Resending:
	cell_add_spuaware_cpufreq_governor.diff
Date: Wed, 16 Apr 2008 16:53:07 +0200
Message-ID: <20080416165307.1d7a4258@de.ibm.com>
References: <20080118171119.3faa4a6a@de.ibm.com>
	<200804140221.41726.arnd@arndb.de>
	<20080416134938.01d27dc2@de.ibm.com>
	<200804161408.26145.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1400805366=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <200804161408.26145.arnd@arndb.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Arnd Bergmann <arnd@arndb.de>
Cc: parabelboi@bopserverein.de, cpufreq@lists.linux.org.uk, cbe-oss-dev@ozlabs.org

--===============1400805366==
Content-Type: multipart/signed; boundary="Sig_/kzAr2xAe+9xAlhJopMIrtMj";
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_/kzAr2xAe+9xAlhJopMIrtMj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Apr 2008 14:08:25 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Wednesday 16 April 2008, Christian Krafft wrote:
> > This patch is also missing a correct load calculation.
> > It works pretty well for spu's running at full time or idling, but not =
so
> > well for mixed load (i.e. each spu running 50 percent of the time we wo=
uld
> > switch to fullspeed instead of half speed).
>=20
> So why should that be something to optimize for? If the SPUs are all idle,
> I would assume we'd be better off throwing the tasks off and putting them
> into low-power mode, rather than changing the frequency, right?
>=20
> What's the point of your driver, really?
>=20
> 	Arnd <><

What we have now is good enough to
- switch to full power if there are spus active (waiting or running) and=20
- switch to low power if not.

What we have now is not good enough to
- switch to low power if there are spus waiting, but none are running

As we cannot _yet_ differentiate between spus waiting and spus running means
that in _some_ cases we will not save as much power as we could.

The point of submitting the driver is to get it working.
Further improvements will follow of course.

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

--Sig_/kzAr2xAe+9xAlhJopMIrtMj
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFIBhLp6rqK4qDx+dcRAm+cAJ9QdOa9aLtoikipRCzjHvXXY9gGRACfbpbV
QyHR+LAK6cb33VR1pjtqQmM=
=1pMR
-----END PGP SIGNATURE-----

--Sig_/kzAr2xAe+9xAlhJopMIrtMj--


--===============1400805366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1400805366==--

