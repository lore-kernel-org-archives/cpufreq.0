From: Alexander Clouter <alex@digriz.org.uk>
Subject: [PATCH] (2/3) cpufreq_ondemand - 02_check-rate-and-break-out.diff
Date: Tue, 10 May 2005 23:31:31 +0100
Message-ID: <20050510223131.GC4478@inskipp>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0354362500=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk
Cc: davej@redhat.com, linux@dominikbrodowski.de, alex-kernel@digriz.org.uk


--===============0354362500==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pgaa2uWPnPrfixyx"
Content-Disposition: inline


--Pgaa2uWPnPrfixyx
Content-Type: multipart/mixed; boundary="MIdTMoZhcV1D07fI"
Content-Disposition: inline


--MIdTMoZhcV1D07fI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Prevents un-necessary cpufreq changes if we are already at min/max

Signed-off-by: Alexander Clouter <alex-kernel@digriz.org.uk>

--=20
 _______________________________________=20
/ Things are not always what they seem. \
|                                       |
\ -- Phaedrus                           /
 ---------------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--MIdTMoZhcV1D07fI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq_ondemand-2.6.12-rc3-mm3-02_check-rate-and-break-out.diff"
Content-Transfer-Encoding: quoted-printable

--- linux-2.6.12-rc3-mm3.orig/drivers/cpufreq/cpufreq_ondemand.c	2005-05-10=
 22:21:35.370204952 +0100
+++ linux-2.6.12-rc3-mm3/drivers/cpufreq/cpufreq_ondemand.c	2005-05-10 22:2=
2:02.832030120 +0100
@@ -333,6 +333,10 @@
 			usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
=20
 	if (idle_ticks < up_idle_ticks) {
+		/* if we are already at full speed then break out early */
+		if (policy->cur =3D=3D policy->max)
+			return;
+	=09
 		__cpufreq_driver_target(policy, policy->max,=20
 			CPUFREQ_RELATION_H);
 		down_skip[cpu] =3D 0;
@@ -386,6 +390,10 @@
 			usecs_to_jiffies(freq_down_sampling_rate);
=20
 	if (idle_ticks > down_idle_ticks ) {
+		/* if we are already at the lowest speed then break out early */
+		if (policy->cur =3D=3D policy->min)
+			return;
+	=09
 		freq_down_step =3D (5 * policy->max) / 100;
=20
 		/* max freq cannot be less than 100. But who knows.... */

--MIdTMoZhcV1D07fI--

--Pgaa2uWPnPrfixyx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCgTZDNv5Ugh/sRBYRAsLDAJ9TPVF1O+MIjfM2UIjOWexpK87hSgCfXMBM
4kcxJx21xJEyNlHd3gzJ2j8=
=BITG
-----END PGP SIGNATURE-----

--Pgaa2uWPnPrfixyx--


--===============0354362500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0354362500==--

