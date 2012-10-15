From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2] cpufreq: Move common part from governors to separate file
Date: Mon, 15 Oct 2012 17:07:36 +0530
Message-ID: <55ee99ecd367db51513d6dbff504a9b6f14ffba3.1350301011.git.viresh.kumar@linaro.org>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, Robin.Randhawa@arm.com, Viresh Kumar <viresh.kumar@linaro.org>

Multiple cpufreq governers have defined similar get_cpu_idle_time_***()
routines. These routines must be moved to some common place, so that all
governors can use them.

So moving them to cpufreq_governor.c, which seems to be a better place for
keeping these routines.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2:
-----
- Instead of moving get_cpu_idle_time_*() routines to tick-sched, move them=
 to
  common governor specific file.

 drivers/cpufreq/Makefile               |  4 +--
 drivers/cpufreq/cpufreq_conservative.c | 34 ----------------------
 drivers/cpufreq/cpufreq_governor.c     | 52 ++++++++++++++++++++++++++++++=
++++
 drivers/cpufreq/cpufreq_ondemand.c     | 34 ----------------------
 include/linux/cpufreq.h                |  5 ++++
 5 files changed, 59 insertions(+), 70 deletions(-)
 create mode 100644 drivers/cpufreq/cpufreq_governor.c

diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 7c620a8..fe4cd26 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -7,8 +7,8 @@ obj-$(CONFIG_CPU_FREQ_STAT)             +=3D cpufreq_stats.=
o
 obj-$(CONFIG_CPU_FREQ_GOV_PERFORMANCE)=09+=3D cpufreq_performance.o
 obj-$(CONFIG_CPU_FREQ_GOV_POWERSAVE)=09+=3D cpufreq_powersave.o
 obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)=09+=3D cpufreq_userspace.o
-obj-$(CONFIG_CPU_FREQ_GOV_ONDEMAND)=09+=3D cpufreq_ondemand.o
-obj-$(CONFIG_CPU_FREQ_GOV_CONSERVATIVE)=09+=3D cpufreq_conservative.o
+obj-$(CONFIG_CPU_FREQ_GOV_ONDEMAND)=09+=3D cpufreq_ondemand.o cpufreq_gove=
rnor.o
+obj-$(CONFIG_CPU_FREQ_GOV_CONSERVATIVE)=09+=3D cpufreq_conservative.o cpuf=
req_governor.o
=20
 # CPUfreq cross-arch helpers
 obj-$(CONFIG_CPU_FREQ_TABLE)=09=09+=3D freq_table.o
diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufr=
eq_conservative.c
index 55f0354..93b02f4 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -95,40 +95,6 @@ static struct dbs_tuners {
 =09.freq_step =3D 5,
 };
=20
-static inline u64 get_cpu_idle_time_jiffy(unsigned int cpu, u64 *wall)
-{
-=09u64 idle_time;
-=09u64 cur_wall_time;
-=09u64 busy_time;
-
-=09cur_wall_time =3D jiffies64_to_cputime64(get_jiffies_64());
-
-=09busy_time  =3D kcpustat_cpu(cpu).cpustat[CPUTIME_USER];
-=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_SYSTEM];
-=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_IRQ];
-=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_SOFTIRQ];
-=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_STEAL];
-=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_NICE];
-
-=09idle_time =3D cur_wall_time - busy_time;
-=09if (wall)
-=09=09*wall =3D jiffies_to_usecs(cur_wall_time);
-
-=09return jiffies_to_usecs(idle_time);
-}
-
-static inline cputime64_t get_cpu_idle_time(unsigned int cpu, cputime64_t =
*wall)
-{
-=09u64 idle_time =3D get_cpu_idle_time_us(cpu, NULL);
-
-=09if (idle_time =3D=3D -1ULL)
-=09=09return get_cpu_idle_time_jiffy(cpu, wall);
-=09else
-=09=09idle_time +=3D get_cpu_iowait_time_us(cpu, wall);
-
-=09return idle_time;
-}
-
 /* keep track of frequency transitions */
 static int
 dbs_cpufreq_notifier(struct notifier_block *nb, unsigned long val,
diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_g=
overnor.c
new file mode 100644
index 0000000..0001071
--- /dev/null
+++ b/drivers/cpufreq/cpufreq_governor.c
@@ -0,0 +1,52 @@
+/*
+ * drivers/cpufreq/cpufreq_governor.c
+ *
+ * CPUFREQ governors common code
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <asm/cputime.h>
+#include <linux/export.h>
+#include <linux/kernel_stat.h>
+#include <linux/tick.h>
+#include <linux/types.h>
+/*
+ * Code picked from earlier governer implementations
+ */
+static inline u64 get_cpu_idle_time_jiffy(unsigned int cpu, u64 *wall)
+{
+=09u64 idle_time;
+=09u64 cur_wall_time;
+=09u64 busy_time;
+
+=09cur_wall_time =3D jiffies64_to_cputime64(get_jiffies_64());
+
+=09busy_time =3D kcpustat_cpu(cpu).cpustat[CPUTIME_USER];
+=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_SYSTEM];
+=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_IRQ];
+=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_SOFTIRQ];
+=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_STEAL];
+=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_NICE];
+
+=09idle_time =3D cur_wall_time - busy_time;
+=09if (wall)
+=09=09*wall =3D jiffies_to_usecs(cur_wall_time);
+
+=09return jiffies_to_usecs(idle_time);
+}
+
+cputime64_t get_cpu_idle_time(unsigned int cpu, cputime64_t *wall)
+{
+=09u64 idle_time =3D get_cpu_idle_time_us(cpu, NULL);
+
+=09if (idle_time =3D=3D -1ULL)
+=09=09return get_cpu_idle_time_jiffy(cpu, wall);
+=09else
+=09=09idle_time +=3D get_cpu_iowait_time_us(cpu, wall);
+
+=09return idle_time;
+}
+EXPORT_SYMBOL_GPL(get_cpu_idle_time);
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_o=
ndemand.c
index 14c1af5..964918b 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -119,40 +119,6 @@ static struct dbs_tuners {
 =09.powersave_bias =3D 0,
 };
=20
-static inline u64 get_cpu_idle_time_jiffy(unsigned int cpu, u64 *wall)
-{
-=09u64 idle_time;
-=09u64 cur_wall_time;
-=09u64 busy_time;
-
-=09cur_wall_time =3D jiffies64_to_cputime64(get_jiffies_64());
-
-=09busy_time  =3D kcpustat_cpu(cpu).cpustat[CPUTIME_USER];
-=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_SYSTEM];
-=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_IRQ];
-=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_SOFTIRQ];
-=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_STEAL];
-=09busy_time +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_NICE];
-
-=09idle_time =3D cur_wall_time - busy_time;
-=09if (wall)
-=09=09*wall =3D jiffies_to_usecs(cur_wall_time);
-
-=09return jiffies_to_usecs(idle_time);
-}
-
-static inline cputime64_t get_cpu_idle_time(unsigned int cpu, cputime64_t =
*wall)
-{
-=09u64 idle_time =3D get_cpu_idle_time_us(cpu, NULL);
-
-=09if (idle_time =3D=3D -1ULL)
-=09=09return get_cpu_idle_time_jiffy(cpu, wall);
-=09else
-=09=09idle_time +=3D get_cpu_iowait_time_us(cpu, wall);
-
-=09return idle_time;
-}
-
 static inline cputime64_t get_cpu_iowait_time(unsigned int cpu, cputime64_=
t *wall)
 {
 =09u64 iowait_time =3D get_cpu_iowait_time_us(cpu, wall);
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index fc4b785..d03c219 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -11,6 +11,7 @@
 #ifndef _LINUX_CPUFREQ_H
 #define _LINUX_CPUFREQ_H
=20
+#include <asm/cputime.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/threads.h>
@@ -407,5 +408,9 @@ void cpufreq_frequency_table_get_attr(struct cpufreq_fr=
equency_table *table,
=20
 void cpufreq_frequency_table_put_attr(unsigned int cpu);
=20
+/*********************************************************************
+ *                     Governor Helpers=09=09=09=09     *
+ *********************************************************************/
+cputime64_t get_cpu_idle_time(unsigned int cpu, cputime64_t *wall);
=20
 #endif /* _LINUX_CPUFREQ_H */
--=20
1.7.12.rc2.18.g61b472e

