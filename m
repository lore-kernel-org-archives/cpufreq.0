From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: patch-04 [Re: [PATCHES] cpufreq_get(), cpufreq->get()]
Date: Mon, 12 Apr 2004 00:00:26 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040411220026.GC8160@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

Sometimes we might discover during a call to cpufreq_get() that we're "out of sync",
meaning the actual CPU frequency changed "behind our back". If this happens, the
flag CPUFREQ_PANIC_OUTOFSYNC decides what can be done: if it is set, the kernel panic's,
it it is not set, the cpufreq transition notifiers are informed of this change, and
a call to cpufreq_update_policy() is scheduled [using the default workqueue] so that
the user-defined values override BIOS / external interaction.

 drivers/cpufreq/cpufreq.c |   50 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/cpufreq.h   |   15 +++++++++++--
 2 files changed, 63 insertions(+), 2 deletions(-)

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-04-11 17:08:00.752526168 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-04-11 17:09:54.233274472 +0200
@@ -362,6 +362,7 @@
 	.release	= cpufreq_sysfs_release,
 };
 
+static void handle_update(void *data);
 
 /**
  * cpufreq_add_dev - add a CPU device
@@ -388,6 +389,7 @@
 	policy->cpu = cpu;
 	init_MUTEX_LOCKED(&policy->lock);
 	init_completion(&policy->kobj_unregister);
+	INIT_WORK(&policy->update, handle_update, (void *) cpu);
 
 	/* call driver. From then on the cpufreq must be able
 	 * to accept all calls to ->verify and ->setpolicy for this CPU
@@ -496,6 +498,39 @@
 }
 
 
+static void handle_update(void *data)
+{
+	unsigned int cpu = (unsigned int) data;
+	cpufreq_update_policy(cpu);
+}
+
+/**
+ *	cpufreq_out_of_sync - If actual and saved CPU frequency differs, we're in deep trouble.
+ *	@cpu: cpu number
+ *	@old_freq: CPU frequency the kernel thinks the CPU runs at
+ *	@new_freq: CPU frequency the CPU actually runs at
+ *
+ *	We adjust to current frequency first, and need to clean up later. So either call
+ *	to cpufreq_update_policy() or schedule handle_update()).
+ */
+static void cpufreq_out_of_sync(unsigned int cpu, unsigned int old_freq, unsigned int new_freq)
+{
+	struct cpufreq_freqs freqs;
+
+	if (cpufreq_driver->flags & CPUFREQ_PANIC_OUTOFSYNC)
+		panic("CPU Frequency is out of sync.");
+
+	printk(KERN_WARNING "Warning: CPU frequency out of sync: cpufreq and timing "
+	       "core thinks of %u, is %u kHz.\n", old_freq, new_freq);
+
+	freqs.cpu = cpu;
+	freqs.old = old_freq;
+	freqs.new = new_freq;
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+}
+
+
 /** 
  * cpufreq_get - get the current CPU frequency (in kHz)
  * @cpu: CPU number
@@ -517,6 +552,15 @@
 
 	ret = cpufreq_driver->get(cpu);
 
+	if (ret && policy->cur && !(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) 
+	{
+		/* verify no discrepancy between actual and saved value exists */
+		if (unlikely(ret != policy->cur)) {
+			cpufreq_out_of_sync(cpu, policy->cur, ret);
+			schedule_work(&policy->update);
+		}
+	}
+
 	up(&policy->lock);
 
  out:
@@ -957,6 +1001,9 @@
 
 static inline void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci)
 {
+	if (cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)
+		return;
+
 	if (!l_p_j_ref_freq) {
 		l_p_j_ref = loops_per_jiffy;
 		l_p_j_ref_freq = ci->old;
@@ -1023,6 +1070,9 @@
 	    ((!driver_data->setpolicy) && (!driver_data->target)))
 		return -EINVAL;
 
+	if (driver_data->setpolicy)
+		driver_data->flags |= CPUFREQ_CONST_LOOPS;
+
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	if (cpufreq_driver) {
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-04-11 17:07:17.095163096 +0200
+++ linux/include/linux/cpufreq.h	2004-04-11 17:10:41.321116032 +0200
@@ -21,6 +21,7 @@
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
 #include <linux/completion.h>
+#include <linux/workqueue.h>
 
 #define CPUFREQ_NAME_LEN 16
 
@@ -81,6 +82,9 @@
  	struct semaphore	lock;   /* CPU ->setpolicy or ->target may
 					   only be called once a time */
 
+	struct work_struct	update; /* if update_policy() needs to be
+					 * called, but you're in IRQ context */
+
 	struct cpufreq_real_policy	user_policy;
 
 	struct kobject		kobj;
@@ -198,8 +202,15 @@
 
 /* flags */
 
-#define CPUFREQ_STICKY	0x01	/* the driver isn't removed even if 
-				   all ->init() calls failed */
+#define CPUFREQ_STICKY		0x01	/* the driver isn't removed even if 
+					 * all ->init() calls failed */
+#define CPUFREQ_CONST_LOOPS 	0x02	/* loops_per_jiffy or other kernel
+					 * "constants" aren't affected by
+					 * frequency transitions */
+#define CPUFREQ_PANIC_OUTOFSYNC	0x04	/* panic if cpufreq's opinion of
+					 * current frequency differs from
+					 * actual frequency */
+
 
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
 int cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
