From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH 4/8] speedstep-lib: support for 533 and 800 MHz FSB
Date: Wed, 19 Nov 2003 19:31:55 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031119183155.GE20576@brodo.de>
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
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

I don't know whether there's a P4-M with 533 or 800 MHz FSB out there yet,
but let's prepare the speedstep-lib for these FSBs anyways.

 arch/i386/kernel/cpu/cpufreq/speedstep-lib.c |   37 ++++++++++++++++++++++++---
 arch/i386/kernel/cpu/cpufreq/speedstep-lib.h |    2 -
 2 files changed, 35 insertions(+), 4 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2003-11-19 17:06:10.572868648 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2003-11-19 17:23:45.817447088 +0100
@@ -106,14 +106,45 @@
 
 static unsigned int pentium4_get_frequency(void)
 {
-	u32 msr_lo, msr_hi;
+	struct cpuinfo_x86 *c = &boot_cpu_data;
+	u32 msr_lo, msr_hi, mult;
+	unsigned int fsb = 0;
 
 	rdmsr(0x2c, msr_lo, msr_hi);
 
 	dprintk(KERN_DEBUG "speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, msr_hi);
 
-	msr_lo >>= 24;
-	return (msr_lo * 100000);
+	/* decode the FSB: see IA-32 Intel (C) Architecture Software 
+	 * Developer's Manual, Volume 3: System Prgramming Guide,
+	 * revision #12 in Table B-1: MSRs in the Pentium 4 and
+	 * Intel Xeon Processors, on page B-4 and B-5.
+	 */
+	if (c->x86_model < 2)
+		fsb = 100 * 1000;
+	else {
+		u8 fsb_code = (msr_lo >> 16) & 0x7;
+		switch (fsb_code) {
+		case 0:
+			fsb = 100 * 1000;
+			break;
+		case 1:
+			fsb = 13333 * 10;
+			break;
+		case 2:
+			fsb = 200 * 1000;
+			break;
+		}
+	}
+
+	if (!fsb)
+		printk(KERN_DEBUG "speedstep-lib: couldn't detect FSB speed. Please send an e-mail to <linux@brodo.de>\n");
+
+	/* Multiplier. */
+	mult = msr_lo >> 24;
+
+	dprintk(KERN_DEBUG "speedstep-lib: P4 - FSB %u kHz; Multiplier %u\n", fsb, mult);
+
+	return (fsb * mult);
 }
 
  
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2003-11-19 17:06:10.572868648 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2003-11-19 17:23:45.817447088 +0100
@@ -15,7 +15,7 @@
 #define SPEEDSTEP_PROCESSOR_PIII_C_EARLY	0x00000001  /* Coppermine core */
 #define SPEEDSTEP_PROCESSOR_PIII_C		0x00000002  /* Coppermine core */
 #define SPEEDSTEP_PROCESSOR_PIII_T 		0x00000003  /* Tualatin core */
-#define SPEEDSTEP_PROCESSOR_P4M			0x00000004  /* P4-M with 100 MHz FSB */
+#define SPEEDSTEP_PROCESSOR_P4M			0x00000004  /* P4-M  */
 
 /* speedstep states -- only two of them */
