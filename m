From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH][DOCUMENTATION BUGFIX] latency in micro-, not nanoseconds
Date: Tue, 4 Nov 2003 17:08:16 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031104160816.GA9187@brodo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============79676093675187465=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk


--===============79676093675187465==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

All drivers [davej, can you please verify for powernow-k7?] set the=20
transition_latency time in microseconds, even though the core demanded
nanoseconds. Instead of fixing up the drivers, fix up the core...

	Dominik

diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufre=
q.h
--- linux-original/include/linux/cpufreq.h	2003-11-04 15:27:38.000000000 +0=
100
+++ linux/include/linux/cpufreq.h	2003-11-04 16:09:23.547389216 +0100
@@ -57,7 +57,7 @@
 struct cpufreq_cpuinfo {
 	unsigned int		max_freq;
 	unsigned int		min_freq;
-	unsigned int		transition_latency; /* in 10^(-9) s */
+	unsigned int		transition_latency; /* in 10^(-6) s =3D microseconds */
 };
=20
 struct cpufreq_real_policy {

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/p87vZ8MDCHJbN8YRAje3AKCVFznTV3RNkQH5y0IJfOI/4JaPggCdGtZC
gEG12hWo2GJmdRkUJ5JaePE=
=44To
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--


--===============79676093675187465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============79676093675187465==--

