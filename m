From: Christian Krafft <krafft@de.ibm.com>
Subject: [Cbe-oss-dev] [Patch] Resending: cell: add spu aware cpufreq governor
Date: Mon, 28 Jan 2008 19:12:25 +0100
Message-ID: <20080128191225.092a6143@de.ibm.com>
References: <20080118171119.3faa4a6a@de.ibm.com>
	<200801192238.45636.arnd@arndb.de>
	<20080128190341.21c8fc97@de.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0849279740=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080128190341.21c8fc97@de.ibm.com>
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
To: Christian Krafft <krafft@de.ibm.com>
Cc: parabelboi@bopserverein.de, cpufreq@lists.linux.org.uk, cbe-oss-dev@ozlabs.org, Arnd Bergmann <arnd@arndb.de>

--===============0849279740==
Content-Type: multipart/signed; boundary="Sig_/3D1uVD=2Mpl3XmxR_Jzeaio";
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_/3D1uVD=2Mpl3XmxR_Jzeaio
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Christian Krafft <krafft@de.ibm.com>

This patch adds a cpufreq governor that takes the spu load into account.
It's very similar to the ondemand governor, but not as complex.
Instead of hacking spu load into the ondemand governor I'd like to see
cpufreq accepting multiple governors per cpu in future. Don't know if this =
is
the right way, but it would keep the governors simple.

This patch is also missing a correct load calculation.
It works pretty well for spu's running at full time or idling, but not so w=
ell
for mixed load (i.e. each spu running 50 percent of the time we would
switch to fullspeed instead of half speed).

Signed-off-by: Christian Krafft <krafft@de.ibm.com>

Index: linux.git/arch/powerpc/platforms/cell/Kconfig
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux.git.orig/arch/powerpc/platforms/cell/Kconfig
+++ linux.git/arch/powerpc/platforms/cell/Kconfig
@@ -87,4 +87,14 @@ config CBE_CPUFREQ_PMI
 	  processor will not only be able to run at lower speed,
 	  but also at lower core voltage.
=20
+config CBE_CPUFREQ_SPU_GOVERNOR
+	tristate "CBE frequency scaling based on SPU usage"
+	depends SPU_FS
+	select CBE_CPUFREQ
+	default m
+	help
+	  This governor checks for spu usage to adjust the cpu frequency.
+	  If no spu is running on a given cpu, that cpu will be throttled to
+	  the minimal possible frequency.
+
 endmenu
Index: linux.git/arch/powerpc/platforms/cell/Makefile
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux.git.orig/arch/powerpc/platforms/cell/Makefile
+++ linux.git/arch/powerpc/platforms/cell/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_CBE_THERM)			+=3D cbe_thermal
 obj-$(CONFIG_CBE_CPUFREQ_PMI)		+=3D cbe_cpufreq_pmi.o
 obj-$(CONFIG_CBE_CPUFREQ)		+=3D cbe-cpufreq.o
 cbe-cpufreq-y				+=3D cbe_cpufreq_pervasive.o cbe_cpufreq.o
+obj-$(CONFIG_CBE_CPUFREQ_SPU_GOVERNOR)	+=3D cbe_spu_governor.o
=20
 ifeq ($(CONFIG_SMP),y)
 obj-$(CONFIG_PPC_CELL_NATIVE)		+=3D smp.o
Index: linux.git/arch/powerpc/platforms/cell/cbe_spu_governor.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null
+++ linux.git/arch/powerpc/platforms/cell/cbe_spu_governor.c
@@ -0,0 +1,199 @@
+/*
+ * spu aware cpufreq governor for the cell processor
+ *
+ * (C) Copyright IBM Deutschland Entwicklung GmbH 2005-2007
+ *
+ * Author: Christian Krafft <krafft@de.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2, or (at your option)
+ * any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#include <linux/cpufreq.h>
+#include <linux/sched.h>
+#include <linux/timer.h>
+#include <asm/atomic.h>
+#include <asm/machdep.h>
+#include <asm/spu.h>
+
+#include "asm/cell-regs.h"
+
+#define POLL_TIME	1000	/* in ms */
+
+struct spu_gov_info_struct {
+	unsigned long load;
+	unsigned long last_load;
+	struct cpufreq_policy *policy;
+	struct delayed_work work;
+	unsigned int poll_int;
+};
+static DEFINE_PER_CPU(struct spu_gov_info_struct, spu_gov_info);
+
+static struct workqueue_struct *kspugov_wq;
+
+/* parts of this function should go into spu scheduler */
+static int spu_gov_calc_load(struct spu_gov_info_struct *info)
+{
+	unsigned long active_tasks; /* fixed-point */
+	int cpu, load;
+
+	cpu =3D info->policy->cpu;
+	active_tasks =3D cbe_spu_info[cpu_to_node(cpu)].nr_active * FIXED_1;
+
+	/* this is also a bit too trivial
+	 * actually we want the max load of all spu's belonging together */
+	CALC_LOAD(info->load, EXP_1, active_tasks);
+
+	load =3D (info->load + FIXED_1 / 200) >> FSHIFT;
+
+	return load;
+}
+
+static void spu_gov_work(struct work_struct *work)
+{
+	struct spu_gov_info_struct *info;
+	unsigned int load_int;
+	int delay;
+
+	info =3D container_of(work, struct spu_gov_info_struct, work.work);
+
+	/* after cancel_delayed_work_sync we unset info->policy */
+	BUG_ON(info->policy =3D=3D NULL);
+
+	load_int =3D spu_gov_calc_load(info);
+
+	if ((load_int =3D=3D 0) && (info->policy->cur !=3D info->policy->min)) {
+		pr_debug("switching cpu %d to low frequency\n", info->policy->cpu);
+		__cpufreq_driver_target(info->policy,
+			info->policy->min,
+			CPUFREQ_RELATION_L);
+	} else if ((load_int > 0) && (info->policy->cur !=3D info->policy->max)) {
+		pr_debug("switching cpu %d to high frequency\n", info->policy->cpu);
+		__cpufreq_driver_target(info->policy,
+			info->policy->max,
+			CPUFREQ_RELATION_H);
+	}
+
+	delay =3D msecs_to_jiffies(info->poll_int);
+	queue_delayed_work_on(info->policy->cpu, kspugov_wq, &info->work, delay);
+}
+
+static void spu_gov_init_work(struct spu_gov_info_struct *info)
+{
+	int delay =3D msecs_to_jiffies(info->poll_int);
+	INIT_DELAYED_WORK_DEFERRABLE(&info->work, spu_gov_work);
+	queue_delayed_work_on(info->policy->cpu, kspugov_wq, &info->work, delay);
+}
+
+static void spu_gov_cancel_work(struct spu_gov_info_struct *info)
+{
+	cancel_delayed_work_sync(&info->work);
+}
+
+static int spu_gov_govern(struct cpufreq_policy *policy, unsigned int even=
t)
+{
+	unsigned int cpu =3D policy->cpu;
+	struct spu_gov_info_struct *info, *affected_info;
+	int i;
+	int ret =3D 0;
+
+	info =3D &per_cpu(spu_gov_info, cpu);
+
+	switch (event) {
+	case CPUFREQ_GOV_START:
+		if (!cpu_online(cpu)) {
+			printk(KERN_ERR "cpu %d is not online\n", cpu);
+			ret =3D -EINVAL;
+			break;
+		}
+
+		if (!policy->cur) {
+			printk(KERN_ERR "no cpu specified in policy\n");
+			ret =3D -EINVAL;
+			break;
+		}
+
+		/* initialize spu_gov_info for all affected cpus */
+		for_each_cpu_mask(i, policy->cpus) {
+			affected_info =3D &per_cpu(spu_gov_info, i);
+			affected_info->policy =3D policy;
+		}
+
+		info->poll_int =3D POLL_TIME;
+
+		/* setup timer */
+		spu_gov_init_work(info);
+
+		break;
+
+	case CPUFREQ_GOV_STOP:
+		/* cancel timer */
+		spu_gov_cancel_work(info);
+
+		/* clean spu_gov_info for all affected cpus */
+		for_each_cpu_mask (i, policy->cpus) {
+			info =3D &per_cpu(spu_gov_info, i);
+			info->policy =3D NULL;
+		}
+
+		break;
+	}
+
+	return ret;
+}
+
+static struct cpufreq_governor spu_governor =3D {
+	.name =3D "spu_governor",
+	.governor =3D spu_gov_govern,
+	.owner =3D THIS_MODULE,
+};
+
+/*
+ * module init and destoy
+ */
+
+static int __init spu_gov_init(void)
+{
+	int ret;
+
+	kspugov_wq =3D create_workqueue("kspugov");
+	if (!kspugov_wq) {
+		printk(KERN_ERR "creation of kspugov failed\n");
+		ret =3D -EFAULT;
+		goto out;
+	}
+
+	ret =3D cpufreq_register_governor(&spu_governor);
+	if (ret) {
+		printk(KERN_ERR "registration of governor failed\n");
+		destroy_workqueue(kspugov_wq);
+		goto out;;
+	}
+out:
+	return ret;
+}
+
+static void __exit spu_gov_exit(void)
+{
+	cpufreq_unregister_governor(&spu_governor);
+	destroy_workqueue(kspugov_wq);
+}
+
+
+module_init(spu_gov_init);
+module_exit(spu_gov_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
+

--Sig_/3D1uVD=2Mpl3XmxR_Jzeaio
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFHnhsK6rqK4qDx+dcRAtSfAJ9ZTCxQwtVs/LPxf8Z4AC/Ehhsl+QCgk3r4
nxfQJ4/D9i8cj49DOSjR7tM=
=NtjX
-----END PGP SIGNATURE-----

--Sig_/3D1uVD=2Mpl3XmxR_Jzeaio--


--===============0849279740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0849279740==--

