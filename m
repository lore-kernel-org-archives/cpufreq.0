From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: 1/4 SMT awareness: save cpumask_t cpus
Date: Mon, 9 Aug 2004 21:54:26 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040809195426.GD9397@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk, davej@redhat.com

Save the "affected_cpu_map" used in SMT-aware drivers in struct 
cpufreq_policy->(cpumask_t) cpus, and use it wherever possible. In
most cases, the ->get() function is only allowed to run on one CPU [the
one passed as argument] to keep code simpler, and as that code path
isn't executed often, and only root can do it anyway.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c        |   28 ++++---------
 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |    2
 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c      |   46 ++++++++--------------
 drivers/cpufreq/cpufreq.c                         |    2
 include/linux/cpufreq.h                           |    4 +
 5 files changed, 33 insertions(+), 49 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-08-05 17:45:13.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-08-06 21:53:14.344397920 +0200
@@ -110,7 +110,7 @@
 {
 	unsigned int    newstate = DC_RESV;
 	struct cpufreq_freqs freqs;
-	cpumask_t cpus_allowed, affected_cpu_map;
+	cpumask_t cpus_allowed;
 	int i;
 
 	if (cpufreq_frequency_table_target(policy, &p4clockmod_table[0], target_freq, relation, &newstate))
@@ -122,18 +122,8 @@
 	if (freqs.new == freqs.old)
 		return 0;
 
-	/* switch to physical CPU where state is to be changed*/
-	cpus_allowed = current->cpus_allowed;
-
-	/* only run on CPU to be set, or on its sibling */
-#ifdef CONFIG_SMP
-	affected_cpu_map = cpu_sibling_map[policy->cpu];
-#else
-	affected_cpu_map = cpumask_of_cpu(policy->cpu);
-#endif
-
 	/* notifiers */
-	for_each_cpu_mask(i, affected_cpu_map) {
+	for_each_cpu_mask(i, policy->cpus) {
 		freqs.cpu = i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 	}
@@ -141,7 +131,9 @@
 	/* run on each logical CPU, see section 13.15.3 of IA32 Intel Architecture Software
 	 * Developer's Manual, Volume 3 
 	 */
-	for_each_cpu_mask(i, affected_cpu_map) {
+	cpus_allowed = current->cpus_allowed;
+
+	for_each_cpu_mask(i, policy->cpus) {
 		cpumask_t this_cpu = cpumask_of_cpu(i);
 
 		set_cpus_allowed(current, this_cpu);
@@ -152,7 +144,7 @@
 	set_cpus_allowed(current, cpus_allowed);
 
 	/* notifiers */
-	for_each_cpu_mask(i, affected_cpu_map) {
+	for_each_cpu_mask(i, policy->cpus) {
 		freqs.cpu = i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 	}
@@ -260,14 +252,13 @@
 
 static unsigned int cpufreq_p4_get(unsigned int cpu)
 {
-	cpumask_t cpus_allowed, affected_cpu_map;
+	cpumask_t cpus_allowed;
 	u32 l, h;
 
 	cpus_allowed = current->cpus_allowed;
-        affected_cpu_map = cpumask_of_cpu(cpu);
 
-	set_cpus_allowed(current, affected_cpu_map);
-        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
+	set_cpus_allowed(current, cpumask_of_cpu(cpu));
+	BUG_ON(smp_processor_id() != cpu);
 
 	rdmsr(MSR_IA32_THERM_CONTROL, l, h);
 
@@ -335,4 +326,3 @@
 
 late_initcall(cpufreq_p4_init);
 module_exit(cpufreq_p4_exit);
-
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-08-05 17:45:13.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-08-06 21:50:57.061268128 +0200
@@ -564,7 +564,7 @@
 	 * Make sure we are running on the CPU that wants to change frequency
 	 */
 	saved_mask = current->cpus_allowed;
-	set_cpus_allowed(current, cpumask_of_cpu(policy->cpu));
+	set_cpus_allowed(current, policy->cpus);
 	if (smp_processor_id() != policy->cpu) {
 		return(-EAGAIN);
 	}
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-08-05 17:45:13.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-08-06 21:50:57.062267976 +0200
@@ -223,24 +223,23 @@
 	return 0;
 }
 
-static unsigned int speedstep_get(unsigned int cpu)
+static unsigned int _speedstep_get(cpumask_t cpus)
 {
 	unsigned int speed;
-	cpumask_t cpus_allowed,affected_cpu_map;
+	cpumask_t cpus_allowed;
 
-	/* only run on CPU to be set, or on its sibling */
 	cpus_allowed = current->cpus_allowed;
-#ifdef CONFIG_SMP
-	affected_cpu_map = cpu_sibling_map[cpu];
-#else
-	affected_cpu_map = cpumask_of_cpu(cpu);
-#endif
-	set_cpus_allowed(current, affected_cpu_map);
-	speed=speedstep_get_processor_frequency(speedstep_processor);
+	set_cpus_allowed(current, cpus);
+	speed = speedstep_get_processor_frequency(speedstep_processor);
 	set_cpus_allowed(current, cpus_allowed);
 	return speed;
 }
 
+static unsigned int speedstep_get(unsigned int cpu)
+{
+	return _speedstep_get(cpumask_of_cpu(cpu));
+}
+
 /**
  * speedstep_target - set a new CPUFreq policy
  * @policy: new policy
@@ -255,13 +254,13 @@
 {
 	unsigned int newstate = 0;
 	struct cpufreq_freqs freqs;
-	cpumask_t cpus_allowed, affected_cpu_map;
+	cpumask_t cpus_allowed;
 	int i;
 
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
-	freqs.old = speedstep_get(policy->cpu);
+	freqs.old = _speedstep_get(policy->cpus);
 	freqs.new = speedstep_freqs[newstate].frequency;
 	freqs.cpu = policy->cpu;
 
@@ -271,27 +270,20 @@
 
 	cpus_allowed = current->cpus_allowed;
 
-	/* only run on CPU to be set, or on its sibling */
-#ifdef CONFIG_SMP
-	affected_cpu_map = cpu_sibling_map[policy->cpu];
-#else
-	affected_cpu_map = cpumask_of_cpu(policy->cpu);
-#endif
-
-	for_each_cpu_mask(i, affected_cpu_map) {
+	for_each_cpu_mask(i, policy->cpus) {
 		freqs.cpu = i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 	}
 
 	/* switch to physical CPU where state is to be changed */
-	set_cpus_allowed(current, affected_cpu_map);
+	set_cpus_allowed(current, policy->cpus);
 
 	speedstep_set_state(newstate);
 
 	/* allow to be run on all CPUs */
 	set_cpus_allowed(current, cpus_allowed);
 
-	for_each_cpu_mask(i, affected_cpu_map) {
+	for_each_cpu_mask(i, policy->cpus) {
 		freqs.cpu = i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 	}
@@ -317,7 +309,7 @@
 {
 	int result = 0;
 	unsigned int speed;
-	cpumask_t cpus_allowed,affected_cpu_map;
+	cpumask_t cpus_allowed;
 
 
 	/* capability check */
@@ -327,11 +319,9 @@
 	/* only run on CPU to be set, or on its sibling */
 	cpus_allowed = current->cpus_allowed;
 #ifdef CONFIG_SMP
-	affected_cpu_map = cpu_sibling_map[policy->cpu];
-#else
-	affected_cpu_map = cpumask_of_cpu(policy->cpu);
+	policy->cpus = cpu_sibling_map[policy->cpu];
 #endif
-	set_cpus_allowed(current, affected_cpu_map);
+	set_cpus_allowed(current, policy->cpus);
 
 	/* detect low and high frequency */
 	result = speedstep_get_freqs(speedstep_processor,
@@ -343,7 +333,7 @@
 		return result;
 
 	/* get current speed setting */
-	speed = speedstep_get(policy->cpu);
+	speed = _speedstep_get(policy->cpus);
 	if (!speed)
 		return -EIO;
 
diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-08-05 17:41:41.000000000 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-08-06 21:50:57.063267824 +0200
@@ -471,6 +471,8 @@
 	memset(policy, 0, sizeof(struct cpufreq_policy));
 
 	policy->cpu = cpu;
+	policy->cpus = cpumask_of_cpu(cpu);
+
 	init_MUTEX_LOCKED(&policy->lock);
 	init_completion(&policy->kobj_unregister);
 	INIT_WORK(&policy->update, handle_update, (void *)(long)cpu);
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-08-05 17:41:50.000000000 +0200
+++ linux/include/linux/cpufreq.h	2004-08-06 21:50:57.076265848 +0200
@@ -22,6 +22,7 @@
 #include <linux/sysfs.h>
 #include <linux/completion.h>
 #include <linux/workqueue.h>
+#include <linux/cpumask.h>
 
 #define CPUFREQ_NAME_LEN 16
 
@@ -69,7 +70,8 @@
 };
 
 struct cpufreq_policy {
-	unsigned int		cpu;    /* cpu nr */
+	cpumask_t		cpus;	/* affected CPUs */
+	unsigned int		cpu;    /* cpu nr of registered CPU */
 	struct cpufreq_cpuinfo	cpuinfo;/* see above */
 
 	unsigned int		min;    /* in kHz */
