From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 2.6] cpufreq on x86: scaling_available_frequencies
Date: Fri, 20 Feb 2004 15:44:17 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040220144417.GA9795@dominikbrodowski.de>
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

Export scaling_available_frequencies on the remaining 
x86 freq_table-based cpufreq drivers. powernow-k7, acpi and speedstep-centrino
are already queued.

Please note that this cannot be done in the cpufreq core as the cpufreq core
tries very hard to be independent of the freq_table helpers.

 arch/i386/kernel/cpu/cpufreq/elanfreq.c      |   24 +++++++++++++++++++++++-
 arch/i386/kernel/cpu/cpufreq/longhaul.c      |   21 ++++++++++++++++++++-
 arch/i386/kernel/cpu/cpufreq/powernow-k6.c   |   17 +++++++++++++++--
 arch/i386/kernel/cpu/cpufreq/powernow-k8.c   |   10 ++++++++++
 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |   23 ++++++++++++++++++++++-
 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |   21 ++++++++++++++++++++-
 6 files changed, 110 insertions(+), 6 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/elanfreq.c linux/arch/i386/kernel/cpu/cpufreq/elanfreq.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/elanfreq.c	2004-02-18 10:22:09.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/elanfreq.c	2004-02-20 15:33:58.034685040 +0100
@@ -199,6 +199,7 @@
 {
 	struct cpuinfo_x86 *c = cpu_data;
 	unsigned int i;
+	int result;
 
 	/* capability check */
 	if ((c->x86_vendor != X86_VENDOR_AMD) ||
@@ -220,7 +221,20 @@
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = elanfreq_get_cpu_frequency();
 
-	return cpufreq_frequency_table_cpuinfo(policy, &elanfreq_table[0]);;
+	result = cpufreq_frequency_table_cpuinfo(policy, elanfreq_table);
+	if (result)
+		return (result);
+
+        cpufreq_frequency_table_get_attr(elanfreq_table, policy->cpu);
+
+	return 0;
+}
+
+
+static int elanfreq_cpu_exit(struct cpufreq_policy *policy)
+{
+	cpufreq_frequency_table_put_attr(policy->cpu);
+	return 0;
 }
 
 
@@ -245,12 +259,20 @@
 #endif
 
 
+static struct freq_attr* elanfreq_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
+
 static struct cpufreq_driver elanfreq_driver = {
 	.verify 	= elanfreq_verify,
 	.target 	= elanfreq_target,
 	.init		= elanfreq_cpu_init,
+	.exit		= elanfreq_cpu_exit,
 	.name		= "elanfreq",
 	.owner		= THIS_MODULE,
+	.attr		= elanfreq_attr,
 };
 
 
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/longhaul.c linux/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/longhaul.c	2004-02-18 10:22:09.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/longhaul.c	2004-02-20 15:37:14.605801688 +0100
@@ -428,15 +428,34 @@
  	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = calc_speed (longhaul_get_cpu_mult(), fsb);
 
-	return cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
+	ret = cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
+	if (ret)
+		return ret;
+
+	cpufreq_frequency_table_get_attr(longhaul_table, policy->cpu);
+
+	return 0;
 }
 
+static int longhaul_cpu_exit(struct cpufreq_policy *policy)
+{
+	cpufreq_frequency_table_put_attr(policy->cpu);
+	return 0;
+}
+
+static struct freq_attr* longhaul_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
 static struct cpufreq_driver longhaul_driver = {
 	.verify 	= longhaul_verify,
 	.target 	= longhaul_target,
 	.init		= longhaul_cpu_init,
+	.exit		= longhaul_cpu_exit,
 	.name		= "longhaul",
 	.owner		= THIS_MODULE,
+	.attr		= longhaul_attr,
 };
 
 static int __init longhaul_init (void)
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k6.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k6.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k6.c	2004-02-18 10:22:09.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k6.c	2004-02-20 15:34:45.402484040 +0100
@@ -140,6 +140,7 @@
 static int powernow_k6_cpu_init(struct cpufreq_policy *policy)
 {
 	unsigned int i;
+	int result;
 
 	if (policy->cpu != 0)
 		return -ENODEV;
@@ -161,7 +162,13 @@
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = busfreq * max_multiplier;
 
-	return cpufreq_frequency_table_cpuinfo(policy, &clock_ratio[0]);
+	result = cpufreq_frequency_table_cpuinfo(policy, clock_ratio);
+	if (result)
+		return (result);
+
+	cpufreq_frequency_table_get_attr(clock_ratio, policy->cpu);
+
+	return 0;
 }
 
 
@@ -172,9 +179,14 @@
 		if (i==max_multiplier)
 			powernow_k6_set_state(i);
 	}
-	return 0;
+	cpufreq_frequency_table_put_attr(policy->cpu);
+ 	return 0;
 }
 
+static struct freq_attr* powernow_k6_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
 
 static struct cpufreq_driver powernow_k6_driver = {
 	.verify 	= powernow_k6_verify,
@@ -183,6 +195,7 @@
 	.exit		= powernow_k6_cpu_exit,
 	.name		= "powernow-k6",
 	.owner		= THIS_MODULE,
+	.attr		= powernow_k6_attr,
 };
 
 
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-02-18 10:22:09.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-02-20 15:36:35.710714640 +0100
@@ -801,6 +797,8 @@
 		return -EINVAL;
 	}
 
+	cpufreq_frequency_table_get_attr(powernow_table, pol->cpu);
+
 	printk(KERN_INFO PFX "cpu_init done, current fid 0x%x, vid 0x%x\n",
 	       currfid, currvid);
 
@@ -812,12 +810,19 @@
 	if (pol->cpu != 0)
 		return -EINVAL;
 
+	cpufreq_frequency_table_put_attr(pol->cpu);
+
 	if (powernow_table)
 		kfree(powernow_table);
 
 	return 0;
 }
 
+static struct freq_attr* powernow_k8_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
 static struct cpufreq_driver cpufreq_amd64_driver = {
 	.verify = powernowk8_verify,
 	.target = powernowk8_target,
@@ -825,6 +830,7 @@
 	.exit = powernowk8_cpu_exit,
 	.name = "powernow-k8",
 	.owner = THIS_MODULE,
+	.attr = powernow_k8_attr,
 };
 
 
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-02-18 10:22:09.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-02-20 15:33:07.122424880 +0100
@@ -303,16 +303,37 @@
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = speed;
 
-	return cpufreq_frequency_table_cpuinfo(policy, &speedstep_freqs[0]);
+	result = cpufreq_frequency_table_cpuinfo(policy, speedstep_freqs);
+	if (result)
+		return (result);
+
+        cpufreq_frequency_table_get_attr(speedstep_freqs, policy->cpu);
+
+	return 0;
 }
 
 
+static int speedstep_cpu_exit(struct cpufreq_policy *policy)
+{
+	cpufreq_frequency_table_put_attr(policy->cpu);
+	return 0;
+}
+
+
+static struct freq_attr* speedstep_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
+
 static struct cpufreq_driver speedstep_driver = {
 	.name		= "speedstep-ich",
 	.verify 	= speedstep_verify,
 	.target 	= speedstep_target,
 	.init		= speedstep_cpu_init,
+	.exit		= speedstep_cpu_exit,
 	.owner		= THIS_MODULE,
+	.attr		= speedstep_attr,
 };
 
 
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004-02-18 10:22:09.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004-02-20 15:38:02.874463736 +0100
@@ -286,7 +286,20 @@
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = speed;
 
-	return cpufreq_frequency_table_cpuinfo(policy, &speedstep_freqs[0]);
+	result = cpufreq_frequency_table_cpuinfo(policy, speedstep_freqs);
+	if (result)
+		return (result);
+
+        cpufreq_frequency_table_get_attr(speedstep_freqs, policy->cpu);
+
+	return 0;
+}
+
+
+static int speedstep_cpu_exit(struct cpufreq_policy *policy)
+{
+	cpufreq_frequency_table_put_attr(policy->cpu);
+	return 0;
 }
 
 
@@ -300,14 +313,20 @@
 	return result;
 }
 
+static struct freq_attr* speedstep_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
 
 static struct cpufreq_driver speedstep_driver = {
 	.name		= "speedstep-smi",
 	.verify 	= speedstep_verify,
 	.target 	= speedstep_target,
 	.init		= speedstep_cpu_init,
+	.exit		= speedstep_cpu_exit,
 	.resume		= speedstep_resume,
 	.owner		= THIS_MODULE,
+	.attr		= speedstep_attr,
 };
 
 /**
