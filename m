From: Dominik Brodowski <linux@brodo.de>
Subject: [RFC] remove special-handling of longrun
Date: Tue, 4 Nov 2003 22:30:15 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031104213015.GA7175@brodo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============41680804664462445=="
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk


--===============41680804664462445==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Note: this is definitely nothing for 2.6.0-testX]

- Remove the current ->setpolicy implementation.
- A cpufreq driver should be able to define a=20
	->target function if the CPU can be set to a specific operating frequency,
  or a  ->range  function if the CPU can be set to an area of operating
		 frequencies, where the CPU decides on its own which one to
		 chose.
- Also "->target" CPUfreq implementations may be able to provide a generic
  "economy" / "performance" / "burst" / ... mode, and such setting is best
  done as an extra sysfs parameter. So, move the longrun operating mode
  setting to such an extra sysfs file.

	Dominik


diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/longrun.c linux/arch/=
i386/kernel/cpu/cpufreq/longrun.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/longrun.c	2003-11-04 15:27:=
33.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/longrun.c	2003-11-04 21:08:43.000000=
000 +0100
@@ -16,8 +16,6 @@
 #include <asm/processor.h>
 #include <asm/timex.h>
=20
-static struct cpufreq_driver	longrun_driver;
-
 /**
  * longrun_{low,high}_freq is needed for the conversion of cpufreq kHz=20
  * values into per cent values. In TMTA microcode, the following is valid:
@@ -30,19 +28,12 @@
  * longrun_get_policy - get the current LongRun policy
  * @policy: struct cpufreq_policy where current policy is written into
  *
- * Reads the current LongRun policy by access to MSR_TMTA_LONGRUN_FLAGS
- * and MSR_TMTA_LONGRUN_CTRL
+ * Reads the current LongRun policy by access to MSR_TMTA_LONGRUN_CTRL
  */
 static void longrun_get_policy(struct cpufreq_policy *policy)
 {
 	u32 msr_lo, msr_hi;
=20
-	rdmsr(MSR_TMTA_LONGRUN_FLAGS, msr_lo, msr_hi);
-	if (msr_lo & 0x01)
-		policy->policy =3D CPUFREQ_POLICY_PERFORMANCE;
-	else
-		policy->policy =3D CPUFREQ_POLICY_POWERSAVE;
-=09
 	rdmsr(MSR_TMTA_LONGRUN_CTRL, msr_lo, msr_hi);
 	msr_lo &=3D 0x0000007F;
 	msr_hi &=3D 0x0000007F;
@@ -80,18 +71,6 @@
 	if (pctg_lo > pctg_hi)
 		pctg_lo =3D pctg_hi;
=20
-	/* performance or economy mode */
-	rdmsr(MSR_TMTA_LONGRUN_FLAGS, msr_lo, msr_hi);
-	msr_lo &=3D 0xFFFFFFFE;
-	switch (policy->policy) {
-	case CPUFREQ_POLICY_PERFORMANCE:
-		msr_lo |=3D 0x00000001;
-		break;
-	case CPUFREQ_POLICY_POWERSAVE:
-		break;
-	}
-	wrmsr(MSR_TMTA_LONGRUN_FLAGS, msr_lo, msr_hi);
-
 	/* lower and upper boundary */
 	rdmsr(MSR_TMTA_LONGRUN_CTRL, msr_lo, msr_hi);
 	msr_lo &=3D 0xFFFFFF80;
@@ -112,18 +91,13 @@
  */
 static int longrun_verify_policy(struct cpufreq_policy *policy)
 {
-	if (!policy)
+	if (!policy || !(policy->cpu !=3D 0))
 		return -EINVAL;
=20
-	policy->cpu =3D 0;
 	cpufreq_verify_within_limits(policy,=20
 		policy->cpuinfo.min_freq,=20
 		policy->cpuinfo.max_freq);
=20
-	if ((policy->policy !=3D CPUFREQ_POLICY_POWERSAVE) &&
-	    (policy->policy !=3D CPUFREQ_POLICY_PERFORMANCE))
-		return -EINVAL;
-
 	return 0;
 }
=20
@@ -243,12 +217,69 @@
 }
=20
=20
+/*
+ * The TMTA CPU can be put into two modes: economy mode or
+ * performance mode.
+ */
+
+static ssize_t show_longrun_mode (struct cpufreq_policy *policy, char *buf)
+{
+
+	u32 msr_lo, msr_hi;
+
+	rdmsr(MSR_TMTA_LONGRUN_FLAGS, msr_lo, msr_hi);
+	if (msr_lo & 0x01)
+		return sprintf(buf, "performance\n");
+	else
+		return sprintf(buf, "economy\n");
+}
+
+static ssize_t store_longrun_mode (struct cpufreq_policy * policy,=20
+				   const char *buf, size_t count)=20
+{
+	u32 mode =3D 0xFF;
+	u32 msr_lo, msr_hi;
+
+	if (count < 7)
+		return -EINVAL;
+
+	if (!strnicmp(buf,"performance",7))
+		mode =3D 0x01;
+	if (!strnicmp(buf,"economy",7))
+		mode =3D 0x00;
+
+	if (mode =3D=3D 0xFF)
+		return -EINVAL;
+
+	rdmsr(MSR_TMTA_LONGRUN_FLAGS, msr_lo, msr_hi);
+
+	msr_lo &=3D 0xFFFFFFFE;
+	msr_lo |=3D mode;
+
+	wrmsr(MSR_TMTA_LONGRUN_FLAGS, msr_lo, msr_hi);
+
+	return count;
+}
+
+
+struct freq_attr longrun_mode_attr =3D {
+	.attr =3D { .name =3D "lognrun_mode", .mode =3D 0644 },
+	.show =3D show_longrun_mode,
+	.store =3D store_longrun_mode,
+};
+
+static struct freq_attr* longrun_attr[] =3D {
+	&longrun_mode_attr,
+	NULL,
+};
+
 static struct cpufreq_driver longrun_driver =3D {
 	.verify 	=3D longrun_verify_policy,
-	.setpolicy 	=3D longrun_set_policy,
+	.range		=3D longrun_set_policy,
 	.init		=3D longrun_cpu_init,
 	.name		=3D "longrun",
 	.owner		=3D THIS_MODULE,
+	.attr		=3D longrun_attr,
 };
=20
=20
diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cp=
ufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2003-11-04 15:27:37.000000000 =
+0100
+++ linux/drivers/cpufreq/cpufreq.c	2003-11-04 22:20:20.224386984 +0100
@@ -105,35 +105,28 @@
 /**
  * cpufreq_parse_governor - parse a governor string
  */
-int cpufreq_parse_governor (char *str_governor, unsigned int *policy,
-				struct cpufreq_governor **governor)
+int cpufreq_parse_governor (char *str_governor,=20
+struct cpufreq_governor **governor)
 {
+	struct cpufreq_governor *t;
+
 	if (!cpufreq_driver)
 		return -EINVAL;
-	if (cpufreq_driver->setpolicy) {
-		if (!strnicmp(str_governor, "performance", CPUFREQ_NAME_LEN)) {
-			*policy =3D CPUFREQ_POLICY_PERFORMANCE;
-			return 0;
-		} else if (!strnicmp(str_governor, "powersave", CPUFREQ_NAME_LEN)) {
-			*policy =3D CPUFREQ_POLICY_POWERSAVE;
+
+	if (cpufreq_driver->range) {
+		*governor =3D NULL;
+		return 0;
+	}
+
+	down(&cpufreq_governor_sem);
+	list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
+		if (!strnicmp(str_governor,t->name,CPUFREQ_NAME_LEN)) {
+			*governor =3D t;
+			up(&cpufreq_governor_sem);
 			return 0;
 		}
-		return -EINVAL;
-	} else {
-		struct cpufreq_governor *t;
-		down(&cpufreq_governor_sem);
-		if (!cpufreq_driver || !cpufreq_driver->target)
-			goto out;
-		list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
-			if (!strnicmp(str_governor,t->name,CPUFREQ_NAME_LEN)) {
-				*governor =3D t;
-				up(&cpufreq_governor_sem);
-				return 0;
-			}
-		}
-	out:
-		up(&cpufreq_governor_sem);
 	}
+	up(&cpufreq_governor_sem);
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(cpufreq_parse_governor);
@@ -193,11 +186,7 @@
  */
 static ssize_t show_scaling_governor (struct cpufreq_policy * policy, char=
 *buf)
 {
-	if(policy->policy =3D=3D CPUFREQ_POLICY_POWERSAVE)
-		return sprintf(buf, "powersave\n");
-	else if (policy->policy =3D=3D CPUFREQ_POLICY_PERFORMANCE)
-		return sprintf(buf, "performance\n");
-	else if (policy->governor)
+	if (policy->governor)
 		return snprintf(buf, CPUFREQ_NAME_LEN, "%s\n", policy->governor->name);
 	return -EINVAL;
 }
@@ -221,7 +210,7 @@
 	if (ret !=3D 1)
 		return -EINVAL;
=20
-	if (cpufreq_parse_governor(str_governor, &new_policy.policy, &new_policy.=
governor))
+	if (cpufreq_parse_governor(str_governor, &new_policy.governor))
 		return -EINVAL;
=20
 	ret =3D cpufreq_set_policy(&new_policy);
@@ -246,11 +235,6 @@
 	ssize_t i =3D 0;
 	struct cpufreq_governor *t;
=20
-	if (!cpufreq_driver->target) {
-		i +=3D sprintf(buf, "performance powersave");
-		goto out;
-	}
-
 	list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
 		if (i >=3D (ssize_t) ((PAGE_SIZE / sizeof(char)) - (CPUFREQ_NAME_LEN + 2=
)))
 			goto out;
@@ -288,9 +272,7 @@
 	&cpuinfo_max_freq.attr,
 	&scaling_min_freq.attr,
 	&scaling_max_freq.attr,
-	&scaling_governor.attr,
 	&scaling_driver.attr,
-	&scaling_available_governors.attr,
 	NULL
 };
=20
@@ -387,6 +369,11 @@
 		goto err_out;
=20
 	/* set up files for this cpu device */
+	if (cpufreq_driver->target) {
+		sysfs_create_file(&policy->kobj, &scaling_governor.attr);
+		sysfs_create_file(&policy->kobj, &scaling_available_governors.attr);
+	}
+
 	drv_attr =3D cpufreq_driver->attr;
 	while ((drv_attr) && (*drv_attr)) {
 		sysfs_create_file(&policy->kobj, &((*drv_attr)->attr));
@@ -501,8 +488,8 @@
 		goto out;
 	}
=20
-	if (cpufreq_driver->setpolicy)
-		ret =3D cpufreq_driver->setpolicy(cpu_policy);
+	if (cpufreq_driver->range)
+		ret =3D cpufreq_driver->range(cpu_policy);
 	else
 	/* CPUFREQ_RELATION_H or CPUFREQ_RELATION_L have the same effect here, as=
 cpu_policy->cur is known
 	 * to be a valid and exact target frequency
@@ -782,9 +769,8 @@
 	data->min    =3D policy->min;
 	data->max    =3D policy->max;
=20
-	if (cpufreq_driver->setpolicy) {
-		data->policy =3D policy->policy;
-		ret =3D cpufreq_driver->setpolicy(policy);
+	if (cpufreq_driver->range) {
+		ret =3D cpufreq_driver->range(policy);
 	} else {
 		if (policy->governor !=3D data->governor) {
 			/* save old, working values */
@@ -838,7 +824,6 @@
 	ret =3D __cpufreq_set_policy(data, policy);
 	data->user_policy.min =3D data->min;
 	data->user_policy.max =3D data->max;
-	data->user_policy.policy =3D data->policy;
 	data->user_policy.governor =3D data->governor;
=20
 	up(&data->lock);
@@ -872,7 +857,6 @@
 	       sizeof(struct cpufreq_policy));
 	policy.min =3D data->user_policy.min;
 	policy.max =3D data->user_policy.max;
-	policy.policy =3D data->user_policy.policy;
 	policy.governor =3D data->user_policy.governor;
=20
 	ret =3D __cpufreq_set_policy(data, &policy);
@@ -965,7 +949,7 @@
 	unsigned long flags;
=20
 	if (!driver_data || !driver_data->verify || !driver_data->init ||
-	    ((!driver_data->setpolicy) && (!driver_data->target)))
+	    ((!driver_data->range) && (!driver_data->target)))
 		return -EINVAL;
=20
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
diff -ruN linux-original/drivers/cpufreq/proc_intf.c linux/drivers/cpufreq/=
proc_intf.c
--- linux-original/drivers/cpufreq/proc_intf.c	2003-11-04 15:27:37.00000000=
0 +0100
+++ linux/drivers/cpufreq/proc_intf.c	2003-11-04 22:22:57.206522072 +0100
@@ -39,7 +39,6 @@
=20
 	policy->min =3D 0;
 	policy->max =3D 0;
-	policy->policy =3D 0;
 	policy->cpu =3D CPUFREQ_ALL_CPUS;
=20
 	if (sscanf(input_string, "%d:%d:%d:%15s", &cpu, &min, &max, str_governor)=
 =3D=3D 4)=20
@@ -82,7 +81,7 @@
 	return -EINVAL;
=20
 scan_policy:
-	result =3D cpufreq_parse_governor(str_governor, &policy->policy, &policy-=
>governor);
+	result =3D cpufreq_parse_governor(str_governor, &policy->governor);
=20
 	return result;
 }
@@ -126,19 +125,7 @@
=20
 		p +=3D sprintf(p, "CPU%3d    %9d kHz (%3d %%)  -  %9d kHz (%3d %%)  -  ",
 			     i , policy.min, min_pctg, policy.max, max_pctg);
-		if (policy.policy) {
-			switch (policy.policy) {
-				case CPUFREQ_POLICY_POWERSAVE:
-				p +=3D sprintf(p, "powersave\n");
-				break;=09
-			case CPUFREQ_POLICY_PERFORMANCE:
-				p +=3D sprintf(p, "performance\n");
-				break;
-			default:
-				p +=3D sprintf(p, "INVALID\n");
-				break;
-			}=20
-		} else
+		if (policy.governor)
 			p +=3D snprintf(p, CPUFREQ_NAME_LEN, "%s\n", policy.governor->name);
 	}
 end:
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufre=
q.h
--- linux-original/include/linux/cpufreq.h	2003-11-04 17:02:06.000000000 +0=
100
+++ linux/include/linux/cpufreq.h	2003-11-04 22:19:11.908772536 +0100
@@ -37,12 +37,7 @@
=20
=20
 /* if (cpufreq_driver->target) exists, the ->governor decides what frequen=
cy
- * within the limits is used. If (cpufreq_driver->setpolicy> exists, these
- * two generic policies are available:
- */
-
-#define CPUFREQ_POLICY_POWERSAVE	(1)
-#define CPUFREQ_POLICY_PERFORMANCE	(2)
+ * within the limits is used.  */
=20
 /* Frequency values here are CPU kHz so that hardware which doesn't run=20
  * with some frequencies can complain without having to guess what per=20
@@ -63,7 +58,6 @@
 struct cpufreq_real_policy {
 	unsigned int		min;    /* in kHz */
 	unsigned int		max;    /* in kHz */
-        unsigned int		policy; /* see above */
 	struct cpufreq_governor	*governor; /* see below */
 };
=20
@@ -73,12 +67,12 @@
=20
 	unsigned int		min;    /* in kHz */
 	unsigned int		max;    /* in kHz */
-	unsigned int		cur;    /* in kHz, only needed if cpufreq
-					 * governors are used */
-        unsigned int		policy; /* see above */
+
+	/* the following two entries are only valid if ->target is used */
+	unsigned int		cur;    /* in kHz */
 	struct cpufreq_governor	*governor; /* see below */
=20
- 	struct semaphore	lock;   /* CPU ->setpolicy or ->target may
+ 	struct semaphore	lock;   /* CPU ->range or ->target may
 					   only be called once a time */
=20
 	struct cpufreq_real_policy	user_policy;
@@ -181,7 +175,7 @@
 	int	(*verify)	(struct cpufreq_policy *policy);
=20
 	/* define one out of two */
-	int	(*setpolicy)	(struct cpufreq_policy *policy);
+	int	(*range)	(struct cpufreq_policy *policy);
 	int	(*target)	(struct cpufreq_policy *policy,
 				 unsigned int target_freq,
 				 unsigned int relation);
@@ -229,7 +223,7 @@
 int cpufreq_update_policy(unsigned int cpu);
=20
 /* the proc_intf.c needs this */
-int cpufreq_parse_governor (char *str_governor, unsigned int *policy, stru=
ct cpufreq_governor **governor);
+int cpufreq_parse_governor (char *str_governor, struct cpufreq_governor **=
governor);
=20
 #if defined(CONFIG_CPU_FREQ_GOV_USERSPACE) || defined(CONFIG_CPU_FREQ_GOV_=
USERSPACE_MODULE)
 /*********************************************************************

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/qBpmZ8MDCHJbN8YRAmCYAJ935yVB71DaJd3h2lazg86xb1Pd0ACeJxov
S8g/cLl7nkL+EhzNeCie52U=
=BI3S
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--


--===============41680804664462445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============41680804664462445==--

