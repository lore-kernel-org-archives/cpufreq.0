From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] don't use speedstep-centrino on unsupported CPUs
Date: Tue, 6 Apr 2004 17:08:09 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406150809.GA8795@dominikbrodowski.de>
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

Don't use the ACPI data on CPUs we don't know nothing about.

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-04-06 16:41:19.908636480 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-04-06 17:03:50.263351360 +0200
@@ -195,21 +195,6 @@
 	struct cpuinfo_x86 *cpu = &cpu_data[policy->cpu];
 	struct cpu_model *model;
 
-	if (!cpu_has(cpu, X86_FEATURE_EST))
-		return -ENODEV;
-
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
 	for(model = models; model->model_name != NULL; model++)
 		if (strcmp(cpu->x86_model_id, model->model_name) == 0)
 			break;
@@ -361,6 +346,7 @@
 
 static int centrino_cpu_init(struct cpufreq_policy *policy)
 {
+	struct cpuinfo_x86 *cpu = &cpu_data[policy->cpu];
 	unsigned freq;
 	unsigned l, h;
 	int ret;
@@ -368,6 +354,21 @@
 	if (policy->cpu != 0)
 		return -ENODEV;
 
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
 	if (centrino_cpu_init_acpi(policy)) {
 		if (centrino_cpu_init_table(policy)) {
 			return -ENODEV;
