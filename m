From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] [RFC] [1/2] powernow-k7. Recalibrate cpu_khz (common code)
Date: Thu, 18 Nov 2004 17:11:39 +0100
Message-ID: <20041118161139.GB31422@poupinou.org>
References: <20041118161034.GA31422@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041118161034.GA31422@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Some cpufreq drivers (at that time, only powernow-k7) need to recalibrate
the cpu_khz at runtime.

Signed-off-by: Bruno Ducrot <ducrot@poupinou.org>

 arch/i386/kernel/timers/common.c |   15 +++++++++++++--
 include/asm-i386/timer.h         |    1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

--- linux-2.6.10-rc2/arch/i386/kernel/timers/common.c	2004-11-18 16:49:03.000000000 +0100
+++ linux-2.6.10-rc2/arch/i386/kernel/timers/common.c	2004-11-18 16:31:42.000000000 +0100
@@ -6,6 +6,7 @@
 #include <linux/timex.h>
 #include <linux/errno.h>
 #include <linux/jiffies.h>
+#include <linux/module.h>
 
 #include <asm/io.h>
 #include <asm/timer.h>
@@ -24,7 +25,7 @@
 
 #define CALIBRATE_TIME	(5 * 1000020/HZ)
 
-unsigned long __init calibrate_tsc(void)
+unsigned long calibrate_tsc(void)
 {
 	mach_prepare_counter();
 
@@ -139,7 +140,7 @@
 #endif
 
 /* calculate cpu_khz */
-void __init init_cpu_khz(void)
+void init_cpu_khz(void)
 {
 	if (cpu_has_tsc) {
 		unsigned long tsc_quotient = calibrate_tsc();
@@ -158,3 +159,13 @@
 		}
 	}
 }
+
+int recalibrate_cpu_khz(void)
+{
+	if (cpu_has_tsc) {
+		init_cpu_khz();
+		return 0;
+	} else
+		return -ENODEV;
+}
+EXPORT_SYMBOL(recalibrate_cpu_khz);
--- linux-2.6.10-rc2/include/asm-i386/timer.h	2004-11-18 16:49:06.000000000 +0100
+++ linux-2.6.10-rc2/include/asm-i386/timer.h	2004-11-18 16:24:28.000000000 +0100
@@ -53,6 +53,7 @@
 
 extern unsigned long calibrate_tsc(void);
 extern void init_cpu_khz(void);
+extern int recalibrate_cpu_khz(void);
 #ifdef CONFIG_HPET_TIMER
 extern struct init_timer_opts timer_hpet_init;
 extern unsigned long calibrate_tsc_hpet(unsigned long *tsc_hpet_quotient_ptr);

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
