From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] p4-clockmod HT fix
Date: Sat, 15 May 2004 22:35:34 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040515203534.GA10136@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk
Cc: moqua@kurtenba.ch, linux-kernel@tux.tmfweb.nl, cpufreq@www.linux.org.uk

As noted and debugged by Rutger Nijlunsing and Mr. Kurtenbach and verified in 
section 13.15.3 of Intel's IA32 Intel Architecture Software Developer's Manual,
Volume 3, the p4-clockmod msr needs to be set to the same value on all logical 
CPUs ("siblings") so that throttling works "properly".

This patch implements this, and uses cpufreq_p4_get() instead of a local copy in
cpufreq_p4_setdc. The latter function now only does the actual setting, all
other (notification, verification and set_cpus_allowed()) stuff is done in
cpufreq_p4_target.

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |  110 +++++++++++++----------------
 1 files changed, 52 insertions(+), 58 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-05-14 13:09:51.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-05-15 22:29:41.623113680 +0200
@@ -52,55 +52,15 @@
 static int has_N44_O17_errata[NR_CPUS];
 static unsigned int stock_freq;
 static struct cpufreq_driver p4clockmod_driver;
+static unsigned int cpufreq_p4_get(unsigned int cpu);
 
 static int cpufreq_p4_setdc(unsigned int cpu, unsigned int newstate)
 {
 	u32 l, h;
-	cpumask_t cpus_allowed, affected_cpu_map;
-	struct cpufreq_freqs freqs;
-	int j;
 
-	if (!cpu_online(cpu) || (newstate > DC_DISABLE) || 
-		(newstate == DC_RESV))
+	if (!cpu_online(cpu) || (newstate > DC_DISABLE) || (newstate == DC_RESV))
 		return -EINVAL;
 
-	/* switch to physical CPU where state is to be changed*/
-	cpus_allowed = current->cpus_allowed;
-
-	/* only run on CPU to be set, or on its sibling */
-#ifdef CONFIG_SMP
-	affected_cpu_map = cpu_sibling_map[cpu];
-#else
-	affected_cpu_map = cpumask_of_cpu(cpu);
-#endif
-	set_cpus_allowed(current, affected_cpu_map);
-        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
-
-	/* get current state */
-	rdmsr(MSR_IA32_THERM_CONTROL, l, h);
-	if (l & 0x10) {
-		l = l >> 1;
-		l &= 0x7;
-	} else
-		l = DC_DISABLE;
-	
-	if (l == newstate) {
-		set_cpus_allowed(current, cpus_allowed);
-		return 0;
-	} else if (l == DC_RESV) {
-		printk(KERN_ERR PFX "BIG FAT WARNING: currently in invalid setting\n");
-	}
-
-	/* notifiers */
-	freqs.old = stock_freq * l / 8;
-	freqs.new = stock_freq * newstate / 8;
-	for_each_cpu(j) {
-		if (cpu_isset(j, affected_cpu_map)) {
-			freqs.cpu = j;
-			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-		}
-	}
-
 	rdmsr(MSR_IA32_THERM_STATUS, l, h);
 #if 0
 	if (l & 0x01)
@@ -126,16 +86,6 @@
 		wrmsr(MSR_IA32_THERM_CONTROL, l, h);
 	}
 
-	set_cpus_allowed(current, cpus_allowed);
-
-	/* notifiers */
-	for_each_cpu(j) {
-		if (cpu_isset(j, affected_cpu_map)) {
-			freqs.cpu = j;
-			cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-		}
-	}
-
 	return 0;
 }
 
@@ -159,11 +109,59 @@
 			     unsigned int relation)
 {
 	unsigned int    newstate = DC_RESV;
+	struct cpufreq_freqs freqs;
+	cpumask_t cpus_allowed, affected_cpu_map;
+	int i;
 
 	if (cpufreq_frequency_table_target(policy, &p4clockmod_table[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
-	cpufreq_p4_setdc(policy->cpu, p4clockmod_table[newstate].index);
+	freqs.old = cpufreq_p4_get(policy->cpu);
+	freqs.new = stock_freq * p4clockmod_table[newstate].index / 8;
+
+	if (freqs.new == freqs.old)
+		return 0;
+
+	/* switch to physical CPU where state is to be changed*/
+	cpus_allowed = current->cpus_allowed;
+
+	/* only run on CPU to be set, or on its sibling */
+#ifdef CONFIG_SMP
+	affected_cpu_map = cpu_sibling_map[policy->cpu];
+#else
+	affected_cpu_map = cpumask_of_cpu(policy->cpu);
+#endif
+
+	/* notifiers */
+	for_each_cpu(i) {
+		if (cpu_isset(i, affected_cpu_map)) {
+			freqs.cpu = i;
+			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+		}
+	}
+
+	/* run on each logical CPU, see section 13.15.3 of IA32 Intel Architecture Software
+	 * Developer's Manual, Volume 3 
+	 */
+	for_each_cpu(i) {
+		if (cpu_isset(i, affected_cpu_map)) {
+			cpumask_t this_cpu = cpumask_of_cpu(i);
+
+			set_cpus_allowed(current, this_cpu);
+			BUG_ON(smp_processor_id() != i);
+
+			cpufreq_p4_setdc(i, p4clockmod_table[newstate].index);
+		}
+	}
+	set_cpus_allowed(current, cpus_allowed);
+
+	/* notifiers */
+	for_each_cpu(i) {
+		if (cpu_isset(i, affected_cpu_map)) {
+			freqs.cpu = i;
+			cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+		}
+	}
 
 	return 0;
 }
@@ -271,13 +269,9 @@
 	cpumask_t cpus_allowed, affected_cpu_map;
 	u32 l, h;
 
-	/* only run on CPU to be set, or on its sibling */
 	cpus_allowed = current->cpus_allowed;
-#ifdef CONFIG_SMP
-        affected_cpu_map = cpu_sibling_map[cpu];
-#else
         affected_cpu_map = cpumask_of_cpu(cpu);
-#endif
+
 	set_cpus_allowed(current, affected_cpu_map);
         BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
