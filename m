From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC][PATCH] (1/4) cpufreq SMT awareness: keep affected_cpu_mask
Date: Fri, 18 Jun 2004 16:42:26 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040618144226.GA8871@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

The following four patches try to upgrade the SMT or CPU-group 
awareness of the cpufreq core. On all SMT platforms, and possibly
on some MP systems, only the frequency of some or even all CPUs 
can be changed at the same time. So, only register one cpufreq
(k)object in these cases. In /sys/devices/system/cpu/cpuX, either
the subdirectory cpufreq is found, or a link -- named "cpufreq",
of course -- to the appropriate subdirectory.

Neither the UP case nor the user interface should be affected by 
these changes. Unfortunately, because I only own UP hardware, I 
couldn't test these changes for the case where they matter most:
SMT and SMP.

	Dominik


Save the "affected_cpu_map" used in SMT-aware drivers in struct 
cpufreq_policy->(cpumask_t) cpus

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c   |   27 +++++++++++++--------------
 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |   23 ++++++++---------------
 include/linux/cpufreq.h                      |    2 ++
 3 files changed, 23 insertions(+), 29 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-06-16 18:38:40.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-06-18 15:06:40.798844232 +0200
@@ -110,7 +110,7 @@
 {
 	unsigned int    newstate = DC_RESV;
 	struct cpufreq_freqs freqs;
-	cpumask_t cpus_allowed, affected_cpu_map;
+	cpumask_t cpus_allowed;
 	int i;
 
 	if (cpufreq_frequency_table_target(policy, &p4clockmod_table[0], target_freq, relation, &newstate))
@@ -122,18 +122,9 @@
 	if (freqs.new == freqs.old)
 		return 0;
 
-	/* switch to physical CPU where state is to be changed*/
-	cpus_allowed = current->cpus_allowed;
-
 	/* only run on CPU to be set, or on its sibling */
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
@@ -141,7 +132,9 @@
 	/* run on each logical CPU, see section 13.15.3 of IA32 Intel Architecture Software
 	 * Developer's Manual, Volume 3 
 	 */
-	for_each_cpu_mask(i, affected_cpu_map) {
+	cpus_allowed = current->cpus_allowed;
+
+	for_each_cpu_mask(i, policy->cpus) {
 		cpumask_t this_cpu = cpumask_of_cpu(i);
 
 		set_cpus_allowed(current, this_cpu);
@@ -152,7 +145,7 @@
 	set_cpus_allowed(current, cpus_allowed);
 
 	/* notifiers */
-	for_each_cpu_mask(i, affected_cpu_map) {
+	for_each_cpu_mask(i, policy->cpus) {
 		freqs.cpu = i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 	}
@@ -248,6 +241,12 @@
 	policy->cpuinfo.transition_latency = 1000000; /* assumed */
 	policy->cur = stock_freq;
 
+#ifdef CONFIG_SMP
+	policy->cpus = cpu_sibling_map[policy->cpu];
+#else
+	policy->cpus = cpumask_of_cpu(policy->cpu);
+#endif
+
 	return cpufreq_frequency_table_cpuinfo(policy, &p4clockmod_table[0]);
 }
 
@@ -267,7 +266,7 @@
         affected_cpu_map = cpumask_of_cpu(cpu);
 
 	set_cpus_allowed(current, affected_cpu_map);
-        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
+	BUG_ON(smp_processor_id() != cpu);
 
 	rdmsr(MSR_IA32_THERM_CONTROL, l, h);
 
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-16 18:38:40.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-18 14:59:02.663491392 +0200
@@ -241,7 +241,7 @@
 {
 	unsigned int	newstate = 0;
 	struct cpufreq_freqs freqs;
-	cpumask_t cpus_allowed, affected_cpu_map;
+	cpumask_t cpus_allowed;
 	int i;
 
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
@@ -257,27 +257,20 @@
 
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
@@ -303,7 +296,7 @@
 {
 	int		result = 0;
 	unsigned int	speed;
-	cpumask_t       cpus_allowed,affected_cpu_map;
+	cpumask_t       cpus_allowed;
 
 
 	/* capability check */
@@ -313,11 +306,11 @@
 	/* only run on CPU to be set, or on its sibling */
 	cpus_allowed = current->cpus_allowed;
 #ifdef CONFIG_SMP
-	affected_cpu_map = cpu_sibling_map[policy->cpu];
+	policy->cpus = cpu_sibling_map[policy->cpu];
 #else
-	affected_cpu_map = cpumask_of_cpu(policy->cpu);
+	policy->cpus = cpumask_of_cpu(policy->cpu);
 #endif
-	set_cpus_allowed(current, affected_cpu_map);
+	set_cpus_allowed(current, policy->cpus);
 
 	/* detect low and high frequency */
 	result = speedstep_get_freqs(speedstep_processor,
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-06-16 18:38:42.000000000 +0200
+++ linux/include/linux/cpufreq.h	2004-06-18 14:55:28.650026384 +0200
@@ -22,6 +22,7 @@
 #include <linux/sysfs.h>
 #include <linux/completion.h>
 #include <linux/workqueue.h>
+#include <linux/cpumask.h>
 
 #define CPUFREQ_NAME_LEN 16
 
@@ -69,6 +70,7 @@
 };
 
 struct cpufreq_policy {
+	cpumask_t		cpus;	/* affected CPUs */
 	unsigned int		cpu;    /* cpu nr */
 	struct cpufreq_cpuinfo	cpuinfo;/* see above */
