From: Alexander Clouter <alex@digriz.org.uk>
Subject: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Tue, 10 May 2005 23:30:31 +0100
Message-ID: <20050510223031.GA4478@inskipp>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2110512712=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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


--===============2110512712==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline


--Fba/0zbH8Xs+Fj9o
Content-Type: multipart/mixed; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Adds support to cpufreq_ondemand to ignore 'nice' cpu time

Signed-off-by: Alexander Clouter <alex-kernel@digriz.org.uk>

--=20
 ________________________________________=20
/ Scintillation is not always            \
\ identification for an auric substance. /
 ----------------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq_ondemand-2.6.12-rc3-mm3-01_ignore-nice.diff"
Content-Transfer-Encoding: quoted-printable

--- linux-2.6.12-rc3-mm3.orig/drivers/cpufreq/cpufreq_ondemand.c	2005-05-10=
 19:38:11.376638520 +0100
+++ linux-2.6.12-rc3-mm3/drivers/cpufreq/cpufreq_ondemand.c	2005-05-10 22:1=
4:49.632886400 +0100
@@ -78,6 +78,7 @@
 	unsigned int		sampling_down_factor;
 	unsigned int		up_threshold;
 	unsigned int		down_threshold;
+	unsigned int		ignore_nice;
 };
=20
 static struct dbs_tuners dbs_tuners_ins =3D {
@@ -115,6 +116,7 @@
 show_one(sampling_down_factor, sampling_down_factor);
 show_one(up_threshold, up_threshold);
 show_one(down_threshold, down_threshold);
+show_one(ignore_nice, ignore_nice);
=20
 static ssize_t store_sampling_down_factor(struct cpufreq_policy *unused,=
=20
 		const char *buf, size_t count)
@@ -193,6 +195,46 @@
 	return count;
 }
=20
+static ssize_t store_ignore_nice(struct cpufreq_policy *policy,
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+
+	unsigned int j;
+=09
+	ret =3D sscanf (buf, "%u", &input);
+	if ( ret !=3D 1 )
+		return -EINVAL;
+
+	if ( input > 1 )
+		input =3D 1;
+=09
+	down(&dbs_sem);
+	if ( input =3D=3D dbs_tuners_ins.ignore_nice ) { /* nothing to do */
+		up(&dbs_sem);
+		return count;
+	}
+	dbs_tuners_ins.ignore_nice =3D input;
+
+	/* we need to re-evaluate prev_cpu_idle_up and prev_cpu_idle_down */
+	for_each_cpu_mask(j, policy->cpus) {
+		struct cpu_dbs_info_s *j_dbs_info;
+		j_dbs_info =3D &per_cpu(cpu_dbs_info, j);
+		j_dbs_info->cur_policy =3D policy;
+
+		j_dbs_info->prev_cpu_idle_up =3D
+			kstat_cpu(j).cpustat.idle +
+			kstat_cpu(j).cpustat.iowait +
+			( !dbs_tuners_ins.ignore_nice
+			  ? kstat_cpu(j).cpustat.nice : 0 );
+		j_dbs_info->prev_cpu_idle_down =3D j_dbs_info->prev_cpu_idle_up;
+	}
+	up(&dbs_sem);
+
+	return count;
+}
+
 #define define_one_rw(_name) \
 static struct freq_attr _name =3D \
 __ATTR(_name, 0644, show_##_name, store_##_name)
@@ -201,6 +243,7 @@
 define_one_rw(sampling_down_factor);
 define_one_rw(up_threshold);
 define_one_rw(down_threshold);
+define_one_rw(ignore_nice);
=20
 static struct attribute * dbs_attributes[] =3D {
 	&sampling_rate_max.attr,
@@ -209,6 +252,7 @@
 	&sampling_down_factor.attr,
 	&up_threshold.attr,
 	&down_threshold.attr,
+	&ignore_nice.attr,
 	NULL
 };
=20
@@ -253,6 +297,9 @@
 	/* Check for frequency increase */
 	total_idle_ticks =3D kstat_cpu(cpu).cpustat.idle +
 		kstat_cpu(cpu).cpustat.iowait;
+	  /* consider 'nice' tasks as 'idle' time too if required */
+	  if (dbs_tuners_ins.ignore_nice =3D=3D 0)
+		total_idle_ticks +=3D kstat_cpu(cpu).cpustat.nice;
 	idle_ticks =3D total_idle_ticks -
 		this_dbs_info->prev_cpu_idle_up;
 	this_dbs_info->prev_cpu_idle_up =3D total_idle_ticks;
@@ -269,6 +316,9 @@
 		/* Check for frequency increase */
 		total_idle_ticks =3D kstat_cpu(j).cpustat.idle +
 			kstat_cpu(j).cpustat.iowait;
+		  /* consider 'nice' too? */
+		  if (dbs_tuners_ins.ignore_nice =3D=3D 0)
+			   total_idle_ticks +=3D kstat_cpu(j).cpustat.nice;
 		tmp_idle_ticks =3D total_idle_ticks -
 			j_dbs_info->prev_cpu_idle_up;
 		j_dbs_info->prev_cpu_idle_up =3D total_idle_ticks;
@@ -297,6 +347,9 @@
=20
 	total_idle_ticks =3D kstat_cpu(cpu).cpustat.idle +
 		kstat_cpu(cpu).cpustat.iowait;
+	  /* consider 'nice' too? */
+	  if (dbs_tuners_ins.ignore_nice =3D=3D 0)
+		  total_idle_ticks +=3D kstat_cpu(cpu).cpustat.nice;
 	idle_ticks =3D total_idle_ticks -
 		this_dbs_info->prev_cpu_idle_down;
 	this_dbs_info->prev_cpu_idle_down =3D total_idle_ticks;
@@ -312,6 +365,9 @@
 		/* Check for frequency increase */
 		total_idle_ticks =3D kstat_cpu(j).cpustat.idle +
 			kstat_cpu(j).cpustat.iowait;
+		  /* consider 'nice' too? */
+		  if (dbs_tuners_ins.ignore_nice =3D=3D 0)
+			total_idle_ticks +=3D kstat_cpu(j).cpustat.nice;
 		tmp_idle_ticks =3D total_idle_ticks -
 			j_dbs_info->prev_cpu_idle_down;
 		j_dbs_info->prev_cpu_idle_down =3D total_idle_ticks;
@@ -397,10 +453,11 @@
 	=09
 			j_dbs_info->prev_cpu_idle_up =3D=20
 				kstat_cpu(j).cpustat.idle +
-				kstat_cpu(j).cpustat.iowait;
-			j_dbs_info->prev_cpu_idle_down =3D=20
-				kstat_cpu(j).cpustat.idle +
-				kstat_cpu(j).cpustat.iowait;
+				kstat_cpu(j).cpustat.iowait +
+				( !dbs_tuners_ins.ignore_nice
+				  ? kstat_cpu(j).cpustat.nice : 0 );
+			j_dbs_info->prev_cpu_idle_down
+				=3D j_dbs_info->prev_cpu_idle_up;
 		}
 		this_dbs_info->enable =3D 1;
 		sysfs_create_group(&policy->kobj, &dbs_attr_group);
@@ -420,6 +477,7 @@
 			def_sampling_rate =3D (latency / 1000) *
 					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
 			dbs_tuners_ins.sampling_rate =3D def_sampling_rate;
+			dbs_tuners_ins.ignore_nice =3D 0;
=20
 			dbs_timer_init();
 		}

--wac7ysb48OaltWcw--

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCgTYHNv5Ugh/sRBYRAtHnAJ0fS5wvvJ40eLyPh12w5Bioxz+y5gCgmlaq
eHhyGxMFqx6TbWDOZqhlt+8=
=/XAj
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--


--===============2110512712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============2110512712==--

