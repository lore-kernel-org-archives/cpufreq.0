From: Mattia Dongili <dongili@supereva.it>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 11:59:26 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021095925.GB893@inferi.kami.home>
References: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
	<1066725533.5237.3.camel@laptop.fenrus.com>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============397080249422608=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <1066725533.5237.3.camel@laptop.fenrus.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org


--===============397080249422608==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2003 at 10:38:53AM +0200, Arjan van de Ven wrote:
> On Tue, 2003-10-21 at 04:56, Pallipadi, Venkatesh wrote:
> > Patch 3/3: New dynamic cpufreq driver (called=20
> > DemandBasedSwitch driver), which periodically monitors CPU=20
> > usage and changes the CPU frequency based on the demand.
>=20
>=20
> it's all nice code and such, but I still wonder why this can't be done
> by a userland policy daemon. The 2.6 kernel has the infrastructure to
> give very detailed information to userspace (eg top etc) about idle
> percentages...... I didn't see anything in this driver that couldn't be
> done from userspace.

I remember Linus forcing a kernel only policy management:
http://www.linux.org.uk/mailman/private/cpufreq/2002-August/000865.html

Also: I think the userspace governor is a workaround to allow userspace
policies.

ciao
--=20
mattia
:wq!

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/lQN9gpRPaOotLEERAhR0AKCLhO55PN1PjYprhSNcct/Afz8B0ACeKjJO
P+WoP9/yb1+VAErXh03ShN8=
=Zi7R
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--


--===============397080249422608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============397080249422608==--

