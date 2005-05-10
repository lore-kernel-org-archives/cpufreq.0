From: Alexander Clouter <alex@digriz.org.uk>
Subject: [PATCH] (1/1) cpufreq_conservative -
	cpufreq_conservative-2.6.12-rc3-mm3.diff
Date: Tue, 10 May 2005 23:33:46 +0100
Message-ID: <20050510223346.GE4478@inskipp>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0729746725=="
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


--===============0729746725==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Swj79WlilW4BQYVz"
Content-Disposition: inline


--Swj79WlilW4BQYVz
Content-Type: multipart/mixed; boundary="GvuyDaC2GNSBQusT"
Content-Disposition: inline


--GvuyDaC2GNSBQusT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

A new cpufreq module, based on the ondemand one with my additional patches
just posted.  This one is more suitable for battery environments where its
probably more appealing to have the cpu freq gracefully increase and decrea=
se
rather than flip between the min and max freq's.

N.B. Bruno Ducrot pointed out that the amd64's "do have unacceptable latency
between min and max freq transition, due to the step-by-step requirements
(200MHz IIRC)"; so AMD64 users would probably benefit from this too.

Signed-off-by: Alexander Clouter <alex-kernel@digriz.org.uk>

--=20
 _________________________________________=20
/ Adde parvum parvo manus acervus erit.   \
|                                         |
| [Add little to little and there will be |
| a big pile.]                            |
|                                         |
\ -- Ovid                                 /
 -----------------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--GvuyDaC2GNSBQusT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq_conservative-2.6.12-rc3-mm3.diff"
Content-Transfer-Encoding: quoted-printable

diff -N -u -d -r linux-2.6.12-rc3-mm3.orig/drivers/cpufreq/Kconfig linux-2.=
6.12-rc3-mm3/drivers/cpufreq/Kconfig
--- linux-2.6.12-rc3-mm3.orig/drivers/cpufreq/Kconfig	2005-05-10 19:38:11.3=
77638368 +0100
+++ linux-2.6.12-rc3-mm3/drivers/cpufreq/Kconfig	2005-05-10 22:27:31.978992=
176 +0100
@@ -119,4 +119,24 @@
=20
 	  If in doubt, say N.
=20
+config CPU_FREQ_GOV_CONSERVATIVE
+	tristate "'conservative' cpufreq governor"
+	depends on CPU_FREQ
+	help
+	  'conservative' - this driver is rather similar to the 'ondemand'
+	  governor both in its source code and its purpose, the difference is
+	  its optimisation for better suitability in a battery powered
+	  environment.  The frequency is gracefully increased and decreased
+	  rather than jumping to 100% when speed is required.
+
+	  If you have a desktop machine then you should really be considering
+	  the 'ondemand' governor instead, however if you are using a laptop,
+	  PDA or even an AMD64 based computer (due to the unacceptable
+	  step-by-step latency issues between the minimum and maximum frequency
+	  transitions in the CPU) you will probably want to use this governor.
+
+	  For details, take a look at linux/Documentation/cpu-freq.
+
+	  If in doubt, say N.
+
 endif	# CPU_FREQ
diff -N -u -d -r linux-2.6.12-rc3-mm3.orig/drivers/cpufreq/Makefile linux-2=
=2E6.12-rc3-mm3/drivers/cpufreq/Makefile
--- linux-2.6.12-rc3-mm3.orig/drivers/cpufreq/Makefile	2005-05-10 19:38:11.=
297650528 +0100
+++ linux-2.6.12-rc3-mm3/drivers/cpufreq/Makefile	2005-05-10 22:27:31.97999=
2024 +0100
@@ -8,6 +8,7 @@
 obj-$(CONFIG_CPU_FREQ_GOV_POWERSAVE)	+=3D cpufreq_powersave.o
 obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+=3D cpufreq_userspace.o
 obj-$(CONFIG_CPU_FREQ_GOV_ONDEMAND)	+=3D cpufreq_ondemand.o
+obj-$(CONFIG_CPU_FREQ_GOV_CONSERVATIVE)	+=3D cpufreq_conservative.o
=20
 # CPUfreq cross-arch helpers
 obj-$(CONFIG_CPU_FREQ_TABLE)		+=3D freq_table.o
diff -N -u -d -r linux-2.6.12-rc3-mm3.orig/drivers/cpufreq/cpufreq_conserva=
tive.c linux-2.6.12-rc3-mm3/drivers/cpufreq/cpufreq_conservative.c
--- linux-2.6.12-rc3-mm3.orig/drivers/cpufreq/cpufreq_conservative.c	1970-0=
1-01 01:00:00.000000000 +0100
+++ linux-2.6.12-rc3-mm3/drivers/cpufreq/cpufreq_conservative.c	2005-05-10 =
23:10:53.618792920 +0100
@@ -0,0 +1,614 @@
+/*
+ *  drivers/cpufreq/cpufreq_conservative.c
+ *
+ *  Copyright (C)  2001 Russell King
+ *            (C)  2003 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com=
>.
+ *                      Jun Nakajima <jun.nakajima@intel.com>
+ *            (C)  2004 Alexander Clouter <alex-kernel@digriz.org.uk>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/smp.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/ctype.h>
+#include <linux/cpufreq.h>
+#include <linux/sysctl.h>
+#include <linux/types.h>
+#include <linux/fs.h>
+#include <linux/sysfs.h>
+#include <linux/sched.h>
+#include <linux/kmod.h>
+#include <linux/workqueue.h>
+#include <linux/jiffies.h>
+#include <linux/kernel_stat.h>
+#include <linux/percpu.h>
+
+/*
+ * dbs is used in this file as a shortform for demandbased switching
+ * It helps to keep variable names smaller, simpler
+ */
+
+#define DEF_FREQUENCY_UP_THRESHOLD		(80)
+#define MIN_FREQUENCY_UP_THRESHOLD		(0)
+#define MAX_FREQUENCY_UP_THRESHOLD		(100)
+
+#define DEF_FREQUENCY_DOWN_THRESHOLD		(20)
+#define MIN_FREQUENCY_DOWN_THRESHOLD		(0)
+#define MAX_FREQUENCY_DOWN_THRESHOLD		(100)
+
+/*=20
+ * The polling frequency of this governor depends on the capability of=20
+ * the processor. Default polling frequency is 1000 times the transition
+ * latency of the processor. The governor will work on any processor with=
=20
+ * transition latency <=3D 10mS, using appropriate sampling=20
+ * rate.
+ * For CPUs with transition latency > 10mS (mostly drivers with CPUFREQ_ET=
ERNAL)
+ * this governor will not work.
+ * All times here are in uS.
+ */
+static unsigned int 				def_sampling_rate;
+#define MIN_SAMPLING_RATE			(def_sampling_rate / 2)
+#define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
+#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(100000)
+#define DEF_SAMPLING_DOWN_FACTOR		(5)
+#define TRANSITION_LATENCY_LIMIT		(10 * 1000)
+
+static void do_dbs_timer(void *data);
+
+struct cpu_dbs_info_s {
+	struct cpufreq_policy 	*cur_policy;
+	unsigned int 		prev_cpu_idle_up;
+	unsigned int 		prev_cpu_idle_down;
+	unsigned int 		enable;
+};
+static DEFINE_PER_CPU(struct cpu_dbs_info_s, cpu_dbs_info);
+
+static unsigned int dbs_enable;	/* number of CPUs using this policy */
+
+static DECLARE_MUTEX 	(dbs_sem);
+static DECLARE_WORK	(dbs_work, do_dbs_timer, NULL);
+
+struct dbs_tuners {
+	unsigned int 		sampling_rate;
+	unsigned int		sampling_down_factor;
+	unsigned int		up_threshold;
+	unsigned int		down_threshold;
+	unsigned int		ignore_nice;
+	unsigned int		freq_step;
+};
+
+static struct dbs_tuners dbs_tuners_ins =3D {
+	.up_threshold 		=3D DEF_FREQUENCY_UP_THRESHOLD,
+	.down_threshold 	=3D DEF_FREQUENCY_DOWN_THRESHOLD,
+	.sampling_down_factor 	=3D DEF_SAMPLING_DOWN_FACTOR,
+};
+
+/************************** sysfs interface ************************/
+static ssize_t show_sampling_rate_max(struct cpufreq_policy *policy, char =
*buf)
+{
+	return sprintf (buf, "%u\n", MAX_SAMPLING_RATE);
+}
+
+static ssize_t show_sampling_rate_min(struct cpufreq_policy *policy, char =
*buf)
+{
+	return sprintf (buf, "%u\n", MIN_SAMPLING_RATE);
+}
+
+#define define_one_ro(_name) 					\
+static struct freq_attr _name =3D  				\
+__ATTR(_name, 0444, show_##_name, NULL)
+
+define_one_ro(sampling_rate_max);
+define_one_ro(sampling_rate_min);
+
+/* cpufreq_conservative Governor Tunables */
+#define show_one(file_name, object)					\
+static ssize_t show_##file_name						\
+(struct cpufreq_policy *unused, char *buf)				\
+{									\
+	return sprintf(buf, "%u\n", dbs_tuners_ins.object);		\
+}
+show_one(sampling_rate, sampling_rate);
+show_one(sampling_down_factor, sampling_down_factor);
+show_one(up_threshold, up_threshold);
+show_one(down_threshold, down_threshold);
+show_one(ignore_nice, ignore_nice);
+show_one(freq_step, freq_step);
+
+static ssize_t store_sampling_down_factor(struct cpufreq_policy *unused,=
=20
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+	ret =3D sscanf (buf, "%u", &input);
+	if (ret !=3D 1 )
+		return -EINVAL;
+
+	down(&dbs_sem);
+	dbs_tuners_ins.sampling_down_factor =3D input;
+	up(&dbs_sem);
+
+	return count;
+}
+
+static ssize_t store_sampling_rate(struct cpufreq_policy *unused,=20
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+	ret =3D sscanf (buf, "%u", &input);
+
+	down(&dbs_sem);
+	if (ret !=3D 1 || input > MAX_SAMPLING_RATE || input < MIN_SAMPLING_RATE)=
 {
+		up(&dbs_sem);
+		return -EINVAL;
+	}
+
+	dbs_tuners_ins.sampling_rate =3D input;
+	up(&dbs_sem);
+
+	return count;
+}
+
+static ssize_t store_up_threshold(struct cpufreq_policy *unused,=20
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+	ret =3D sscanf (buf, "%u", &input);
+
+	down(&dbs_sem);
+	if (ret !=3D 1 || input > MAX_FREQUENCY_UP_THRESHOLD ||=20
+			input < MIN_FREQUENCY_UP_THRESHOLD ||
+			input <=3D dbs_tuners_ins.down_threshold) {
+		up(&dbs_sem);
+		return -EINVAL;
+	}
+
+	dbs_tuners_ins.up_threshold =3D input;
+	up(&dbs_sem);
+
+	return count;
+}
+
+static ssize_t store_down_threshold(struct cpufreq_policy *unused,=20
+		const char *buf, size_t count)
+{
+	unsigned int input;
+	int ret;
+	ret =3D sscanf (buf, "%u", &input);
+
+	down(&dbs_sem);
+	if (ret !=3D 1 || input > MAX_FREQUENCY_DOWN_THRESHOLD ||=20
+			input < MIN_FREQUENCY_DOWN_THRESHOLD ||
+			input >=3D dbs_tuners_ins.up_threshold) {
+		up(&dbs_sem);
+		return -EINVAL;
+	}
+
+	dbs_tuners_ins.down_threshold =3D input;
+	up(&dbs_sem);
+
+	return count;
+}
+
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
+#define define_one_rw(_name) \
+static struct freq_attr _name =3D \
+__ATTR(_name, 0644, show_##_name, store_##_name)
+
+define_one_rw(sampling_rate);
+define_one_rw(sampling_down_factor);
+define_one_rw(up_threshold);
+define_one_rw(down_threshold);
+define_one_rw(ignore_nice);
+define_one_rw(freq_step);
+
+static struct attribute * dbs_attributes[] =3D {
+	&sampling_rate_max.attr,
+	&sampling_rate_min.attr,
+	&sampling_rate.attr,
+	&sampling_down_factor.attr,
+	&up_threshold.attr,
+	&down_threshold.attr,
+	&ignore_nice.attr,
+	&freq_step.attr,
+	NULL
+};
+
+static struct attribute_group dbs_attr_group =3D {
+	.attrs =3D dbs_attributes,
+	.name =3D "conservative",
+};
+
+/************************** sysfs end ************************/
+
+static void dbs_check_cpu(int cpu)
+{
+	unsigned int idle_ticks, up_idle_ticks, down_idle_ticks;
+	unsigned int total_idle_ticks;
+	unsigned int freq_step;
+	unsigned int freq_down_sampling_rate;
+	static int down_skip[NR_CPUS];
+	static int requested_freq[NR_CPUS];
+	static unsigned short init_flag =3D 0;
+	struct cpu_dbs_info_s *this_dbs_info;
+	struct cpu_dbs_info_s *dbs_info;
+
+	struct cpufreq_policy *policy;
+	unsigned int j;
+
+	this_dbs_info =3D &per_cpu(cpu_dbs_info, cpu);
+	if (!this_dbs_info->enable)
+		return;
+
+	policy =3D this_dbs_info->cur_policy;
+
+	if ( init_flag =3D=3D 0 ) {
+		for ( /* NULL */; init_flag < NR_CPUS; init_flag++ ) {
+			dbs_info =3D &per_cpu(cpu_dbs_info, init_flag);
+			requested_freq[cpu] =3D dbs_info->cur_policy->cur;
+		}
+		init_flag =3D 1;
+	}
+=09
+	/*=20
+	 * The default safe range is 20% to 80%=20
+	 * Every sampling_rate, we check
+	 * 	- If current idle time is less than 20%, then we try to=20
+	 * 	  increase frequency
+	 * Every sampling_rate*sampling_down_factor, we check
+	 * 	- If current idle time is more than 80%, then we try to
+	 * 	  decrease frequency
+	 *
+	 * Any frequency increase takes it to the maximum frequency.=20
+	 * Frequency reduction happens at minimum steps of=20
+	 * 5% (default) of max_frequency=20
+	 */
+
+	/* Check for frequency increase */
+	total_idle_ticks =3D kstat_cpu(cpu).cpustat.idle +
+		kstat_cpu(cpu).cpustat.iowait;
+	  /* consider 'nice' tasks as 'idle' time too if required */
+	  if (dbs_tuners_ins.ignore_nice =3D=3D 0)
+		total_idle_ticks +=3D kstat_cpu(cpu).cpustat.nice;
+	idle_ticks =3D total_idle_ticks -
+		this_dbs_info->prev_cpu_idle_up;
+	this_dbs_info->prev_cpu_idle_up =3D total_idle_ticks;
+=09
+
+	for_each_cpu_mask(j, policy->cpus) {
+		unsigned int tmp_idle_ticks;
+		struct cpu_dbs_info_s *j_dbs_info;
+
+		if (j =3D=3D cpu)
+			continue;
+
+		j_dbs_info =3D &per_cpu(cpu_dbs_info, j);
+		/* Check for frequency increase */
+		total_idle_ticks =3D kstat_cpu(j).cpustat.idle +
+			kstat_cpu(j).cpustat.iowait;
+		  /* consider 'nice' too? */
+		  if (dbs_tuners_ins.ignore_nice =3D=3D 0)
+			   total_idle_ticks +=3D kstat_cpu(j).cpustat.nice;
+		tmp_idle_ticks =3D total_idle_ticks -
+			j_dbs_info->prev_cpu_idle_up;
+		j_dbs_info->prev_cpu_idle_up =3D total_idle_ticks;
+
+		if (tmp_idle_ticks < idle_ticks)
+			idle_ticks =3D tmp_idle_ticks;
+	}
+
+	/* Scale idle ticks by 100 and compare with up and down ticks */
+	idle_ticks *=3D 100;
+	up_idle_ticks =3D (100 - dbs_tuners_ins.up_threshold) *
+		usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
+
+	if (idle_ticks < up_idle_ticks) {
+		/* if we are already at full speed then break out early */
+		if (requested_freq[cpu] =3D=3D policy->max)
+			return;
+	=09
+		freq_step =3D (dbs_tuners_ins.freq_step * policy->max) / 100;
+
+		/* max freq cannot be less than 100. But who knows.... */
+		if (unlikely(freq_step =3D=3D 0))
+			freq_step =3D 5;
+	=09
+		requested_freq[cpu] +=3D freq_step;
+		if (requested_freq[cpu] > policy->max)
+			requested_freq[cpu] =3D policy->max;
+
+		__cpufreq_driver_target(policy, requested_freq[cpu],=20
+			CPUFREQ_RELATION_H);
+		down_skip[cpu] =3D 0;
+		this_dbs_info->prev_cpu_idle_down =3D total_idle_ticks;
+		return;
+	}
+
+	/* Check for frequency decrease */
+	down_skip[cpu]++;
+	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
+		return;
+
+	total_idle_ticks =3D kstat_cpu(cpu).cpustat.idle +
+		kstat_cpu(cpu).cpustat.iowait;
+	  /* consider 'nice' too? */
+	  if (dbs_tuners_ins.ignore_nice =3D=3D 0)
+		  total_idle_ticks +=3D kstat_cpu(cpu).cpustat.nice;
+	idle_ticks =3D total_idle_ticks -
+		this_dbs_info->prev_cpu_idle_down;
+	this_dbs_info->prev_cpu_idle_down =3D total_idle_ticks;
+
+	for_each_cpu_mask(j, policy->cpus) {
+		unsigned int tmp_idle_ticks;
+		struct cpu_dbs_info_s *j_dbs_info;
+
+		if (j =3D=3D cpu)
+			continue;
+
+		j_dbs_info =3D &per_cpu(cpu_dbs_info, j);
+		/* Check for frequency increase */
+		total_idle_ticks =3D kstat_cpu(j).cpustat.idle +
+			kstat_cpu(j).cpustat.iowait;
+		  /* consider 'nice' too? */
+		  if (dbs_tuners_ins.ignore_nice =3D=3D 0)
+			total_idle_ticks +=3D kstat_cpu(j).cpustat.nice;
+		tmp_idle_ticks =3D total_idle_ticks -
+			j_dbs_info->prev_cpu_idle_down;
+		j_dbs_info->prev_cpu_idle_down =3D total_idle_ticks;
+
+		if (tmp_idle_ticks < idle_ticks)
+			idle_ticks =3D tmp_idle_ticks;
+	}
+
+	/* Scale idle ticks by 100 and compare with up and down ticks */
+	idle_ticks *=3D 100;
+	down_skip[cpu] =3D 0;
+
+	freq_down_sampling_rate =3D dbs_tuners_ins.sampling_rate *
+		dbs_tuners_ins.sampling_down_factor;
+	down_idle_ticks =3D (100 - dbs_tuners_ins.down_threshold) *
+			usecs_to_jiffies(freq_down_sampling_rate);
+
+	if (idle_ticks > down_idle_ticks ) {
+		/* if we are already at the lowest speed then break out early
+		 * or if we 'cannot' reduce the speed as the user might want
+		 * freq_step to be zero */
+		if (requested_freq[cpu] =3D=3D policy->min
+				|| dbs_tuners_ins.freq_step =3D=3D 0)
+			return;
+
+		freq_step =3D (dbs_tuners_ins.freq_step * policy->max) / 100;
+
+		/* max freq cannot be less than 100. But who knows.... */
+		if (unlikely(freq_step =3D=3D 0))
+			freq_step =3D 5;
+
+		requested_freq[cpu] -=3D freq_step;
+		if (requested_freq[cpu] < policy->min)
+			requested_freq[cpu] =3D policy->min;
+
+		__cpufreq_driver_target(policy,
+			requested_freq[cpu],
+			CPUFREQ_RELATION_H);
+		return;
+	}
+}
+
+static void do_dbs_timer(void *data)
+{=20
+	int i;
+	down(&dbs_sem);
+	for_each_online_cpu(i)
+		dbs_check_cpu(i);
+	schedule_delayed_work(&dbs_work,=20
+			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
+	up(&dbs_sem);
+}=20
+
+static inline void dbs_timer_init(void)
+{
+	INIT_WORK(&dbs_work, do_dbs_timer, NULL);
+	schedule_delayed_work(&dbs_work,
+			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
+	return;
+}
+
+static inline void dbs_timer_exit(void)
+{
+	cancel_delayed_work(&dbs_work);
+	return;
+}
+
+static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
+				   unsigned int event)
+{
+	unsigned int cpu =3D policy->cpu;
+	struct cpu_dbs_info_s *this_dbs_info;
+	unsigned int j;
+
+	this_dbs_info =3D &per_cpu(cpu_dbs_info, cpu);
+
+	switch (event) {
+	case CPUFREQ_GOV_START:
+		if ((!cpu_online(cpu)) ||=20
+		    (!policy->cur))
+			return -EINVAL;
+
+		if (policy->cpuinfo.transition_latency >
+				(TRANSITION_LATENCY_LIMIT * 1000))
+			return -EINVAL;
+		if (this_dbs_info->enable) /* Already enabled */
+			break;
+		=20
+		down(&dbs_sem);
+		for_each_cpu_mask(j, policy->cpus) {
+			struct cpu_dbs_info_s *j_dbs_info;
+			j_dbs_info =3D &per_cpu(cpu_dbs_info, j);
+			j_dbs_info->cur_policy =3D policy;
+	=09
+			j_dbs_info->prev_cpu_idle_up =3D=20
+				kstat_cpu(j).cpustat.idle +
+				kstat_cpu(j).cpustat.iowait +
+				( !dbs_tuners_ins.ignore_nice
+				  ? kstat_cpu(j).cpustat.nice : 0 );
+			j_dbs_info->prev_cpu_idle_down
+				=3D j_dbs_info->prev_cpu_idle_up;
+		}
+		this_dbs_info->enable =3D 1;
+		sysfs_create_group(&policy->kobj, &dbs_attr_group);
+		dbs_enable++;
+		/*
+		 * Start the timerschedule work, when this governor
+		 * is used for first time
+		 */
+		if (dbs_enable =3D=3D 1) {
+			unsigned int latency;
+			/* policy latency is in nS. Convert it to uS first */
+
+			latency =3D policy->cpuinfo.transition_latency;
+			if (latency < 1000)
+				latency =3D 1000;
+
+			def_sampling_rate =3D (latency / 1000) *
+					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
+			dbs_tuners_ins.sampling_rate =3D def_sampling_rate;
+			dbs_tuners_ins.ignore_nice =3D 0;
+			dbs_tuners_ins.freq_step =3D 5;
+
+			dbs_timer_init();
+		}
+	=09
+		up(&dbs_sem);
+		break;
+
+	case CPUFREQ_GOV_STOP:
+		down(&dbs_sem);
+		this_dbs_info->enable =3D 0;
+		sysfs_remove_group(&policy->kobj, &dbs_attr_group);
+		dbs_enable--;
+		/*
+		 * Stop the timerschedule work, when this governor
+		 * is used for first time
+		 */
+		if (dbs_enable =3D=3D 0)=20
+			dbs_timer_exit();
+	=09
+		up(&dbs_sem);
+
+		break;
+
+	case CPUFREQ_GOV_LIMITS:
+		down(&dbs_sem);
+		if (policy->max < this_dbs_info->cur_policy->cur)
+			__cpufreq_driver_target(
+					this_dbs_info->cur_policy,
+				       	policy->max, CPUFREQ_RELATION_H);
+		else if (policy->min > this_dbs_info->cur_policy->cur)
+			__cpufreq_driver_target(
+					this_dbs_info->cur_policy,
+				       	policy->min, CPUFREQ_RELATION_L);
+		up(&dbs_sem);
+		break;
+	}
+	return 0;
+}
+
+struct cpufreq_governor cpufreq_gov_dbs =3D {
+	.name		=3D "conservative",
+	.governor	=3D cpufreq_governor_dbs,
+	.owner		=3D THIS_MODULE,
+};
+EXPORT_SYMBOL(cpufreq_gov_dbs);
+
+static int __init cpufreq_gov_dbs_init(void)
+{
+	return cpufreq_register_governor(&cpufreq_gov_dbs);
+}
+
+static void __exit cpufreq_gov_dbs_exit(void)
+{
+	/* Make sure that the scheduled work is indeed not running */
+	flush_scheduled_work();
+
+	cpufreq_unregister_governor(&cpufreq_gov_dbs);
+}
+
+
+MODULE_AUTHOR ("Alexander Clouter <alex-kernel@digriz.org.uk>");
+MODULE_DESCRIPTION ("'cpufreq_conservative' - A dynamic cpufreq governor f=
or "
+		"Low Latency Frequency Transition capable processors "
+		"optimised for use in a battery environment");
+MODULE_LICENSE ("GPL");
+
+module_init(cpufreq_gov_dbs_init);
+module_exit(cpufreq_gov_dbs_exit);

--GvuyDaC2GNSBQusT--

--Swj79WlilW4BQYVz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCgTbKNv5Ugh/sRBYRAkWdAJ436BkJcyqjzacj4MYvxd2PnKHeXgCeKQ7C
zgh7KukCRakGe5e7YHScGkI=
=j+hX
-----END PGP SIGNATURE-----

--Swj79WlilW4BQYVz--


--===============0729746725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0729746725==--

