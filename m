From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 2.6] Pentium-4-M detection fix for speedstep-lib
Date: Mon, 9 Feb 2004 11:13:31 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209101331.GA19101@dominikbrodowski.de>
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
To: davej@redhat.com
Cc: cpufreq@www.linux.org.uk

The different P-4-M steppings have different "ebx" values. Analyze it
correctly to sort out Pentium-4-based Celerons.

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-02-09 09:26:04.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-02-09 11:08:53.376217760 +0100
@@ -207,17 +207,55 @@
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
+		dprintk(KERN_INFO "ebx value is %x, x86_mask is %x\n", ebx, c->86_mask);
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
+			 * So, how to distinguish all those processors with
+			 * ebx=0xf? I don't know. Sort them out, and wait
+			 * for someone to complain.
+			 */
+			if (ebx == 0x0e)
+				return SPEEDSTEP_PROCESSOR_P4M;
+			break;
+		default:
+			break;
+		}
+		return 0;
 	}
 
 	switch (c->x86_model) {
