From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH v2] p4-clockmod: add more CPUs
Date: Sun, 5 Nov 2006 23:08:33 -0500
Message-ID: <20061106040833.GA8390@dominikbrodowski.de>
References: <20061031174408.GA8838@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061031174408.GA8838@dominikbrodowski.de>
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
To: davej@redhat.com, cpufreq@lists.linux.org.uk

Several more Intel CPUs are now capable using the p4-clockmod cpufreq
driver. As it is of limited use most of the time, print a big bold warning
if a better cpufreq driver might be available.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

diff --git a/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c b/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
index 304d2ea..bec5017 100644
--- a/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
+++ b/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
@@ -163,29 +163,27 @@ static int cpufreq_p4_verify(struct cpuf
 
 static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
 {
-	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
-		/* Pentium M (Banias) */
-		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
-		       "The speedstep_centrino module offers voltage scaling"
-		       " in addition of frequency scaling. You should use "
-		       "that instead of p4-clockmod, if possible.\n");
-		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
-	}
-
-	if ((c->x86 == 0x06) && (c->x86_model == 0x0D)) {
-		/* Pentium M (Dothan) */
-		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
-		       "The speedstep_centrino module offers voltage scaling"
-		       " in addition of frequency scaling. You should use "
-		       "that instead of p4-clockmod, if possible.\n");
-		/* on P-4s, the TSC runs with constant frequency independent whether
-		 * throttling is active or not. */
-		p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
-		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
+	if (c->x86 == 0x06) {
+		if (cpu_has(c, X86_FEATURE_EST))
+			printk(KERN_WARNING PFX "Warning: EST-capable CPU detected. "
+			       "The acpi-cpufreq module offers voltage scaling"
+			       " in addition of frequency scaling. You should use "
+			       "that instead of p4-clockmod, if possible.\n");
+		switch (c->x86_model) {
+		case 0x0E: /* Core */
+		case 0x0F: /* Core Duo */
+			p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
+			return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PCORE);
+		case 0x0D: /* Pentium M (Dothan) */
+			p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
+			/* fall through */
+		case 0x09: /* Pentium M (Banias) */
+			return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
+		}
 	}
 
 	if (c->x86 != 0xF) {
-		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
+		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <cpufreq@lists.linux.org.uk>\n");
 		return 0;
 	}
 
diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
index 4f46cac..d59277c 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
@@ -123,6 +123,36 @@ static unsigned int pentiumM_get_frequen
 	return (msr_tmp * 100 * 1000);
 }
 
+static unsigned int pentium_core_get_frequency(void)
+{
+	u32 fsb = 0;
+	u32 msr_lo, msr_tmp;
+
+	rdmsr(MSR_FSB_FREQ, msr_lo, msr_tmp);
+	/* see table B-2 of 25366920.pdf */
+	switch (msr_lo & 0x07) {
+	case 5:
+		fsb = 100000;
+		break;
+	case 1:
+		fsb = 133333;
+		break;
+	case 3:
+		fsb = 166667;
+		break;
+	default:
+		printk(KERN_ERR "PCORE - MSR_FSB_FREQ undefined value");
+	}
+
+	rdmsr(MSR_IA32_EBL_CR_POWERON, msr_lo, msr_tmp);
+	dprintk("PCORE - MSR_IA32_EBL_CR_POWERON: 0x%x 0x%x\n", msr_lo, msr_tmp);
+
+	msr_tmp = (msr_lo >> 22) & 0x1f;
+	dprintk("bits 22-26 are 0x%x, speed is %u\n", msr_tmp, (msr_tmp * fsb));
+
+	return (msr_tmp * fsb);
+}
+
 
 static unsigned int pentium4_get_frequency(void)
 {
@@ -174,6 +204,8 @@ static unsigned int pentium4_get_frequen
 unsigned int speedstep_get_processor_frequency(unsigned int processor)
 {
 	switch (processor) {
+	case SPEEDSTEP_PROCESSOR_PCORE:
+		return pentium_core_get_frequency();
 	case SPEEDSTEP_PROCESSOR_PM:
 		return pentiumM_get_frequency();
 	case SPEEDSTEP_PROCESSOR_P4D:
diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
index b735429..b11bcc6 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
@@ -22,6 +22,7 @@
  * the speedstep_get_processor_frequency() call. */
 #define SPEEDSTEP_PROCESSOR_PM			0xFFFFFF03  /* Pentium M  */
 #define SPEEDSTEP_PROCESSOR_P4D			0xFFFFFF04  /* desktop P4  */
+#define SPEEDSTEP_PROCESSOR_PCORE		0xFFFFFF05  /* Core */
 
 /* speedstep states -- only two of them */
 
diff --git a/include/asm-i386/msr.h b/include/asm-i386/msr.h
index 62b76cd..e2e98d6 100644
--- a/include/asm-i386/msr.h
+++ b/include/asm-i386/msr.h
@@ -95,6 +95,8 @@ static inline void wrmsrl (unsigned long
 
 #define MSR_P6_PERFCTR0		0xc1
 #define MSR_P6_PERFCTR1		0xc2
+#define MSR_FSB_FREQ		0xcd
+
 
 #define MSR_IA32_BBL_CR_CTL		0x119
