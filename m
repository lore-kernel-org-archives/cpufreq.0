From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH] BUGFIX for powernow-k8
Date: Tue, 4 Nov 2003 15:51:01 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031104145100.GA6517@brodo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============12115048616934709=="
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
To: davej@codemonkey.org.uk, paul.devriendt@amd.com, cpufreq@www.linux.org.uk


--===============12115048616934709==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Paul,

Here is an important bugfix for powernow-k8.c in its current form
(2.6.0-test9).

Problem description:
As the powernow-k8 driver uses the ->target and not the=20
->setpolicy callback, cpufreq_policy->policy is always zero. Checking for it
in the powernow-k8 driver always returned "false". So we can easily remove
this invalid check (and the #warning added to denote this).

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/a=
rch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-11-04 15=
:27:33.609957704 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-11-04 15:39:36.41=
0075384 +0100
@@ -935,10 +935,8 @@
 		return -ENODEV;
 	}
=20
-#warning pol->policy is in undefined state here
 	res =3D find_match(&targ, &min, &max,
-			 pol->policy =3D=3D CPUFREQ_POLICY_POWERSAVE ?
-			 SEARCH_DOWN : SEARCH_UP, 0, 0);
+			 SEARCH_DOWN, 0, 0);
 	if (!res) {
 		pol->min =3D min * 1000;
 		pol->max =3D max * 1000;

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/p7zTZ8MDCHJbN8YRAvgGAJwN6eoSZYGwOrh5/caXl0wjA1iRaQCfY9fQ
JE/6HPhAJhMNcKP6/RUm350=
=AFnX
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--


--===============12115048616934709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============12115048616934709==--

