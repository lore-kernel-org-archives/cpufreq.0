From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: avoid re-enabling of interrupts too early during
	resume
Date: Mon, 9 Aug 2004 21:53:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040809195346.GA9397@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, davej@redhat.com
Cc: brian@interlinx.bc.ca

Avoid re-enabling the interrupts in "write_sequnlock_irq" in
cpufreq_timer_notifier() when it gets called in "CPUFREQ_RESUMECHANGE" state
-- that happens if the CPU frequency is detected to be different now from
what it was during suspension, and that's a resume call of a sys device, so
with interrupts off.

Without this patch, it can cause nasty oopses. IIRC resume is done on one
CPU only, so we don't need no lock anyways. Right?

Many thanks to Brian J. Murrell for debugging this issue.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/timers/timer_tsc.c linux/arch/i386/kernel/timers/timer_tsc.c
--- linux-original/arch/i386/kernel/timers/timer_tsc.c	2004-08-05 17:44:47.000000000 +0200
+++ linux/arch/i386/kernel/timers/timer_tsc.c	2004-08-08 18:23:27.791458408 +0200
@@ -265,7 +265,8 @@
 {
 	struct cpufreq_freqs *freq = data;
 
-	write_seqlock_irq(&xtime_lock);
+	if (val != CPUFREQ_RESUMECHANGE)
+		write_seqlock_irq(&xtime_lock);
 	if (!ref_freq) {
 		ref_freq = freq->old;
 		loops_per_jiffy_ref = cpu_data[freq->cpu].loops_per_jiffy;
@@ -291,7 +292,9 @@
 		}
 #endif
 	}
-	write_sequnlock_irq(&xtime_lock);
+
+	if (val != CPUFREQ_RESUMECHANGE)
+		write_sequnlock_irq(&xtime_lock);
 
 	return 0;
 }
