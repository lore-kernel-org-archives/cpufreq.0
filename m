From: venkatesh.pallipadi@intel.com
Subject: [patch 5/6] cpufreq: Changes to get_cpu_idle_time_us(),
	to be used in ondemand governor
Date: Thu, 17 Jul 2008 13:55:59 -0700
Message-ID: <20080717205616.515582000@intel.com>
References: <20080717205554.214645000@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline; filename=generic_microaccounting_changes.patch
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk
Cc: davej@redhat.com

export get_cpu_idle_time_us() for it to be used in ondemand governor.
Last update time can be current time when the CPU is currently non-idle,
accounting for the busy time since last idle.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

---
 include/linux/tick.h     |    2 +-
 kernel/time/tick-sched.c |   11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

Index: linux-2.6/kernel/time/tick-sched.c
===================================================================
--- linux-2.6.orig/kernel/time/tick-sched.c	2008-07-17 13:19:08.000000000 -0700
+++ linux-2.6/kernel/time/tick-sched.c	2008-07-17 13:27:29.000000000 -0700
@@ -20,6 +20,7 @@
 #include <linux/profile.h>
 #include <linux/sched.h>
 #include <linux/tick.h>
+#include <linux/module.h>
 
 #include <asm/irq_regs.h>
 
@@ -184,9 +185,17 @@ u64 get_cpu_idle_time_us(int cpu, u64 *l
 {
 	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
 
-	*last_update_time = ktime_to_us(ts->idle_lastupdate);
+	if (!tick_nohz_enabled)
+		return -1;
+
+	if (ts->idle_active)
+		*last_update_time = ktime_to_us(ts->idle_lastupdate);
+	else
+		*last_update_time = ktime_to_us(ktime_get());
+
 	return ktime_to_us(ts->idle_sleeptime);
 }
+EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
 
 /**
  * tick_nohz_stop_sched_tick - stop the idle tick from the idle task
Index: linux-2.6/include/linux/tick.h
===================================================================
--- linux-2.6.orig/include/linux/tick.h	2008-07-17 13:19:08.000000000 -0700
+++ linux-2.6/include/linux/tick.h	2008-07-17 13:27:29.000000000 -0700
@@ -122,7 +122,7 @@ static inline ktime_t tick_nohz_get_slee
 	return len;
 }
 static inline void tick_nohz_stop_idle(int cpu) { }
-static inline u64 get_cpu_idle_time_us(int cpu, u64 *unused) { return 0; }
+static inline u64 get_cpu_idle_time_us(int cpu, u64 *unused) { return -1; }
 # endif /* !NO_HZ */
 
 #endif

-- 
