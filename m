From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 2.6.4] (3/5) speedstep-centrino: move to per-CPU analyzing
	of CPU data
Date: Mon, 15 Mar 2004 15:14:57 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315141457.GD8636@dominikbrodowski.de>
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

Move the table matching into an own function; only the FEATURE_EST bit 
for CPU 0 is checked in module_init() directly. As cpufreq drivers aren't 
sticky any longer (see other pending patch), this will not change 
user-visible behaviour.

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |  106 ++++++++++++---------- 
 1 files changed, 60 insertions(+), 46 deletions(-)


diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-03-15 09:20:50.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-03-15 13:34:53.885365160 +0100
@@ -187,6 +187,45 @@
 };
 #undef CPU
 
+static int centrino_cpu_init_table(struct cpufreq_policy *policy)
+{
+	struct cpuinfo_x86 *cpu = &cpu_data[policy->cpu];
+	const struct cpu_model *model;
+
+	if (!cpu_has(cpu, X86_FEATURE_EST))
+		return -ENODEV;
+
+	/* Only Intel Pentium M stepping 5 for now - add new CPUs as
+	   they appear after making sure they use PERF_CTL in the same
+	   way. */
+	if (cpu->x86_vendor != X86_VENDOR_INTEL ||
+	    cpu->x86        != 6 ||
+	    cpu->x86_model  != 9 ||
+	    cpu->x86_mask   != 5) {
+		printk(KERN_INFO PFX "found unsupported CPU with Enhanced SpeedStep: "
+		       "send /proc/cpuinfo to " MAINTAINER "\n");
+		return -ENODEV;
+	}
+
+	for(model = models; model->model_name != NULL; model++)
+		if (strcmp(cpu->x86_model_id, model->model_name) == 0)
+			break;
+	if (model->model_name == NULL) {
+		printk(KERN_INFO PFX "no support for CPU model \"%s\": "
+		       "send /proc/cpuinfo to " MAINTAINER "\n",
+		       cpu->x86_model_id);
+		return -ENOENT;
+	}
+
+	centrino_model = model;
+		
+	printk(KERN_INFO PFX "found \"%s\": max frequency: %dkHz\n",
+	       model->model_name, model->max_freq);
+
+	return 0;
+}
+
+
 /* Extract clock in kHz from PERF_CTL value */
 static unsigned extract_clock(unsigned msr)
 {
@@ -206,10 +245,30 @@
 static int centrino_cpu_init(struct cpufreq_policy *policy)
 {
 	unsigned freq;
+	unsigned l, h;
 
-	if (policy->cpu != 0 || centrino_model == NULL)
+	if (policy->cpu != 0)
 		return -ENODEV;
 
+	if (centrino_cpu_init_table(policy))
+		return -ENODEV;
+
+	/* Check to see if Enhanced SpeedStep is enabled, and try to
+	   enable it if not. */
+	rdmsr(MSR_IA32_MISC_ENABLE, l, h);
+		
+	if (!(l & (1<<16))) {
+		l |= (1<<16);
+		wrmsr(MSR_IA32_MISC_ENABLE, l, h);
+		
+		/* check to see if it stuck */
+		rdmsr(MSR_IA32_MISC_ENABLE, l, h);
+		if (!(l & (1<<16))) {
+			printk(KERN_INFO PFX "couldn't enable Enhanced SpeedStep\n");
+			return -ENODEV;
+		}
+	}
+
 	freq = get_cur_freq();
 
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
@@ -322,55 +381,10 @@
 static int __init centrino_init(void)
 {
 	struct cpuinfo_x86 *cpu = cpu_data;
-	const struct cpu_model *model;
-	unsigned l, h;
 
 	if (!cpu_has(cpu, X86_FEATURE_EST))
 		return -ENODEV;
 
-	/* Only Intel Pentium M stepping 5 for now - add new CPUs as
-	   they appear after making sure they use PERF_CTL in the same
-	   way. */
-	if (cpu->x86_vendor != X86_VENDOR_INTEL ||
-	    cpu->x86        != 6 ||
-	    cpu->x86_model  != 9 ||
-	    cpu->x86_mask   != 5) {
-		printk(KERN_INFO PFX "found unsupported CPU with Enhanced SpeedStep: "
-		       "send /proc/cpuinfo to " MAINTAINER "\n");
-		return -ENODEV;
-	}
-
-	/* Check to see if Enhanced SpeedStep is enabled, and try to
-	   enable it if not. */
-	rdmsr(MSR_IA32_MISC_ENABLE, l, h);
-		
-	if (!(l & (1<<16))) {
-		l |= (1<<16);
-		wrmsr(MSR_IA32_MISC_ENABLE, l, h);
-		
-		/* check to see if it stuck */
-		rdmsr(MSR_IA32_MISC_ENABLE, l, h);
-		if (!(l & (1<<16))) {
-			printk(KERN_INFO PFX "couldn't enable Enhanced SpeedStep\n");
-			return -ENODEV;
-		}
-	}
-
-	for(model = models; model->model_name != NULL; model++)
-		if (strcmp(cpu->x86_model_id, model->model_name) == 0)
-			break;
-	if (model->model_name == NULL) {
-		printk(KERN_INFO PFX "no support for CPU model \"%s\": "
-		       "send /proc/cpuinfo to " MAINTAINER "\n",
-		       cpu->x86_model_id);
-		return -ENOENT;
-	}
-
-	centrino_model = model;
-		
-	printk(KERN_INFO PFX "found \"%s\": max frequency: %dkHz\n",
-	       model->model_name, model->max_freq);
-
 	return cpufreq_register_driver(&centrino_driver);
 }
