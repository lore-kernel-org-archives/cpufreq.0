From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/arm/mach-integrator cpu.c,1.6,1.7
Date: Tue, 19 Aug 2003 14:39:04 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19p6hU-0005kP-IS@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-integrator
In directory flint:/tmp/cvs-serv22028/linux/arch/arm/mach-integrator

Modified Files:
	cpu.c 
Log Message:
sync with latest davej version

Index: cpu.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-integrator/cpu.c,v
retrieving revision 1.6
retrieving revision 1.7
diff -u -r1.6 -r1.7
--- cpu.c	18 Jul 2002 13:58:51 -0000	1.6
+++ cpu.c	19 Aug 2003 13:38:31 -0000	1.7
@@ -12,6 +12,7 @@
  * CPU support functions
  */
 #include <linux/config.h>
+#include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/cpufreq.h>
@@ -22,93 +23,109 @@
 
 #include <asm/hardware.h>
 #include <asm/io.h>
+#include <asm/hardware/icst525.h>
+
+static struct cpufreq_driver integrator_driver;
 
 #define CM_ID  	(IO_ADDRESS(INTEGRATOR_HDR_BASE)+INTEGRATOR_HDR_ID_OFFSET)
 #define CM_OSC	(IO_ADDRESS(INTEGRATOR_HDR_BASE)+INTEGRATOR_HDR_OSC_OFFSET)
 #define CM_STAT (IO_ADDRESS(INTEGRATOR_HDR_BASE)+INTEGRATOR_HDR_STAT_OFFSET)
 #define CM_LOCK (IO_ADDRESS(INTEGRATOR_HDR_BASE)+INTEGRATOR_HDR_LOCK_OFFSET)
 
-struct vco {
-	unsigned char vdw;
-	unsigned char od;
+static const struct icst525_params lclk_params = {
+	.ref		= 24000,
+	.vco_max	= 320000,
+	.vd_min		= 8,
+	.vd_max		= 132,
+	.rd_min		= 24,
+	.rd_max		= 24,
 };
 
-/*
- * Divisors for each OD setting.
- */
-static unsigned char cc_divisor[8] = { 10, 2, 8, 4, 5, 7, 9, 6 };
-
-static unsigned int vco_to_freq(struct vco vco, int factor)
-{
-	return 2000 * (vco.vdw + 8) / cc_divisor[vco.od] / factor;
-}
+static const struct icst525_params cclk_params = {
+	.ref		= 24000,
+	.vco_max	= 320000,
+	.vd_min		= 12,
+	.vd_max		= 160,
+	.rd_min		= 24,
+	.rd_max		= 24,
+};
 
-#ifdef CONFIG_CPU_FREQ
 /*
- * Divisor indexes in ascending divisor order
+ * Validate the speed policy.
  */
-static unsigned char s2od[] = { 1, 3, 4, 7, 5, 2, 6, 0 };
-
-static struct vco freq_to_vco(unsigned int freq_khz, int factor)
+static int integrator_verify_policy(struct cpufreq_policy *policy)
 {
-	struct vco vco = {0, 0};
-	unsigned int i, f;
-
-	freq_khz *= factor;
-
-	for (i = 0; i < 8; i++) {
-		f = freq_khz * cc_divisor[s2od[i]];
-		/* f must be between 10MHz and 320MHz */
-		if (f > 10000 && f <= 320000)
-			break;
-	}
-
-	vco.od  = s2od[i];
-	vco.vdw = f / 2000 - 8;
-
-	return vco;
-}
+	struct icst525_vco vco;
 
-/*
- * Validate the speed in khz.  If it is outside our
- * range, then return the lowest.
- */
-static unsigned int
-integrator_validatespeed(unsigned int cpu, unsigned int freq_khz)
-{
-	struct vco vco;
+	cpufreq_verify_within_limits(policy, 
+				     policy->cpuinfo.min_freq, 
+				     policy->cpuinfo.max_freq);
 
-	if (freq_khz < 12000)
-		freq_khz = 12000;
-	if (freq_khz > 160000)
-		freq_khz = 160000;
+	vco = icst525_khz_to_vco(&cclk_params, policy->max);
+	policy->max = icst525_khz(&cclk_params, vco);
 
-	vco = freq_to_vco(freq_khz, 1);
+	vco = icst525_khz_to_vco(&cclk_params, policy->min);
+	policy->min = icst525_khz(&cclk_params, vco);
 
-	if (vco.vdw < 4 || vco.vdw > 152)
-		return -EINVAL;
+	cpufreq_verify_within_limits(policy, 
+				     policy->cpuinfo.min_freq, 
+				     policy->cpuinfo.max_freq);
 
-	return vco_to_freq(vco, 1);
+	return 0;
 }
 
-static void integrator_setspeed(unsigned int cpu, unsigned int freq_khz)
+
+static int integrator_set_target(struct cpufreq_policy *policy,
+				 unsigned int target_freq,
+				 unsigned int relation)
 {
-	struct vco vco = freq_to_vco(freq_khz, 1);
 	unsigned long cpus_allowed;
+	int cpu = policy->cpu;
+	struct icst525_vco vco;
+	struct cpufreq_freqs freqs;
 	u_int cm_osc;
 
 	/*
-	 * Save this threads cpus_allowed mask, and bind to the
-	 * specified CPU.  When this call returns, we should be
-	 * running on the right CPU.
+	 * Save this threads cpus_allowed mask.
 	 */
 	cpus_allowed = current->cpus_allowed;
+
+	/*
+	 * Bind to the specified CPU.  When this call returns,
+	 * we should be running on the right CPU.
+	 */
 	set_cpus_allowed(current, 1 << cpu);
 	BUG_ON(cpu != smp_processor_id());
 
+	/* get current setting */
+	cm_osc = __raw_readl(CM_OSC);
+	vco.s = (cm_osc >> 8) & 7;
+	vco.v = cm_osc & 255;
+	vco.r = 22;
+	freqs.old = icst525_khz(&cclk_params, vco);
+
+	/* icst525_khz_to_vco rounds down -- so we need the next
+	 * larger freq in case of CPUFREQ_RELATION_L.
+	 */
+	if (relation == CPUFREQ_RELATION_L)
+		target_freq += 1999;
+	if (target_freq > policy->max)
+		target_freq = policy->max;
+	vco = icst525_khz_to_vco(&cclk_params, target_freq);
+	freqs.new = icst525_khz(&cclk_params, vco);
+
+	freqs.cpu = policy->cpu;
+
+	if (freqs.old == freqs.new) {
+		set_cpus_allowed(current, cpus_allowed);
+		return 0;
+	}
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+
 	cm_osc = __raw_readl(CM_OSC);
 	cm_osc &= 0xfffff800;
-	cm_osc |= vco.vdw | vco.od << 8;
+	cm_osc |= vco.v | vco.s << 8;
 
 	__raw_writel(0xa05f, CM_LOCK);
 	__raw_writel(cm_osc, CM_OSC);
@@ -118,67 +135,73 @@
 	 * Restore the CPUs allowed mask.
 	 */
 	set_cpus_allowed(current, cpus_allowed);
-}
 
-static struct cpufreq_driver integrator_driver = {
-	.validate	= integrator_validatespeed,
-	.setspeed	= integrator_setspeed,
-	.sync		= 1,
-};
-#endif
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
-static int __init integrator_cpu_init(void)
+	return 0;
+}
+
+static int integrator_cpufreq_init(struct cpufreq_policy *policy)
 {
-	struct cpufreq_freqs *freqs;
 	unsigned long cpus_allowed;
-	int cpu;
-
-	freqs = kmalloc(sizeof(struct cpufreq_freqs) * NR_CPUS,
-			GFP_KERNEL);
-	if (!freqs) {
-		printk(KERN_ERR "CPU: unable to allocate cpufreqs structure\n");
-		return -ENOMEM;
-	}
+	unsigned int cpu = policy->cpu;
+	u_int cm_osc, cm_stat, mem_freq_khz;
+	struct icst525_vco vco;
 
 	cpus_allowed = current->cpus_allowed;
-	for (cpu = 0; cpu < NR_CPUS; cpu++) {
-		u_int cm_osc, cm_stat, mem_freq_khz;
-		struct vco vco;
-
-		if (!cpu_online(cpu))
-			continue;
-
-		set_cpus_allowed(current, 1 << cpu);
-		BUG_ON(cpu != smp_processor_id());
-
-		cm_stat = __raw_readl(CM_STAT);
-		cm_osc = __raw_readl(CM_OSC);
-		vco.od  = (cm_osc >> 20) & 7;
-		vco.vdw = (cm_osc >> 12) & 255;
-		mem_freq_khz = vco_to_freq(vco, 2);
-
-		printk(KERN_INFO "CPU%d: Module id: %d\n", cpu, cm_stat & 255);
-		printk(KERN_INFO "CPU%d: Memory clock = %d.%03d MHz\n",
-			cpu, mem_freq_khz / 1000, mem_freq_khz % 1000);
-
-		vco.od = (cm_osc >> 8) & 7;
-		vco.vdw = cm_osc & 255;
-
-		freqs[cpu].min = 12000;
-		freqs[cpu].max = 160000;
-		freqs[cpu].cur = vco_to_freq(vco, 1);
-	}
 
-	set_cpus_allowed(current, cpus_allowed);
+	set_cpus_allowed(current, 1 << cpu);
+	BUG_ON(cpu != smp_processor_id());
 
-#ifdef CONFIG_CPU_FREQ
-	integrator_driver.freq = freqs;
-	cpufreq_register(&integrator_driver);
-#else
-	kfree(freqs);
-#endif
+	/* detect memory etc. */
+	cm_stat = __raw_readl(CM_STAT);
+	cm_osc = __raw_readl(CM_OSC);
+	vco.s = (cm_osc >> 20) & 7;
+	vco.v = (cm_osc >> 12) & 255;
+	vco.r = 22;
+	mem_freq_khz = icst525_khz(&lclk_params, vco) / 2;
+
+	printk(KERN_INFO "CPU%d: Module id: %d\n", cpu, cm_stat & 255);
+	printk(KERN_INFO "CPU%d: Memory clock = %d.%03d MHz\n",
+	       cpu, mem_freq_khz / 1000, mem_freq_khz % 1000);
+
+	vco.s = (cm_osc >> 8) & 7;
+	vco.v = cm_osc & 255;
+	vco.r = 22;
+
+	/* set default policy and cpuinfo */
+	policy->policy = CPUFREQ_POLICY_PERFORMANCE;
+	policy->cpuinfo.max_freq = 160000;
+	policy->cpuinfo.min_freq = 12000;
+	policy->cpuinfo.transition_latency = 1000; /* 1 ms, assumed */
+	policy->cur = policy->min = policy->max =
+		icst525_khz(&cclk_params, vco); /* current freq */
+
+	set_cpus_allowed(current, cpus_allowed);
 
 	return 0;
 }
 
-__initcall(integrator_cpu_init);
+static struct cpufreq_driver integrator_driver = {
+	.verify		= integrator_verify_policy,
+	.target		= integrator_set_target,
+	.init		= integrator_cpufreq_init,
+	.name		= "integrator",
+};
+
+static int __init integrator_cpu_init(void)
+{
+	return cpufreq_register_driver(&integrator_driver);
+}
+
+static void __exit integrator_cpu_exit(void)
+{
+	cpufreq_unregister_driver(&integrator_driver);
+}
+
+MODULE_AUTHOR ("Russell M. King");
+MODULE_DESCRIPTION ("cpufreq driver for ARM Integrator CPUs");
+MODULE_LICENSE ("GPL");
+
+module_init(integrator_cpu_init);
+module_exit(integrator_cpu_exit);
