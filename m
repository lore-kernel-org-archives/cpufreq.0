From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.4,
	1.5 cpu-sa1110.c, 1.10, 1.11
Date: Wed, 05 Nov 2003 18:28:14 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AHSO6-0000Zc-U1@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100
In directory flint:/tmp/cvs-serv2114/linux/arch/arm/mach-sa1100

Modified Files:
	cpu-sa1100.c cpu-sa1110.c 
Log Message:
Merge with davej cpufreq bk tree.

Index: cpu-sa1100.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1100.c,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- cpu-sa1100.c	19 Aug 2003 13:38:31 -0000	1.4
+++ cpu-sa1100.c	5 Nov 2003 18:27:41 -0000	1.5
@@ -194,7 +194,7 @@
 		new_ppcr = sa11x0_freq_to_ppcr(target_freq);
 		if ((sa11x0_ppcr_to_freq(new_ppcr) > target_freq) &&
 		    (sa11x0_ppcr_to_freq(new_ppcr - 1) >= policy->min))
-			mew_ppcr--;
+			new_ppcr--;
 		break;
 	}
 
@@ -222,7 +222,7 @@
 	if (policy->cpu != 0)
 		return -EINVAL;
 	policy->cur = policy->min = policy->max = sa11x0_getspeed();
-	policy->policy = CPUFREQ_POLICY_POWERSAVE;
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = 59000;
 	policy->cpuinfo.max_freq = 287000;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;

Index: cpu-sa1110.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1110.c,v
retrieving revision 1.10
retrieving revision 1.11
diff -u -r1.10 -r1.11
--- cpu-sa1110.c	19 Aug 2003 13:38:32 -0000	1.10
+++ cpu-sa1110.c	5 Nov 2003 18:27:41 -0000	1.11
@@ -270,8 +270,12 @@
 	 * We wait 20ms to be safe.
 	 */
 	sdram_set_refresh(2);
+	if (!irqs_disabled()) {
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	schedule_timeout(20 * HZ / 1000);
+	} else {
+		mdelay(20);
+	}
 
 	/*
 	 * Reprogram the DRAM timings with interrupts disabled, and
@@ -282,19 +286,19 @@
 	local_irq_save(flags);
 	asm("mcr p15, 0, %0, c7, c10, 4" : : "r" (0));
 	udelay(10);
-	__asm__ __volatile__("
-		b	2f
-		.align	5
-1:		str	%3, [%1, #0]		@ MDCNFG
-		str	%4, [%1, #28]		@ MDREFR
-		str	%5, [%1, #4]		@ MDCAS0
-		str	%6, [%1, #8]		@ MDCAS1
-		str	%7, [%1, #12]		@ MDCAS2
-		str	%8, [%2, #0]		@ PPCR
-		ldr	%0, [%1, #0]
-		b	3f
-2:		b	1b
-3:		nop
+	__asm__ __volatile__("					\n\
+		b	2f					\n\
+		.align	5					\n\
+1:		str	%3, [%1, #0]		@ MDCNFG	\n\
+		str	%4, [%1, #28]		@ MDREFR	\n\
+		str	%5, [%1, #4]		@ MDCAS0	\n\
+		str	%6, [%1, #8]		@ MDCAS1	\n\
+		str	%7, [%1, #12]		@ MDCAS2	\n\
+		str	%8, [%2, #0]		@ PPCR		\n\
+		ldr	%0, [%1, #0]				\n\
+		b	3f					\n\
+2:		b	1b					\n\
+3:		nop						\n\
 		nop"
 		: "=&r" (unused)
 		: "r" (&MDCNFG), "r" (&PPCR), "0" (sd.mdcnfg),
@@ -317,7 +321,7 @@
 	if (policy->cpu != 0)
 		return -EINVAL;
 	policy->cur = policy->min = policy->max = sa11x0_getspeed();
-	policy->policy = CPUFREQ_POLICY_POWERSAVE;
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = 59000;
 	policy->cpuinfo.max_freq = 287000;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
