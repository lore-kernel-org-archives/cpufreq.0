From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] update lost-ticks handling
Date: Mon, 10 May 2004 14:11:30 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040510121130.GB16913@dominikbrodowski.de>
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
To: davej@redhat.com, cpufreq@www.linux.org.uk

Avoid scheduling cpufreq_delayed_get_work() twice; but do call it a bit
earlier.

diff -ruN linux-original/arch/i386/kernel/timers/timer_tsc.c linux/arch/i386/kernel/timers/timer_tsc.c
--- linux-original/arch/i386/kernel/timers/timer_tsc.c	2004-05-10 09:19:19.126474472 +0200
+++ linux/arch/i386/kernel/timers/timer_tsc.c	2004-05-10 09:32:27.629603776 +0200
@@ -244,7 +244,7 @@
 			clock_fallback();
 		}
 		/* ... but give the TSC a fair chance */
-		if (lost_count == 50)
+		if (lost_count > 25)
 			cpufreq_delayed_get();
 	} else
 		lost_count = 0;
@@ -331,6 +331,7 @@
 #ifdef CONFIG_CPU_FREQ
 #include <linux/workqueue.h>
 
+static unsigned int cpufreq_delayed_issched = 0;
 static unsigned int cpufreq_init = 0;
 static struct work_struct cpufreq_delayed_get_work;
 
@@ -340,6 +341,7 @@
 	for_each_online_cpu(cpu) {
 		cpufreq_get(cpu);
 	}
+	cpufreq_delayed_issched = 0;
 }
 
 /* if we notice lost ticks, schedule a call to cpufreq_get() as it tries
@@ -348,8 +350,11 @@
  */
 static inline void cpufreq_delayed_get(void) 
 {
-	if (cpufreq_init)
+	if (cpufreq_init && !cpufreq_delayed_issched) {
+		cpufreq_delayed_issched = 1;
+		printk(KERN_DEBUG "Losing some ticks... checking if CPU frequency changed.\n");
 		schedule_work(&cpufreq_delayed_get_work);
+	}
 }
 
 /* If the CPU frequency is scaled, TSC-based delays will need a different
