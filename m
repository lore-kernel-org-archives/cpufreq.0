From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq Kconfig, 1.12, 1.13 Makefile,
	1.16, 1.17 acpi.c, 1.11, 1.12 elanfreq.c, 1.32,
	1.33 gx-suspmod.c, 1.10, 1.11 longhaul.c, 1.95,
	1.96 longhaul.h, 1.2, 1.3 longrun.c, 1.30, 1.31 p4-clockmod.c,
	1.45, 1.46 powernow-k6.c, 1.53, 1.54 powernow-k7.c, 1.48,
	1.49 powernow-k7.h, 1.3, 1.4 powernow-k8.c, 1.3,
	1.4 powernow-k8.h, 1.2, 1.3 speedstep-centrino.c, 1.4,
	1.5 speedstep-ich.c, 1.7, 1.8 speedstep-lib.c, 1.3,
	1.4 speedstep-lib.h, 1.2, 1.3 speedstep-smi.c, 1.4, 1.5
Date: Thu, 26 Aug 2004 14:25:27 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C0KFr-0006ng-O6@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv26017/linux/arch/i386/kernel/cpufreq

Modified Files:
	Kconfig Makefile acpi.c elanfreq.c gx-suspmod.c longhaul.c 
	longhaul.h longrun.c p4-clockmod.c powernow-k6.c powernow-k7.c 
	powernow-k7.h powernow-k8.c powernow-k8.h speedstep-centrino.c 
	speedstep-ich.c speedstep-lib.c speedstep-lib.h 
	speedstep-smi.c 
Log Message:
merge with current cpufreq bk tree and 2.6.9-r1

Index: Kconfig
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/Kconfig,v
retrieving revision 1.12
retrieving revision 1.13
diff -u -r1.12 -r1.13
--- Kconfig	20 Jan 2004 17:03:31 -0000	1.12
+++ Kconfig	26 Aug 2004 13:25:18 -0000	1.13
@@ -11,8 +11,8 @@
 	  fly. This is a nice method to save battery power on notebooks,
 	  because the lower the clock speed, the less power the CPU consumes.
 
-	  For more information, take a look at linux/Documentation/cpu-freq or
-	  at <http://www.codemonkey.org.uk/projects/cpufreq/>
+	  For more information, take a look at <file:Documentation/cpu-freq/>
+	  or at <http://www.codemonkey.org.uk/projects/cpufreq/>
 
 	  If in doubt, say N.
 
@@ -38,7 +38,7 @@
 	  This driver adds a CPUFreq driver which utilizes the ACPI
 	  Processor Performance States.
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 
@@ -54,7 +54,7 @@
 
 config ELAN_CPUFREQ
 	tristate "AMD Elan"
-	depends on CPU_FREQ_TABLE && MELAN
+	depends on CPU_FREQ_TABLE && X86_ELAN
 	---help---
 	  This adds the CPUFreq driver for AMD Elan SC400 and SC410
 	  processors.
@@ -63,7 +63,7 @@
 	  parameter: elanfreq=maxspeed (in kHz) or as module
 	  parameter "max_freq".
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 
@@ -74,7 +74,7 @@
 	  This adds the CPUFreq driver for mobile AMD K6-2+ and mobile
 	  AMD K6-3+ processors.
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 
@@ -84,30 +84,66 @@
 	help
 	  This adds the CPUFreq driver for mobile AMD K7 mobile processors.
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 
+config X86_POWERNOW_K7_ACPI
+	bool
+	depends on ((X86_POWERNOW_K7 = "m" && ACPI_PROCESSOR) || (X86_POWERNOW_K7 = "y" && ACPI_PROCESSOR = "y"))
+	default y
+
 config X86_POWERNOW_K8
 	tristate "AMD Opteron/Athlon64 PowerNow!"
 	depends on CPU_FREQ && EXPERIMENTAL
 	help
 	  This adds the CPUFreq driver for mobile AMD Opteron/Athlon64 processors.
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 
+config X86_POWERNOW_K8_ACPI
+	bool
+	depends on ((X86_POWERNOW_K8 = "m" && ACPI_PROCESSOR) || (X86_POWERNOW_K8 = "y" && ACPI_PROCESSOR = "y"))
+	default y
+
 config X86_GX_SUSPMOD
 	tristate "Cyrix MediaGX/NatSemi Geode Suspend Modulation"
 	depends on CPU_FREQ
 	help
-	 This add the CPUFreq driver for NatSemi Geode processors which
-	 support suspend modulation.
+	  This add the CPUFreq driver for NatSemi Geode processors which
+	  support suspend modulation.
 
-	 For details, take a look at linux/Documentation/cpu-freq.
+	  For details, take a look at <file:Documentation/cpu-freq/>.
+
+	  If in doubt, say N.
 
-	 If in doubt, say N.
+config X86_SPEEDSTEP_CENTRINO
+	tristate "Intel Enhanced SpeedStep"
+	depends on CPU_FREQ_TABLE
+	help
+	  This adds the CPUFreq driver for Enhanced SpeedStep enabled
+	  mobile CPUs.  This means Intel Pentium M (Centrino) CPUs.
+	  
+	  For details, take a look at <file:Documentation/cpu-freq/>.
+	  
+	  If in doubt, say N.
+
+config X86_SPEEDSTEP_CENTRINO_TABLE
+	bool
+	depends on X86_SPEEDSTEP_CENTRINO
+	default y
+
+config X86_SPEEDSTEP_CENTRINO_ACPI
+	bool "Use ACPI tables to decode valid frequency/voltage pairs (EXPERIMENTAL)"
+	depends on EXPERIMENTAL
+	depends on ((X86_SPEEDSTEP_CENTRINO = "m" && ACPI_PROCESSOR) || (X86_SPEEDSTEP_CENTRINO = "y" && ACPI_PROCESSOR = "y"))
+	help
+	  Use primarily the information provided in the BIOS ACPI tables
+	  to determine valid CPU frequency and voltage pairings.
+
+	  If in doubt, say Y.
 
 config X86_SPEEDSTEP_PIIX4
 	tristate "Intel Speedstep on PIIX4 chipsets (ioport interface)"
@@ -115,10 +151,10 @@
 	help
 	  This adds the CPUFreq driver for certain mobile Intel Pentium III
 	  (Coppermine), all mobile Intel Pentium III-M (Tualatin) and all
-	  mobile Intel Pentium 4 P4-Ms on systems which have an Intel
+	  mobile Intel Pentium 4 P4-M on systems which have an Intel
 	  PIIX4 (440BX/440MX) southbridge.
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 
@@ -128,10 +164,10 @@
 	help
 	  This adds the CPUFreq driver for certain mobile Intel Pentium III
 	  (Coppermine), all mobile Intel Pentium III-M (Tualatin) and all
-	  mobile Intel Pentium 4 P4-Ms on systems which have an Intel ICH2,
+	  mobile Intel Pentium 4 P4-M on systems which have an Intel ICH2,
 	  ICH3 or ICH4 southbridge.
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 
@@ -143,26 +179,25 @@
 	  (Coppermine), all mobile Intel Pentium III-M (Tualatin)  
 	  on systems which have an Intel 440BX/ZX/MX southbridge.
 
-	  For details, take a look at linux/Documentation/cpu-freq.
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 
-config X86_SPEEDSTEP_CENTRINO
-	tristate "Intel Enhanced SpeedStep"
-	depends on CPU_FREQ_TABLE
-	help
-	  This adds the CPUFreq driver for Enhanced SpeedStep enabled
-	  mobile CPUs.  This means Intel Pentium M (Centrino) CPUs.
-	  
-	  For details, take a look at linux/Documentation/cpu-freq. 
-	  
-	  If in doubt, say N.
-
 config X86_SPEEDSTEP_LIB
        tristate
        depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD || X86_SPEEDSTEP_PIIX4)
        default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD || X86_SPEEDSTEP_PIIX4)
 
+config X86_SPEEDSTEP_RELAXED_CAP_CHECK
+	bool "Relaxed speedstep capability checks"
+	depends on (X86_SPEEDSTEP_SMI || X86_SPEEDSTEP_ICH)
+	help
+	  Don't perform all checks for a speedstep capable system which would 
+	  normally be done. Some ancient or strange systems, though speedstep 
+	  capable, don't always indicate that they are speedstep capable. This 
+	  option let's the probing code bypass some of those checks if the
+	  parameter "relaxed_check=1" is passed to the module.
+
 config X86_P4_CLOCKMOD
 	tristate "Intel Pentium 4 clock modulation"
 	depends on CPU_FREQ_TABLE
@@ -170,7 +205,7 @@
 	  This adds the CPUFreq driver for Intel Pentium 4 / XEON
 	  processors.
 
-	  For details, take a look at linux/Documentation/cpu-freq.
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 
@@ -181,7 +216,7 @@
 	  This adds the CPUFreq driver for Transmeta Crusoe processors which
 	  support LongRun.
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 
@@ -193,7 +228,7 @@
 	  VIA Cyrix Samuel/C3, VIA Cyrix Ezra and VIA Cyrix Ezra-T 
 	  processors.
 
-	  For details, take a look at linux/Documentation/cpu-freq. 
+	  For details, take a look at <file:Documentation/cpu-freq/>.
 
 	  If in doubt, say N.
 

Index: Makefile
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/Makefile,v
retrieving revision 1.16
retrieving revision 1.17
diff -u -r1.16 -r1.17
--- Makefile	5 Nov 2003 18:27:42 -0000	1.16
+++ Makefile	26 Aug 2004 13:25:18 -0000	1.17
@@ -2,16 +2,16 @@
 obj-$(CONFIG_X86_POWERNOW_K7)	+= powernow-k7.o
 obj-$(CONFIG_X86_POWERNOW_K8)	+= powernow-k8.o
 obj-$(CONFIG_X86_LONGHAUL)	+= longhaul.o
-obj-$(CONFIG_X86_P4_CLOCKMOD)	+= p4-clockmod.o
 obj-$(CONFIG_ELAN_CPUFREQ)	+= elanfreq.o
 obj-$(CONFIG_X86_LONGRUN)	+= longrun.o  
 obj-$(CONFIG_X86_GX_SUSPMOD)    += gx-suspmod.o
-obj-$(CONFIG_X86_ACPI_CPUFREQ)	+= acpi.o
+obj-$(CONFIG_X86_SPEEDSTEP_PIIX4) += speedstep-piix4.o
 obj-$(CONFIG_X86_SPEEDSTEP_ICH)	+= speedstep-ich.o
-obj-$(CONFIG_X86_SPEEDSTEP_PIIX4)	+= speedstep-piix4.o
 obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO) += speedstep-centrino.o
 obj-$(CONFIG_X86_SPEEDSTEP_LIB) += speedstep-lib.o
 obj-$(CONFIG_X86_SPEEDSTEP_SMI) += speedstep-smi.o
+obj-$(CONFIG_X86_ACPI_CPUFREQ)	+= acpi.o
+obj-$(CONFIG_X86_P4_CLOCKMOD)	+= p4-clockmod.o
 
 ifdef CONFIG_X86_ACPI_CPUFREQ
   ifdef CONFIG_ACPI_DEBUG

Index: acpi.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/acpi.c,v
retrieving revision 1.11
retrieving revision 1.12
diff -u -r1.11 -r1.12
--- acpi.c	20 Jan 2004 17:03:31 -0000	1.11
+++ acpi.c	26 Aug 2004 13:25:18 -0000	1.12
@@ -1,9 +1,9 @@
 /*
- * acpi_processor_perf.c - ACPI Processor P-States Driver ($Revision$)
+ * acpi-cpufreq-io.c - ACPI Processor P-States Driver ($Revision$)
  *
  *  Copyright (C) 2001, 2002 Andy Grover <andrew.grover@intel.com>
  *  Copyright (C) 2001, 2002 Paul Diefenbaugh <paul.s.diefenbaugh@intel.com>
- *  Copyright (C) 2002, 2003 Dominik Brodowski <linux@brodo.de>
+ *  Copyright (C) 2002 - 2004 Dominik Brodowski <linux@brodo.de>
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *
[...961 lines suppressed...]
-		if (performance[i].pr)
-			performance[i].pr->flags.performance = 0;
-	}
-
-	 cpufreq_unregister_driver(&acpi_cpufreq_driver);
-
-	/* unregister struct acpi_processor_performance performance */
-	for (i=0; i<NR_CPUS; i++) {
-		if (performance[i].pr) {
-			performance[i].pr->flags.performance = 0;
-			performance[i].pr->performance = NULL;
-			performance[i].pr = NULL;
-		}
-	}
-
-	kfree(performance);
+	cpufreq_unregister_driver(&acpi_cpufreq_driver);
 
 	return_VOID;
 }

Index: elanfreq.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/elanfreq.c,v
retrieving revision 1.32
retrieving revision 1.33
diff -u -r1.32 -r1.33
--- elanfreq.c	5 Nov 2003 18:27:42 -0000	1.32
+++ elanfreq.c	26 Aug 2004 13:25:18 -0000	1.33
@@ -77,7 +77,7 @@
  *	and have the rest of the chip running with 33 MHz. 
  */
 
-static unsigned int elanfreq_get_cpu_frequency(void)
+static unsigned int elanfreq_get_cpu_frequency(unsigned int cpu)
 {
         u8 clockspeed_reg;    /* Clock Speed Register */
 	
@@ -121,7 +121,7 @@
 
 	struct cpufreq_freqs    freqs;
 
-	freqs.old = elanfreq_get_cpu_frequency();
+	freqs.old = elanfreq_get_cpu_frequency(0);
 	freqs.new = elan_multiplier[state].clock;
 	freqs.cpu = 0; /* elanfreq.c is UP only driver */
 	
@@ -165,7 +165,8 @@
 
 
 /**
- *	elanfreq_validatespeed: test if frequency range is valid 
+ *	elanfreq_validatespeed: test if frequency range is valid
+ *      @policy: the policy to validate
  *
  *	This function checks if a given frequency range in kHz is valid 
  *      for the hardware supported by the driver. 
@@ -199,6 +200,7 @@
 {
 	struct cpuinfo_x86 *c = cpu_data;
 	unsigned int i;
+	int result;
 
 	/* capability check */
 	if ((c->x86_vendor != X86_VENDOR_AMD) ||
@@ -207,7 +209,7 @@
 
 	/* max freq */
 	if (!max_freq)
-		max_freq = elanfreq_get_cpu_frequency();
+		max_freq = elanfreq_get_cpu_frequency(0);
 
 	/* table init */
  	for (i=0; (elanfreq_table[i].frequency != CPUFREQ_TABLE_END); i++) {
@@ -218,9 +220,22 @@
 	/* cpuinfo and default policy values */
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
-	policy->cur = elanfreq_get_cpu_frequency();
+	policy->cur = elanfreq_get_cpu_frequency(0);
 
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
 
 
@@ -239,18 +254,28 @@
 static int __init elanfreq_setup(char *str)
 {
 	max_freq = simple_strtoul(str, &str, 0);
+	printk(KERN_WARNING "You're using the deprecated elanfreq command line option. Use elanfreq.max_freq instead, please!\n");
 	return 1;
 }
 __setup("elanfreq=", elanfreq_setup);
 #endif
 
 
+static struct freq_attr* elanfreq_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
+
 static struct cpufreq_driver elanfreq_driver = {
+	.get	 	= elanfreq_get_cpu_frequency,
 	.verify 	= elanfreq_verify,
 	.target 	= elanfreq_target,
 	.init		= elanfreq_cpu_init,
+	.exit		= elanfreq_cpu_exit,
 	.name		= "elanfreq",
 	.owner		= THIS_MODULE,
+	.attr		= elanfreq_attr,
 };
 
 
@@ -276,7 +301,7 @@
 }
 
 
-MODULE_PARM (max_freq, "i");
+module_param (max_freq, int, 0444);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Robert Schwebel <r.schwebel@pengutronix.de>, Sven Geggus <sven@geggus.net>");

Index: gx-suspmod.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/gx-suspmod.c,v
retrieving revision 1.10
retrieving revision 1.11
diff -u -r1.10 -r1.11
--- gx-suspmod.c	5 Nov 2003 18:27:42 -0000	1.10
+++ gx-suspmod.c	26 Aug 2004 13:25:18 -0000	1.11
@@ -28,30 +28,34 @@
  *	with 'Suspend Modulation OFF Count Register'
  *	and 'Suspend Modulation ON Count Register'.
  *	These registers are 8bit counters that represent the number of 
- *	32us intervals which the SUSP# pin is asserted/de-asserted to the 
- *	processor.
+ *	32us intervals which the SUSP# pin is asserted(ON)/de-asserted(OFF)
+ *	to the processor.
  *
  *	These counters define a ratio which is the effective frequency 
  * 	of operation of the system.
  *
- *			       On Count
+ *			       OFF Count
  *	F_eff = Fgx * ----------------------
- *	                On Count + Off Count
+ *	                OFF Count + ON Count
  *
  *	0 <= On Count, Off Count <= 255
  *
  *	From these limits, we can get register values 
  *
- *	on_duration + off_duration <= MAX_DURATION
- *	off_duration = on_duration * (stock_freq - freq) / freq
+ *	off_duration + on_duration <= MAX_DURATION
+ *	on_duration = off_duration * (stock_freq - freq) / freq
  *
- *      on_duration  =  (freq * DURATION) / stock_freq 
- *      off_duration = DURATION - on_duration 
+ *      off_duration  =  (freq * DURATION) / stock_freq 
+ *      on_duration = DURATION - off_duration 
  *
  *
  *---------------------------------------------------------------------------
  *
  * ChangeLog:
+ *  	Dec. 12, 2003	Hiroshi Miura <miura@da-cha.org>
+ *  		- fix on/off register mistake
+ *  		- fix cpu_khz calc when it stops cpu modulation.
+ *
  *	Dec. 11, 2002 	Hiroshi Miura <miura@da-cha.org>
  *		- rewrite for Cyrix MediaGX Cx5510/5520 and 
  *		  NatSemi Geode Cs5530(A).
@@ -71,7 +75,6 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h> 
-#include <linux/sched.h>
 #include <linux/init.h>
 #include <linux/smp.h>
 #include <linux/cpufreq.h>
@@ -121,7 +124,7 @@
 
 /* PCI bus clock - defaults to 30.000 if cpu_khz is not available */
 static int pci_busclk = 0;
-MODULE_PARM(pci_busclk, "i");
+module_param (pci_busclk, int, 0444);
 
 /* maximum duration for which the cpu may be suspended
  * (32us * MAX_DURATION). If no parameter is given, this defaults
@@ -130,7 +133,7 @@
  * is suspended -- processing power is just 0.39% of what it used to be,
  * though. 781.25 kHz(!) for a 200 MHz processor -- wow. */
 static int max_duration = 255;
-MODULE_PARM(max_duration, "i");
+module_param (max_duration, int, 0444);
 
 /* For the default policy, we want at least some processing power
  * - let's say 5%. (min = maxfreq / POLICY_MIN_DIV)
@@ -211,7 +214,7 @@
  *
  * Finds out at which efficient frequency the Cyrix MediaGX/NatSemi Geode CPU runs.
  */
-static int gx_get_cpuspeed(void)
+static unsigned int gx_get_cpuspeed(unsigned int cpu)
 {
 	if ((gx_params->pci_suscfg & SUSMOD) == 0) 
 		return stock_freq;
@@ -233,13 +236,13 @@
 	int old_tmp_freq = stock_freq;
 	int tmp_freq;
 
-	*on_duration=1;
-	*off_duration=0;
+	*off_duration=1;
+	*on_duration=0;
 
 	for (i=max_duration; i>0; i--) {
-		tmp_on = ((khz * i) / stock_freq) & 0xff; 
-		tmp_off = i - tmp_on;
-		tmp_freq = (stock_freq * tmp_on) / i;
+		tmp_off = ((khz * i) / stock_freq) & 0xff; 
+		tmp_on = i - tmp_off;
+		tmp_freq = (stock_freq * tmp_off) / i;
 		/* if this relation is closer to khz, use this. If it's equal,
 		 * prefer it, too - lower latency */
 		if (abs(tmp_freq - khz) <= abs(old_tmp_freq - khz)) {
@@ -267,48 +270,44 @@
 
 
 	freqs.cpu = 0;
-	freqs.old = gx_get_cpuspeed();
+	freqs.old = gx_get_cpuspeed(0);
 
 	new_khz = gx_validate_speed(khz, &gx_params->on_duration, &gx_params->off_duration);
 
 	freqs.new = new_khz;
 
-	if (new_khz == stock_freq) {  /* if new khz == 100% of CPU speed, it is special case */
-		local_irq_save(flags);
-		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-		pci_write_config_byte(gx_params->cs55x0, PCI_SUSCFG, (gx_params->pci_suscfg & ~(SUSMOD)));
-		pci_read_config_byte(gx_params->cs55x0, PCI_SUSCFG, &(gx_params->pci_suscfg));
-		local_irq_restore(flags);
-		dprintk("suspend modulation disabled: cpu runs 100 percent speed.\n");
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-		return;
-	}
-
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-
 	local_irq_save(flags);
-	switch (gx_params->cs55x0->device) {
-	case PCI_DEVICE_ID_CYRIX_5530_LEGACY:
-		pmer1 = gx_params->pci_pmer1 | IRQ_SPDUP | VID_SPDUP;
-		/* FIXME: need to test other values -- Zwane,Miura */
-		pci_write_config_byte(gx_params->cs55x0, PCI_IRQTC, 4); /* typical 2 to 4ms */
-		pci_write_config_byte(gx_params->cs55x0, PCI_VIDTC, 100);/* typical 50 to 100ms */
-		pci_write_config_byte(gx_params->cs55x0, PCI_PMER1, pmer1);
 
-		if (gx_params->pci_rev < 0x10) {   /* CS5530(rev 1.2, 1.3) */
+	if (new_khz != stock_freq) {  /* if new khz == 100% of CPU speed, it is special case */
+		switch (gx_params->cs55x0->device) {
+		case PCI_DEVICE_ID_CYRIX_5530_LEGACY:
+			pmer1 = gx_params->pci_pmer1 | IRQ_SPDUP | VID_SPDUP;
+			/* FIXME: need to test other values -- Zwane,Miura */
+			pci_write_config_byte(gx_params->cs55x0, PCI_IRQTC, 4); /* typical 2 to 4ms */
+			pci_write_config_byte(gx_params->cs55x0, PCI_VIDTC, 100);/* typical 50 to 100ms */
+			pci_write_config_byte(gx_params->cs55x0, PCI_PMER1, pmer1);
+
+			if (gx_params->pci_rev < 0x10) {   /* CS5530(rev 1.2, 1.3) */
+				suscfg = gx_params->pci_suscfg | SUSMOD;
+			} else {                           /* CS5530A,B.. */
+				suscfg = gx_params->pci_suscfg | SUSMOD | PWRSVE;
+			}
+			break;
+		case PCI_DEVICE_ID_CYRIX_5520:
+		case PCI_DEVICE_ID_CYRIX_5510:
 			suscfg = gx_params->pci_suscfg | SUSMOD;
-		} else {                           /* CS5530A,B.. */
-			suscfg = gx_params->pci_suscfg | SUSMOD | PWRSVE;
+			break;
+		default:
+			local_irq_restore(flags);
+			dprintk("fatal: try to set unknown chipset.\n");
+			return;
 		}
-		break;
-	case PCI_DEVICE_ID_CYRIX_5520:
-	case PCI_DEVICE_ID_CYRIX_5510:
-		suscfg = gx_params->pci_suscfg | SUSMOD;
-		break;
-	default:
-		local_irq_restore(flags);
-		dprintk("fatal: try to set unknown chipset.\n");
-		return;
+	} else {
+		suscfg = gx_params->pci_suscfg & ~(SUSMOD);
+		gx_params->off_duration = 0;
+		gx_params->on_duration = 0;
+		dprintk("suspend modulation disabled: cpu runs 100 percent speed.\n");
 	}
 
 	pci_write_config_byte(gx_params->cs55x0, PCI_MODOFF, gx_params->off_duration);
@@ -406,7 +405,7 @@
 
 static int cpufreq_gx_cpu_init(struct cpufreq_policy *policy)
 {
-	int maxfreq, curfreq;
+	unsigned int maxfreq, curfreq;
 
 	if (!policy || policy->cpu != 0)
 		return -ENODEV;
@@ -420,7 +419,7 @@
 		maxfreq = 30000 * gx_freq_mult[getCx86(CX86_DIR1) & 0x0f];
 	}
 	stock_freq = maxfreq;
-	curfreq = gx_get_cpuspeed();
+	curfreq = gx_get_cpuspeed(0);
 
 	dprintk("cpu max frequency is %d.\n", maxfreq);
 	dprintk("cpu current frequency is %dkHz.\n",curfreq);
@@ -447,6 +446,7 @@
  *   MediaGX/Geode GX initialize cpufreq driver
  */
 static struct cpufreq_driver gx_suspmod_driver = {
+	.get		= gx_get_cpuspeed,
 	.verify		= cpufreq_gx_verify,
 	.target		= cpufreq_gx_target,
 	.init		= cpufreq_gx_cpu_init,

Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.95
retrieving revision 1.96
diff -u -r1.95 -r1.96
--- longhaul.c	20 Jan 2004 17:03:31 -0000	1.95
+++ longhaul.c	26 Aug 2004 13:25:18 -0000	1.96
@@ -1,24 +1,30 @@
 /*
- *  (C) 2001-2003  Dave Jones. <davej@codemonkey.org.uk>
+ *  (C) 2001-2004  Dave Jones. <davej@codemonkey.org.uk>
  *  (C) 2002  Padraig Brady. <padraig@antefacto.com>
  *
  *  Licensed under the terms of the GNU GPL License version 2.
  *  Based upon datasheets & sample CPUs kindly provided by VIA.
  *
- *  VIA have currently 2 different versions of Longhaul.
+ *  VIA have currently 3 different versions of Longhaul.
  *  Version 1 (Longhaul) uses the BCR2 MSR at 0x1147.
- *   It is present only in Samuel 1, Samuel 2 and Ezra.
- *  Version 2 (Powersaver) uses the POWERSAVER MSR at 0x110a.
- *   It is present in Ezra-T, Nehemiah and above.
- *   In addition to scaling multiplier, it can also scale voltage.
- *   There is provision for scaling FSB too, but this doesn't work
- *   too well in practice.
+ *   It is present only in Samuel 1 (C5A), Samuel 2 (C5B) stepping 0.
+ *  Version 2 of longhaul is the same as v1, but adds voltage scaling.
+ *   Present in Samuel 2 (steppings 1-7 only) (C5B), and Ezra (C5C)
+ *   voltage scaling support has currently been disabled in this driver
+ *   until we have code that gets it right.
+ *  Version 3 of longhaul got renamed to Powersaver and redesigned
+ *   to use the POWERSAVER MSR at 0x110a.
+ *   It is present in Ezra-T (C5M), Nehemiah (C5X) and above.
+ *   It's pretty much the same feature wise to longhaul v2, though
+ *   there is provision for scaling FSB too, but this doesn't work
+ *   too well in practice so we don't even try to use this.
  *
  *  BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h> 
+#include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/cpufreq.h>
 #include <linux/slab.h>
@@ -30,25 +36,44 @@
 
 #include "longhaul.h"
 
-#define DEBUG
-
-#ifdef DEBUG
-#define dprintk(msg...) printk(msg)
-#else
-#define dprintk(msg...) do { } while(0)
-#endif
-
 #define PFX "longhaul: "
 
+#define TYPE_LONGHAUL_V1	1
+#define TYPE_LONGHAUL_V2	2
+#define TYPE_POWERSAVER		3
+
+#define	CPU_SAMUEL	1
+#define	CPU_SAMUEL2	2
+#define	CPU_EZRA	3
+#define	CPU_EZRA_T	4
+#define	CPU_NEHEMIAH	5
+
+static int cpu_model;
 static unsigned int numscales=16, numvscales;
+static unsigned int fsb;
 static int minvid, maxvid;
+static unsigned int minmult, maxmult;
 static int can_scale_voltage;
 static int vrmrev;
 
-
 /* Module parameters */
 static int dont_scale_voltage;
-static unsigned int fsb;
+static int debug;
+
+static void dprintk(const char *fmt, ...)
+{
+	char s[256];
+	va_list args;
+
+	if (debug == 0)
+		return;
+
+	va_start(args, fmt);
+	vsprintf(s, fmt, args);
+	printk(s);
+	va_end(args);
+}
+
 
 #define __hlt()     __asm__ __volatile__("hlt": : :"memory")
 
@@ -59,25 +84,40 @@
 static unsigned int highest_speed, lowest_speed; /* kHz */
 static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
+static char speedbuffer[8];
+
+static char *print_speed(int speed)
+{
+	if (speed > 1000) {
+		if (speed%1000 == 0)
+			sprintf (speedbuffer, "%dGHz", speed/1000);
+		else
+			sprintf (speedbuffer, "%d.%dGHz", speed/1000, (speed%1000)/100);
+	} else
+		sprintf (speedbuffer, "%dMHz", speed);
+
+	return speedbuffer;
+}
 
 
-static unsigned int calc_speed (int mult, int fsb)
+static unsigned int calc_speed(int mult)
 {
-	int mhz;
-	mhz = (mult/10)*fsb;
+	int khz;
+	khz = (mult/10)*fsb;
 	if (mult%10)
-		mhz += fsb/2;
-	return mhz;
+		khz += fsb/2;
+	khz *= 1000;
+	return khz;
 }
 
 
-static int longhaul_get_cpu_mult (void)
+static int longhaul_get_cpu_mult(void)
 {
 	unsigned long invalue=0,lo, hi;
 
 	rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
 	invalue = (lo & (1<<22|1<<23|1<<24|1<<25)) >>22;
-	if (longhaul_version==2) {
+	if (longhaul_version==TYPE_LONGHAUL_V2 || longhaul_version==TYPE_POWERSAVER) {
 		if (lo & (1<<27))
 			invalue+=16;
 	}
@@ -85,77 +125,118 @@
 }
 
 
+static void do_powersaver(union msr_longhaul *longhaul,
+			unsigned int clock_ratio_index)
+{
+	int version;
+
+	switch (cpu_model) {
+	case CPU_EZRA_T:
+		version = 3;
+		break;
+	case CPU_NEHEMIAH:
+		version = 0xf;
+		break;
+	default:
+		return;
+	}
+
+	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	longhaul->bits.SoftBusRatio = clock_ratio_index & 0xf;
+	longhaul->bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
+	longhaul->bits.EnableSoftBusRatio = 1;
+	longhaul->bits.RevisionKey = 0;
+	local_irq_disable();
+	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	local_irq_enable();
+	__hlt();
+
+	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	longhaul->bits.EnableSoftBusRatio = 0;
+	longhaul->bits.RevisionKey = version;
+	local_irq_disable();
+	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	local_irq_enable();
+}
+
 /**
  * longhaul_set_cpu_frequency()
  * @clock_ratio_index : bitpattern of the new multiplier.
  *
- * Sets a new clock ratio, and -if applicable- a new Front Side Bus
+ * Sets a new clock ratio.
  */
 
-static void longhaul_setstate (unsigned int clock_ratio_index)
+static void longhaul_setstate(unsigned int clock_ratio_index)
 {
 	int speed, mult;
 	struct cpufreq_freqs freqs;
 	union msr_longhaul longhaul;
 	union msr_bcr2 bcr2;
+	static unsigned int old_ratio=-1;
+
+	if (old_ratio == clock_ratio_index)
+		return;
+	old_ratio = clock_ratio_index;
 
 	mult = clock_ratio[clock_ratio_index];
 	if (mult == -1)
 		return;
 
-	speed = calc_speed (mult, fsb);
+	speed = calc_speed(mult);
 	if ((speed > highest_speed) || (speed < lowest_speed))
 		return;
 
-	freqs.old = calc_speed (longhaul_get_cpu_mult(), fsb);
+	freqs.old = calc_speed(longhaul_get_cpu_mult());
 	freqs.new = speed;
 	freqs.cpu = 0; /* longhaul.c is UP only driver */
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
-	dprintk (KERN_INFO PFX "FSB:%d Mult:%d.%dx\n", fsb,
-				mult/10, mult%10);
+	dprintk (KERN_INFO PFX "Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
+			fsb, mult/10, mult%10, print_speed(speed/1000));
 
 	switch (longhaul_version) {
-	case 1:
+
+	/*
+	 * Longhaul v1. (Samuel[C5A] and Samuel2 stepping 0[C5B])
+	 * Software controlled multipliers only.
+	 *
+	 * *NB* Until we get voltage scaling working v1 & v2 are the same code.
+	 * Longhaul v2 appears in Samuel2 Steppings 1->7 [C5b] and Ezra [C5C]
+	 */
+	case TYPE_LONGHAUL_V1:
+	case TYPE_LONGHAUL_V2:
 		rdmsrl (MSR_VIA_BCR2, bcr2.val);
 		/* Enable software clock multiplier */
 		bcr2.bits.ESOFTBF = 1;
 		bcr2.bits.CLOCKMUL = clock_ratio_index;
+		local_irq_disable();
 		wrmsrl (MSR_VIA_BCR2, bcr2.val);
+		local_irq_enable();
 
 		__hlt();
 
 		/* Disable software clock multiplier */
 		rdmsrl (MSR_VIA_BCR2, bcr2.val);
 		bcr2.bits.ESOFTBF = 0;
+		local_irq_disable();
 		wrmsrl (MSR_VIA_BCR2, bcr2.val);
+		local_irq_enable();
 		break;
 
 	/*
-	 * Powersaver. (Ezra-T [C5M], Nehemiah [C5N])
+	 * Longhaul v3 (aka Powersaver). (Ezra-T [C5M] & Nehemiah [C5N])
 	 * We can scale voltage with this too, but that's currently
 	 * disabled until we come up with a decent 'match freq to voltage'
 	 * algorithm.
-	 * We also need to do the voltage/freq setting in order depending
-	 * on the direction of scaling (like we do in powernow-k7.c)
-	 * Ezra-T was alleged to do FSB scaling too, but it never worked in practice.
+	 * When we add voltage scaling, we will also need to do the
+	 * voltage/freq setting in order depending on the direction
+	 * of scaling (like we do in powernow-k7.c)
+	 * Nehemiah can do FSB scaling too, but this has never been proven
+	 * to work in practice.
 	 */
-	case 2:
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-		longhaul.bits.SoftBusRatio = clock_ratio_index & 0xf;
-		longhaul.bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
-		longhaul.bits.EnableSoftBusRatio = 1;
-		/* We must program the revision key only with values we
-		 * know about, not blindly copy it from 0:3 */
-		longhaul.bits.RevisionKey = 3;	/* SoftVID & SoftBSEL */
-		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
-		__hlt();
-
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-		longhaul.bits.EnableSoftBusRatio = 0;
-		longhaul.bits.RevisionKey = 3;
-		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+	case TYPE_POWERSAVER:
+		do_powersaver(&longhaul, clock_ratio_index);
 		break;
 	}
 
@@ -173,7 +254,7 @@
 
 #define ROUNDING	0xf
 
-static int _guess (int guess, int maxmult)
+static int _guess(int guess)
 {
 	int target;
 
@@ -185,7 +266,8 @@
 	return target;
 }
 
-static int guess_fsb(int maxmult)
+
+static int guess_fsb(void)
 {
 	int speed = (cpu_khz/1000);
 	int i;
@@ -195,65 +277,108 @@
 	speed &= ~ROUNDING;
 
 	for (i=0; i<3; i++) {
-		if (_guess(speeds[i],maxmult) == speed)
+		if (_guess(speeds[i]) == speed)
 			return speeds[i];
 	}
 	return 0;
 }
 
 
-
-static int __init longhaul_get_ranges (void)
+static int __init longhaul_get_ranges(void)
 {
-	struct cpuinfo_x86 *c = cpu_data;
 	unsigned long invalue;
-	unsigned int minmult=0, maxmult=0;
 	unsigned int multipliers[32]= {
 		50,30,40,100,55,35,45,95,90,70,80,60,120,75,85,65,
 		-1,110,120,-1,135,115,125,105,130,150,160,140,-1,155,-1,145 };
 	unsigned int j, k = 0;
 	union msr_longhaul longhaul;
 	unsigned long lo, hi;
-	unsigned int eblcr_fsb_table[] = { 66, 133, 100, -1 };
+	unsigned int eblcr_fsb_table_v1[] = { 66, 133, 100, -1 };
+	unsigned int eblcr_fsb_table_v2[] = { 133, 100, -1, 66 };
 
 	switch (longhaul_version) {
-	case 1:
+	case TYPE_LONGHAUL_V1:
+	case TYPE_LONGHAUL_V2:
 		/* Ugh, Longhaul v1 didn't have the min/max MSRs.
 		   Assume min=3.0x & max = whatever we booted at. */
 		minmult = 30;
 		maxmult = longhaul_get_cpu_mult();
 		rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
 		invalue = (lo & (1<<18|1<<19)) >>18;
-		if (c->x86_model==6)
-			fsb = eblcr_fsb_table[invalue];
+		if (cpu_model==CPU_SAMUEL || cpu_model==CPU_SAMUEL2)
+			fsb = eblcr_fsb_table_v1[invalue];
 		else
-			fsb = guess_fsb(maxmult);
+			fsb = guess_fsb();
 		break;
 
-	case 2:
-		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+	case TYPE_POWERSAVER:
+		/* Ezra-T */
+		if (cpu_model==CPU_EZRA_T) {
+			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+			invalue = longhaul.bits.MaxMHzBR;
+			if (longhaul.bits.MaxMHzBR4)
+				invalue += 16;
+			maxmult=multipliers[invalue];
+
+			invalue = longhaul.bits.MinMHzBR;
+			if (longhaul.bits.MinMHzBR4 == 1)
+				minmult = 30;
+			else
+				minmult = multipliers[invalue];
+			fsb = eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
+			break;
+		}
 
-		invalue = longhaul.bits.MaxMHzBR;
-		if (longhaul.bits.MaxMHzBR4)
-			invalue += 16;
-		maxmult=multipliers[invalue];
+		/* Nehemiah */
+		if (cpu_model==CPU_NEHEMIAH) {
+			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+
+			/*
+			 * TODO: This code works, but raises a lot of questions.
+			 * - Some Nehemiah's seem to have broken Min/MaxMHzBR's.
+			 *   We get around this by using a hardcoded multiplier of 4.0x
+			 *   for the minimimum speed, and the speed we booted up at for the max.
+			 *   This is done in longhaul_get_cpu_mult() by reading the EBLCR register.
+			 * - According to some VIA documentation EBLCR is only
+			 *   in pre-Nehemiah C3s. How this still works is a mystery.
+			 *   We're possibly using something undocumented and unsupported,
+			 *   But it works, so we don't grumble.
+			 */
+			minmult=40;
+			maxmult=longhaul_get_cpu_mult();
+
+			/* Starting with the 1.2GHz parts, theres a 200MHz bus. */
+			if ((cpu_khz/1000) > 1200)
+				fsb = 200;
+			else
+				fsb = eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
+			break;
+		}
+	}
 
-		invalue = longhaul.bits.MinMHzBR;
-		if (longhaul.bits.MinMHzBR4 == 1)
-			minmult = 30;
-		else
-			minmult = multipliers[invalue];
+	dprintk (KERN_INFO PFX "MinMult:%d.%dx MaxMult:%d.%dx\n",
+		 minmult/10, minmult%10, maxmult/10, maxmult%10);
 
-		fsb = guess_fsb(maxmult);
-		break;
+	if (fsb == -1) {
+		printk (KERN_INFO PFX "Invalid (reserved) FSB!\n");
+		return -EINVAL;
 	}
 
-	dprintk (KERN_INFO PFX "MinMult=%d.%dx MaxMult=%d.%dx\n",
-		 minmult/10, minmult%10, maxmult/10, maxmult%10);
-	highest_speed = calc_speed (maxmult, fsb);
-	lowest_speed = calc_speed (minmult,fsb);
-	dprintk (KERN_INFO PFX "FSB: %dMHz Lowestspeed=%dMHz Highestspeed=%dMHz\n",
-		 fsb, lowest_speed, highest_speed);
+	highest_speed = calc_speed(maxmult);
+	lowest_speed = calc_speed(minmult);
+	dprintk (KERN_INFO PFX "FSB:%dMHz  ", fsb);
+	dprintk ("Lowest speed:%s  ", print_speed(lowest_speed/1000));
+	dprintk ("Highest speed:%s\n", print_speed(highest_speed/1000));
+
+	if (lowest_speed == highest_speed) {
+		printk (KERN_INFO PFX "highestspeed == lowest, aborting.\n");
+		return -EINVAL;
+	}
+	if (lowest_speed > highest_speed) {
+		printk (KERN_INFO PFX "nonsense! lowest (%d > %d) !\n",
+			lowest_speed, highest_speed);
+		return -EINVAL;
+	}
 
 	longhaul_table = kmalloc((numscales + 1) * sizeof(struct cpufreq_frequency_table), GFP_KERNEL);
 	if(!longhaul_table)
@@ -266,8 +391,8 @@
 			continue;
 		if (ratio > maxmult || ratio < minmult)
 			continue;
-		longhaul_table[k].frequency = calc_speed (ratio, fsb);
-		longhaul_table[k].index	= (j << 8);
+		longhaul_table[k].frequency = calc_speed(ratio);
+		longhaul_table[k].index	= j;
 		k++;
 	}
 
@@ -341,24 +466,32 @@
 }
 
 
-static int longhaul_target (struct cpufreq_policy *policy,
-			    unsigned int target_freq,
-			    unsigned int relation)
+static int longhaul_target(struct cpufreq_policy *policy,
+			    unsigned int target_freq, unsigned int relation)
 {
 	unsigned int table_index = 0;
- 	unsigned int new_clock_ratio = 0;
+	unsigned int new_clock_ratio = 0;
 
 	if (cpufreq_frequency_table_target(policy, longhaul_table, target_freq, relation, &table_index))
 		return -EINVAL;
 
 	new_clock_ratio = longhaul_table[table_index].index & 0xFF;
- 
+
 	longhaul_setstate(new_clock_ratio);
 
 	return 0;
 }
 
-static int longhaul_cpu_init (struct cpufreq_policy *policy)
+
+static unsigned int longhaul_get(unsigned int cpu)
+{
+	if (cpu)
+		return 0;
+	return calc_speed(longhaul_get_cpu_mult());
+}
+
+
+static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 {
 	struct cpuinfo_x86 *c = cpu_data;
 	char *cpuname=NULL;
@@ -366,26 +499,31 @@
 
 	switch (c->x86_model) {
 	case 6:
+		cpu_model = CPU_SAMUEL;
 		cpuname = "C3 'Samuel' [C5A]";
-		longhaul_version=1;
+		longhaul_version = TYPE_LONGHAUL_V1;
 		memcpy (clock_ratio, samuel1_clock_ratio, sizeof(samuel1_clock_ratio));
 		memcpy (eblcr_table, samuel1_eblcr, sizeof(samuel1_eblcr));
 		break;
 
-	case 7:		/* C5B / C5C */
-		longhaul_version=1;
+	case 7:
+		longhaul_version = TYPE_LONGHAUL_V1;
 		switch (c->x86_mask) {
 		case 0:
+			cpu_model = CPU_SAMUEL2;
 			cpuname = "C3 'Samuel 2' [C5B]";
 			/* Note, this is not a typo, early Samuel2's had Samuel1 ratios. */
 			memcpy (clock_ratio, samuel1_clock_ratio, sizeof(samuel1_clock_ratio));
 			memcpy (eblcr_table, samuel2_eblcr, sizeof(samuel2_eblcr));
 			break;
 		case 1 ... 15:
-			if (c->x86_mask < 8)
+			if (c->x86_mask < 8) {
+				cpu_model = CPU_SAMUEL2;
 				cpuname = "C3 'Samuel 2' [C5B]";
-			else
+			} else {
+				cpu_model = CPU_EZRA;
 				cpuname = "C3 'Ezra' [C5C]";
+			}
 			memcpy (clock_ratio, ezra_clock_ratio, sizeof(ezra_clock_ratio));
 			memcpy (eblcr_table, ezra_eblcr, sizeof(ezra_eblcr));
 			break;
@@ -393,19 +531,35 @@
 		break;
 
 	case 8:
+		cpu_model = CPU_EZRA_T;
 		cpuname = "C3 'Ezra-T' [C5M]";
-		longhaul_version=2;
+		longhaul_version = TYPE_POWERSAVER;
 		numscales=32;
 		memcpy (clock_ratio, ezrat_clock_ratio, sizeof(ezrat_clock_ratio));
 		memcpy (eblcr_table, ezrat_eblcr, sizeof(ezrat_eblcr));
 		break;
 
 	case 9:
-		cpuname = "C3 'Nehemiah' [C5N]";
-		longhaul_version=2;
+		cpu_model = CPU_NEHEMIAH;
+		longhaul_version = TYPE_POWERSAVER;
 		numscales=32;
-		memcpy (clock_ratio, nehemiah_clock_ratio, sizeof(nehemiah_clock_ratio));
-		memcpy (eblcr_table, nehemiah_eblcr, sizeof(nehemiah_eblcr));
+		switch (c->x86_mask) {
+		case 0 ... 1:
+			cpuname = "C3 'Nehemiah A' [C5N]";
+			memcpy (clock_ratio, nehemiah_a_clock_ratio, sizeof(nehemiah_a_clock_ratio));
+			memcpy (eblcr_table, nehemiah_a_eblcr, sizeof(nehemiah_a_eblcr));
+			break;
+		case 2 ... 4:
+			cpuname = "C3 'Nehemiah B' [C5N]";
+			memcpy (clock_ratio, nehemiah_b_clock_ratio, sizeof(nehemiah_b_clock_ratio));
+			memcpy (eblcr_table, nehemiah_b_eblcr, sizeof(nehemiah_b_eblcr));
+			break;
+		case 5 ... 15:
+			cpuname = "C3 'Nehemiah C' [C5N]";
+			memcpy (clock_ratio, nehemiah_c_clock_ratio, sizeof(nehemiah_c_clock_ratio));
+			memcpy (eblcr_table, nehemiah_c_eblcr, sizeof(nehemiah_c_eblcr));
+			break;
+		}
 		break;
 
 	default:
@@ -413,32 +567,62 @@
 		break;
 	}
 
-	printk (KERN_INFO PFX "VIA %s CPU detected. Longhaul v%d supported.\n",
-					cpuname, longhaul_version);
-
-	if ((longhaul_version==2) && (dont_scale_voltage==0))
-		longhaul_setup_voltagescaling();
+	printk (KERN_INFO PFX "VIA %s CPU detected.  ", cpuname);
+	switch (longhaul_version) {
+	case TYPE_LONGHAUL_V1:
+	case TYPE_LONGHAUL_V2:
+		printk ("Longhaul v%d supported.\n", longhaul_version);
+		break;
+	case TYPE_POWERSAVER:
+		printk ("Powersaver supported.\n");
+		break;
+	};
 
 	ret = longhaul_get_ranges();
 	if (ret != 0)
 		return ret;
 
- 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
- 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
-	policy->cur = calc_speed (longhaul_get_cpu_mult(), fsb);
+	if ((longhaul_version==TYPE_LONGHAUL_V2 || longhaul_version==TYPE_POWERSAVER) &&
+		 (dont_scale_voltage==0))
+		longhaul_setup_voltagescaling();
+
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
+	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
+	policy->cur = calc_speed(longhaul_get_cpu_mult());
+
+	ret = cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
+	if (ret)
+		return ret;
+
+	cpufreq_frequency_table_get_attr(longhaul_table, policy->cpu);
 
-	return cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
+	return 0;
+}
+
+static int __devexit longhaul_cpu_exit(struct cpufreq_policy *policy)
+{
+	cpufreq_frequency_table_put_attr(policy->cpu);
+	return 0;
 }
 
+static struct freq_attr* longhaul_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
 static struct cpufreq_driver longhaul_driver = {
-	.verify 	= longhaul_verify,
-	.target 	= longhaul_target,
-	.init		= longhaul_cpu_init,
-	.name		= "longhaul",
-	.owner		= THIS_MODULE,
+	.verify	= longhaul_verify,
+	.target	= longhaul_target,
+	.get	= longhaul_get,
+	.init	= longhaul_cpu_init,
+	.exit	= __devexit_p(longhaul_cpu_exit),
+	.name	= "longhaul",
+	.owner	= THIS_MODULE,
+	.attr	= longhaul_attr,
 };
 
-static int __init longhaul_init (void)
+
+static int __init longhaul_init(void)
 {
 	struct cpuinfo_x86 *c = cpu_data;
 
@@ -446,12 +630,8 @@
 		return -ENODEV;
 
 	switch (c->x86_model) {
-	case 6 ... 8:
+	case 6 ... 9:
 		return cpufreq_register_driver(&longhaul_driver);
-	case 9:
-		printk (KERN_INFO PFX "Nehemiah unsupported: Waiting on working silicon "
-						"from VIA before this is usable.\n");
-		break;
 	default:
 		printk (KERN_INFO PFX "Unknown VIA CPU. Contact davej@codemonkey.org.uk\n");
 	}
@@ -459,13 +639,27 @@
 	return -ENODEV;
 }
 
-static void __exit longhaul_exit (void)
+
+static void __exit longhaul_exit(void)
 {
+	int i=0;
+
+	for (i=0; i < numscales; i++) {
+		if (clock_ratio[i] == maxmult) {
+			longhaul_setstate(i);
+			break;
+		}
+	}
+
 	cpufreq_unregister_driver(&longhaul_driver);
 	kfree(longhaul_table);
 }
 
-MODULE_PARM (dont_scale_voltage, "i");
+module_param (dont_scale_voltage, int, 0644);
+MODULE_PARM_DESC(dont_scale_voltage, "Don't scale voltage of processor");
+
+module_param (debug, int, 0644);
+MODULE_PARM_DESC(debug, "Dump debugging information.");
 
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Longhaul driver for VIA Cyrix processors.");

Index: longhaul.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.h,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- longhaul.h	5 Nov 2003 18:27:42 -0000	1.2
+++ longhaul.h	26 Aug 2004 13:25:18 -0000	1.3
@@ -234,14 +234,15 @@
 
 /*
  * VIA C3 Nehemiah */
-static int __initdata nehemiah_clock_ratio[32] = {
+ 
+static int __initdata nehemiah_a_clock_ratio[32] = {
 	100, /* 0000 -> 10.0x */
 	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 -> RESERVED */
+	-1,  /* 0010 ->  RESERVED */
 	90,  /* 0011 ->  9.0x */
 	95,  /* 0100 ->  9.5x */
-	-1,  /* 0101 -> RESERVED */
-	-1,  /* 0110 -> RESERVED */
+	-1,  /* 0101 ->  RESERVED */
+	-1,  /* 0110 ->  RESERVED */
 	55,  /* 0111 ->  5.5x */
 	60,  /* 1000 ->  6.0x */
 	70,  /* 1001 ->  7.0x */
@@ -250,8 +251,77 @@
 	65,  /* 1100 ->  6.5x */
 	75,  /* 1101 ->  7.5x */
 	85,  /* 1110 ->  8.5x */
-	120, /* 1111 ->  12.0x */
+	120, /* 1111 -> 12.0x */
+	100, /* 0000 -> 10.0x */
+	-1,  /* 0001 -> RESERVED */
+	120, /* 0010 -> 12.0x */
+	90,  /* 0011 ->  9.0x */
+	105, /* 0100 -> 10.5x */
+	115, /* 0101 -> 11.5x */
+	125, /* 0110 -> 12.5x */
+	135, /* 0111 -> 13.5x */
+	140, /* 1000 -> 14.0x */
+	150, /* 1001 -> 15.0x */
+	160, /* 1010 -> 16.0x */
+	130, /* 1011 -> 13.0x */
+	145, /* 1100 -> 14.5x */
+	155, /* 1101 -> 15.5x */
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	120, /* 1111 -> 12.0x */
+};
+
+static int __initdata  nehemiah_b_clock_ratio[32] = {
+	100, /* 0000 -> 10.0x */
+	160, /* 0001 -> 16.0x */
+	-1,  /* 0010 ->  RESERVED */
+	90,  /* 0011 ->  9.0x */
+	95,  /* 0100 ->  9.5x */
+	-1,  /* 0101 ->  RESERVED */
+	-1,  /* 0110 ->  RESERVED */
+	55,  /* 0111 ->  5.5x */
+	60,  /* 1000 ->  6.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	50,  /* 1011 ->  5.0x */
+	65,  /* 1100 ->  6.5x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	120, /* 1111 -> 12.0x */
+	100, /* 0000 -> 10.0x */
+	110, /* 0001 -> 11.0x */
+	120, /* 0010 -> 12.0x */
+	90,  /* 0011 ->  9.0x */
+	105, /* 0100 -> 10.5x */
+	115, /* 0101 -> 11.5x */
+	125, /* 0110 -> 12.5x */
+	135, /* 0111 -> 13.5x */
+	140, /* 1000 -> 14.0x */
+	150, /* 1001 -> 15.0x */
+	160, /* 1010 -> 16.0x */
+	130, /* 1011 -> 13.0x */
+	145, /* 1100 -> 14.5x */
+	155, /* 1101 -> 15.5x */
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	120, /* 1111 -> 12.0x */
+};
 
+static int __initdata  nehemiah_c_clock_ratio[32] = {
+	100, /* 0000 -> 10.0x */
+	160, /* 0001 -> 16.0x */
+	40,  /* 0010 ->  RESERVED */
+	90,  /* 0011 ->  9.0x */
+	95,  /* 0100 ->  9.5x */
+	-1,  /* 0101 ->  RESERVED */
+	45,  /* 0110 ->  RESERVED */
+	55,  /* 0111 ->  5.5x */
+	60,  /* 1000 ->  6.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	50,  /* 1011 ->  5.0x */
+	65,  /* 1100 ->  6.5x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	120, /* 1111 -> 12.0x */
 	100, /* 0000 -> 10.0x */
 	110, /* 0001 -> 11.0x */
 	120, /* 0010 -> 12.0x */
@@ -266,18 +336,53 @@
 	130, /* 1011 -> 13.0x */
 	145, /* 1100 -> 14.5x */
 	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED */
+	-1,  /* 1110 -> RESERVED (13.0x) */
 	120, /* 1111 -> 12.0x */
 };
 
-static int __initdata nehemiah_eblcr[32] = {
+static int __initdata nehemiah_a_eblcr[32] = {
 	50,  /* 0000 ->  5.0x */
 	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 -> RESERVED */
+	-1,  /* 0010 ->  RESERVED */
 	100, /* 0011 -> 10.0x */
 	55,  /* 0100 ->  5.5x */
-	-1,  /* 0101 -> RESERVED */
-	-1,  /* 0110 -> RESERVED */
+	-1,  /* 0101 ->  RESERVED */
+	-1,  /* 0110 ->  RESERVED */
+	95,  /* 0111 ->  9.5x */
+	90,  /* 1000 ->  9.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	60,  /* 1011 ->  6.0x */
+	120, /* 1100 -> 12.0x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	65,  /* 1111 ->  6.5x */
+	90,  /* 0000 ->  9.0x */
+	-1,  /* 0001 -> RESERVED */
+	120, /* 0010 -> 12.0x */
+	100, /* 0011 -> 10.0x */
+	135, /* 0100 -> 13.5x */
+	115, /* 0101 -> 11.5x */
+	125, /* 0110 -> 12.5x */
+	105, /* 0111 -> 10.5x */
+	130, /* 1000 -> 13.0x */
+	150, /* 1001 -> 15.0x */
+	160, /* 1010 -> 16.0x */
+	140, /* 1011 -> 14.0x */
+	120, /* 1100 -> 12.0x */
+	155, /* 1101 -> 15.5x */
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	145 /* 1111 -> 14.5x */
+   /* end of table  */
+};
+static int __initdata nehemiah_b_eblcr[32] = {
+	50,  /* 0000 ->  5.0x */
+	160, /* 0001 -> 16.0x */
+	-1,  /* 0010 ->  RESERVED */
+	100, /* 0011 -> 10.0x */
+	55,  /* 0100 ->  5.5x */
+	-1,  /* 0101 ->  RESERVED */
+	-1,  /* 0110 ->  RESERVED */
 	95,  /* 0111 ->  9.5x */
 	90,  /* 1000 ->  9.0x */
 	70,  /* 1001 ->  7.0x */
@@ -287,7 +392,6 @@
 	75,  /* 1101 ->  7.5x */
 	85,  /* 1110 ->  8.5x */
 	65,  /* 1111 ->  6.5x */
-
 	90,  /* 0000 ->  9.0x */
 	110, /* 0001 -> 11.0x */
 	120, /* 0010 -> 12.0x */
@@ -302,9 +406,46 @@
 	140, /* 1011 -> 14.0x */
 	120, /* 1100 -> 12.0x */
 	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED */
-	-1,  /* 1111 -> RESERVED */
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	145 /* 1111 -> 14.5x */
+	   /* end of table  */
 };
+static int __initdata nehemiah_c_eblcr[32] = {
+	50,  /* 0000 ->  5.0x */
+	160, /* 0001 -> 16.0x */
+	40,  /* 0010 ->  RESERVED */
+	100, /* 0011 -> 10.0x */
+	55,  /* 0100 ->  5.5x */
+	-1,  /* 0101 ->  RESERVED */
+	45,  /* 0110 ->  RESERVED */
+	95,  /* 0111 ->  9.5x */
+	90,  /* 1000 ->  9.0x */
+	70,  /* 1001 ->  7.0x */
+	80,  /* 1010 ->  8.0x */
+	60,  /* 1011 ->  6.0x */
+	120, /* 1100 -> 12.0x */
+	75,  /* 1101 ->  7.5x */
+	85,  /* 1110 ->  8.5x */
+	65,  /* 1111 ->  6.5x */
+	90,  /* 0000 ->  9.0x */
+	110, /* 0001 -> 11.0x */
+	120, /* 0010 -> 12.0x */
+	100, /* 0011 -> 10.0x */
+	135, /* 0100 -> 13.5x */
+	115, /* 0101 -> 11.5x */
+	125, /* 0110 -> 12.5x */
+	105, /* 0111 -> 10.5x */
+	130, /* 1000 -> 13.0x */
+	150, /* 1001 -> 15.0x */
+	160, /* 1010 -> 16.0x */
+	140, /* 1011 -> 14.0x */
+	120, /* 1100 -> 12.0x */
+	155, /* 1101 -> 15.5x */
+	-1,  /* 1110 -> RESERVED (13.0x) */
+	145 /* 1111 -> 14.5x */
+	  /* end of table  */
+};
+
 /* 
  * Voltage scales. Div/Mod by 1000 to get actual voltage.
  * Which scale to use depends on the VRM type in use.

Index: longrun.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longrun.c,v
retrieving revision 1.30
retrieving revision 1.31
diff -u -r1.30 -r1.31
--- longrun.c	5 Nov 2003 18:27:42 -0000	1.30
+++ longrun.c	26 Aug 2004 13:25:18 -0000	1.31
@@ -7,7 +7,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h> 
+#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/cpufreq.h>
@@ -19,7 +19,7 @@
 static struct cpufreq_driver	longrun_driver;
 
 /**
- * longrun_{low,high}_freq is needed for the conversion of cpufreq kHz 
+ * longrun_{low,high}_freq is needed for the conversion of cpufreq kHz
  * values into per cent values. In TMTA microcode, the following is valid:
  * performance_pctg = (current_freq - low_freq)/(high_freq - low_freq)
  */
@@ -33,7 +33,7 @@
  * Reads the current LongRun policy by access to MSR_TMTA_LONGRUN_FLAGS
  * and MSR_TMTA_LONGRUN_CTRL
  */
-static void longrun_get_policy(struct cpufreq_policy *policy)
+static void __init longrun_get_policy(struct cpufreq_policy *policy)
 {
 	u32 msr_lo, msr_hi;
 
@@ -42,22 +42,27 @@
 		policy->policy = CPUFREQ_POLICY_PERFORMANCE;
 	else
 		policy->policy = CPUFREQ_POLICY_POWERSAVE;
-	
+
 	rdmsr(MSR_TMTA_LONGRUN_CTRL, msr_lo, msr_hi);
 	msr_lo &= 0x0000007F;
 	msr_hi &= 0x0000007F;
 
-	policy->min = longrun_low_freq + msr_lo * 
-		((longrun_high_freq - longrun_low_freq) / 100);
-	policy->max = longrun_low_freq + msr_hi * 
-		((longrun_high_freq - longrun_low_freq) / 100);
+	if ( longrun_high_freq <= longrun_low_freq ) {
+		/* Assume degenerate Longrun table */
+		policy->min = policy->max = longrun_high_freq;
+	} else {
+		policy->min = longrun_low_freq + msr_lo *
+			((longrun_high_freq - longrun_low_freq) / 100);
+		policy->max = longrun_low_freq + msr_hi *
+			((longrun_high_freq - longrun_low_freq) / 100);
+	}
 	policy->cpu = 0;
 }
 
 
 /**
  * longrun_set_policy - sets a new CPUFreq policy
- * @policy - new policy
+ * @policy: new policy
  *
  * Sets a new CPUFreq policy on LongRun-capable processors. This function
  * has to be called with cpufreq_driver locked.
@@ -70,10 +75,15 @@
 	if (!policy)
 		return -EINVAL;
 
-	pctg_lo = (policy->min - longrun_low_freq) / 
-		((longrun_high_freq - longrun_low_freq) / 100);
-	pctg_hi = (policy->max - longrun_low_freq) / 
-		((longrun_high_freq - longrun_low_freq) / 100);
+	if ( longrun_high_freq <= longrun_low_freq ) {
+		/* Assume degenerate Longrun table */
+		pctg_lo = pctg_hi = 100;
+	} else {
+		pctg_lo = (policy->min - longrun_low_freq) /
+			((longrun_high_freq - longrun_low_freq) / 100);
+		pctg_hi = (policy->max - longrun_low_freq) /
+			((longrun_high_freq - longrun_low_freq) / 100);
+	}
 
 	if (pctg_hi > 100)
 		pctg_hi = 100;
@@ -106,8 +116,9 @@
 
 /**
  * longrun_verify_poliy - verifies a new CPUFreq policy
+ * @policy: the policy to verify
  *
- * Validates a new CPUFreq policy. This function has to be called with 
+ * Validates a new CPUFreq policy. This function has to be called with
  * cpufreq_driver locked.
  */
 static int longrun_verify_policy(struct cpufreq_policy *policy)
@@ -116,8 +127,8 @@
 		return -EINVAL;
 
 	policy->cpu = 0;
-	cpufreq_verify_within_limits(policy, 
-		policy->cpuinfo.min_freq, 
+	cpufreq_verify_within_limits(policy,
+		policy->cpuinfo.min_freq,
 		policy->cpuinfo.max_freq);
 
 	if ((policy->policy != CPUFREQ_POLICY_POWERSAVE) &&
@@ -127,21 +138,35 @@
 	return 0;
 }
 
+static unsigned int longrun_get(unsigned int cpu)
+{
+	u32 eax, ebx, ecx, edx;
+
+	if (cpu)
+		return 0;
+
+	cpuid(0x80860007, &eax, &ebx, &ecx, &edx);
+
+	return (eax * 1000);
+}
 
 /**
  * longrun_determine_freqs - determines the lowest and highest possible core frequency
+ * @low_freq: an int to put the lowest frequency into
+ * @high_freq: an int to put the highest frequency into
  *
  * Determines the lowest and highest possible core frequencies on this CPU.
  * This is necessary to calculate the performance percentage according to
  * TMTA rules:
  * performance_pctg = (target_freq - low_freq)/(high_freq - low_freq)
  */
-static unsigned int __init longrun_determine_freqs(unsigned int *low_freq, 
+static unsigned int __init longrun_determine_freqs(unsigned int *low_freq,
 						   unsigned int *high_freq)
 {
 	u32 msr_lo, msr_hi;
 	u32 save_lo, save_hi;
 	u32 eax, ebx, ecx, edx;
+	u32 try_hi;
 	struct cpuinfo_x86 *c = cpu_data;
 
 	if (!low_freq || !high_freq)
@@ -149,9 +174,9 @@
 
 	if (cpu_has(c, X86_FEATURE_LRTI)) {
 		/* if the LongRun Table Interface is present, the
-		 * detection is a bit easier: 
+		 * detection is a bit easier:
 		 * For minimum frequency, read out the maximum
-		 * level (msr_hi), write that into "currently 
+		 * level (msr_hi), write that into "currently
 		 * selected level", and read out the frequency.
 		 * For maximum frequency, read out level zero.
 		 */
@@ -184,19 +209,21 @@
 	 * upper limit to make the calculation more accurate.
 	 */
 	cpuid(0x80860007, &eax, &ebx, &ecx, &edx);
-	if (ecx > 90) {
-		/* set to 0 to 80 perf_pctg */
+	/* try decreasing in 10% steps, some processors react only
+	 * on some barrier values */
+	for (try_hi = 80; try_hi > 0 && ecx > 90; try_hi -=10) {
+		/* set to 0 to try_hi perf_pctg */
 		msr_lo &= 0xFFFFFF80;
 		msr_hi &= 0xFFFFFF80;
 		msr_lo |= 0;
-		msr_hi |= 80;
+		msr_hi |= try_hi;
 		wrmsr(MSR_TMTA_LONGRUN_CTRL, msr_lo, msr_hi);
 
 		/* read out current core MHz and current perf_pctg */
 		cpuid(0x80860007, &eax, &ebx, &ecx, &edx);
 
 		/* restore values */
-		wrmsr(MSR_TMTA_LONGRUN_CTRL, save_lo, save_hi);	
+		wrmsr(MSR_TMTA_LONGRUN_CTRL, save_lo, save_hi);
 	}
 
 	/* performance_pctg = (current_freq - low_freq)/(high_freq - low_freq)
@@ -210,7 +237,7 @@
 	if ((ecx > 95) || (ecx == 0) || (eax < ebx))
 		return -EIO;
 
-	edx = (eax - ebx) / (100 - ecx); 
+	edx = (eax - ebx) / (100 - ecx);
 	*low_freq = edx * 1000; /* back to kHz */
 
 	if (*low_freq > *high_freq)
@@ -220,9 +247,9 @@
 }
 
 
-static int longrun_cpu_init(struct cpufreq_policy *policy)
+static int __init longrun_cpu_init(struct cpufreq_policy *policy)
 {
-	int                     result = 0;
+	int result = 0;
 
 	/* capability check */
 	if (policy->cpu != 0)
@@ -238,14 +265,16 @@
 	policy->cpuinfo.max_freq = longrun_high_freq;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	longrun_get_policy(policy);
-	
+
 	return 0;
 }
 
 
 static struct cpufreq_driver longrun_driver = {
-	.verify 	= longrun_verify_policy,
-	.setpolicy 	= longrun_set_policy,
+	.flags		= CPUFREQ_CONST_LOOPS,
+	.verify		= longrun_verify_policy,
+	.setpolicy	= longrun_set_policy,
+	.get		= longrun_get,
 	.init		= longrun_cpu_init,
 	.name		= "longrun",
 	.owner		= THIS_MODULE,
@@ -261,7 +290,7 @@
 {
 	struct cpuinfo_x86 *c = cpu_data;
 
-	if (c->x86_vendor != X86_VENDOR_TRANSMETA || 
+	if (c->x86_vendor != X86_VENDOR_TRANSMETA ||
 	    !cpu_has(c, X86_FEATURE_LONGRUN))
 		return -ENODEV;
 

Index: p4-clockmod.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/p4-clockmod.c,v
retrieving revision 1.45
retrieving revision 1.46
diff -u -r1.45 -r1.46
--- p4-clockmod.c	20 Jan 2004 17:03:31 -0000	1.45
+++ p4-clockmod.c	26 Aug 2004 13:25:18 -0000	1.46
@@ -27,7 +27,7 @@
 #include <linux/smp.h>
 #include <linux/cpufreq.h>
 #include <linux/slab.h>
-#include <linux/sched.h>
+#include <linux/cpumask.h>
 
 #include <asm/processor.h> 
 #include <asm/msr.h>
@@ -35,7 +35,7 @@
 
 #include "speedstep-lib.h"
 
-#define PFX	"cpufreq: "
+#define PFX	"p4-clockmod: "
 
 /*
  * Duty Cycle (3bits), note DC_DISABLE is not specified in
@@ -51,59 +51,16 @@
 
 static int has_N44_O17_errata[NR_CPUS];
 static unsigned int stock_freq;
+static struct cpufreq_driver p4clockmod_driver;
+static unsigned int cpufreq_p4_get(unsigned int cpu);
 
 static int cpufreq_p4_setdc(unsigned int cpu, unsigned int newstate)
 {
 	u32 l, h;
-	cpumask_t cpus_allowed, affected_cpu_map;
-	struct cpufreq_freqs freqs;
-	int hyperthreading = 0;
-	int sibling = 0;
 
-	if (!cpu_online(cpu) || (newstate > DC_DISABLE) || 
-		(newstate == DC_RESV))
+	if (!cpu_online(cpu) || (newstate > DC_DISABLE) || (newstate == DC_RESV))
 		return -EINVAL;
 
-	/* switch to physical CPU where state is to be changed*/
-	cpus_allowed = current->cpus_allowed;
-
-	/* only run on CPU to be set, or on its sibling */
-       affected_cpu_map = cpumask_of_cpu(cpu);
-#ifdef CONFIG_X86_HT
-	hyperthreading = ((cpu_has_ht) && (smp_num_siblings == 2));
-	if (hyperthreading) {
-		sibling = cpu_sibling_map[cpu];
-                cpu_set(sibling, affected_cpu_map);
-	}
-#endif
-	set_cpus_allowed(current, affected_cpu_map);
-        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
-
-	/* get current state */
-	rdmsr(MSR_IA32_THERM_CONTROL, l, h);
-	if (l & 0x10) {
-		l = l >> 1;
-		l &= 0x7;
-	} else
-		l = DC_DISABLE;
-	
-	if (l == newstate) {
-		set_cpus_allowed(current, cpus_allowed);
-		return 0;
-	} else if (l == DC_RESV) {
-		printk(KERN_ERR PFX "BIG FAT WARNING: currently in invalid setting\n");
-	}
-
-	/* notifiers */
-	freqs.old = stock_freq * l / 8;
-	freqs.new = stock_freq * newstate / 8;
-	freqs.cpu = cpu;
-	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-	if (hyperthreading) {
-		freqs.cpu = sibling;
-		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-	}
-
 	rdmsr(MSR_IA32_THERM_STATUS, l, h);
 #if 0
 	if (l & 0x01)
@@ -129,15 +86,6 @@
 		wrmsr(MSR_IA32_THERM_CONTROL, l, h);
 	}
 
-	set_cpus_allowed(current, cpus_allowed);
-
-	/* notifiers */
-	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-	if (hyperthreading) {
-		freqs.cpu = cpu;
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-	}
-
 	return 0;
 }
 
@@ -161,11 +109,53 @@
 			     unsigned int relation)
 {
 	unsigned int    newstate = DC_RESV;
+	struct cpufreq_freqs freqs;
+	cpumask_t cpus_allowed, affected_cpu_map;
+	int i;
 
 	if (cpufreq_frequency_table_target(policy, &p4clockmod_table[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
-	cpufreq_p4_setdc(policy->cpu, p4clockmod_table[newstate].index);
+	freqs.old = cpufreq_p4_get(policy->cpu);
+	freqs.new = stock_freq * p4clockmod_table[newstate].index / 8;
+
+	if (freqs.new == freqs.old)
+		return 0;
+
+	/* switch to physical CPU where state is to be changed*/
+	cpus_allowed = current->cpus_allowed;
+
+	/* only run on CPU to be set, or on its sibling */
+#ifdef CONFIG_SMP
+	affected_cpu_map = cpu_sibling_map[policy->cpu];
+#else
+	affected_cpu_map = cpumask_of_cpu(policy->cpu);
+#endif
+
+	/* notifiers */
+	for_each_cpu_mask(i, affected_cpu_map) {
+		freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	}
+
+	/* run on each logical CPU, see section 13.15.3 of IA32 Intel Architecture Software
+	 * Developer's Manual, Volume 3 
+	 */
+	for_each_cpu_mask(i, affected_cpu_map) {
+		cpumask_t this_cpu = cpumask_of_cpu(i);
+
+		set_cpus_allowed(current, this_cpu);
+		BUG_ON(smp_processor_id() != i);
+
+		cpufreq_p4_setdc(i, p4clockmod_table[newstate].index);
+	}
+	set_cpus_allowed(current, cpus_allowed);
+
+	/* notifiers */
+	for_each_cpu_mask(i, affected_cpu_map) {
+		freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	}
 
 	return 0;
 }
@@ -180,22 +170,41 @@
 static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
 {
 	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
-		/* Pentium M */
-		printk(KERN_DEBUG PFX "Warning: Pentium M detected. The speedstep_centrino module\n");
-		printk(KERN_DEBUG PFX "offers voltage scaling in addition of frequency scaling. You\n");
-		printk(KERN_DEBUG PFX "should use that instead of p4-clockmod, if possible.\n");
+		/* Pentium M (Banias) */
+		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
+		       "The speedstep_centrino module offers voltage scaling"
+		       " in addition of frequency scaling. You should use "
+		       "that instead of p4-clockmod, if possible.\n");
+		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
+	}
+
+	if ((c->x86 == 0x06) && (c->x86_model == 0x13)) {
+		/* Pentium M (Dothan) */
+		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
+		       "The speedstep_centrino module offers voltage scaling"
+		       " in addition of frequency scaling. You should use "
+		       "that instead of p4-clockmod, if possible.\n");
+		/* on P-4s, the TSC runs with constant frequency independent whether
+		 * throttling is active or not. */
+		p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
 		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
 	}
 
 	if (c->x86 != 0xF) {
-		printk(KERN_DEBUG PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
+		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
 		return 0;
 	}
 
+	/* on P-4s, the TSC runs with constant frequency independent whether
+	 * throttling is active or not. */
+	p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
+
 	if (speedstep_detect_processor() == SPEEDSTEP_PROCESSOR_P4M) {
-		printk(KERN_DEBUG PFX "Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq \n");
-		printk(KERN_DEBUG PFX "modules offers voltage scaling in addition of frequency scaling. You\n");
-		printk(KERN_DEBUG PFX "should use either one instead of p4-clockmod, if possible.\n");
+		printk(KERN_WARNING PFX "Warning: Pentium 4-M detected. "
+		       "The speedstep-ich or acpi cpufreq modules offer "
+		       "voltage scaling in addition of frequency scaling. "
+		       "You should use either one instead of p4-clockmod, "
+		       "if possible.\n");
 		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_P4M);
 	}
 
@@ -246,7 +255,34 @@
 static int cpufreq_p4_cpu_exit(struct cpufreq_policy *policy)
 {
 	cpufreq_frequency_table_put_attr(policy->cpu);    
-	return cpufreq_p4_setdc(policy->cpu, DC_DISABLE);
+	return 0;
+}
+
+static unsigned int cpufreq_p4_get(unsigned int cpu)
+{
+	cpumask_t cpus_allowed, affected_cpu_map;
+	u32 l, h;
+
+	cpus_allowed = current->cpus_allowed;
+        affected_cpu_map = cpumask_of_cpu(cpu);
+
+	set_cpus_allowed(current, affected_cpu_map);
+        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
+
+	rdmsr(MSR_IA32_THERM_CONTROL, l, h);
+
+	set_cpus_allowed(current, cpus_allowed);
+
+	if (l & 0x10) {
+		l = l >> 1;
+		l &= 0x7;
+	} else
+		l = DC_DISABLE;
+
+	if (l != DC_DISABLE)
+		return (stock_freq * l / 8);
+
+	return stock_freq;
 }
 
 static struct freq_attr* p4clockmod_attr[] = {
@@ -259,6 +295,7 @@
 	.target		= cpufreq_p4_target,
 	.init		= cpufreq_p4_cpu_init,
 	.exit		= cpufreq_p4_cpu_exit,
+	.get		= cpufreq_p4_get,
 	.name		= "p4-clockmod",
 	.owner		= THIS_MODULE,
 	.attr		= p4clockmod_attr,

Index: powernow-k6.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k6.c,v
retrieving revision 1.53
retrieving revision 1.54
diff -u -r1.53 -r1.54
--- powernow-k6.c	5 Nov 2003 18:27:42 -0000	1.53
+++ powernow-k6.c	26 Aug 2004 13:25:18 -0000	1.54
@@ -118,7 +118,9 @@
 
 /**
  * powernow_k6_setpolicy - sets a new CPUFreq policy
- * @policy - new policy
+ * @policy: new policy
+ * @target_freq: the target frequency
+ * @relation: how that frequency relates to achieved frequency (CPUFREQ_RELATION_L or CPUFREQ_RELATION_H)
  *
  * sets a new CPUFreq policy
  */
@@ -140,6 +142,7 @@
 static int powernow_k6_cpu_init(struct cpufreq_policy *policy)
 {
 	unsigned int i;
+	int result;
 
 	if (policy->cpu != 0)
 		return -ENODEV;
@@ -161,7 +164,13 @@
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
 
 
@@ -172,17 +181,29 @@
 		if (i==max_multiplier)
 			powernow_k6_set_state(i);
 	}
-	return 0;
+	cpufreq_frequency_table_put_attr(policy->cpu);
+ 	return 0;
+}
+
+static unsigned int powernow_k6_get(unsigned int cpu)
+{
+	return busfreq * powernow_k6_get_cpu_multiplier();
 }
 
+static struct freq_attr* powernow_k6_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
 
 static struct cpufreq_driver powernow_k6_driver = {
 	.verify 	= powernow_k6_verify,
 	.target 	= powernow_k6_target,
 	.init		= powernow_k6_cpu_init,
 	.exit		= powernow_k6_cpu_exit,
+	.get		= powernow_k6_get,
 	.name		= "powernow-k6",
 	.owner		= THIS_MODULE,
+	.attr		= powernow_k6_attr,
 };
 
 

Index: powernow-k7.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.c,v
retrieving revision 1.48
retrieving revision 1.49
diff -u -r1.48 -r1.49
--- powernow-k7.c	21 Jan 2004 13:02:20 -0000	1.48
+++ powernow-k7.c	26 Aug 2004 13:25:18 -0000	1.49
@@ -1,13 +1,11 @@
 /*
  *  AMD K7 Powernow driver.
  *  (C) 2003 Dave Jones <davej@codemonkey.org.uk> on behalf of SuSE Labs.
- *  (C) 2003 Dave Jones <davej@redhat.com>
+ *  (C) 2003-2004 Dave Jones <davej@redhat.com>
  *
  *  Licensed under the terms of the GNU GPL License version 2.
  *  Based upon datasheets & sample CPUs kindly provided by AMD.
  *
- *  BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*
- *
  * Errata 5: Processor may fail to execute a FID/VID change in presence of interrupt.
  * - We cli/sti on stepping A0 CPUs around the FID/VID transition.
  * Errata 15: Processors with half frequency multipliers may hang upon wakeup from disconnect.
@@ -16,27 +14,26 @@
 
 #include <linux/config.h>
 #include <linux/kernel.h>
-#include <linux/module.h> 
+#include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/cpufreq.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/dmi.h>
 
 #include <asm/msr.h>
 #include <asm/timex.h>
 #include <asm/io.h>
 #include <asm/system.h>
 
-#include "powernow-k7.h"
-
-#define DEBUG
-
-#ifdef DEBUG
-#define dprintk(msg...) printk(msg)
-#else
-#define dprintk(msg...) do { } while(0)
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
+#include <linux/acpi.h>
+#include <acpi/processor.h>
 #endif
 
+#include "powernow-k7.h"
+
 #define PFX "powernow: "
 
 
@@ -57,6 +54,17 @@
 	u8 numpstates;
 };
 
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
+union powernow_acpi_control_t {
+	struct {
+		unsigned long fid:5,
+		vid:5,
+		sgtc:20,
+		res1:2;
+	} bits;
+	unsigned long val;
+};
+#endif
 
 /* divide by 1000 to get VID. */
 static int mobile_vid_table[32] = {
@@ -69,11 +77,18 @@
 /* divide by 10 to get FID. */
 static int fid_codes[32] = {
     110, 115, 120, 125, 50, 55, 60, 65,
-    70, 75, 80, 85, 90, 95, 100, 105, 
+    70, 75, 80, 85, 90, 95, 100, 105,
     30, 190, 40, 200, 130, 135, 140, 210,
     150, 225, 160, 165, 170, 180, -1, -1,
 };
 
+/* This parameter is used in order to force ACPI instead of legacy method for
+ * configuration purpose.
+ */
+
+static int acpi_force;
+static int debug;
+
 static struct cpufreq_frequency_table *powernow_table;
 
 static unsigned int can_scale_bus;
@@ -85,6 +100,29 @@
 static unsigned int latency;
 static char have_a0;
 
+static void dprintk(const char *fmt, ...)
+{
+	char s[256];
+	va_list args;
+
+	if (debug==0)
+		return;
+
+	va_start(args,fmt);
+	vsprintf(s, fmt, args);
+	printk(s);
+	va_end(args);
+}
+
+
+static int check_fsb(unsigned int fsbspeed)
+{
+	int delta;
+	unsigned int f = fsb / 1000;
+
+	delta = (fsbspeed > f) ? fsbspeed - f : f - fsbspeed;
+	return (delta < 5);
+}
 
 static int check_powernow(void)
 {
@@ -98,19 +136,26 @@
 		return 0;
 	}
 
-	if ((c->x86_model == 6) && (c->x86_mask == 0)) {
-		printk (KERN_INFO PFX "K7 660[A0] core detected, enabling errata workarounds\n");
-		have_a0 = 1;
-	}
-
 	/* Get maximum capabilities */
 	maxei = cpuid_eax (0x80000000);
 	if (maxei < 0x80000007) {	/* Any powernow info ? */
+#ifdef MODULE
 		printk (KERN_INFO PFX "No powernow capabilities detected\n");
+#endif
 		return 0;
 	}
 
+	if ((c->x86_model == 6) && (c->x86_mask == 0)) {
+		printk (KERN_INFO PFX "K7 660[A0] core detected, enabling errata workarounds\n");
+		have_a0 = 1;
+	}
+
 	cpuid(0x80000007, &eax, &ebx, &ecx, &edx);
+
+	/* Check we can actually do something before we say anything.*/
+	if (!(edx & (1 << 1 | 1 << 2)))
+		return 0;
+
 	printk (KERN_INFO PFX "PowerNOW! Technology present. Can scale: ");
 
 	if (edx & 1 << 1) {
@@ -126,11 +171,6 @@
 		can_scale_vid=1;
 	}
 
-	if (!(edx & (1 << 1 | 1 << 2))) {
-		printk ("nothing.\n");
-		return 0;
-	}
-
 	printk (".\n");
 	return 1;
 }
@@ -138,7 +178,8 @@
 
 static int get_ranges (unsigned char *pst)
 {
-	unsigned int j, speed;
+	unsigned int j;
+	unsigned int speed;
 	u8 fid, vid;
 
 	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) * (number_scales + 1)), GFP_KERNEL);
@@ -149,20 +190,20 @@
 	for (j=0 ; j < number_scales; j++) {
 		fid = *pst++;
 
-		powernow_table[j].frequency = fsb * fid_codes[fid] * 100;
+		powernow_table[j].frequency = (fsb * fid_codes[fid]) / 10;
 		powernow_table[j].index = fid; /* lower 8 bits */
 
-		speed = fsb * (fid_codes[fid]/10);
+		speed = powernow_table[j].frequency;
+
 		if ((fid_codes[fid] % 10)==5) {
-			speed += fsb/2;
-#if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
 			if (have_a0 == 1)
 				powernow_table[j].frequency = CPUFREQ_ENTRY_INVALID;
 #endif
 		}
 
-		dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])\t", fid,
-			fid_codes[fid] / 10, fid_codes[fid] % 10, speed);
+		dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])  ", fid,
+			fid_codes[fid] / 10, fid_codes[fid] % 10, speed/1000);
 
 		if (speed < minimum_speed)
 			minimum_speed = speed;
@@ -174,8 +215,6 @@
 		dprintk ("VID: 0x%x (%d.%03dV)\n", vid,	mobile_vid_table[vid]/1000,
 			mobile_vid_table[vid]%1000);
 	}
-	dprintk ("\n");
-
 	powernow_table[number_scales].frequency = CPUFREQ_TABLE_END;
 	powernow_table[number_scales].index = 0;
 
@@ -232,7 +271,8 @@
 
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 	cfid = fidvidstatus.bits.CFID;
-	freqs.old = fsb * fid_codes[cfid] * 100;
+	freqs.old = fsb * fid_codes[cfid] / 10;
+
 	freqs.new = powernow_table[index].frequency;
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
@@ -251,7 +291,7 @@
 		change_VID(vid);
 		change_FID(fid);
 	}
-	
+
 
 	if (have_a0 == 1)
 		local_irq_enable();
@@ -260,19 +300,136 @@
 }
 
 
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
+
+struct acpi_processor_performance *acpi_processor_perf;
+
+static int powernow_acpi_init(void)
+{
+	int i;
+	int retval = 0;
+	union powernow_acpi_control_t pc;
+
+	if (acpi_processor_perf != NULL && powernow_table != NULL) {
+		retval = -EINVAL;
+		goto err0;
+	}
+
+	acpi_processor_perf = kmalloc(sizeof(struct acpi_processor_performance),
+				      GFP_KERNEL);
+
+	if (!acpi_processor_perf) {
+		retval = -ENOMEM;
+		goto err0;
+	}
+
+	memset(acpi_processor_perf, 0, sizeof(struct acpi_processor_performance));
+
+	if (acpi_processor_register_performance(acpi_processor_perf, 0)) {
+		retval = -EIO;
+		goto err1;
+	}
+
+	if (acpi_processor_perf->control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) {
+		retval = -ENODEV;
+		goto err2;
+	}
+
+	if (acpi_processor_perf->status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) {
+		retval = -ENODEV;
+		goto err2;
+	}
+
+	number_scales = acpi_processor_perf->state_count;
+
+	if (number_scales < 2) {
+		retval = -ENODEV;
+		goto err2;
+	}
+
+	powernow_table = kmalloc((number_scales + 1) * (sizeof(struct cpufreq_frequency_table)), GFP_KERNEL);
+	if (!powernow_table) {
+		retval = -ENOMEM;
+		goto err2;
+	}
+
+	memset(powernow_table, 0, ((number_scales + 1) * sizeof(struct cpufreq_frequency_table)));
+
+	pc.val = (unsigned long) acpi_processor_perf->states[0].control;
+	for (i = 0; i < number_scales; i++) {
+		u8 fid, vid;
+		unsigned int speed;
+
+		pc.val = (unsigned long) acpi_processor_perf->states[i].control;
+		dprintk (KERN_INFO PFX "acpi:  P%d: %d MHz %d mW %d uS control %08x SGTC %d\n",
+			 i,
+			 (u32) acpi_processor_perf->states[i].core_frequency,
+			 (u32) acpi_processor_perf->states[i].power,
+			 (u32) acpi_processor_perf->states[i].transition_latency,
+			 (u32) acpi_processor_perf->states[i].control,
+			 pc.bits.sgtc);
+
+		vid = pc.bits.vid;
+		fid = pc.bits.fid;
+
+		powernow_table[i].frequency = fsb * fid_codes[fid] / 10;
+		powernow_table[i].index = fid; /* lower 8 bits */
+		powernow_table[i].index |= (vid << 8); /* upper 8 bits */
+
+		speed = powernow_table[i].frequency;
+
+		if ((fid_codes[fid] % 10)==5) {
+			if (have_a0 == 1)
+				powernow_table[i].frequency = CPUFREQ_ENTRY_INVALID;
+		}
+
+		dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])  ", fid,
+			fid_codes[fid] / 10, fid_codes[fid] % 10, speed/1000);
+		dprintk ("VID: 0x%x (%d.%03dV)\n", vid,	mobile_vid_table[vid]/1000,
+			mobile_vid_table[vid]%1000);
+
+		if (latency < pc.bits.sgtc)
+			latency = pc.bits.sgtc;
+
+		if (speed < minimum_speed)
+			minimum_speed = speed;
+		if (speed > maximum_speed)
+			maximum_speed = speed;
+	}
+
+	powernow_table[i].frequency = CPUFREQ_TABLE_END;
+	powernow_table[i].index = 0;
+
+	return 0;
+
+err2:
+	acpi_processor_unregister_performance(acpi_processor_perf, 0);
+err1:
+	kfree(acpi_processor_perf);
+err0:
+	printk(KERN_WARNING PFX "ACPI perflib can not be used in this platform\n");
+	acpi_processor_perf = NULL;
+	return retval;
+}
+#else
+static int powernow_acpi_init(void)
+{
+	printk(KERN_INFO PFX "no support for ACPI processor found."
+	       "  Please recompile your kernel with ACPI processor\n");
+	return -EINVAL;
+}
+#endif
+
 static int powernow_decode_bios (int maxfid, int startvid)
 {
 	struct psb_s *psb;
 	struct pst_s *pst;
-	struct cpuinfo_x86 *c = cpu_data;
 	unsigned int i, j;
 	unsigned char *p;
 	unsigned int etuple;
 	unsigned int ret;
 
 	etuple = cpuid_eax(0x80000001);
-	etuple &= 0xf00;
-	etuple |= (c->x86_model<<4)|(c->x86_mask);
 
 	for (i=0xC0000; i < 0xffff0 ; i+=16) {
 
@@ -303,7 +460,6 @@
 			}
 			dprintk (KERN_INFO PFX "Settling Time: %d microseconds.\n", psb->settlingtime);
 			dprintk (KERN_INFO PFX "Has %d PST tables. (Only dumping ones relevant to this CPU).\n", psb->numpst);
-			latency *= 100;	/* SGTC needs to be in units of 10ns */
 
 			p += sizeof (struct psb_s);
 
@@ -313,15 +469,15 @@
 				pst = (struct pst_s *) p;
 				number_scales = pst->numpstates;
 
-				if ((etuple == pst->cpuid) && (maxfid==pst->maxfid) && (startvid==pst->startvid))
+				if ((etuple == pst->cpuid) && check_fsb(pst->fsbspeed) &&
+				    (maxfid==pst->maxfid) && (startvid==pst->startvid))
 				{
 					dprintk (KERN_INFO PFX "PST:%d (@%p)\n", i, pst);
-					dprintk (KERN_INFO PFX " cpuid: 0x%x\t", pst->cpuid);
-					dprintk ("fsb: %d\t", pst->fsbspeed);
-					dprintk ("maxFID: 0x%x\t", pst->maxfid);
+					dprintk (KERN_INFO PFX " cpuid: 0x%x  ", pst->cpuid);
+					dprintk ("fsb: %d  ", pst->fsbspeed);
+					dprintk ("maxFID: 0x%x  ", pst->maxfid);
 					dprintk ("startvid: 0x%x\n", pst->startvid);
 
-					fsb = pst->fsbspeed;
 					ret = get_ranges ((char *) pst + sizeof (struct pst_s));
 					return ret;
 
@@ -333,7 +489,7 @@
 			}
 			printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
 			printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
-			printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
+
 			return -EINVAL;
 		}
 		p++;
@@ -363,6 +519,72 @@
 	return cpufreq_frequency_table_verify(policy, powernow_table);
 }
 
+/*
+ * We use the fact that the bus frequency is somehow
+ * a multiple of 100000/3 khz, then we compute sgtc according
+ * to this multiple.
+ * That way, we match more how AMD thinks all of that work.
+ * We will then get the same kind of behaviour already tested under
+ * the "well-known" other OS.
+ */
+static int __init fixup_sgtc(void)
+{
+	unsigned int sgtc;
+	unsigned int m;
+
+	m = fsb / 3333;
+	if ((m % 10) >= 5)
+		m += 5;
+
+	m /= 10;
+
+	sgtc = 100 * m * latency;
+	sgtc = sgtc / 3;
+	if (sgtc > 0xfffff) {
+		printk(KERN_WARNING PFX "SGTC too large %d\n", sgtc);
+		sgtc = 0xfffff;
+	}
+	return sgtc;
+}
+
+static unsigned int powernow_get(unsigned int cpu)
+{
+	union msr_fidvidstatus fidvidstatus;
+	unsigned int cfid;
+
+	if (cpu)
+		return 0;
+	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
+	cfid = fidvidstatus.bits.CFID;
+
+	return (fsb * fid_codes[cfid] / 10);
+}
+
+
+static int __init acer_cpufreq_pst(struct dmi_system_id *d)
+{
+	printk(KERN_WARNING "%s laptop with broken PST tables in BIOS detected.\n", d->ident);
+	printk(KERN_WARNING "You need to downgrade to 3A21 (09/09/2002), or try a newer BIOS than 3A71 (01/20/2003)\n");
+	printk(KERN_WARNING "cpufreq scaling has been disabled as a result of this.\n");
+	return 0;
+}
+
+/*
+ * Some Athlon laptops have really fucked PST tables.
+ * A BIOS update is all that can save them.
+ * Mention this, and disable cpufreq.
+ */
+static struct dmi_system_id __initdata powernow_dmi_table[] = {
+	{
+		.callback = acer_cpufreq_pst,
+		.ident = "Acer Aspire",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde Software"),
+			DMI_MATCH(DMI_BIOS_VERSION, "3A71"),
+		},
+	},
+	{ }
+};
 
 static int __init powernow_cpu_init (struct cpufreq_policy *policy)
 {
@@ -374,53 +596,76 @@
 
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 
-	result = powernow_decode_bios(fidvidstatus.bits.MFID, fidvidstatus.bits.SVID);
+	/* A K7 with powernow technology is set to max frequency by BIOS */
+	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
+	if (!fsb) {
+		printk(KERN_WARNING PFX "can not determine bus frequency\n");
+		return -EINVAL;
+	}
+	dprintk(KERN_INFO PFX "FSB: %3d.%03d MHz\n", fsb/1000, fsb%1000);
+
+	if (dmi_check_system(powernow_dmi_table) || acpi_force) {
+		printk (KERN_INFO PFX "PSB/PST known to be broken.  Trying ACPI instead\n");
+		result = powernow_acpi_init();
+	} else {
+		result = powernow_decode_bios(fidvidstatus.bits.MFID, fidvidstatus.bits.SVID);
+		if (result) {
+			printk (KERN_INFO PFX "Trying ACPI perflib\n");
+			maximum_speed = 0;
+			minimum_speed = -1;
+			latency = 0;
+			result = powernow_acpi_init();
+			if (result) {
+				printk (KERN_INFO PFX "ACPI and legacy methods failed\n");
+				printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
+			}
+		} else {
+			/* SGTC use the bus clock as timer */
+			latency = fixup_sgtc();
+			printk(KERN_INFO PFX "SGTC: %d\n", latency);
+		}
+	}
+
 	if (result)
 		return result;
 
 	printk (KERN_INFO PFX "Minimum speed %d MHz. Maximum speed %d MHz.\n",
-				minimum_speed, maximum_speed);
-
-	cpufreq_frequency_table_get_attr(powernow_table, policy->cpu);
+				minimum_speed/1000, maximum_speed/1000);
 
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
-	/* latency is in 10 ns (look for SGTC above) for each VID
-	 * and FID transition, so multiply that value with 20 */
-	policy->cpuinfo.transition_latency = latency * 20;
+	policy->cpuinfo.transition_latency = 20 * latency / fsb;
 
-	policy->cur = maximum_speed;
+	policy->cur = powernow_get(0);
+
+	cpufreq_frequency_table_get_attr(powernow_table, policy->cpu);
 
 	return cpufreq_frequency_table_cpuinfo(policy, powernow_table);
 }
 
-static int powernow_cpu_exit(struct cpufreq_policy *policy)
-{
+static int powernow_cpu_exit (struct cpufreq_policy *policy) {
 	cpufreq_frequency_table_put_attr(policy->cpu);
 	return 0;
 }
 
-static struct freq_attr* powernow_attr[] = {
+static struct freq_attr* powernow_table_attr[] = {
 	&cpufreq_freq_attr_scaling_available_freqs,
 	NULL,
 };
 
 static struct cpufreq_driver powernow_driver = {
-	.verify 	= powernow_verify,
-	.target 	= powernow_target,
-	.init		= powernow_cpu_init,
-	.exit		= powernow_cpu_exit,
-	.attr		= powernow_attr,
-	.name		= "powernow-k7",
-	.owner		= THIS_MODULE,
+	.verify	= powernow_verify,
+	.target	= powernow_target,
+	.get	= powernow_get,
+	.init	= powernow_cpu_init,
+	.exit	= powernow_cpu_exit,
+	.name	= "powernow-k7",
+	.owner	= THIS_MODULE,
+	.attr	= powernow_table_attr,
 };
 
 static int __init powernow_init (void)
 {
-	if (dmi_broken & BROKEN_CPUFREQ) {
-		printk (KERN_INFO PFX "Disabled at boot time by DMI,\n");
-		return -ENODEV;
-	}
 	if (check_powernow()==0)
 		return -ENODEV;
 	return cpufreq_register_driver(&powernow_driver);
@@ -429,15 +674,26 @@
 
 static void __exit powernow_exit (void)
 {
+#ifdef CONFIG_X86_POWERNOW_K7_ACPI
+	if (acpi_processor_perf) {
+		acpi_processor_unregister_performance(acpi_processor_perf, 0);
+		kfree(acpi_processor_perf);
+	}
+#endif
 	cpufreq_unregister_driver(&powernow_driver);
 	if (powernow_table)
 		kfree(powernow_table);
 }
 
+module_param(debug, int, 0444);
+MODULE_PARM_DESC(debug, "enable debug output.");
+module_param(acpi_force,  int, 0444);
+MODULE_PARM_DESC(acpi_force, "Force ACPI to be used.");
+
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Powernow driver for AMD K7 processors.");
 MODULE_LICENSE ("GPL");
 
-module_init(powernow_init);
+late_initcall(powernow_init);
 module_exit(powernow_exit);
 

Index: powernow-k7.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.h,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -r1.3 -r1.4

Index: powernow-k8.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -r1.3 -r1.4
--- powernow-k8.c	20 Jan 2004 17:03:31 -0000	1.3
+++ powernow-k8.c	26 Aug 2004 13:25:18 -0000	1.4
@@ -1,20 +1,23 @@
 /*
- *   (c) 2003 Advanced Micro Devices, Inc.
+ *   (c) 2003, 2004 Advanced Micro Devices, Inc.
  *  Your use of this code is subject to the terms and conditions of the
- *  GNU general public license version 2. See "../../../COPYING" or
+ *  GNU general public license version 2. See "COPYING" or
  *  http://www.gnu.org/licenses/gpl.html
  *
  *  Support : paul.devriendt@amd.com
  *
  *  Based on the powernow-k7.c module written by Dave Jones.
[...1639 lines suppressed...]
 
 /* driver entry point for term */
-static void __exit
-powernowk8_exit(void)
+static void __exit powernowk8_exit(void)
 {
-	dprintk(KERN_INFO PFX "powernowk8_exit\n");
+	dprintk(KERN_INFO PFX "exit\n");
 
 	cpufreq_unregister_driver(&cpufreq_amd64_driver);
-	kfree(ppst);
 }
 
 MODULE_AUTHOR("Paul Devriendt <paul.devriendt@amd.com>");
 MODULE_DESCRIPTION("AMD Athlon 64 and Opteron processor frequency driver.");
 MODULE_LICENSE("GPL");
 
-module_init(powernowk8_init);
+late_initcall(powernowk8_init);
 module_exit(powernowk8_exit);

Index: powernow-k8.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.h,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- powernow-k8.h	5 Nov 2003 18:27:43 -0000	1.2
+++ powernow-k8.h	26 Aug 2004 13:25:18 -0000	1.3
@@ -1,23 +1,52 @@
 /*
- *   (c) 2003 Advanced Micro Devices, Inc.
+ *  (c) 2003, 2004 Advanced Micro Devices, Inc.
  *  Your use of this code is subject to the terms and conditions of the
- *  GNU general public license version 2. See "../../../COPYING" or
+ *  GNU general public license version 2. See "COPYING" or
  *  http://www.gnu.org/licenses/gpl.html
  */
 
+struct powernow_k8_data {
+	unsigned int cpu;
+
+	u32 numps;  /* number of p-states */
+	u32 batps;  /* number of p-states supported on battery */
+
+	/* these values are constant when the PSB is used to determine
+	 * vid/fid pairings, but are modified during the ->target() call
+	 * when ACPI is used */
+	u32 rvo;     /* ramp voltage offset */
+	u32 irt;     /* isochronous relief time */
+	u32 vidmvs;  /* usable value calculated from mvs */
+	u32 vstable; /* voltage stabilization time, units 20 us */
+	u32 plllock; /* pll lock time, units 1 us */
+
+	/* keep track of the current fid / vid */
+	u32 currvid;
+	u32 currfid;
+
+	/* the powernow_table includes all frequency and vid/fid pairings:
+	 * fid are the lower 8 bits of the index, vid are the upper 8 bits.
+	 * frequency is in kHz */
+	struct cpufreq_frequency_table  *powernow_table;
+
+#ifdef CONFIG_X86_POWERNOW_K8_ACPI
+	/* the acpi table needs to be kept. it's only available if ACPI was
+	 * used to determine valid frequency/vid/fid states */
+	struct acpi_processor_performance acpi_data;
+#endif
+};
+
+
 /* processor's cpuid instruction support */
-#define CPUID_PROCESSOR_SIGNATURE             1	/* function 1               */
-#define CPUID_F1_FAM                 0x00000f00	/* family mask              */
-#define CPUID_F1_XFAM                0x0ff00000	/* extended family mask     */
-#define CPUID_F1_MOD                 0x000000f0	/* model mask               */
-#define CPUID_F1_STEP                0x0000000f	/* stepping level mask      */
-#define CPUID_XFAM_MOD               0x0ff00ff0	/* xtended fam, fam + model */
-#define ATHLON64_XFAM_MOD            0x00000f40	/* xtended fam, fam + model */
-#define OPTERON_XFAM_MOD             0x00000f50	/* xtended fam, fam + model */
-#define ATHLON64_REV_C0                       8
-#define CPUID_GET_MAX_CAPABILITIES   0x80000000
-#define CPUID_FREQ_VOLT_CAPABILITIES 0x80000007
-#define P_STATE_TRANSITION_CAPABLE            6
+#define CPUID_PROCESSOR_SIGNATURE	1	/* function 1 */
+#define CPUID_XFAM			0x0ff00000	/* extended family */
+#define CPUID_XFAM_K8			0
+#define CPUID_XMOD			0x000f0000	/* extended model */
+#define CPUID_XMOD_REV_E		0x00020000
+#define CPUID_USE_XFAM_XMOD		0x00000f00
+#define CPUID_GET_MAX_CAPABILITIES	0x80000000
+#define CPUID_FREQ_VOLT_CAPABILITIES	0x80000007
+#define P_STATE_TRANSITION_CAPABLE	6
 
 /* Model Specific Registers for p-state transitions. MSRs are 64-bit. For     */
 /* writes (wrmsr - opcode 0f 30), the register number is placed in ecx, and   */
@@ -47,10 +76,23 @@
 #define MSR_S_HI_MAX_WORKING_VID  0x001f0000
 #define MSR_S_HI_START_VID        0x00001f00
 #define MSR_S_HI_CURRENT_VID      0x0000001f
+#define MSR_C_HI_STP_GNT_BENIGN   0x00000001
+
+/*
+ * There are restrictions frequencies have to follow:
+ * - only 1 entry in the low fid table ( <=1.4GHz )
+ * - lowest entry in the high fid table must be >= 2 * the entry in the
+ *   low fid table
+ * - lowest entry in the high fid table must be a <= 200MHz + 2 * the entry
+ *   in the low fid table
+ * - the parts can only step at 200 MHz intervals, so 1.9 GHz is never valid
+ * - lowest frequency must be >= interprocessor hypertransport link speed
+ *   (only applies to MP systems obviously)
+ */
 
 /* fids (frequency identifiers) are arranged in 2 tables - lo and hi */
-#define LO_FID_TABLE_TOP     6
-#define HI_FID_TABLE_BOTTOM  8
+#define LO_FID_TABLE_TOP     6	/* fid values marking the boundary    */
+#define HI_FID_TABLE_BOTTOM  8	/* between the low and high tables    */
 
 #define LO_VCOFREQ_TABLE_TOP    1400	/* corresponding vco frequency values */
 #define HI_VCOFREQ_TABLE_BOTTOM 1600
@@ -58,14 +100,12 @@
 #define MIN_FREQ_RESOLUTION  200 /* fids jump by 2 matching freq jumps by 200 */
 
 #define MAX_FID 0x2a	/* Spec only gives FID values as far as 5 GHz */
-
 #define LEAST_VID 0x1e	/* Lowest (numerically highest) useful vid value */
 
 #define MIN_FREQ 800	/* Min and max freqs, per spec */
 #define MAX_FREQ 5000
 
 #define INVALID_FID_MASK 0xffffffc1  /* not a valid fid if these bits are set */
-
 #define INVALID_VID_MASK 0xffffffe0  /* not a valid vid if these bits are set */
 
 #define STOP_GRANT_5NS 1 /* min poss memory access latency for voltage change */
@@ -73,18 +113,35 @@
 #define PLL_LOCK_CONVERSION (1000/5) /* ms to ns, then divide by clock period */
 
 #define MAXIMUM_VID_STEPS 1  /* Current cpus only allow a single step of 25mV */
-
 #define VST_UNITS_20US 20   /* Voltage Stabalization Time is in units of 20us */
 
 /*
-Version 1.4 of the PSB table. This table is constructed by BIOS and is
-to tell the OS's power management driver which VIDs and FIDs are
-supported by this particular processor. This information is obtained from
-the data sheets for each processor model by the system vendor and
-incorporated into the BIOS.
-If the data in the PSB / PST is wrong, then this driver will program the
-wrong values into hardware, which is very likely to lead to a crash.
-*/
+ * Most values of interest are enocoded in a single field of the _PSS
+ * entries: the "control" value.
+ */
+                                                                                                    
+#define IRT_SHIFT      30
+#define RVO_SHIFT      28
+#define PLL_L_SHIFT    20
+#define MVS_SHIFT      18
+#define VST_SHIFT      11
+#define VID_SHIFT       6
+#define IRT_MASK        3
+#define RVO_MASK        3
+#define PLL_L_MASK   0x7f
+#define MVS_MASK        3
+#define VST_MASK     0x7f
+#define VID_MASK     0x1f
+#define FID_MASK     0x3f
+
+
+/*
+ * Version 1.4 of the PSB table. This table is constructed by BIOS and is
+ * to tell the OS's power management driver which VIDs and FIDs are
+ * supported by this particular processor.
+ * If the data in the PSB / PST is wrong, then this driver will program the
+ * wrong values into hardware, which is very likely to lead to a crash.
+ */
 
 #define PSB_ID_STRING      "AMDK7PNOW!"
 #define PSB_ID_STRING_LEN  10
@@ -117,10 +174,8 @@
 #define dprintk(msg...) do { } while(0)
 #endif
 
-static inline int core_voltage_pre_transition(u32 reqvid);
-static inline int core_voltage_post_transition(u32 reqvid);
-static inline int core_frequency_transition(u32 reqfid);
-static int powernowk8_verify(struct cpufreq_policy *pol);
-static int powernowk8_target(struct cpufreq_policy *pol, unsigned targfreq,
-		      unsigned relation);
-static int __init powernowk8_cpu_init(struct cpufreq_policy *pol);
+static int core_voltage_pre_transition(struct powernow_k8_data *data, u32 reqvid);
+static int core_voltage_post_transition(struct powernow_k8_data *data, u32 reqvid);
+static int core_frequency_transition(struct powernow_k8_data *data, u32 reqfid);
+
+static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data, unsigned int index);

Index: speedstep-centrino.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-centrino.c,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- speedstep-centrino.c	5 Nov 2003 18:27:43 -0000	1.4
+++ speedstep-centrino.c	26 Aug 2004 13:25:19 -0000	1.5
@@ -10,7 +10,7 @@
  * Copyright (C) 2003 Jeremy Fitzhardinge <jeremy@goop.org>
  *
  * WARNING WARNING WARNING
- * 
+ *
  * This driver manipulates the PERF_CTL MSR, which is only somewhat
  * documented.  While it seems to work on my laptop, it has not been
  * tested anywhere else, and it may not work for you, do strange
@@ -21,6 +21,12 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/cpufreq.h>
+#include <linux/config.h>
+
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
+#include <linux/acpi.h>
+#include <acpi/processor.h>
+#endif
 
 #include <asm/msr.h>
 #include <asm/processor.h>
@@ -37,16 +43,43 @@
 #define dprintk(msg...) do { } while(0)
 #endif
 
+struct cpu_id
+{
+	__u8	x86;            /* CPU family */
+	__u8	x86_model;	/* model */
+	__u8	x86_mask;	/* stepping */
+};
+
+enum {
+	CPU_BANIAS,
+	CPU_DOTHAN_A1,
+	CPU_DOTHAN_A2,
+	CPU_DOTHAN_B0,
+};
+
+static const struct cpu_id cpu_ids[] = {
+	[CPU_BANIAS]	= { 6,  9, 5 },
+	[CPU_DOTHAN_A1]	= { 6, 13, 1 },
+	[CPU_DOTHAN_A2]	= { 6, 13, 2 },
+	[CPU_DOTHAN_B0]	= { 6, 13, 6 },
+};
+#define N_IDS	(sizeof(cpu_ids)/sizeof(cpu_ids[0]))
+
 struct cpu_model
 {
+	const struct cpu_id *cpu_id;
 	const char	*model_name;
 	unsigned	max_freq; /* max clock in kHz */
 
 	struct cpufreq_frequency_table *op_points; /* clock/voltage pairs */
 };
+static int centrino_verify_cpu_id(const struct cpuinfo_x86 *c, const struct cpu_id *x);
 
 /* Operating points for current CPU */
-static const struct cpu_model *centrino_model;
+static struct cpu_model *centrino_model;
+static int centrino_cpu;
+
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE
 
 /* Computes the correct form for IA32_PERF_CTL MSR for a particular
    frequency/voltage operating point; frequency in MHz, volts in mV.
@@ -57,15 +90,15 @@
 		.index = (((mhz)/100) << 8) | ((mv - 700) / 16)		\
 	}
 
-/* 
+/*
  * These voltage tables were derived from the Intel Pentium M
  * datasheet, document 25261202.pdf, Table 5.  I have verified they
  * are consistent with my IBM ThinkPad X31, which has a 1.3GHz Pentium
  * M.
  */
 
-/* Ultra Low Voltage Intel Pentium M processor 900MHz */
-static struct cpufreq_frequency_table op_900[] =
+/* Ultra Low Voltage Intel Pentium M processor 900MHz (Banias) */
+static struct cpufreq_frequency_table banias_900[] =
 {
 	OP(600,  844),
 	OP(800,  988),
@@ -73,18 +106,18 @@
 	{ .frequency = CPUFREQ_TABLE_END }
 };
 
-/* Ultra Low Voltage Intel Pentium M processor 1000MHz */
-static struct cpufreq_frequency_table op_1000[] =
+/* Ultra Low Voltage Intel Pentium M processor 1000MHz (Banias) */
+static struct cpufreq_frequency_table banias_1000[] =
 {
-	OP(600,  844),
-	OP(800,  972),
-	OP(900,  988),
+	OP(600,   844),
+	OP(800,   972),
+	OP(900,   988),
 	OP(1000, 1004),
 	{ .frequency = CPUFREQ_TABLE_END }
 };
 
-/* Low Voltage Intel Pentium M processor 1.10GHz */
-static struct cpufreq_frequency_table op_1100[] =
+/* Low Voltage Intel Pentium M processor 1.10GHz (Banias) */
+static struct cpufreq_frequency_table banias_1100[] =
 {
 	OP( 600,  956),
 	OP( 800, 1020),
@@ -95,8 +128,8 @@
 };
 
 
-/* Low Voltage Intel Pentium M processor 1.20GHz */
-static struct cpufreq_frequency_table op_1200[] =
+/* Low Voltage Intel Pentium M processor 1.20GHz (Banias) */
+static struct cpufreq_frequency_table banias_1200[] =
 {
 	OP( 600,  956),
 	OP( 800, 1004),
@@ -107,8 +140,8 @@
 	{ .frequency = CPUFREQ_TABLE_END }
 };
 
-/* Intel Pentium M processor 1.30GHz */
-static struct cpufreq_frequency_table op_1300[] = 
+/* Intel Pentium M processor 1.30GHz (Banias) */
+static struct cpufreq_frequency_table banias_1300[] =
 {
 	OP( 600,  956),
 	OP( 800, 1260),
@@ -118,8 +151,8 @@
 	{ .frequency = CPUFREQ_TABLE_END }
 };
 
-/* Intel Pentium M processor 1.40GHz */
-static struct cpufreq_frequency_table op_1400[] = 
+/* Intel Pentium M processor 1.40GHz (Banias) */
+static struct cpufreq_frequency_table banias_1400[] =
 {
 	OP( 600,  956),
 	OP( 800, 1180),
@@ -129,8 +162,8 @@
 	{ .frequency = CPUFREQ_TABLE_END }
 };
 
-/* Intel Pentium M processor 1.50GHz */
-static struct cpufreq_frequency_table op_1500[] = 
+/* Intel Pentium M processor 1.50GHz (Banias) */
+static struct cpufreq_frequency_table banias_1500[] =
 {
 	OP( 600,  956),
 	OP( 800, 1116),
@@ -141,8 +174,8 @@
 	{ .frequency = CPUFREQ_TABLE_END }
 };
 
-/* Intel Pentium M processor 1.60GHz */
-static struct cpufreq_frequency_table op_1600[] = 
+/* Intel Pentium M processor 1.60GHz (Banias) */
+static struct cpufreq_frequency_table banias_1600[] =
 {
 	OP( 600,  956),
 	OP( 800, 1036),
@@ -153,8 +186,8 @@
 	{ .frequency = CPUFREQ_TABLE_END }
 };
 
-/* Intel Pentium M processor 1.70GHz */
-static struct cpufreq_frequency_table op_1700[] =
+/* Intel Pentium M processor 1.70GHz (Banias) */
+static struct cpufreq_frequency_table banias_1700[] =
 {
 	OP( 600,  956),
 	OP( 800, 1004),
@@ -166,65 +199,339 @@
 };
 #undef OP
 
-#define _CPU(max, name)	\
-	{ "Intel(R) Pentium(R) M processor " name "MHz", (max)*1000, op_##max }
-#define CPU(max)	_CPU(max, #max)
+#define _BANIAS(cpuid, max, name)	\
+{	.cpu_id		= cpuid,	\
+	.model_name	= "Intel(R) Pentium(R) M processor " name "MHz", \
+	.max_freq	= (max)*1000,	\
+	.op_points	= banias_##max,	\
+}
+#define BANIAS(max)	_BANIAS(&cpu_ids[CPU_BANIAS], max, #max)
 
 /* CPU models, their operating frequency range, and freq/voltage
    operating points */
-static const struct cpu_model models[] = 
+static struct cpu_model models[] =
 {
-       _CPU( 900, " 900"),
-	CPU(1000),
-	CPU(1100),
-	CPU(1200),
-	CPU(1300),
-	CPU(1400),
-	CPU(1500),
-	CPU(1600),
-	CPU(1700),
-	{ 0, }
-};
-#undef CPU
+	_BANIAS(&cpu_ids[CPU_BANIAS], 900, " 900"),
+	BANIAS(1000),
+	BANIAS(1100),
+	BANIAS(1200),
+	BANIAS(1300),
+	BANIAS(1400),
+	BANIAS(1500),
+	BANIAS(1600),
+	BANIAS(1700),
+
+	/* NULL model_name is a wildcard */
+	{ &cpu_ids[CPU_DOTHAN_A1], NULL, 0, NULL },
+	{ &cpu_ids[CPU_DOTHAN_A2], NULL, 0, NULL },
+	{ &cpu_ids[CPU_DOTHAN_B0], NULL, 0, NULL },
+
+	{ NULL, }
+};
+#undef _BANIAS
+#undef BANIAS
+
+static int centrino_cpu_init_table(struct cpufreq_policy *policy)
+{
+	struct cpuinfo_x86 *cpu = &cpu_data[policy->cpu];
+	struct cpu_model *model;
+
+	for(model = models; model->cpu_id != NULL; model++)
+		if (centrino_verify_cpu_id(cpu, model->cpu_id) &&
+		    (model->model_name == NULL ||
+		     strcmp(cpu->x86_model_id, model->model_name) == 0))
+			break;
+
+	if (model->cpu_id == NULL) {
+		/* No match at all */
+		printk(KERN_INFO PFX "no support for CPU model \"%s\": "
+		       "send /proc/cpuinfo to " MAINTAINER "\n",
+		       cpu->x86_model_id);
+		return -ENOENT;
+	}
 
-/* Extract clock in kHz from PERF_CTL value */
+	if (model->op_points == NULL) {
+		/* Matched a non-match */
+		printk(KERN_INFO PFX "no table support for CPU model \"%s\": \n",
+		       cpu->x86_model_id);
+		printk(KERN_INFO PFX "try compiling with CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled\n");
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
+#else
+static inline int centrino_cpu_init_table(struct cpufreq_policy *policy) { return -ENODEV; }
+#endif /* CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE */
+
+static int centrino_verify_cpu_id(const struct cpuinfo_x86 *c, const struct cpu_id *x)
+{
+	if ((c->x86 == x->x86) &&
+	    (c->x86_model == x->x86_model) &&
+	    (c->x86_mask == x->x86_mask))
+		return 1;
+	return 0;
+}
+
+/* To be called only after centrino_model is initialized */
 static unsigned extract_clock(unsigned msr)
 {
-	msr = (msr >> 8) & 0xff;
-	return msr * 100000;
+	int i;
+
+	/*
+	 * Extract clock in kHz from PERF_CTL value
+	 * for centrino, as some DSDTs are buggy.
+	 * Ideally, this can be done using the acpi_data structure.
+	 */
+	if (centrino_cpu) {
+		msr = (msr >> 8) & 0xff;
+		return msr * 100000;
+	}
+
+	if ((!centrino_model) || (!centrino_model->op_points))
+		return 0;
+
+	msr &= 0xffff;
+	for (i=0;centrino_model->op_points[i].frequency != CPUFREQ_TABLE_END; i++) {
+		if (msr == centrino_model->op_points[i].index)
+		return centrino_model->op_points[i].frequency;
+	}
+	return 0;
 }
 
 /* Return the current CPU frequency in kHz */
-static unsigned get_cur_freq(void)
+static unsigned int get_cur_freq(unsigned int cpu)
 {
 	unsigned l, h;
+	cpumask_t saved_mask;
+
+	saved_mask = current->cpus_allowed;
+	set_cpus_allowed(current, cpumask_of_cpu(cpu));
+	if (smp_processor_id() != cpu)
+		return 0;
 
 	rdmsr(MSR_IA32_PERF_STATUS, l, h);
+	set_cpus_allowed(current, saved_mask);
 	return extract_clock(l);
 }
 
+
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
+
+static struct acpi_processor_performance p;
+
+/*
+ * centrino_cpu_init_acpi - register with ACPI P-States library
+ *
+ * Register with the ACPI P-States library (part of drivers/acpi/processor.c)
+ * in order to determine correct frequency and voltage pairings by reading
+ * the _PSS of the ACPI DSDT or SSDT tables.
+ */
+static int centrino_cpu_init_acpi(struct cpufreq_policy *policy)
+{
+	union acpi_object		arg0 = {ACPI_TYPE_BUFFER};
+	u32				arg0_buf[3];
+	struct acpi_object_list		arg_list = {1, &arg0};
+	unsigned long			cur_freq;
+	int				result = 0, i;
+
+	/* _PDC settings */
+        arg0.buffer.length = 12;
+        arg0.buffer.pointer = (u8 *) arg0_buf;
+        arg0_buf[0] = ACPI_PDC_REVISION_ID;
+        arg0_buf[1] = 1;
+        arg0_buf[2] = ACPI_PDC_EST_CAPABILITY_SMP | ACPI_PDC_EST_CAPABILITY_MSR;
+
+	p.pdc = &arg_list;
+
+	/* register with ACPI core */
+        if (acpi_processor_register_performance(&p, policy->cpu))
+                return -EIO;
+
+	/* verify the acpi_data */
+	if (p.state_count <= 1) {
+                printk(KERN_DEBUG "No P-States\n");
+                result = -ENODEV;
+                goto err_unreg;
+	}
+
+	if ((p.control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
+	    (p.status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
+		printk(KERN_DEBUG "Invalid control/status registers\n");
+		result = -EIO;
+		goto err_unreg;
+	}
+
+	for (i=0; i<p.state_count; i++) {
+		if (p.states[i].control != p.states[i].status) {
+			printk(KERN_DEBUG "Different control and status values\n");
+			result = -EINVAL;
+			goto err_unreg;
+		}
+
+		if (!p.states[i].core_frequency) {
+			printk(KERN_DEBUG "Zero core frequency\n");
+			result = -EINVAL;
+			goto err_unreg;
+		}
+
+		if (p.states[i].core_frequency > p.states[0].core_frequency) {
+			printk(KERN_DEBUG "P%u has larger frequency than P0, skipping\n", i);
+			p.states[i].core_frequency = 0;
+			continue;
+		}
+	}
+
+	centrino_model = kmalloc(sizeof(struct cpu_model), GFP_KERNEL);
+	if (!centrino_model) {
+		result = -ENOMEM;
+		goto err_unreg;
+	}
+	memset(centrino_model, 0, sizeof(struct cpu_model));
+
+	centrino_model->model_name=NULL;
+	centrino_model->max_freq = p.states[0].core_frequency * 1000;
+	centrino_model->op_points =  kmalloc(sizeof(struct cpufreq_frequency_table) *
+					     (p.state_count + 1), GFP_KERNEL);
+        if (!centrino_model->op_points) {
+                result = -ENOMEM;
+                goto err_kfree;
+        }
+
+        for (i=0; i<p.state_count; i++) {
+		centrino_model->op_points[i].index = p.states[i].control;
+		centrino_model->op_points[i].frequency = p.states[i].core_frequency * 1000;
+	}
+	centrino_model->op_points[p.state_count].frequency = CPUFREQ_TABLE_END;
+
+	cur_freq = get_cur_freq(policy->cpu);
+
+	for (i=0; i<p.state_count; i++) {
+		if (extract_clock(centrino_model->op_points[i].index) !=
+		    (centrino_model->op_points[i].frequency)) {
+			printk(KERN_DEBUG "Invalid encoded frequency\n");
+			result = -EINVAL;
+			goto err_kfree_all;
+		}
+
+		if (cur_freq == centrino_model->op_points[i].frequency)
+			p.state = i;
+		if (!p.states[i].core_frequency)
+			centrino_model->op_points[i].frequency = CPUFREQ_ENTRY_INVALID;
+	}
+
+	return 0;
+
+ err_kfree_all:
+	kfree(centrino_model->op_points);
+ err_kfree:
+	kfree(centrino_model);
+ err_unreg:
+	acpi_processor_unregister_performance(&p, policy->cpu);
+	return (result);
+}
+#else
+static inline int centrino_cpu_init_acpi(struct cpufreq_policy *policy) { return -ENODEV; }
+#endif
+
 static int centrino_cpu_init(struct cpufreq_policy *policy)
 {
+	struct cpuinfo_x86 *cpu = &cpu_data[policy->cpu];
 	unsigned freq;
+	unsigned l, h;
+	int ret;
+	int i;
 
-	if (policy->cpu != 0 || centrino_model == NULL)
+	/* Only Intel makes Enhanced Speedstep-capable CPUs */
+	if (cpu->x86_vendor != X86_VENDOR_INTEL || !cpu_has(cpu, X86_FEATURE_EST))
 		return -ENODEV;
 
-	freq = get_cur_freq();
+	for (i = 0; i < N_IDS; i++)
+		if (centrino_verify_cpu_id(cpu, &cpu_ids[i]))
+			break;
+
+	if (i != N_IDS)
+		centrino_cpu = 1;
+
+	if (centrino_cpu_init_acpi(policy)) {
+		if (policy->cpu != 0)
+			return -ENODEV;
+
+		if (!centrino_cpu) {
+			printk(KERN_INFO PFX "found unsupported CPU with "
+			"Enhanced SpeedStep: send /proc/cpuinfo to "
+			MAINTAINER "\n");
+			return -ENODEV;
+		}
+
+		if (centrino_cpu_init_table(policy)) {
+			return -ENODEV;
+		}
+	}
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
+	freq = get_cur_freq(policy->cpu);
 
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = 10; /* 10uS transition latency */
+	policy->cpuinfo.transition_latency = 10000; /* 10uS transition latency */
 	policy->cur = freq;
 
 	dprintk(KERN_INFO PFX "centrino_cpu_init: policy=%d cur=%dkHz\n",
 		policy->policy, policy->cur);
-	
-	return cpufreq_frequency_table_cpuinfo(policy, centrino_model->op_points);
+
+	ret = cpufreq_frequency_table_cpuinfo(policy, centrino_model->op_points);
+	if (ret)
+		return (ret);
+
+	cpufreq_frequency_table_get_attr(centrino_model->op_points, policy->cpu);
+
+	return 0;
+}
+
+static int centrino_cpu_exit(struct cpufreq_policy *policy)
+{
+	if (!centrino_model)
+		return -ENODEV;
+
+	cpufreq_frequency_table_put_attr(policy->cpu);
+
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
+	if (!centrino_model->model_name) {
+		acpi_processor_unregister_performance(&p, policy->cpu);
+		kfree(centrino_model->op_points);
+		kfree(centrino_model);
+	}
+#endif
+
+	centrino_model = NULL;
+
+	return 0;
 }
 
 /**
  * centrino_verify - verifies a new CPUFreq policy
- * @freq: new policy
+ * @policy: new policy
  *
  * Limit must be within this model's frequency range at least one
  * border included.
@@ -237,6 +544,8 @@
 /**
  * centrino_setpolicy - set a new CPUFreq policy
  * @policy: new policy
+ * @target_freq: the target frequency
+ * @relation: how that frequency relates to achieved frequency (CPUFREQ_RELATION_L or CPUFREQ_RELATION_H)
  *
  * Sets a new CPUFreq policy.
  */
@@ -247,19 +556,35 @@
 	unsigned int    newstate = 0;
 	unsigned int	msr, oldmsr, h;
 	struct cpufreq_freqs	freqs;
+	cpumask_t		saved_mask;
+	int			retval;
 
 	if (centrino_model == NULL)
 		return -ENODEV;
 
+	/*
+	 * Support for SMP systems.
+	 * Make sure we are running on the CPU that wants to change frequency
+	 */
+	saved_mask = current->cpus_allowed;
+	set_cpus_allowed(current, cpumask_of_cpu(policy->cpu));
+	if (smp_processor_id() != policy->cpu) {
+		return(-EAGAIN);
+	}
+
 	if (cpufreq_frequency_table_target(policy, centrino_model->op_points, target_freq,
-					   relation, &newstate))
-		return -EINVAL;
+					   relation, &newstate)) {
+		retval = -EINVAL;
+		goto migrate_end;
+	}
 
 	msr = centrino_model->op_points[newstate].index;
 	rdmsr(MSR_IA32_PERF_CTL, oldmsr, h);
 
-	if (msr == (oldmsr & 0xffff))
-		return 0;
+	if (msr == (oldmsr & 0xffff)) {
+		retval = 0;
+		goto migrate_end;
+	}
 
 	/* Hm, old frequency can either be the last value we put in
 	   PERF_CTL, or whatever it is now. The trouble is that TM2
@@ -268,39 +593,50 @@
 	   tell us something happened, but it may leave the things on
 	   the notifier chain confused; we therefore stick to using
 	   the last programmed speed rather than the current speed for
-	   "old". 
+	   "old".
 
 	   TODO: work out how the TCC interrupts work, and try to
 	   catch the CPU changing things under us.
 	*/
-	freqs.cpu = 0;
+	freqs.cpu = policy->cpu;
 	freqs.old = extract_clock(oldmsr);
 	freqs.new = extract_clock(msr);
-	
+
 	dprintk(KERN_INFO PFX "target=%dkHz old=%d new=%d msr=%04x\n",
 		target_freq, freqs.old, freqs.new, msr);
 
-	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);	
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
 	/* all but 16 LSB are "reserved", so treat them with
 	   care */
 	oldmsr &= ~0xffff;
 	msr &= 0xffff;
 	oldmsr |= msr;
-	
+
 	wrmsr(MSR_IA32_PERF_CTL, oldmsr, h);
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
-	return 0;
+	retval = 0;
+migrate_end:
+	set_cpus_allowed(current, saved_mask);
+	return (retval);
 }
 
+static struct freq_attr* centrino_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
 static struct cpufreq_driver centrino_driver = {
-	.name		= "centrino", /* should be speedstep-centrino, 
+	.name		= "centrino", /* should be speedstep-centrino,
 					 but there's a 16 char limit */
 	.init		= centrino_cpu_init,
-	.verify 	= centrino_verify,
-	.target 	= centrino_target,
+	.exit		= centrino_cpu_exit,
+	.verify		= centrino_verify,
+	.target		= centrino_target,
+	.get		= get_cur_freq,
+	.attr           = centrino_attr,
 	.owner		= THIS_MODULE,
 };
 
@@ -322,55 +658,10 @@
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
 
@@ -383,5 +674,5 @@
 MODULE_DESCRIPTION ("Enhanced SpeedStep driver for Intel Pentium M processors.");
 MODULE_LICENSE ("GPL");
 
-module_init(centrino_init);
+late_initcall(centrino_init);
 module_exit(centrino_exit);

Index: speedstep-ich.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-ich.c,v
retrieving revision 1.7
retrieving revision 1.8
diff -u -r1.7 -r1.8
--- speedstep-ich.c	5 Nov 2003 18:27:43 -0000	1.7
+++ speedstep-ich.c	26 Aug 2004 13:25:19 -0000	1.8
@@ -7,7 +7,7 @@
  *  for chipsets ICH2-M and ICH3-M.
  *
  *  Many thanks to Ducrot Bruno for finding and fixing the last
- *  "missing link" for ICH2-M/ICH3-M support, and to Thomas Winkler 
+ *  "missing link" for ICH2-M/ICH3-M support, and to Thomas Winkler
  *  for extensive testing.
  *
  *  BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*
@@ -19,7 +19,7 @@
  *********************************************************************/
 
 #include <linux/kernel.h>
-#include <linux/module.h> 
+#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/cpufreq.h>
 #include <linux/pci.h>
@@ -29,24 +29,24 @@
 
 
 /* speedstep_chipset:
- *   It is necessary to know which chipset is used. As accesses to 
- * this device occur at various places in this module, we need a 
+ *   It is necessary to know which chipset is used. As accesses to
+ * this device occur at various places in this module, we need a
  * static struct pci_dev * pointing to that device.
  */
-static struct pci_dev			*speedstep_chipset_dev;
+static struct pci_dev *speedstep_chipset_dev;
 
 
 /* speedstep_processor
  */
-static unsigned int			speedstep_processor = 0;
+static unsigned int speedstep_processor = 0;
 
 
-/* 
+/*
  *   There are only two frequency states for each processor. Values
  * are in kHz for the time being.
  */
 static struct cpufreq_frequency_table speedstep_freqs[] = {
-	{SPEEDSTEP_HIGH, 	0},
+	{SPEEDSTEP_HIGH,	0},
 	{SPEEDSTEP_LOW,		0},
 	{0,			CPUFREQ_TABLE_END},
 };
@@ -68,30 +68,21 @@
  * speedstep_set_state - set the SpeedStep state
  * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
  *
- *   Tries to change the SpeedStep state. 
+ *   Tries to change the SpeedStep state.
  */
-static void speedstep_set_state (unsigned int state, unsigned int notify)
+static void speedstep_set_state (unsigned int state)
 {
-	u32			pmbase;
-	u8			pm2_blk;
-	u8			value;
-	unsigned long		flags;
-	struct cpufreq_freqs	freqs;
+	u32 pmbase;
+	u8 pm2_blk;
+	u8 value;
+	unsigned long flags;
 
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
-	if (!(pmbase & 0x01))
-	{
+	if (!(pmbase & 0x01)) {
 		printk(KERN_ERR "cpufreq: could not find speedstep register\n");
 		return;
 	}
@@ -142,9 +133,6 @@
 		printk (KERN_ERR "cpufreq: change failed - I/O error\n");
 	}
 
-	if (notify)
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-
 	return;
 }
 
@@ -157,18 +145,16 @@
  */
 static int speedstep_activate (void)
 {
-	u16		value = 0;
+	u16 value = 0;
 
 	if (!speedstep_chipset_dev)
 		return -EINVAL;
 
-	pci_read_config_word(speedstep_chipset_dev, 
-			     0x00A0, &value);
+	pci_read_config_word(speedstep_chipset_dev, 0x00A0, &value);
 	if (!(value & 0x08)) {
 		value |= 0x08;
 		dprintk(KERN_DEBUG "cpufreq: activating SpeedStep (TM) registers\n");
-		pci_write_config_word(speedstep_chipset_dev, 
-				      0x00A0, value);
+		pci_write_config_word(speedstep_chipset_dev, 0x00A0, value);
 	}
 
 	return 0;
@@ -178,15 +164,15 @@
 /**
  * speedstep_detect_chipset - detect the Southbridge which contains SpeedStep logic
  *
- *   Detects PIIX4, ICH2-M and ICH3-M so far. The pci_dev points to 
- * the LPC bridge / PM module which contains all power-management 
+ *   Detects ICH2-M, ICH3-M and ICH4-M so far. The pci_dev points to
+ * the LPC bridge / PM module which contains all power-management
  * functions. Returns the SPEEDSTEP_CHIPSET_-number for the detected
  * chipset, or zero on failure.
  */
 static unsigned int speedstep_detect_chipset (void)
 {
 	speedstep_chipset_dev = pci_find_subsys(PCI_VENDOR_ID_INTEL,
-			      PCI_DEVICE_ID_INTEL_82801DB_12, 
+			      PCI_DEVICE_ID_INTEL_82801DB_12,
 			      PCI_ANY_ID,
 			      PCI_ANY_ID,
 			      NULL);
@@ -194,7 +180,7 @@
 		return 4; /* 4-M */
 
 	speedstep_chipset_dev = pci_find_subsys(PCI_VENDOR_ID_INTEL,
-			      PCI_DEVICE_ID_INTEL_82801CA_12, 
+			      PCI_DEVICE_ID_INTEL_82801CA_12,
 			      PCI_ANY_ID,
 			      PCI_ANY_ID,
 			      NULL);
@@ -209,11 +195,11 @@
 			      NULL);
 	if (speedstep_chipset_dev) {
 		/* speedstep.c causes lockups on Dell Inspirons 8000 and
-		 * 8100 which use a pretty old revision of the 82815 
+		 * 8100 which use a pretty old revision of the 82815
 		 * host brige. Abort on these systems.
 		 */
-		static struct pci_dev	*hostbridge;
-		u8			rev = 0;
+		static struct pci_dev *hostbridge;
+		u8 rev = 0;
 
 		hostbridge  = pci_find_subsys(PCI_VENDOR_ID_INTEL,
 			      PCI_DEVICE_ID_INTEL_82815_MC,
@@ -223,7 +209,7 @@
 
 		if (!hostbridge)
 			return 2; /* 2-M */
-			
+
 		pci_read_config_byte(hostbridge, PCI_REVISION_ID, &rev);
 		if (rev < 5) {
 			dprintk(KERN_INFO "cpufreq: hostbridge does not support speedstep\n");
@@ -237,10 +223,29 @@
 	return 0;
 }
 
+static unsigned int speedstep_get(unsigned int cpu)
+{
+	unsigned int speed;
+	cpumask_t cpus_allowed,affected_cpu_map;
+
+	/* only run on CPU to be set, or on its sibling */
+	cpus_allowed = current->cpus_allowed;
+#ifdef CONFIG_SMP
+	affected_cpu_map = cpu_sibling_map[cpu];
+#else
+	affected_cpu_map = cpumask_of_cpu(cpu);
+#endif
+	set_cpus_allowed(current, affected_cpu_map);
+	speed=speedstep_get_processor_frequency(speedstep_processor);
+	set_cpus_allowed(current, cpus_allowed);
+	return speed;
+}
 
 /**
- * speedstep_setpolicy - set a new CPUFreq policy
+ * speedstep_target - set a new CPUFreq policy
  * @policy: new policy
+ * @target_freq: the target frequency
+ * @relation: how that frequency relates to achieved frequency (CPUFREQ_RELATION_L or CPUFREQ_RELATION_H)
  *
  * Sets a new CPUFreq policy.
  */
@@ -248,12 +253,48 @@
 			     unsigned int target_freq,
 			     unsigned int relation)
 {
-	unsigned int	newstate = 0;
+	unsigned int newstate = 0;
+	struct cpufreq_freqs freqs;
+	cpumask_t cpus_allowed, affected_cpu_map;
+	int i;
 
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
-	speedstep_set_state(newstate, 1);
+	freqs.old = speedstep_get(policy->cpu);
+	freqs.new = speedstep_freqs[newstate].frequency;
+	freqs.cpu = policy->cpu;
+
+	/* no transition necessary */
+	if (freqs.old == freqs.new)
+		return 0;
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
@@ -261,7 +302,7 @@
 
 /**
  * speedstep_verify - verifies a new CPUFreq policy
- * @freq: new policy
+ * @policy: new policy
  *
  * Limit must be within speedstep_low_freq and speedstep_high_freq, with
  * at least one border included.
@@ -274,27 +315,39 @@
 
 static int speedstep_cpu_init(struct cpufreq_policy *policy)
 {
-	int		result = 0;
-	unsigned int	speed;
+	int result = 0;
+	unsigned int speed;
+	cpumask_t cpus_allowed,affected_cpu_map;
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
+	set_cpus_allowed(current, cpus_allowed);
 	if (result)
 		return result;
 
 	/* get current speed setting */
-	speed = speedstep_get_processor_frequency(speedstep_processor);
+	speed = speedstep_get(policy->cpu);
 	if (!speed)
 		return -EIO;
 
-	dprintk(KERN_INFO "cpufreq: currently at %s speed setting - %i MHz\n", 
+	dprintk(KERN_INFO "cpufreq: currently at %s speed setting - %i MHz\n",
 		(speed == speedstep_freqs[SPEEDSTEP_LOW].frequency) ? "low" : "high",
 		(speed / 1000));
 
@@ -303,16 +356,37 @@
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
+static struct freq_attr* speedstep_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
+
 static struct cpufreq_driver speedstep_driver = {
-	.name		= "speedstep-ich",
-	.verify 	= speedstep_verify,
-	.target 	= speedstep_target,
-	.init		= speedstep_cpu_init,
-	.owner		= THIS_MODULE,
+	.name	= "speedstep-ich",
+	.verify	= speedstep_verify,
+	.target	= speedstep_target,
+	.init	= speedstep_cpu_init,
+	.exit	= speedstep_cpu_exit,
+	.get	= speedstep_get,
+	.owner	= THIS_MODULE,
+	.attr	= speedstep_attr,
 };
 
 

Index: speedstep-lib.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -r1.3 -r1.4
--- speedstep-lib.c	20 Jan 2004 17:03:31 -0000	1.3
+++ speedstep-lib.c	26 Aug 2004 13:25:19 -0000	1.4
@@ -10,6 +10,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h> 
+#include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/cpufreq.h>
 #include <linux/pci.h>
@@ -30,6 +31,12 @@
 #define dprintk(msg...) do { } while(0)
 #endif
 
+#ifdef CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
+static int relaxed_check = 0;
+#else
+#define relaxed_check 0
+#endif
+
 /*********************************************************************
  *                   GET PROCESSOR CORE SPEED IN KHZ                 *
  *********************************************************************/
@@ -120,7 +127,7 @@
 	msr_tmp = (msr_lo >> 22) & 0x1f;
 	dprintk(KERN_DEBUG "speedstep-lib: bits 22-26 are 0x%x\n", msr_tmp);
 
-	return (msr_tmp * 100 * 10000);
+	return (msr_tmp * 100 * 1000);
 }
 
 
@@ -207,17 +214,54 @@
 		if (c->x86_model != 2)
 			return 0;
 
-		if ((c->x86_mask != 4) && /* B-stepping [M-P4-M] */
-			(c->x86_mask != 7) && /* C-stepping [M-P4-M] */
-			(c->x86_mask != 9))   /* D-stepping [M-P4-M or M-P4/533] */
-			return 0;
-
 		ebx = cpuid_ebx(0x00000001);
 		ebx &= 0x000000FF;
-		if ((ebx != 0x0e) && (ebx != 0x0f))
-			return 0;
 
-		return SPEEDSTEP_PROCESSOR_P4M;
+		dprintk(KERN_INFO "ebx value is %x, x86_mask is %x\n", ebx, c->x86_mask);
+
+		switch (c->x86_mask) {
+		case 4: 
+			/*
+			 * B-stepping [M-P4-M] 
+			 * sample has ebx = 0x0f, production has 0x0e.
+			 */
+			if ((ebx == 0x0e) || (ebx == 0x0f))
+				return SPEEDSTEP_PROCESSOR_P4M;
+			break;
+		case 7: 
+			/*
+			 * C-stepping [M-P4-M]
+			 * needs to have ebx=0x0e, else it's a celeron:
+			 * cf. 25130917.pdf / page 7, footnote 5 even
+			 * though 25072120.pdf / page 7 doesn't say
+			 * samples are only of B-stepping...
+			 */
+			if (ebx == 0x0e)
+				return SPEEDSTEP_PROCESSOR_P4M;
+			break;
+		case 9:
+			/*
+			 * D-stepping [M-P4-M or M-P4/533]
+			 *
+			 * this is totally strange: CPUID 0x0F29 is
+			 * used by M-P4-M, M-P4/533 and(!) Celeron CPUs.
+			 * The latter need to be sorted out as they don't
+			 * support speedstep.
+			 * Celerons with CPUID 0x0F29 may have either
+			 * ebx=0x8 or 0xf -- 25130917.pdf doesn't say anything
+			 * specific.
+			 * M-P4-Ms may have either ebx=0xe or 0xf [see above]
+			 * M-P4/533 have either ebx=0xe or 0xf. [25317607.pdf]
+			 * also, M-P4M HTs have ebx=0x8, too
+			 * For now, they are distinguished by the model_id string
+			 */
+		        if ((ebx == 0x0e) || (strstr(c->x86_model_id,"Mobile Intel(R) Pentium(R) 4") != NULL)) 
+				return SPEEDSTEP_PROCESSOR_P4M;
+			break;
+		default:
+			break;
+		}
+		return 0;
 	}
 
 	switch (c->x86_model) {
@@ -227,6 +271,7 @@
 		ebx = cpuid_ebx(0x00000001);
 
 		ebx &= 0x000000FF;
+
 		if (ebx != 0x06)
 			return 0;
 
@@ -254,7 +299,7 @@
 		 */
 		rdmsr(MSR_IA32_PLATFORM_ID, msr_lo, msr_hi);
 		dprintk(KERN_DEBUG "cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x%x, 0x%x\n", msr_lo, msr_hi);
-		if ((msr_hi & (1<<18)) && (msr_hi & (3<<24))) {
+		if ((msr_hi & (1<<18)) && (relaxed_check ? 1 : (msr_hi & (3<<24)))) {
 			if (c->x86_mask == 0x01)
 				return SPEEDSTEP_PROCESSOR_PIII_C_EARLY;
 			else
@@ -275,9 +320,7 @@
 unsigned int speedstep_get_freqs(unsigned int processor,
 				  unsigned int *low_speed,
 				  unsigned int *high_speed,
-				  void (*set_state) (unsigned int state,
-						     unsigned int notify)
-				 )
+				  void (*set_state) (unsigned int state))
 {
 	unsigned int prev_speed;
 	unsigned int ret = 0;
@@ -294,7 +337,7 @@
 	local_irq_save(flags);
 
 	/* switch to low state */
-	set_state(SPEEDSTEP_LOW, 0);
+	set_state(SPEEDSTEP_LOW);
 	*low_speed = speedstep_get_processor_frequency(processor);
 	if (!*low_speed) {
 		ret = -EIO;
@@ -302,7 +345,7 @@
 	}
 
 	/* switch to high state */
-	set_state(SPEEDSTEP_HIGH, 0);
+	set_state(SPEEDSTEP_HIGH);
 	*high_speed = speedstep_get_processor_frequency(processor);
 	if (!*high_speed) {
 		ret = -EIO;
@@ -316,13 +359,18 @@
 
 	/* switch to previous state, if necessary */
 	if (*high_speed != prev_speed)
-		set_state(SPEEDSTEP_LOW, 0);
+		set_state(SPEEDSTEP_LOW);
 
  out:
 	local_irq_restore(flags);
 	return (ret);
 }
 EXPORT_SYMBOL_GPL(speedstep_get_freqs);
+
+#ifdef CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
+module_param(relaxed_check, int, 0444);
+MODULE_PARM_DESC(relaxed_check, "Don't do all checks for speedstep capability.");
+#endif
 
 MODULE_AUTHOR ("Dominik Brodowski <linux@brodo.de>");
 MODULE_DESCRIPTION ("Library for Intel SpeedStep 1 or 2 cpufreq drivers.");

Index: speedstep-lib.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.h,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- speedstep-lib.h	20 Jan 2004 17:03:31 -0000	1.2
+++ speedstep-lib.h	26 Aug 2004 13:25:19 -0000	1.3
@@ -44,4 +44,4 @@
 extern unsigned int speedstep_get_freqs(unsigned int processor,
 	  unsigned int *low_speed,
 	  unsigned int *high_speed,
-	  void (*set_state) (unsigned int state, unsigned int notify));
+	  void (*set_state) (unsigned int state));

Index: speedstep-smi.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-smi.c,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- speedstep-smi.c	20 Jan 2004 17:03:31 -0000	1.4
+++ speedstep-smi.c	26 Aug 2004 13:25:19 -0000	1.5
@@ -36,6 +36,8 @@
 static int		smi_cmd		= 0;
 static unsigned int	smi_sig		= 0;
 
+/* info about the processor */
+static unsigned int	speedstep_processor = 0;
 
 /* 
  *   There are only two frequency states for each processor. Values
@@ -90,10 +92,12 @@
 
 /**
  * speedstep_smi_get_freqs - get SpeedStep preferred & current freq.
+ * @low: the low frequency value is placed here
+ * @high: the high frequency value is placed here
+ *
  * Only available on later SpeedStep-enabled systems, returns false results or
  * even hangs [cf. bugme.osdl.org # 1422] on earlier systems. Empirical testing
  * shows that the latter occurs if !(ist_info.event & 0xFFFF).
- *
  */
 static int speedstep_smi_get_freqs (unsigned int *low, unsigned int *high)
 {
@@ -111,6 +115,11 @@
 		: "=a" (result), "=b" (high_mhz), "=c" (low_mhz), "=d" (state), "=D" (edi)
 		: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
 	);
+
+	/* abort if results are obviously incorrect... */
+	if ((high_mhz + low_mhz) < 600)
+		return -EINVAL;
+
 	*high = high_mhz * 1000;
 	*low  = low_mhz  * 1000;
 
@@ -135,7 +144,7 @@
 		: "a" (command), "b" (function), "c" (0), "d" (smi_port), "S" (0)
 	);
 
-	return state;
+	return (state & 1);
 }
 
 /**
@@ -143,28 +152,16 @@
  * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
  *
  */
-static void speedstep_set_state (unsigned int state, unsigned int notify)
+static void speedstep_set_state (unsigned int state)
 {
-	unsigned int old_state, result = 0, command, new_state;
+	unsigned int result = 0, command, new_state;
 	unsigned long flags;
-	struct cpufreq_freqs freqs;
 	unsigned int function=SET_SPEEDSTEP_STATE;
 	unsigned int retry = 0;
 
 	if (state > 0x1)
 		return;
 
-	old_state = speedstep_get_state();
-	freqs.old = speedstep_freqs[old_state].frequency;
-	freqs.new = speedstep_freqs[state].frequency;
-	freqs.cpu = 0; /* speedstep.c is UP only driver */
-
-	if (old_state == state)
-		return;
-
-	if (notify)
-		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-
 	/* Disable IRQs */
 	local_irq_save(flags);
 
@@ -188,14 +185,11 @@
 	local_irq_restore(flags);
 
 	if (new_state == state) {
-		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded after %u tries with result %u\n", (freqs.new / 1000), retry, result);
+		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded after %u tries with result %u\n", (speedstep_freqs[new_state].frequency / 1000), retry, result);
 	} else {
 		printk(KERN_ERR "cpufreq: change failed with new_state %u and result %u\n", new_state, result);
 	}
 
-	if (notify)
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-
 	return;
 }
 
@@ -212,11 +206,21 @@
 			unsigned int target_freq, unsigned int relation)
 {
 	unsigned int newstate = 0;
+	struct cpufreq_freqs freqs;
 
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
-	speedstep_set_state(newstate, 1);
+	freqs.old = speedstep_freqs[speedstep_get_state()].frequency;
+	freqs.new = speedstep_freqs[newstate].frequency;
+	freqs.cpu = 0; /* speedstep.c is UP only driver */
+
+	if (freqs.old == freqs.new)
+		return 0;
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	speedstep_set_state(newstate);
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
 	return 0;
 }
@@ -224,7 +228,7 @@
 
 /**
  * speedstep_verify - verifies a new CPUFreq policy
- * @freq: new policy
+ * @policy: new policy
  *
  * Limit must be within speedstep_low_freq and speedstep_high_freq, with
  * at least one border included.
@@ -255,10 +259,11 @@
 				&speedstep_freqs[SPEEDSTEP_HIGH].frequency);
 	if (result) {
 		/* fall back to speedstep_lib.c dection mechanism: try both states out */
-		unsigned int speedstep_processor = speedstep_detect_processor();
-
 		dprintk(KERN_INFO PFX "could not detect low and high frequencies by SMI call.\n");
 		if (!speedstep_processor)
+			speedstep_processor = speedstep_detect_processor();
+
+		if (!speedstep_processor)
 			return -ENODEV;
 
 		result = speedstep_get_freqs(speedstep_processor,
@@ -286,7 +291,30 @@
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
+static int speedstep_cpu_exit(struct cpufreq_policy *policy)
+{
+	cpufreq_frequency_table_put_attr(policy->cpu);
+	return 0;
+}
+
+static unsigned int speedstep_get(unsigned int cpu)
+{
+	if (cpu)
+		return -ENODEV;
+	if (!speedstep_processor)
+		speedstep_processor = speedstep_detect_processor();
+	if (!speedstep_processor)
+		return 0;
+	return speedstep_get_processor_frequency(speedstep_processor);
 }
 
 
@@ -300,14 +328,21 @@
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
+	.get		= speedstep_get,
 	.resume		= speedstep_resume,
 	.owner		= THIS_MODULE,
+	.attr		= speedstep_attr,
 };
 
 /**
