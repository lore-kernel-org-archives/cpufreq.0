From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: give the TSC a fair chance [Was: [PATCHES] cpufreq_get(),
	cpufreq->get()]
Date: Mon, 12 Apr 2004 14:04:22 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040412120422.GA7337@dominikbrodowski.de>
References: <20040411215912.GA8160@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040411215912.GA8160@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, johnstul@us.ibm.com

Dear John, 

Based on a patchset I submitted to the cpufreq list yesterday [description
and patches: http://www.brodo.de/patches/2004-04-11/00-announcement ]
I'd like to discuss the following patch:

If many lost ticks are detected, a call to "cpufreq_get()" for each online
CPU is scheduled as "work" for the "event" thread. This needs to be delayed
as cpufreq_get() may sleep. Inside cpufreq_get(), the cpufreq core tries to
determine the actual (hardware) CPU frequency, and if it differs from the
state the CPU was last set to, it will adjust to this inconsistency by
calling cpufreq notifiers. This means that the relevant frequency-affected
"constants" in timer_tsc.c will be updated, and no more lost ticks should
occur.

I've just verified that this patch does what it intends to, removing and
inserting the AC plug caused these messages in dmesg:
Warning: CPU frequency out of sync: cpufreq and timing core thinks of 1400000, is 600000 kHz.
Warning: CPU frequency out of sync: cpufreq and timing core thinks of 600000, is 1400000 kHz.

Please note that this patchset only will function on SMP as the cpufreq
workqueue interface was designed so well: even though the "kevent" thread
runs normally on one CPU, the actual work can be moved to other CPUs by
set_cpus_allowed(); one kevent "worker" can schedule additional work.

However, this patch has one slight chance for a bug: if lost_count reaches
50, a call to handle_cpufreq_delayed_work is scheduled, but does not execute
until lost_count reaches 50 again [e.g. when no lost ticks are
detected at the next call, but on the next 50 consecutive calls...]. As
keventd runs at -10 priority I doubt this will happen under normal
circumstances, though.

diff -ruN linux-original/arch/i386/kernel/timers/timer_tsc.c linux/arch/i386/kernel/timers/timer_tsc.c
--- linux-original/arch/i386/kernel/timers/timer_tsc.c	2004-04-12 13:38:59.541593040 +0200
+++ linux/arch/i386/kernel/timers/timer_tsc.c	2004-04-12 10:54:15.000000000 +0200
@@ -27,6 +27,8 @@
 struct timer_opts timer_tsc;
 #endif
 
+static inline void cpufreq_delayed_get(void);
+
 int tsc_disable __initdata = 0;
 
 extern spinlock_t i8253_lock;
@@ -241,6 +243,9 @@
 
 			clock_fallback();
 		}
+		/* ... but give it a fair chance to compensate for BIOS cpu frequency transitions */
+		if (lost_count == 50)
+			cpufreq_delayed_get();
 	} else
 		lost_count = 0;
 	/* update the monotonic base value */
@@ -324,6 +329,29 @@
 
 
 #ifdef CONFIG_CPU_FREQ
+#include <linux/workqueue.h>
+
+static unsigned int cpufreq_init = 0;
+static struct work_struct cpufreq_delayed_get_work;
+
+static void handle_cpufreq_delayed_get(void *v)
+{
+	unsigned int cpu;
+	for_each_online_cpu(cpu) {
+		cpufreq_get(cpu);
+	}
+}
+
+/* if we notice lost ticks, schedule a call to cpufreq_get() as it tries
+ * to verify the CPU frequency the timing core thinks the CPU is running
+ * at is still correct.
+ */
+static inline void cpufreq_delayed_get(void) 
+{
+	if (cpufreq_init)
+		schedule_work(&cpufreq_delayed_get_work);
+}
+
 /* If the CPU frequency is scaled, TSC-based delays will need a different
  * loops_per_jiffy value to function properly. An exception to this
  * are modern Intel Pentium 4 processors, where the TSC runs at a constant
@@ -383,6 +411,8 @@
 
 static int __init cpufreq_tsc(void)
 {
+	INIT_WORK(&cpufreq_delayed_get_work, handle_cpufreq_delayed_get, NULL);
+	cpufreq_init = 1;
 	/* P4 and above CPU TSC freq doesn't change when CPU frequency changes*/
 	if ((boot_cpu_data.x86 >= 15) && (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL))
 		variable_tsc = 0;
@@ -391,6 +421,8 @@
 }
 core_initcall(cpufreq_tsc);
 
+#else /* CONFIG_CPU_FREQ */
+static inline void cpufreq_delayed_get(void) { return; }
 #endif 
