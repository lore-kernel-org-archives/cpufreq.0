From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] cpufreq: timer: Move tick-sched specific code outside of cpufreq governors
Date: Mon, 15 Oct 2012 13:41:20 +0530
Message-ID: <10f0412be71dec50a3e57732c1f2aa5b94fe1df8.1350288504.git.viresh.kumar@linaro.org>
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: rjw@sisk.pl, tglx@linutronix.de
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, Robin.Randhawa@arm.com, Viresh Kumar <viresh.kumar@linaro.org>

Multiple cpufreq governers have defined similar get_cpu_idle_time_***()
routines. These routines must be moved to some common place, so that all
governors can use them.

So moving them to tick-sched.c, which seems to be a better place for keepin=
g
these routines.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq_conservative.c | 34 ------------------------------=
---
 drivers/cpufreq/cpufreq_ondemand.c     | 34 ------------------------------=
---
 include/linux/tick.h                   |  3 +++
 kernel/time/tick-sched.c               | 35 ++++++++++++++++++++++++++++++=
++++
 4 files changed, 38 insertions(+), 68 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufr=
eq_conservative.c
index a152af7..181abad 100644
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
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_o=
ndemand.c
index 396322f..d7f774b 100644
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
diff --git a/include/linux/tick.h b/include/linux/tick.h
index f37fceb..79ca824 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -6,6 +6,7 @@
 #ifndef _LINUX_TICK_H
 #define _LINUX_TICK_H
=20
+#include <asm/cputime.h>
 #include <linux/clockchips.h>
 #include <linux/irqflags.h>
=20
@@ -142,4 +143,6 @@ static inline u64 get_cpu_idle_time_us(int cpu, u64 *un=
used) { return -1; }
 static inline u64 get_cpu_iowait_time_us(int cpu, u64 *unused) { return -1=
; }
 # endif /* !NO_HZ */
=20
+cputime64_t get_cpu_idle_time(unsigned int cpu, cputime64_t *wall);
+
 #endif
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index a402608..b458402 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -271,6 +271,41 @@ u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_t=
ime)
 }
 EXPORT_SYMBOL_GPL(get_cpu_iowait_time_us);
=20
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
+
 static ktime_t tick_nohz_stop_sched_tick(struct tick_sched *ts,
 =09=09=09=09=09 ktime_t now, int cpu)
 {
--=20
1.7.12.rc2.18.g61b472e


