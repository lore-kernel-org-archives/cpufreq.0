From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq longrun.c,1.1.1.1,1.1.1.2
Date: Tue, 31 Aug 2004 10:37:47 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C255H-00025g-8X@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv8033

Modified Files:
      Tag: LINUX_2_4
	longrun.c 
Log Message:
backport from 2.6, especially fix a bug for a degenerated case from Dominik


Index: longrun.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longrun.c,v
retrieving revision 1.1.1.1
retrieving revision 1.1.1.2
diff -u -r1.1.1.1 -r1.1.1.2
--- longrun.c	25 Aug 2003 14:58:47 -0000	1.1.1.1
+++ longrun.c	31 Aug 2004 09:37:44 -0000	1.1.1.2
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
@@ -116,11 +127,12 @@
 		return -EINVAL;
 
 	policy->cpu = 0;
-	cpufreq_verify_within_limits(policy, 
-		policy->cpuinfo.min_freq, 
+	cpufreq_verify_within_limits(policy,
+		policy->cpuinfo.min_freq,
 		policy->cpuinfo.max_freq);
 
-	if (policy->policy == CPUFREQ_POLICY_GOVERNOR)
+	if ((policy->policy != CPUFREQ_POLICY_POWERSAVE) &&
+	    (policy->policy != CPUFREQ_POLICY_PERFORMANCE))
 		return -EINVAL;
 
 	return 0;
@@ -129,18 +141,21 @@
 
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
@@ -148,9 +163,9 @@
 
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
@@ -183,19 +198,21 @@
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
@@ -209,7 +226,7 @@
 	if ((ecx > 95) || (ecx == 0) || (eax < ebx))
 		return -EIO;
 
-	edx = (eax - ebx) / (100 - ecx); 
+	edx = (eax - ebx) / (100 - ecx);
 	*low_freq = edx * 1000; /* back to kHz */
 
 	if (*low_freq > *high_freq)
@@ -219,9 +236,9 @@
 }
 
 
-static int longrun_cpu_init(struct cpufreq_policy *policy)
+static int __init longrun_cpu_init(struct cpufreq_policy *policy)
 {
-	int                     result = 0;
+	int result = 0;
 
 	/* capability check */
 	if (policy->cpu != 0)
@@ -237,7 +254,7 @@
 	policy->cpuinfo.max_freq = longrun_high_freq;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	longrun_get_policy(policy);
-	
+
 	return 0;
 }
 
@@ -259,7 +276,7 @@
 {
 	struct cpuinfo_x86 *c = cpu_data;
 
-	if (c->x86_vendor != X86_VENDOR_TRANSMETA || 
+	if (c->x86_vendor != X86_VENDOR_TRANSMETA ||
 	    !cpu_has(c, X86_FEATURE_LONGRUN))
 		return -ENODEV;
