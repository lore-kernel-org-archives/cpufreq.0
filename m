From: Russell King <rmk@arm.linux.org.uk>
Subject: cpufreq on ARM broken
Date: Sat, 29 May 2004 17:01:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040529170151.B3799@flint.arm.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

Hi,

cpufreq doesn't appear to initialise on ARM - cpufreq_register_driver()
fails with -ENODEV.

This appears to be because we register cpus at subsys_initcall() time,
and cpufreq drivers at arch_initcall() time.  We need cpufreq up and
running before any drivers are initialised since their timings depend
on the CPU clock rate.

The following patch appears to fix these problems.

--- linux-tolinus/arch/arm/mach-sa1100/cpu-sa1100.c	Fri May 21 00:05:46 2004
+++ linux/arch/arm/mach-sa1100/cpu-sa1100.c	Sat May 29 16:19:51 2004
@@ -230,8 +230,9 @@
 }
 
 static struct cpufreq_driver sa1100_driver = {
-	.flags		= (CPUFREQ_PANIC_OUTOFSYNC | 
-			   CPUFREQ_PANIC_RESUME_OUTOFSYNC),
+	.flags		= CPUFREQ_STICKY |
+			  CPUFREQ_PANIC_OUTOFSYNC | 
+			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
 	.verify		= sa11x0_verify_speed,
 	.target		= sa1100_target,
 	.get		= sa11x0_getspeed,
--- linux-tolinus/arch/arm/mach-sa1100/cpu-sa1110.c	Fri May 21 00:05:46 2004
+++ linux/arch/arm/mach-sa1100/cpu-sa1110.c	Sat May 29 16:19:35 2004
@@ -329,8 +329,9 @@
 }
 
 static struct cpufreq_driver sa1110_driver = {
-	.flags		= (CPUFREQ_PANIC_OUTOFSYNC | 
-			   CPUFREQ_PANIC_RESUME_OUTOFSYNC),
+	.flags		= CPUFREQ_STICKY |
+			  CPUFREQ_PANIC_OUTOFSYNC | 
+			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
 	.verify		= sa11x0_verify_speed,
 	.target		= sa1110_target,
 	.get		= sa11x0_getspeed,

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
