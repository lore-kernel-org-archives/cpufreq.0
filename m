From: Alexander Clouter <alex@digriz.org.uk>
Subject: [PATCH] (3/3) cpufreq_ondemand - 03_sys_freq_step.diff
Date: Sun, 20 Feb 2005 13:18:08 +0000
Message-ID: <20050220131808.GD4495@inskipp>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1792065121=="
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


--===============1792065121==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Jtds+vpI57xq70EV"
Content-Disposition: inline


--Jtds+vpI57xq70EV
Content-Type: multipart/mixed; boundary="6THr7QwYWIbrk6Kt"
Content-Disposition: inline


--6THr7QwYWIbrk6Kt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Adds support so that the cpufreq change stepping is no longer fixed at 5% a=
nd=20
can be changed dynamically by the user

Signed-off-by: Alexander Clouter <alex-kernel@digriz.org.uk>

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

--6THr7QwYWIbrk6Kt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq_ondemand-2.6.11-rc3-mm2-03_sys_freq_step.diff"
Content-Transfer-Encoding: quoted-printable

--- linux-2.6.11-rc3-mm2.orig/drivers/cpufreq/cpufreq_ondemand.c	2005-02-20=
 11:36:56.082671840 +0000
+++ linux-2.6.11-rc3-mm2/drivers/cpufreq/cpufreq_ondemand.c	2005-02-20 11:3=
7:13.371043608 +0000
@@ -80,6 +80,7 @@
 	unsigned int		up_threshold;
 	unsigned int		down_threshold;
 	unsigned int		ignore_nice;
+	unsigned int		freq_step;
 };
=20
 static struct dbs_tuners dbs_tuners_ins =3D {
@@ -118,6 +119,7 @@
 show_one(up_threshold, up_threshold);
 show_one(down_threshold, down_threshold);
 show_one(ignore_nice, ignore_nice);
+show_one(freq_step, freq_step);
=20
 static ssize_t store_sampling_down_factor(struct cpufreq_policy *unused,=
=20
 		const char *buf, size_t count)
@@ -236,6 +238,29 @@
 	return count;
 }
=20
+static ssize_t store_freq_step(struct cpufreq_policy *policy,
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+
+	ret =3D sscanf (buf, "%u", &input);
+
+	if ( ret !=3D 1 )
+		return -EINVAL;
+
+	if ( input > 100 )
+		input =3D 100;
+=09
+	/* no need to test here if freq_step is zero as the user might actually
+	 * want this, they would be crazy though :) */
+	down(&dbs_sem);
+	dbs_tuners_ins.freq_step =3D input;
+	up(&dbs_sem);
+
+	return count;
+}
+
 #define define_one_rw(_name) \
 static struct freq_attr _name =3D \
 __ATTR(_name, 0644, show_##_name, store_##_name)
@@ -245,6 +270,7 @@
 define_one_rw(up_threshold);
 define_one_rw(down_threshold);
 define_one_rw(ignore_nice);
+define_one_rw(freq_step);
=20
 static struct attribute * dbs_attributes[] =3D {
 	&sampling_rate_max.attr,
@@ -254,6 +280,7 @@
 	&up_threshold.attr,
 	&down_threshold.attr,
 	&ignore_nice.attr,
+	&freq_step.attr,
 	NULL
 };
=20
@@ -292,7 +319,7 @@
 	 *
 	 * Any frequency increase takes it to the maximum frequency.=20
 	 * Frequency reduction happens at minimum steps of=20
-	 * 5% of max_frequency=20
+	 * 5% (default) of max_frequency=20
 	 */
=20
 	/* Check for frequency increase */
@@ -391,18 +418,20 @@
 			sampling_rate_in_HZ(freq_down_sampling_rate);
=20
 	if (idle_ticks > down_idle_ticks ) {
-		/* if we are already at the lowest speed then break out early */
-		if (policy->cur =3D=3D policy->min)
+		/* if we are already at the lowest speed then break out early
+		 * or if we 'cannot' reduce the speed as the user might want
+		 * freq_step to be zero */
+		if (policy->cur =3D=3D policy->min || dbs_tuners_ins.freq_step =3D=3D 0)
 			return;
-	=09
-		freq_down_step =3D (5 * policy->max) / 100;
+
+		freq_down_step =3D (dbs_tuners_ins.freq_step * policy->max) / 100;
=20
 		/* max freq cannot be less than 100. But who knows.... */
 		if (unlikely(freq_down_step =3D=3D 0))
 			freq_down_step =3D 5;
=20
 		__cpufreq_driver_target(policy,
-			policy->cur - freq_down_step,=20
+			policy->cur - freq_down_step,
 			CPUFREQ_RELATION_H);
 		return;
 	}
@@ -488,6 +517,7 @@
 					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
 			dbs_tuners_ins.sampling_rate =3D def_sampling_rate;
 			dbs_tuners_ins.ignore_nice =3D 0;
+			dbs_tuners_ins.freq_step =3D 5;
=20
 			dbs_timer_init();
 		}

--6THr7QwYWIbrk6Kt--

--Jtds+vpI57xq70EV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCGI4QNv5Ugh/sRBYRAp6PAJ427T9D2xZ3Y/AV+CM72UWIHSZ64QCeO0S/
dAKVh5ffxc8RtpWtX6LKH40=
=raJ1
-----END PGP SIGNATURE-----

--Jtds+vpI57xq70EV--


--===============1792065121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1792065121==--

