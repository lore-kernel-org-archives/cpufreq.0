From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH] prepare speedstep-lib for 533 or 800 MHz FSB p4-m processors
Date: Tue, 4 Nov 2003 20:36:37 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031104193637.GA4474@brodo.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

[Note: this patch is probably too invasive for 2.6.0-testX.]

I don't know whether Intel has yet announced/produced/sold any Pentium 4-M
processors with 533 or 800 MHz FSB [quad-pumped 133 or 200 "real" MHz], but
let's get prepared for that eventuality in speedstep-lib :

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2003-11-04 15:27:33.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2003-11-04 20:18:22.763662832 +0100
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
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2003-11-04 15:27:33.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2003-11-04 20:19:01.658749880 +0100
@@ -15,7 +15,7 @@
 #define SPEEDSTEP_PROCESSOR_PIII_C_EARLY	0x00000001  /* Coppermine core */
 #define SPEEDSTEP_PROCESSOR_PIII_C		0x00000002  /* Coppermine core */
 #define SPEEDSTEP_PROCESSOR_PIII_T 		0x00000003  /* Tualatin core */
-#define SPEEDSTEP_PROCESSOR_P4M			0x00000004  /* P4-M with 100 MHz FSB */
+#define SPEEDSTEP_PROCESSOR_P4M			0x00000004  /* P4-M  */
 
 /* speedstep states -- only two of them */
