From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.5,
Date: Mon, 30 Aug 2004 17:08:31 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040830150831.GA9380@dominikbrodowski.de>
References: <20040829124936.GA16770@dominikbrodowski.de>
	<20040830152954.A22480@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040830152954.A22480@flint.arm.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

On Mon, Aug 30, 2004 at 03:29:54PM +0100, Russell King wrote:
> Obviously given this information, this flag needs to be removed from ARM.
> If ARM is the only user, then the flag and associated code needs to be
> completely removed.

Who shall "push" this patch upstreams? Dave or Russell?


The SA1100 and SA1110 platforms can handle situations well where the
CPU frequency is different to the value the cpufreq (and timing) code 
thinks it is, e.g. when resuming from sleep. So, remove the flags 
noting the opposite.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.de>

---

 arch/arm/mach-sa1100/cpu-sa1100.c |    4 +---
 arch/arm/mach-sa1100/cpu-sa1110.c |    4 +---
 drivers/cpufreq/cpufreq.c         |    9 ---------
 include/linux/cpufreq.h           |    7 -------
 4 files changed, 2 insertions(+), 22 deletions(-)

diff -ruN linux-original/arch/arm/mach-sa1100/cpu-sa1100.c linux/arch/arm/mach-sa1100/cpu-sa1100.c
--- linux-original/arch/arm/mach-sa1100/cpu-sa1100.c	2004-08-30 16:55:43.002188392 +0200
+++ linux/arch/arm/mach-sa1100/cpu-sa1100.c	2004-08-30 16:57:09.285071400 +0200
@@ -230,9 +230,7 @@
 }
 
 static struct cpufreq_driver sa1100_driver = {
-	.flags		= CPUFREQ_STICKY |
-			  CPUFREQ_PANIC_OUTOFSYNC | 
-			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
+	.flags		= CPUFREQ_STICKY,
 	.verify		= sa11x0_verify_speed,
 	.target		= sa1100_target,
 	.get		= sa11x0_getspeed,
diff -ruN linux-original/arch/arm/mach-sa1100/cpu-sa1110.c linux/arch/arm/mach-sa1100/cpu-sa1110.c
--- linux-original/arch/arm/mach-sa1100/cpu-sa1110.c	2004-08-30 16:55:43.002188392 +0200
+++ linux/arch/arm/mach-sa1100/cpu-sa1110.c	2004-08-30 16:57:18.358692000 +0200
@@ -329,9 +329,7 @@
 }
 
 static struct cpufreq_driver sa1110_driver = {
-	.flags		= CPUFREQ_STICKY |
-			  CPUFREQ_PANIC_OUTOFSYNC | 
-			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
+	.flags		= CPUFREQ_STICKY,
 	.verify		= sa11x0_verify_speed,
 	.target		= sa1110_target,
 	.get		= sa11x0_getspeed,
diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-08-30 16:55:48.815304664 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-08-30 16:58:48.196034648 +0200
@@ -157,9 +157,6 @@
 			    (likely(cpufreq_cpu_data[freqs->cpu]->cur)) &&
 			    (unlikely(freqs->old != cpufreq_cpu_data[freqs->cpu]->cur)))
 			{
-				if (cpufreq_driver->flags & CPUFREQ_PANIC_OUTOFSYNC)
-					panic("CPU Frequency is out of sync.");
-
 				printk(KERN_WARNING "Warning: CPU frequency is %u, "
 				       "cpufreq assumed %u kHz.\n", freqs->old, cpufreq_cpu_data[freqs->cpu]->cur);
 				freqs->old = cpufreq_cpu_data[freqs->cpu]->cur;
@@ -603,9 +600,6 @@
 {
 	struct cpufreq_freqs freqs;
 
-	if (cpufreq_driver->flags & CPUFREQ_PANIC_OUTOFSYNC)
-		panic("CPU Frequency is out of sync.");
-
 	printk(KERN_WARNING "Warning: CPU frequency out of sync: cpufreq and timing "
 	       "core thinks of %u, is %u kHz.\n", old_freq, new_freq);
 
@@ -696,9 +690,6 @@
 		if (unlikely(cur_freq != cpu_policy->cur)) {
 			struct cpufreq_freqs freqs;
 
-			if (cpufreq_driver->flags & CPUFREQ_PANIC_RESUME_OUTOFSYNC)
-				panic("CPU Frequency is out of sync.");
-
 			printk(KERN_WARNING "Warning: CPU frequency is %u, "
 			       "cpufreq assumed %u kHz.\n", cur_freq, cpu_policy->cur);
 
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-08-30 16:55:51.403911136 +0200
+++ linux/include/linux/cpufreq.h	2004-08-30 16:59:04.110615264 +0200
@@ -209,13 +209,6 @@
 #define CPUFREQ_CONST_LOOPS 	0x02	/* loops_per_jiffy or other kernel
 					 * "constants" aren't affected by
 					 * frequency transitions */
-#define CPUFREQ_PANIC_OUTOFSYNC	0x04	/* panic if cpufreq's opinion of
-					 * current frequency differs from
-					 * actual frequency */
-#define CPUFREQ_PANIC_RESUME_OUTOFSYNC 0x08 /* panic if cpufreq's opinion of
-					 * current frequency differs from
-					 * actual frequency on resume
-					 * from sleep. */
 
 
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
