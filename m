From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC][PATCH] (4/4) cpufreq SMT awareness: code reduction
Date: Fri, 18 Jun 2004 16:44:29 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040618144429.GD8871@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

Remove the FIXME in speedstep-ich, and -- as the UP case is already pre-set
in the cpufreq core -- remove the #else statements in p4-clockmod and speedstep-ich.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c   |    2 --
 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |    7 -------
 2 files changed, 9 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-06-18 15:09:23.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-06-18 16:21:32.082329656 +0200
@@ -243,8 +243,6 @@
 
 #ifdef CONFIG_SMP
 	policy->cpus = cpu_sibling_map[policy->cpu];
-#else
-	policy->cpus = cpumask_of_cpu(policy->cpu);
 #endif
 
 	return cpufreq_frequency_table_cpuinfo(policy, &p4clockmod_table[0]);
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-18 15:09:23.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-18 16:22:01.045926520 +0200
@@ -298,17 +298,10 @@
 	unsigned int	speed;
 	cpumask_t       cpus_allowed;
 
-
-	/* capability check */
-	if (policy->cpu != 0) /* FIXME: better support for SMT in cpufreq core. Up until then, it's better to register only one CPU */
-		return -ENODEV;
-
 	/* only run on CPU to be set, or on its sibling */
 	cpus_allowed = current->cpus_allowed;
 #ifdef CONFIG_SMP
 	policy->cpus = cpu_sibling_map[policy->cpu];
-#else
-	policy->cpus = cpumask_of_cpu(policy->cpu);
 #endif
 	set_cpus_allowed(current, policy->cpus);
