From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH 5/8] p4_clockmod: detect speed without relying on cpu_khz or
	user input
Date: Wed, 19 Nov 2003 19:32:28 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031119183228.GF20576@brodo.de>
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

Other cpufreq drivers don't rely on cpu_khz, but use the "decoded"/theoretical CPU frequency
as base for all calculations.

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   66 +++++++++++++++++++++++------
 1 files changed, 53 insertions(+), 13 deletions(-)


diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-11-19 17:06:10.569869104 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-11-19 18:18:53.114661488 +0100
@@ -48,8 +48,7 @@
 
 
 static int has_N44_O17_errata[NR_CPUS];
-static int stock_freq;
-
+unsigned int stock_freq;
 
 static int cpufreq_p4_setdc(unsigned int cpu, unsigned int newstate)
 {
@@ -175,6 +174,54 @@
 	return cpufreq_frequency_table_verify(policy, &p4clockmod_table[0]);
 }
 
+/* copied from speedstep_lib, made SMP-compatible */
+static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
+{
+	u32 msr_lo, msr_hi, mult;
+	unsigned int fsb = 0;
+
+	if (c->x86 != 0xF) {
+		printk(KERN_DEBUG PFX "Unknown P4. Please send an e-mail to <linux@brodo.de>\n");
+		return 0;
+	}
+
+	rdmsr(0x2c, msr_lo, msr_hi);
+
+	/* printk(KERN_DEBUG PFX "P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, msr_hi); */
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
+	if (!fsb) {
+		printk(KERN_DEBUG PFX "couldn't detect FSB speed. Please send an e-mail to <linux@brodo.de>\n");
+		printk(KERN_DEBUG PFX "P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, msr_hi);
+	}
+
+	/* Multiplier. */
+	mult = msr_lo >> 24;
+
+	return (fsb * mult);
+}
+
+ 
 
 static int cpufreq_p4_cpu_init(struct cpufreq_policy *policy)
 {
@@ -192,15 +239,10 @@
 		has_N44_O17_errata[policy->cpu] = 1;
 	}
 	
-	/* get frequency */
-	if (!stock_freq) {
-		if (cpu_khz)
-			stock_freq = cpu_khz;
-		else {
-			printk(KERN_INFO PFX "unknown core frequency - please use module parameter 'stock_freq'\n");
-			return -EINVAL;
-		}
-	}
+	/* get max frequency */
+	stock_freq = cpufreq_p4_get_frequency(c);
+	if (!stock_freq)
+		return -EINVAL;
 
 	/* table init */
 	for (i=1; (p4clockmod_table[i].frequency != CPUFREQ_TABLE_END); i++) {
@@ -269,8 +311,6 @@
 }
 
 
-MODULE_PARM(stock_freq, "i");
-
 MODULE_AUTHOR ("Zwane Mwaikambo <zwane@commfireservices.com>");
 MODULE_DESCRIPTION ("cpufreq driver for Pentium(TM) 4/Xeon(TM)");
 MODULE_LICENSE ("GPL");
