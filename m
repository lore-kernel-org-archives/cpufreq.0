From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/arm/mach-integrator cpu.c,1.9,1.10
Date: Thu, 26 Aug 2004 14:25:50 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C0KGE-0006oa-Iv@flint.arm.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-integrator
In directory flint:/tmp/cvs-serv26017/linux/arch/arm/mach-integrator

Modified Files:
	cpu.c 
Log Message:
merge with current cpufreq bk tree and 2.6.9-r1

Index: cpu.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-integrator/cpu.c,v
retrieving revision 1.9
retrieving revision 1.10
diff -u -r1.9 -r1.10
--- cpu.c	20 Jan 2004 17:03:30 -0000	1.9
+++ cpu.c	26 Aug 2004 13:25:17 -0000	1.10
@@ -22,6 +22,7 @@
 
 #include <asm/hardware.h>
 #include <asm/io.h>
+#include <asm/mach-types.h>
 #include <asm/hardware/icst525.h>
 
 static struct cpufreq_driver integrator_driver;
@@ -98,7 +99,12 @@
 
 	/* get current setting */
 	cm_osc = __raw_readl(CM_OSC);
-	vco.s = (cm_osc >> 8) & 7;
+
+	if (machine_is_integrator()) {
+		vco.s = (cm_osc >> 8) & 7;
+	} else if (machine_is_cintegrator()) {
+		vco.s = 1;
+	}
 	vco.v = cm_osc & 255;
 	vco.r = 22;
 	freqs.old = icst525_khz(&cclk_params, vco);
@@ -107,7 +113,7 @@
 	 * larger freq in case of CPUFREQ_RELATION_L.
 	 */
 	if (relation == CPUFREQ_RELATION_L)
-		target_freq += 1999;
+		target_freq += 999;
 	if (target_freq > policy->max)
 		target_freq = policy->max;
 	vco = icst525_khz_to_vco(&cclk_params, target_freq);
@@ -123,8 +129,14 @@
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
 	cm_osc = __raw_readl(CM_OSC);
-	cm_osc &= 0xfffff800;
-	cm_osc |= vco.v | vco.s << 8;
+
+	if (machine_is_integrator()) {
+		cm_osc &= 0xfffff800;
+		cm_osc |= vco.s << 8;
+	} else if (machine_is_cintegrator()) {
+		cm_osc &= 0xffffff00;
+	}
+	cm_osc |= vco.v;
 
 	__raw_writel(0xa05f, CM_LOCK);
 	__raw_writel(cm_osc, CM_OSC);
@@ -140,11 +152,11 @@
 	return 0;
 }
 
-static int integrator_cpufreq_init(struct cpufreq_policy *policy)
+static unsigned int integrator_get(unsigned int cpu)
 {
 	unsigned long cpus_allowed;
-	unsigned int cpu = policy->cpu;
-	u_int cm_osc, cm_stat, mem_freq_khz;
+	unsigned int current_freq;
+	u_int cm_osc;
 	struct icst525_vco vco;
 
 	cpus_allowed = current->cpus_allowed;
@@ -153,30 +165,32 @@
 	BUG_ON(cpu != smp_processor_id());
 
 	/* detect memory etc. */
-	cm_stat = __raw_readl(CM_STAT);
 	cm_osc = __raw_readl(CM_OSC);
-	vco.s = (cm_osc >> 20) & 7;
-	vco.v = (cm_osc >> 12) & 255;
-	vco.r = 22;
-	mem_freq_khz = icst525_khz(&lclk_params, vco) / 2;
-
-	printk(KERN_INFO "CPU%d: Module id: %d\n", cpu, cm_stat & 255);
-	printk(KERN_INFO "CPU%d: Memory clock = %d.%03d MHz\n",
-	       cpu, mem_freq_khz / 1000, mem_freq_khz % 1000);
 
-	vco.s = (cm_osc >> 8) & 7;
+	if (machine_is_integrator()) {
+		vco.s = (cm_osc >> 8) & 7;
+	} else if (machine_is_cintegrator()) {
+		vco.s = 1;
+	}
 	vco.v = cm_osc & 255;
 	vco.r = 22;
 
+	current_freq = icst525_khz(&cclk_params, vco); /* current freq */
+
+	set_cpus_allowed(current, cpus_allowed);
+
+	return current_freq;
+}
+
+static int integrator_cpufreq_init(struct cpufreq_policy *policy)
+{
+
 	/* set default policy and cpuinfo */
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.max_freq = 160000;
 	policy->cpuinfo.min_freq = 12000;
 	policy->cpuinfo.transition_latency = 1000000; /* 1 ms, assumed */
-	policy->cur = policy->min = policy->max =
-		icst525_khz(&cclk_params, vco); /* current freq */
-
-	set_cpus_allowed(current, cpus_allowed);
+	policy->cur = policy->min = policy->max = integrator_get(policy->cpu);
 
 	return 0;
 }
@@ -184,6 +198,7 @@
 static struct cpufreq_driver integrator_driver = {
 	.verify		= integrator_verify_policy,
 	.target		= integrator_set_target,
+	.get		= integrator_get,
 	.init		= integrator_cpufreq_init,
 	.name		= "integrator",
 };
