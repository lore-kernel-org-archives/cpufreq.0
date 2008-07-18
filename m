From: =?ISO-8859-1?Q?Adam_Engstr=F6m?= <ae@lysator.liu.se>
Subject: [PATCH] Set min and max frequencies
Date: Fri, 18 Jul 2008 18:38:48 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807181817530.16435@mustang.lysator.liu.se>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-326989314-1000672610-1216399128=:16435"
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk
Cc: davej@codemonkey.org.uk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---326989314-1000672610-1216399128=:16435
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hello!

This patch fixes a bug with that the scaling min and max frequencies are=20
not set when they are not entirely correctly specified. For example=20
setting max frequency to 500000 when that frequency is 500040 according to=
=20
the frequency table.

Index: cpufreq.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /usr/local/cvsroot/cpufreq/cpufreq.c,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -r1.1 -r1.2
--- cpufreq.c=0916 Jul 2008 22:01:23 -0000=091.1
+++ cpufreq.c=0918 Jul 2008 10:24:31 -0000=091.2
@@ -1625,6 +1625,11 @@
 =09memcpy(&policy->cpuinfo, &data->cpuinfo,
 =09=09=09=09sizeof(struct cpufreq_cpuinfo));
=20
+=09if (policy->max < data->min)
+=09=09policy->max =3D data->min;
+=09if (policy->min > data->max)
+=09=09policy->min =3D data->max;
+
 =09if (policy->min > data->max || policy->max < data->min) {
 =09=09ret =3D -EINVAL;
 =09=09goto error_out;

And here is a second patch that makes sure that all values are accepted.

Index: freq_table.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /usr/local/cvsroot/cpufreq/freq_table.c,v
retrieving revision 1.1
retrieving revision 1.5
diff -u -r1.1 -r1.5
--- freq_table.c=0916 Jul 2008 22:01:23 -0000=091.1
+++ freq_table.c=0918 Jul 2008 10:24:31 -0000=091.5
@@ -120,6 +120,26 @@
 =09if (!cpu_online(policy->cpu))
 =09=09return -EINVAL;
=20
+=09/* Make sure to catch corner cases such as specifying a target
+=09   max and min that both are below the physical min
+=09   frequency. */
+=09unsigned int max =3D 0;
+=09unsigned int min =3D ~0;
+=09for (i=3D0; (table[i].frequency !=3D CPUFREQ_TABLE_END); i++) {
+=09=09unsigned int freq =3D table[i].frequency;
+=09=09if (freq =3D=3D CPUFREQ_ENTRY_INVALID)
+=09=09=09continue;
+
+=09=09if (freq < min)
+=09=09=09min =3D freq;
+=09=09if (freq > max)
+=09=09=09max =3D freq;
+=09}
+=09if (policy->min < min)
+=09=09policy->min =3D min;
+=09if (policy->max > max)
+=09=09policy->max =3D max;
+
 =09for (i=3D0; (table[i].frequency !=3D CPUFREQ_TABLE_END); i++) {
 =09=09unsigned int freq =3D table[i].frequency;
 =09=09if (freq =3D=3D CPUFREQ_ENTRY_INVALID)


Best regards,
Adam Engstr=F6m
---326989314-1000672610-1216399128=:16435
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

---326989314-1000672610-1216399128=:16435--

