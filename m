From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH] cpufreq: add speedstep support for Intel Mobile Pentium P-4 with 533 MHz FSB
Date: Tue, 24 Jun 2003 20:34:02 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030624183402.GA10605@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@suse.de, cpufreq@www.linux.org.uk

Add support for newest "Mobile Pentium 4-M" and the new "Mobile Pentium 4 with
533 MHz FSB" processors.

Depends on the speedstep-lib patch sent earlier.

	Dominik

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2003-06-18 11:04:13.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2003-06-24 20:31:10.000000000 +0200
@@ -148,11 +148,14 @@
 		return 0;
 
 	if (c->x86 == 0xF) {
-		/* Intel Pentium 4 Mobile P4-M */
+		/* Intel Mobile Pentium 4-M
+		 * or Intel Mobile Pentium 4 with 533 MHz FSB */
 		if (c->x86_model != 2)
 			return 0;
 
-		if ((c->x86_mask != 4) && (c->x86_mask != 7))
+		if ((c->x86_mask != 4) && /* B-stepping [M-P4-M] */
+		    (c->x86_mask != 7) && /* C-stepping [M-P4-M] */
+		    (c->x86_mask != 9))   /* D-stepping [M-P4-M or M-P4/533] */
 			return 0;
 
 		ebx = cpuid_ebx(0x00000001);
