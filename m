From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC][PATCH] cpufreq-acpi: rename
Date: Wed, 29 Sep 2004 23:43:20 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040929214320.GB18564@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

NOTE: For this patch to work you need to move the file
arch/i386/kernel/cpu/cpufreq/acpi.c (in bitkeeper) to
arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c _before_ applying this
patch. I haven't done it by means of diff -ruN so that the file 
history can be kept. END NOTE.

The "acpi" cpufreq driver uses the far too generic module name "acpi".
Fix it by renaming it to "cpufreq-acpi". A MODULE_ALIAS("acpi"); will
allow for backwards-compatible naming until 2005-06-30.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c linux/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2004-09-23 19:30:37.633357200 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2004-09-23 19:22:51.196266416 +0200
@@ -516,3 +516,5 @@
 
 late_initcall(acpi_cpufreq_init);
 module_exit(acpi_cpufreq_exit);
+
+MODULE_ALIAS("acpi");
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Makefile linux/arch/i386/kernel/cpu/cpufreq/Makefile
--- linux-original/arch/i386/kernel/cpu/cpufreq/Makefile	2004-09-19 13:48:21.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/Makefile	2004-09-23 19:22:59.709972136 +0200
@@ -9,7 +9,7 @@
 obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO) += speedstep-centrino.o
 obj-$(CONFIG_X86_SPEEDSTEP_LIB) += speedstep-lib.o
 obj-$(CONFIG_X86_SPEEDSTEP_SMI) += speedstep-smi.o
-obj-$(CONFIG_X86_ACPI_CPUFREQ)	+= acpi.o
+obj-$(CONFIG_X86_ACPI_CPUFREQ)	+= acpi-cpufreq.o
 obj-$(CONFIG_X86_P4_CLOCKMOD)	+= p4-clockmod.o
 
 ifdef CONFIG_X86_ACPI_CPUFREQ
diff -ruN linux-original/arch/x86_64/kernel/cpufreq/Makefile linux/arch/x86_64/kernel/cpufreq/Makefile
--- linux-original/arch/x86_64/kernel/cpufreq/Makefile	2004-09-19 13:48:22.000000000 +0200
+++ linux/arch/x86_64/kernel/cpufreq/Makefile	2004-09-23 19:28:24.402611352 +0200
@@ -6,8 +6,8 @@
 
 obj-$(CONFIG_X86_POWERNOW_K8) += powernow-k8.o
 obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO) += speedstep-centrino.o
-obj-$(CONFIG_X86_ACPI_CPUFREQ) += acpi.o
+obj-$(CONFIG_X86_ACPI_CPUFREQ) += acpi-cpufreq.o
 
 powernow-k8-objs := ${SRCDIR}/powernow-k8.o
 speedstep-centrino-objs := ${SRCDIR}/speedstep-centrino.o
-acpi-objs := ${SRCDIR}/acpi.o
+acpi-objs := ${SRCDIR}/acpi-cpufreq.o
