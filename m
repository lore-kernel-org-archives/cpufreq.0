From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] quieter speedstep-centrino
Date: Thu, 9 Dec 2004 17:27:29 -0800
Message-ID: <20041209172729.B3337@unix-os.sc.intel.com>
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: linux@dominikbrodowski.de, cpufreq@www.linux.org.uk



Patch to remove speedstep-centrino error messages getting printed by default.
Print them only when debug flags are enabled.

The reason for this patch is -
With the multiple drivers model that we have now, any installation will try 
different drivers one after the other, until one of them succeeds. So, 
failure to add speedstep-centrino alone doesn't mean error, as some other
driver (say acpi.ko) can succeed later and system will still be able to use
speedstep. Printing the error whenever speedstep-centrino fails can confuse 
the enduser.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

--- linux-2.6.10-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c.org	2004-12-07 18:48:19.000000000 -0800
+++ linux-2.6.10-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-12-07 18:54:09.000000000 -0800
@@ -239,7 +239,7 @@ static int centrino_cpu_init_table(struc
 
 	if (model->cpu_id == NULL) {
 		/* No match at all */
-		printk(KERN_INFO PFX "no support for CPU model \"%s\": "
+		dprintk("no support for CPU model \"%s\": "
 		       "send /proc/cpuinfo to " MAINTAINER "\n",
 		       cpu->x86_model_id);
 		return -ENOENT;
@@ -247,10 +247,10 @@ static int centrino_cpu_init_table(struc
 
 	if (model->op_points == NULL) {
 		/* Matched a non-match */
-		printk(KERN_INFO PFX "no table support for CPU model \"%s\": \n",
+		dprintk("no table support for CPU model \"%s\": \n",
 		       cpu->x86_model_id);
#ifndef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
-		printk(KERN_INFO PFX "try compiling with CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled\n");
+		dprintk("try compiling with CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled\n");
 #endif
 		return -ENOENT;
 	}
@@ -352,7 +352,7 @@ static int centrino_cpu_init_acpi(struct
 
 	/* register with ACPI core */
 	if (acpi_processor_register_performance(&p, cpu)) {
-		printk(KERN_INFO PFX "obtaining ACPI data failed\n");
+		dprintk("obtaining ACPI data failed\n");
 		return -EIO;
 	}
 
@@ -450,7 +450,7 @@ static int centrino_cpu_init_acpi(struct
 	kfree(centrino_model[cpu]);
  err_unreg:
 	acpi_processor_unregister_performance(&p, cpu);
-	printk(KERN_INFO PFX "invalid ACPI data\n");
+	dprintk("invalid ACPI data\n");
 	return (result);
 }
 #else
@@ -481,7 +481,7 @@ static int centrino_cpu_init(struct cpuf
 			return -ENODEV;
 
 		if (!centrino_cpu[policy->cpu]) {
-			printk(KERN_INFO PFX "found unsupported CPU with "
+			dprintk("found unsupported CPU with "
 			"Enhanced SpeedStep: send /proc/cpuinfo to "
 			MAINTAINER "\n");
 			return -ENODEV;
