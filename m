From: Burelli Luca 435260/IF <burellil@dei.unipd.it>
Subject: [PATCH] cpufreq_ondemand.c: minimum frequency limit
Date: Thu, 25 Nov 2004 11:32:31 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0411251053140.12476@flora>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1567402325-261462262-1101378751=:12476"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@www.linux.org.uk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1567402325-261462262-1101378751=:12476
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,
 	I have never submitted a patch to the Linux kernel before, but I=20
would like you to consider including this one. I have added a minimum=20
frequency threshold (user-adjustable through the "min_freq_percent" entry=
=20
in the sysfs interface) for the "ondemand" CPU frequency scaling governor=
.=20
The default is minimum frequency =3D 0%, which is consistent with the=20
current behaviour.
 	I had to implement this because I found extremely annoying to=20
have a 2.8GHz box behave like a 350MHz PII just because I had stopped to=20
read a PDF page; I usually keep my min_freq_percent setting at 33.
 	This patch is based on cpufreq_ondemand.c from the 2.6.10_rc2=20
kernel, which is the latest atm. I have tested it on my P4 (non-HT) box=20
and it works good.
 	Hope I have done it in GoodStyle(TM) and that you will consider=20
the addition in future updates of your driver code (and mentioning me in=20
the changelog:). Thanks very much, best regards

Luca Burelli
--=20
burellil@dei.unipd.it
burelli@ieee.org
Ph.D. Student, Department of Information Engineering
University of Padova, ITALY

"I have seen things you people would not believe. Attack ships on fire of=
f
the shoulder of Orion.  C-beams glittering in the dark near the Tannh=E4u=
ser
Gate.  But... all those moments will be lost in time, like tears in rain.=
"
                                      (Roy Batty, from Blade Runner, 1982=
)
--



--- drivers/cpufreq/cpufreq_ondemand.orig.c	2004-11-25 11:48:35.073374216=
 +0100
+++ drivers/cpufreq/cpufreq_ondemand.c	2004-11-25 12:28:25.605958024 +010=
0
@@ -41,6 +41,8 @@
  #define MIN_FREQUENCY_DOWN_THRESHOLD		(0)
  #define MAX_FREQUENCY_DOWN_THRESHOLD		(100)

+#define DEF_MIN_FREQUENCY_PERCENT		(0)
+
  /*
   * The polling frequency of this governor depends on the capability of
   * the processor. Default polling frequency is 1000 times the transitio=
n
@@ -79,12 +81,14 @@
  	unsigned int		sampling_down_factor;
  	unsigned int		up_threshold;
  	unsigned int		down_threshold;
+	unsigned int		min_freq_percent;
  };

  static struct dbs_tuners dbs_tuners_ins =3D {
  	.up_threshold 		=3D DEF_FREQUENCY_UP_THRESHOLD,
  	.down_threshold 	=3D DEF_FREQUENCY_DOWN_THRESHOLD,
  	.sampling_down_factor 	=3D DEF_SAMPLING_DOWN_FACTOR,
+	.min_freq_percent	=3D DEF_MIN_FREQUENCY_PERCENT,
  };

  /************************** sysfs interface ************************/
@@ -116,6 +120,7 @@
  show_one(sampling_down_factor, sampling_down_factor);
  show_one(up_threshold, up_threshold);
  show_one(down_threshold, down_threshold);
+show_one(min_freq_percent, min_freq_percent);

  static ssize_t store_sampling_down_factor(struct cpufreq_policy *unused=
,
  		const char *buf, size_t count)
@@ -194,6 +199,22 @@
  	return count;
  }

+static ssize_t store_min_freq_percent(struct cpufreq_policy *unused,=20
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+	ret =3D sscanf (buf, "%u", &input);
+	if (ret !=3D 1 || input > 100 || input < 0)
+		return -EINVAL;
+=20
+	down(&dbs_sem);
+	dbs_tuners_ins.min_freq_percent =3D input;
+	up(&dbs_sem);
+=20
+	return count;
+}
+
  #define define_one_rw(_name) \
  static struct freq_attr _name =3D \
  __ATTR(_name, 0644, show_##_name, store_##_name)
@@ -202,6 +223,7 @@
  define_one_rw(sampling_down_factor);
  define_one_rw(up_threshold);
  define_one_rw(down_threshold);
+define_one_rw(min_freq_percent);

  static struct attribute * dbs_attributes[] =3D {
  	&sampling_rate_max.attr,
@@ -210,6 +232,7 @@
  	&sampling_down_factor.attr,
  	&up_threshold.attr,
  	&down_threshold.attr,
+	&min_freq_percent.attr,
  	NULL
  };

@@ -291,6 +314,12 @@
  		if (unlikely(freq_down_step =3D=3D 0))
  			freq_down_step =3D 5;

+		/* do not reduce below user specified threshold */
+		if ((this_dbs_info->cur_policy->cur - freq_down_step) <=20
+		    (dbs_tuners_ins.min_freq_percent *=20
+		     this_dbs_info->cur_policy->max) / 100)
+		    	return;
+
  		__cpufreq_driver_target(this_dbs_info->cur_policy,
  			this_dbs_info->cur_policy->cur - freq_down_step,
  			CPUFREQ_RELATION_H);
---1567402325-261462262-1101378751=:12476
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

---1567402325-261462262-1101378751=:12476--

