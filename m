From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix up CPU detection in p4-clockmod
Date: Sat, 10 Jan 2004 16:12:48 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040110151248.GA7989@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, akpm@osdl.org

Too many users use the p4-clockmod cpufreq driver instead of the more
advanced speedstep-centrino, speedstep-ich or even acpi drivers. All of the
latter (usually) provide voltage scaling, while the p4-clockmod driver only
offers a variant of frequency scaling. So, warn users if they try out this
driver instead.

Also, instead of using a local copy, use the speedstep_lib infrastructure
for detecting the processor speed. Adding the Pentium-M get_frequency
function to that module only costs about 200 bytes in object size.

 arch/i386/kernel/cpu/cpufreq/Kconfig         |   10 ++--
 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c   |   55 ++++++++-------------------
 arch/i386/kernel/cpu/cpufreq/speedstep-lib.c |   23 +++++++++++
 arch/i386/kernel/cpu/cpufreq/speedstep-lib.h |    6 ++
 4 files changed, 52 insertions(+), 42 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig linux/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-01-10 14:54:45.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-01-10 15:25:20.000000000 +0100
@@ -145,11 +145,6 @@
 
 	  If in doubt, say N.
 
-config X86_SPEEDSTEP_LIB
-	tristate
-	depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI)
-	default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI)
-
 config X86_P4_CLOCKMOD
 	tristate "Intel Pentium 4 clock modulation"
 	depends on CPU_FREQ_TABLE
@@ -161,6 +156,11 @@
 
 	  If in doubt, say N.
 
+config X86_SPEEDSTEP_LIB
+	tristate
+	depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD)
+	default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD)
+
 config X86_LONGRUN
 	tristate "Transmeta LongRun"
 	depends on CPU_FREQ
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-01-10 14:54:45.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-01-10 15:41:06.785375544 +0100
@@ -33,6 +33,8 @@
 #include <asm/msr.h>
 #include <asm/timex.h>
 
+#include "speedstep-lib.h"
+
 #define PFX	"cpufreq: "
 
 /*
@@ -174,51 +176,30 @@
 	return cpufreq_frequency_table_verify(policy, &p4clockmod_table[0]);
 }
 
-/* copied from speedstep_lib, made SMP-compatible */
+
 static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
 {
-	u32 msr_lo, msr_hi, mult;
-	unsigned int fsb = 0;
+	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
+		/* Pentium M */
+		printk(KERN_DEBUG PFX "Warning: Pentium M detected. The speedstep_centrino module\n");
+		printk(KERN_DEBUG PFX "offers voltage scaling in addition of frequency scaling. You\n");
+		printk(KERN_DEBUG PFX "should use that instead of p4-clockmod, if possible.\n");
+		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
+	}
 
 	if (c->x86 != 0xF) {
-		printk(KERN_DEBUG PFX "Unknown P4. Please send an e-mail to <linux@brodo.de>\n");
+		printk(KERN_DEBUG PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
 		return 0;
 	}
 
-	rdmsr(0x2c, msr_lo, msr_hi);
-
-	/* printk(KERN_DEBUG PFX "P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, msr_hi); */
-	/* decode the FSB: see IA-32 Intel (C) Architecture Software 
-	 * Developer's Manual, Volume 3: System Prgramming Guide,
-	 * revision #12 in Table B-1: MSRs in the Pentium 4 and
-	 * Intel Xeon Processors, on page B-4 and B-5.
-	 */
-	if (c->x86_model < 2)
-		fsb = 100 * 1000;
-	else {
-		u8 fsb_code = (msr_lo >> 16) & 0x7;
-		switch (fsb_code) {
-		case 0:
-			fsb = 100 * 1000;
-			break;
-		case 1:
-			fsb = 13333 * 10;
-			break;
-		case 2:
-			fsb = 200 * 1000;
-			break;
-		}
-	}
-
-	if (!fsb) {
-		printk(KERN_DEBUG PFX "couldn't detect FSB speed. Please send an e-mail to <linux@brodo.de>\n");
-		printk(KERN_DEBUG PFX "P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, msr_hi);
+	if (speedstep_detect_processor() == SPEEDSTEP_PROCESSOR_P4M) {
+		printk(KERN_DEBUG PFX "Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq \n");
+		printk(KERN_DEBUG PFX "modules offers voltage scaling in addition of frequency scaling. You\n");
+		printk(KERN_DEBUG PFX "should use either one instead of p4-clockmod, if possible.\n");
+		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_P4M);
 	}
 
-	/* Multiplier. */
-	mult = msr_lo >> 24;
-
-	return (fsb * mult);
+	return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_P4D);
 }
 
  
@@ -315,6 +296,6 @@
 MODULE_DESCRIPTION ("cpufreq driver for Pentium(TM) 4/Xeon(TM)");
 MODULE_LICENSE ("GPL");
 
-module_init(cpufreq_p4_init);
+late_initcall(cpufreq_p4_init);
 module_exit(cpufreq_p4_exit);
 
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-01-10 14:54:45.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-01-10 15:38:57.991955120 +0100
@@ -104,6 +104,26 @@
 }
 
 
+static unsigned int pentiumM_get_frequency(void)
+{
+	u32     msr_lo, msr_tmp;
+
+	rdmsr(MSR_IA32_EBL_CR_POWERON, msr_lo, msr_tmp);
+	dprintk(KERN_DEBUG "speedstep-lib: PM - MSR_IA32_EBL_CR_POWERON: 0x%x 0x%x\n", msr_lo, msr_tmp);
+
+	/* see table B-2 of 24547212.pdf */
+	if (msr_lo & 0x00040000) {
+		printk(KERN_DEBUG "speedstep-lib: PM - invalid FSB: 0x%x 0x%x\n", msr_lo, msr_tmp);
+		return 0;
+	}
+
+	msr_tmp = (msr_lo >> 22) & 0x1f;
+	dprintk(KERN_DEBUG "speedstep-lib: bits 22-26 are 0x%x\n", msr_tmp);
+
+	return (msr_tmp * 100 * 10000);
+}
+
+
 static unsigned int pentium4_get_frequency(void)
 {
 	struct cpuinfo_x86 *c = &boot_cpu_data;
@@ -151,6 +171,9 @@
 unsigned int speedstep_get_processor_frequency(unsigned int processor)
 {
 	switch (processor) {
+	case SPEEDSTEP_PROCESSOR_PM:
+		return pentiumM_get_frequency();
+	case SPEEDSTEP_PROCESSOR_P4D:
 	case SPEEDSTEP_PROCESSOR_P4M:
 		return pentium4_get_frequency();
 	case SPEEDSTEP_PROCESSOR_PIII_T:
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2004-01-10 14:54:45.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2004-01-10 15:26:23.000000000 +0100
@@ -17,6 +17,12 @@
 #define SPEEDSTEP_PROCESSOR_PIII_T 		0x00000003  /* Tualatin core */
 #define SPEEDSTEP_PROCESSOR_P4M			0x00000004  /* P4-M  */
 
+/* the following processors are not speedstep-capable and are not auto-detected
+ * in speedstep_detect_processor(). However, their speed can be detected using
+ * the speedstep_get_processor_frequency() call. */
+#define SPEEDSTEP_PROCESSOR_PM			0xFFFFFF03  /* Pentium M  */
+#define SPEEDSTEP_PROCESSOR_P4D			0xFFFFFF04  /* desktop P4  */
+
 /* speedstep states -- only two of them */
 
 #define SPEEDSTEP_HIGH                  0x00000000
