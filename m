From: Alexander Clouter <alex@digriz.org.uk>
Subject: [PATCH] (2/3) cpufreq_ondemand - 02_check-rate-and-break-out.diff
Date: Sun, 20 Feb 2005 13:16:59 +0000
Message-ID: <20050220131659.GC4495@inskipp>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0848986669=="
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
To: cpufreq@lists.linux.org.uk
Cc: davej@redhat.com, linux@dominikbrodowski.de, alex-kernel@digriz.org.uk


--===============0848986669==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1EKig6ypoSyM7jaD"
Content-Disposition: inline


--1EKig6ypoSyM7jaD
Content-Type: multipart/mixed; boundary="TmwHKJoIRFM7Mu/A"
Content-Disposition: inline


--TmwHKJoIRFM7Mu/A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Prevents un-necessary cpufreq changes if we are already at min/max

Signed-off-by: Alexander Clouter <alex-kernel@digriz.org.uk>

--=20
 _________________________________________=20
/ He who lives without folly is less wise \
\ than he believes.                       /
 -----------------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--TmwHKJoIRFM7Mu/A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq_ondemand-2.6.11-rc3-mm2-02_check-rate-and-break-out.diff"
Content-Transfer-Encoding: quoted-printable

--- linux-2.6.11-rc3-mm2.orig/drivers/cpufreq/cpufreq_ondemand.c	2005-02-20=
 11:34:30.901742696 +0000
+++ linux-2.6.11-rc3-mm2/drivers/cpufreq/cpufreq_ondemand.c	2005-02-20 11:3=
6:06.467214536 +0000
@@ -334,6 +334,10 @@
 			sampling_rate_in_HZ(dbs_tuners_ins.sampling_rate);
=20
 	if (idle_ticks < up_idle_ticks) {
+		/* if we are already at full speed then break out early */
+		if (policy->cur =3D=3D policy->max)
+			return;
+	=09
 		__cpufreq_driver_target(policy, policy->max,=20
 			CPUFREQ_RELATION_H);
 		down_skip[cpu] =3D 0;
@@ -387,6 +391,10 @@
 			sampling_rate_in_HZ(freq_down_sampling_rate);
=20
 	if (idle_ticks > down_idle_ticks ) {
+		/* if we are already at the lowest speed then break out early */
+		if (policy->cur =3D=3D policy->min)
+			return;
+	=09
 		freq_down_step =3D (5 * policy->max) / 100;
=20
 		/* max freq cannot be less than 100. But who knows.... */

--TmwHKJoIRFM7Mu/A--

--1EKig6ypoSyM7jaD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCGI3LNv5Ugh/sRBYRAmJWAJ9RLqR8MQa2JNiQCIt4O4NrtpPrhgCdEoyT
WPPHf2PCWRZmgpv+4g4jS0U=
=OCFt
-----END PGP SIGNATURE-----

--1EKig6ypoSyM7jaD--


--===============0848986669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0848986669==--

