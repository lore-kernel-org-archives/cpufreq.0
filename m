From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix cpufreq_p4_get for new cpu_sibling_mask
Date: Tue, 11 May 2004 12:19:06 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040511101906.GA9947@dominikbrodowski.de>
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
To: davej@redhat.com, cpufreq@www.linux.org.uk

Update the newly added cpufreq_p4_get for the change of cpu_sibling_mask to
cpumask_t in 2.6.6-bk-latest.

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   14 ++++----------
 1 files changed, 4 insertions(+), 10 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-05-11 12:16:43.402237520 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-05-11 12:16:08.362564360 +0200
@@ -268,21 +268,15 @@
 
 static unsigned int cpufreq_p4_get(unsigned int cpu)
 {
-	unsigned int hyperthreading;
 	cpumask_t cpus_allowed, affected_cpu_map;
 	u32 l, h;
 
-	hyperthreading = 0;
-
 	/* only run on CPU to be set, or on its sibling */
 	cpus_allowed = current->cpus_allowed;
-	affected_cpu_map = cpumask_of_cpu(cpu);
-#ifdef CONFIG_X86_HT
-	hyperthreading = ((cpu_has_ht) && (smp_num_siblings == 2));
-	if (hyperthreading) {
-		sibling = cpu_sibling_map[cpu];
-		cpu_set(sibling, affected_cpu_map);
-	}
+#ifdef CONFIG_SMP
+        affected_cpu_map = cpu_sibling_map[cpu];
+#else
+        affected_cpu_map = cpumask_of_cpu(cpu);
 #endif
 	set_cpus_allowed(current, affected_cpu_map);
         BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
