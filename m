From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix cpufreq_update_policy
Date: Wed, 28 Jan 2004 22:52:49 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040128215249.GA4727@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============61332447203462537=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: davej@redhat.com, cpufreq@www.linux.org.uk


--===============61332447203462537==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Fix a brown paper bug in drivers/cpufreq/cpufreq.c which accessed random
memory instead of the correct struct.

Please apply,

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cp=
ufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-01-16 20:30:59.000000000 =
+0100
+++ linux/drivers/cpufreq/cpufreq.c	2004-01-28 22:16:38.099398456 +0100
@@ -868,7 +868,7 @@
 	down(&data->lock);
=20
 	memcpy(&policy,=20
-	       &data,=20
+	       data,=20
 	       sizeof(struct cpufreq_policy));
 	policy.min =3D data->user_policy.min;
 	policy.max =3D data->user_policy.max;

--huq684BweRXVnRxX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAGC8xZ8MDCHJbN8YRAhdsAJ4oxlfymWxWsbC5KsP4IIXuOFvXaQCghv98
tBgqDWXLGPrbRYLpORsbyGk=
=eIMZ
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--


--===============61332447203462537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============61332447203462537==--

