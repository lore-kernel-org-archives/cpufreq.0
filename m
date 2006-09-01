From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 3/5] Unify ACPI bits on speedstep-centrino and acpi-cpufreq
Date: Fri, 1 Sep 2006 14:09:32 -0700
Message-ID: <20060901140932.F14821@unix-os.sc.intel.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: alexey.y.starikovskiy@intel.com, cpufreq <cpufreq@www.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>



Mark ACPI hooks in speedstep-centrino as deprecated. Change the order in which
speedstep-centrino and acpi-cpufreq (when both are in kernel) will be
added. First driver to be tried is now acpi-cpufreq, followed by 
speedstep-centrino.

Add a note in feature-removal-schedule to mark this deprecation.

Signed-off-by: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>

Index: linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/Kconfig
===================================================================
--- linux-2.6.18-rc4.orig/arch/i386/kernel/cpu/cpufreq/Kconfig
+++ linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/Kconfig
@@ -17,6 +17,7 @@ config X86_ACPI_CPUFREQ
 	help
 	  This driver adds a CPUFreq driver which utilizes the ACPI
 	  Processor Performance States.
+	  This driver also supports Intel Enhanced Speedstep.
 
 	  For details, take a look at <file:Documentation/cpu-freq/>.
 
@@ -121,12 +122,15 @@ config X86_SPEEDSTEP_CENTRINO
 	  If in doubt, say N.
 
 config X86_SPEEDSTEP_CENTRINO_ACPI
-	bool "Use ACPI tables to decode valid frequency/voltage pairs"
+	bool "Use ACPI tables to decode valid frequency/voltage (deprecated)"
 	depends on X86_SPEEDSTEP_CENTRINO && ACPI_PROCESSOR
 	depends on !(X86_SPEEDSTEP_CENTRINO = y && ACPI_PROCESSOR = m)
 	default y
 	help
-	  Use primarily the information provided in the BIOS ACPI tables
+	  This is deprecated and this functionality is now merged into
+	  acpi_cpufreq (X86_ACPI_CPUFREQ). Use that driver instead of
+	  speedstep_centrino.
+	  Was used primarily the information provided in the BIOS ACPI tables
 	  to determine valid CPU frequency and voltage pairings. It is
 	  required for the driver to work on non-Banias CPUs.
 
Index: linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/Makefile
===================================================================
--- linux-2.6.18-rc4.orig/arch/i386/kernel/cpu/cpufreq/Makefile
+++ linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/Makefile
@@ -7,9 +7,9 @@ obj-$(CONFIG_SC520_CPUFREQ)		+= sc520_fr
 obj-$(CONFIG_X86_LONGRUN)		+= longrun.o  
 obj-$(CONFIG_X86_GX_SUSPMOD)		+= gx-suspmod.o
 obj-$(CONFIG_X86_SPEEDSTEP_ICH)		+= speedstep-ich.o
-obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO)	+= speedstep-centrino.o
 obj-$(CONFIG_X86_SPEEDSTEP_LIB)		+= speedstep-lib.o
 obj-$(CONFIG_X86_SPEEDSTEP_SMI)		+= speedstep-smi.o
 obj-$(CONFIG_X86_ACPI_CPUFREQ)		+= acpi-cpufreq.o
+obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO)	+= speedstep-centrino.o
 obj-$(CONFIG_X86_P4_CLOCKMOD)		+= p4-clockmod.o
 obj-$(CONFIG_X86_CPUFREQ_NFORCE2)	+= cpufreq-nforce2.o
Index: linux-2.6.18-rc4/arch/x86_64/kernel/cpufreq/Kconfig
===================================================================
--- linux-2.6.18-rc4.orig/arch/x86_64/kernel/cpufreq/Kconfig
+++ linux-2.6.18-rc4/arch/x86_64/kernel/cpufreq/Kconfig
@@ -27,10 +27,13 @@ config X86_POWERNOW_K8_ACPI
 	default y
 
 config X86_SPEEDSTEP_CENTRINO
-	tristate "Intel Enhanced SpeedStep"
+	tristate "Intel Enhanced SpeedStep (deprecated)"
 	select CPU_FREQ_TABLE
 	depends on ACPI_PROCESSOR
 	help
+	  This is deprecated and this functionality is now merged into
+	  acpi_cpufreq (X86_ACPI_CPUFREQ). Use that driver instead of
+	  speedstep_centrino.
 	  This adds the CPUFreq driver for Enhanced SpeedStep enabled
 	  mobile CPUs.  This means Intel Pentium M (Centrino) CPUs
 	  or 64bit enabled Intel Xeons.
@@ -50,6 +53,7 @@ config X86_ACPI_CPUFREQ
 	help
 	  This driver adds a CPUFreq driver which utilizes the ACPI
 	  Processor Performance States.
+	  This driver also supports Intel Enhanced Speedstep.
 
 	  For details, take a look at <file:Documentation/cpu-freq/>.
 
Index: linux-2.6.18-rc4/arch/x86_64/kernel/cpufreq/Makefile
===================================================================
--- linux-2.6.18-rc4.orig/arch/x86_64/kernel/cpufreq/Makefile
+++ linux-2.6.18-rc4/arch/x86_64/kernel/cpufreq/Makefile
@@ -5,8 +5,8 @@
 SRCDIR := ../../../i386/kernel/cpu/cpufreq
 
 obj-$(CONFIG_X86_POWERNOW_K8) += powernow-k8.o
-obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO) += speedstep-centrino.o
 obj-$(CONFIG_X86_ACPI_CPUFREQ) += acpi-cpufreq.o
+obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO) += speedstep-centrino.o
 obj-$(CONFIG_X86_P4_CLOCKMOD) += p4-clockmod.o
 obj-$(CONFIG_X86_SPEEDSTEP_LIB) += speedstep-lib.o
 
Index: linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
===================================================================
--- linux-2.6.18-rc4.orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
+++ linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
@@ -531,6 +531,9 @@ static int centrino_cpu_init_acpi(struct
 
 	/* notify BIOS that we exist */
 	acpi_processor_notify_smm(THIS_MODULE);
+	printk("speedstep-centrino with X86_SPEEDSTEP_CENTRINO_ACPI"
+			"config is deprecated.\n "
+			"Use X86_ACPI_CPUFREQ (acpi-cpufreq instead.\n" );
 
 	return 0;
 
Index: linux-2.6.18-rc4/Documentation/feature-removal-schedule.txt
===================================================================
--- linux-2.6.18-rc4.orig/Documentation/feature-removal-schedule.txt
+++ linux-2.6.18-rc4/Documentation/feature-removal-schedule.txt
@@ -274,3 +274,25 @@ Why:	The deferred output hooks are a lay
 Who:	Patrick McHardy <kaber@trash.net>
 
 ---------------------------
+
+What:	ACPI hooks (X86_SPEEDSTEP_CENTRINO_ACPI) in speedstep-centrino driver
+When:	December 2006
+Why:	Speedstep-centrino driver with ACPI hooks and acpi-cpufreq driver are
+	functionally very much similar. They talk to ACPI in same way. Only
+	difference between them is the way they do frequency transitions.
+	One uses MSRs and the other one uses IO ports. Functionaliy of
+	speedstep_centrino with ACPI hooks is now merged into acpi-cpufreq.
+	That means one common driver will support all Intel Enhanced Speedstep
+	capable CPUs. That means less confusion over name of
+	speedstep-centrino driver (with that driver supposed to be used on
+	non-centrino platforms). That means less duplication of code and
+	less maintenance effort and no possibility of these two drivers
+	going out of sync.
+	Current users of speedstep_centrino with ACPI hooks are requested to
+	switch over to acpi-cpufreq driver. speedstep-centrino will continue
+	to work using older non-ACPI static table based scheme even after this
+	date.
+
+Who:	Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
+
+---------------------------
