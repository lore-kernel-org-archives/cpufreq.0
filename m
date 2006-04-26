From: "Jan Beulich" <jbeulich@novell.com>
Subject: [PATCH] dprintk adjustments to cpufreq-speedstep-centrino
Date: Wed, 26 Apr 2006 15:41:22 +0200
Message-ID: <444F94A2.76E4.0078.0@novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: linux-kernel@vger.kernel.org

Remove KERN_* suffixes from some Centrino cpufreq driver's dprintk-s.

Signed-off-by: Jan Beulich <jbeulich@novell.com>

diff -Npru /home/jbeulich/tmp/linux-2.6.17-rc2/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
2.6.17-rc2-x86-cpufreq-centrino-dprintk/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- /home/jbeulich/tmp/linux-2.6.17-rc2/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2006-04-26
10:55:11.000000000 +0200
+++ 2.6.17-rc2-x86-cpufreq-centrino-dprintk/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2006-04-24
12:28:36.000000000 +0200
@@ -250,7 +250,7 @@ static int centrino_cpu_init_table(struc
 
 	if (model->cpu_id == NULL) {
 		/* No match at all */
-		dprintk(KERN_INFO PFX "no support for CPU model \"%s\": "
+		dprintk("no support for CPU model \"%s\": "
 		       "send /proc/cpuinfo to " MAINTAINER "\n",
 		       cpu->x86_model_id);
 		return -ENOENT;
@@ -258,10 +258,10 @@ static int centrino_cpu_init_table(struc
 
 	if (model->op_points == NULL) {
 		/* Matched a non-match */
-		dprintk(KERN_INFO PFX "no table support for CPU model \"%s\"\n",
+		dprintk("no table support for CPU model \"%s\"\n",
 		       cpu->x86_model_id);
 #ifndef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
-		dprintk(KERN_INFO PFX "try compiling with CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled\n");
+		dprintk("try compiling with CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled\n");
 #endif
 		return -ENOENT;
 	}
@@ -368,7 +368,7 @@ static int centrino_cpu_init_acpi(struct
 
 	/* register with ACPI core */
 	if (acpi_processor_register_performance(&p, cpu)) {
-		dprintk(KERN_INFO PFX "obtaining ACPI data failed\n");
+		dprintk("obtaining ACPI data failed\n");
 		return -EIO;
 	}
 
@@ -465,7 +465,7 @@ static int centrino_cpu_init_acpi(struct
 	kfree(centrino_model[cpu]);
  err_unreg:
 	acpi_processor_unregister_performance(&p, cpu);
-	dprintk(KERN_INFO PFX "invalid ACPI data\n");
+	dprintk("invalid ACPI data\n");
 	return (result);
 }
 #else
@@ -499,7 +499,7 @@ static int centrino_cpu_init(struct cpuf
 			centrino_cpu[policy->cpu] = &cpu_ids[i];
 
 		if (!centrino_cpu[policy->cpu]) {
-			dprintk(KERN_INFO PFX "found unsupported CPU with "
+			dprintk("found unsupported CPU with "
 			"Enhanced SpeedStep: send /proc/cpuinfo to "
 			MAINTAINER "\n");
 			return -ENODEV;
