From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] Set CONST_LOOPS flag for P4 with Enhanced Speedstep
	Technology
Date: Thu, 30 Dec 2004 15:11:15 -0800
Message-ID: <20041230151115.A30475@unix-os.sc.intel.com>
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


[CPUFREQ] speedstep-centrino and acpi-cpufreq

In P4, CPU tsc rate won't change with CPU frequency change while using Enhanced 
Speedstep Technology. 
Tested with both speedstep-centrino and acpi-cpufreq on both i386 and x86-64.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

--- linux-2.6.10/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c.org	2004-12-30 13:56:29.000000000 -0800
+++ linux-2.6.10/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2004-12-30 14:02:03.000000000 -0800
@@ -38,6 +38,8 @@
 #include <linux/acpi.h>
 #include <acpi/processor.h>
 
+#include "speedstep-est-common.h"
+
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "acpi-cpufreq", msg)
 
 MODULE_AUTHOR("Paul Diefenbaugh, Dominik Brodowski");
@@ -52,6 +54,7 @@ struct cpufreq_acpi_io {
 
 static struct cpufreq_acpi_io	*acpi_io_data[NR_CPUS];
 
+static struct cpufreq_driver acpi_cpufreq_driver;
 
 static int
 acpi_processor_write_port(
@@ -368,6 +371,10 @@ acpi_cpufreq_cpu_init (
 	if (result)
 		goto err_free;
 
+	if (is_const_loops_cpu(cpu)) {
+		acpi_cpufreq_driver.flags |= CPUFREQ_CONST_LOOPS;
+	}
+
 	/* capability check */
 	if (data->acpi_data.state_count <= 1) {
 		dprintk("No P-States\n");
--- linux-2.6.10/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c.org	2004-12-30 13:42:14.000000000 -0800
+++ linux-2.6.10/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-12-30 14:03:44.000000000 -0800
@@ -32,6 +32,8 @@
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
 
+#include "speedstep-est-common.h"
+
 #define PFX		"speedstep-centrino: "
 #define MAINTAINER	"Jeremy Fitzhardinge <jeremy@goop.org>"
 
@@ -74,6 +76,8 @@ static int centrino_verify_cpu_id(const 
 static struct cpu_model *centrino_model;
 static const struct cpu_id *centrino_cpu;
 
+static struct cpufreq_driver centrino_driver;
+
 #ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE
 
 /* Computes the correct form for IA32_PERF_CTL MSR for a particular
@@ -475,6 +479,10 @@ static int centrino_cpu_init(struct cpuf
 	if (i != N_IDS)
 		centrino_cpu = &cpu_ids[i];
 
+	if (is_const_loops_cpu(policy->cpu)) {
+		centrino_driver.flags |= CPUFREQ_CONST_LOOPS;
+	}
+
 	if (centrino_cpu_init_acpi(policy)) {
 		if (policy->cpu != 0)
 			return -ENODEV;
--- linux-2.6.10/arch/i386/kernel/cpu/cpufreq/speedstep-est-common.h.org	2004-12-30 13:56:07.000000000 -0800
+++ linux-2.6.10/arch/i386/kernel/cpu/cpufreq/speedstep-est-common.h	2004-12-30 17:22:52.000000000 -0800
@@ -0,0 +1,40 @@
+/*
+ * Routines common for drivers handling Enhanced Speedstep Technology
+ *  Copyright (C) 2004 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or (at
+ *  your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful, but
+ *  WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License along
+ *  with this program; if not, write to the Free Software Foundation, Inc.,
+ *  59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
+ *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ */
+
+static inline int is_const_loops_cpu(unsigned int cpu)
+{
+	struct cpuinfo_x86 	*c = cpu_data + cpu;
+
+	if (c->x86_vendor != X86_VENDOR_INTEL || !cpu_has(c, X86_FEATURE_EST))
+		return 0;
+
+	/* 
+	 * on P-4s, the TSC runs with constant frequency independent of cpu freq
+	 * when we use EST 
+	 */
+	if (c->x86 == 0xf)
+		return 1;
+
+	return 0;
+}
+
