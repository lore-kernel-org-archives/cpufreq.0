From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] speedstep-ich: SMT/HT support, fix for notify change
Date: Fri, 11 Jun 2004 18:39:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040611163901.GA13300@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, holbling@cpt.univ-mrs.fr

Propagate the notify moving to speedstep-ich, and add SMT (HT) awareness
to the speedstep-ich. Patch was written in very large parts by 
Christian Hoelbling -- thanks!

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |   70 ++++++++++++++++++++------- 1 files changed, 54 insertions(+), 16 deletions(-)

--- linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c.original	2004-06-11 16:23:51.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-11 18:23:20.824719848 +0200
@@ -67,28 +67,19 @@
 /**
  * speedstep_set_state - set the SpeedStep state
  * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
- * @notify: whether to call cpufreq_notify_transition for CPU speed changes
  *
  *   Tries to change the SpeedStep state. 
  */
-static void speedstep_set_state (unsigned int state, unsigned int notify)
+static void speedstep_set_state (unsigned int state)
 {
 	u32			pmbase;
 	u8			pm2_blk;
 	u8			value;
 	unsigned long		flags;
-	struct cpufreq_freqs	freqs;
 
 	if (!speedstep_chipset_dev || (state > 0x1))
 		return;
 
-	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
-	freqs.new = speedstep_freqs[state].frequency;
-	freqs.cpu = 0; /* speedstep.c is UP only driver */
-	
-	if (notify)
-		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-
 	/* get PMBASE */
 	pci_read_config_dword(speedstep_chipset_dev, 0x40, &pmbase);
 	if (!(pmbase & 0x01))
@@ -143,9 +134,6 @@
 		printk (KERN_ERR "cpufreq: change failed - I/O error\n");
 	}
 
-	if (notify)
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-
 	return;
 }
 
@@ -252,11 +240,47 @@
 			     unsigned int relation)
 {
 	unsigned int	newstate = 0;
+	struct cpufreq_freqs freqs;
+	cpumask_t cpus_allowed, affected_cpu_map;
+	int i;
 
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
-	speedstep_set_state(newstate, 1);
+	/* no transition necessary */
+	if (freqs.old == freqs.new)
+		return 0;
+
+	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
+	freqs.new = speedstep_freqs[newstate].frequency;
+	freqs.cpu = policy->cpu;
+
+	cpus_allowed = current->cpus_allowed;
+
+	/* only run on CPU to be set, or on its sibling */
+#ifdef CONFIG_SMP
+	affected_cpu_map = cpu_sibling_map[policy->cpu];
+#else
+	affected_cpu_map = cpumask_of_cpu(policy->cpu);
+#endif
+
+	for_each_cpu_mask(i, affected_cpu_map) {
+		freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	}
+
+	/* switch to physical CPU where state is to be changed */
+	set_cpus_allowed(current, affected_cpu_map);
+
+	speedstep_set_state(newstate);
+
+	/* allow to be run on all CPUs */
+	set_cpus_allowed(current, cpus_allowed);
+
+	for_each_cpu_mask(i, affected_cpu_map) {
+		freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	}
 
 	return 0;
 }
@@ -279,21 +303,35 @@
 {
 	int		result = 0;
 	unsigned int	speed;
+	cpumask_t       cpus_allowed,affected_cpu_map;
+
 
 	/* capability check */
-	if (policy->cpu != 0)
+	if (policy->cpu != 0) /* FIXME: better support for SMT in cpufreq core. Up until then, it's better to register only one CPU */
 		return -ENODEV;
 
+	/* only run on CPU to be set, or on its sibling */
+	cpus_allowed = current->cpus_allowed;
+#ifdef CONFIG_SMP
+	affected_cpu_map = cpu_sibling_map[policy->cpu];
+#else
+	affected_cpu_map = cpumask_of_cpu(policy->cpu);
+#endif
+	set_cpus_allowed(current, affected_cpu_map);
+
 	/* detect low and high frequency */
 	result = speedstep_get_freqs(speedstep_processor,
 				     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
 				     &speedstep_set_state);
-	if (result)
+	if (result) {
+		set_cpus_allowed(current, cpus_allowed);
 		return result;
+	}
 
 	/* get current speed setting */
 	speed = speedstep_get_processor_frequency(speedstep_processor);
+	set_cpus_allowed(current, cpus_allowed);
 	if (!speed)
 		return -EIO;
