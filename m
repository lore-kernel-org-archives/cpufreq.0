From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: patch-05 [Re: [PATCHES] cpufreq_get(), cpufreq->get()]
Date: Mon, 12 Apr 2004 00:00:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040411220047.GD8160@dominikbrodowski.de>
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

(Hopefully) fix cpufreq resume support.

Upon resuming, first CPUfreq hardware support needs to be re-enabled in ceratin cases
(call to cpufreq_driver->resume()).

Then, two different paths may need to be taken:
a) frequency during suspend equals frequency during resume ==> everything is fine,

b) frequency differ ==> either we can't handle it, then panic (see flag 
   CPUFREQ_PANIC_RESUME_OUTOFSYNC). Or we can handle it, then notify all
   transition notifiers of this frequency change (CPUFREQ_RESUMECHANGE so that they
   know IRQs are disabled).

At last, a call to cpufreq_update_policy() is scheduled. This asserts that
that the policy can be updated soon, in case platform limit, thermal and/or other 
issues make an adjustment necessary.

 Documentation/cpu-freq/core.txt |    4 ++
 drivers/cpufreq/cpufreq.c       |   63 ++++++++++++++++++++++++----------------
 include/linux/cpufreq.h         |    5 +++
 3 files changed, 47 insertions(+), 25 deletions(-)

diff -ruN linux-original/Documentation/cpu-freq/core.txt linux/Documentation/cpu-freq/core.txt
--- linux-original/Documentation/cpu-freq/core.txt	2004-04-11 14:47:24.000000000 +0200
+++ linux/Documentation/cpu-freq/core.txt	2004-04-11 17:13:16.571514384 +0200
@@ -92,3 +92,7 @@
 cpu	- number of the affected CPU
 old	- old frequency
 new	- new frequency
+
+If the cpufreq core detects the frequency has changed while the system
+was suspended, these notifiers are called with CPUFREQ_RESUMECHANGE as
+second argument.
diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-04-11 17:14:34.836616280 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-04-11 17:13:16.572514232 +0200
@@ -33,8 +33,10 @@
 static struct cpufreq_policy	*cpufreq_cpu_data[NR_CPUS];
 static spinlock_t		cpufreq_driver_lock = SPIN_LOCK_UNLOCKED;
 
-/* internal prototype */
+/* internal prototypes */
 static int __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event);
+static void handle_update(void *data);
+static inline void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci);
 
 
 /**
@@ -362,7 +364,6 @@
 	.release	= cpufreq_sysfs_release,
 };
 
-static void handle_update(void *data);
 
 /**
  * cpufreq_add_dev - add a CPU device
@@ -572,10 +573,11 @@
 
 
 /**
- *	cpufreq_resume - restore the CPU clock frequency after resume
+ *	cpufreq_resume -  restore proper CPU frequency handling after resume
  *
- *	Restore the CPU clock frequency so that our idea of the current
- *	frequency reflects the actual hardware.
+ *	1.) resume CPUfreq hardware support (cpufreq_driver->resume())
+ *	2.) if ->target and !CPUFREQ_CONST_LOOPS: verify we're in sync
+ *	3.) schedule call cpufreq_update_policy() ASAP as interrupts are restored.
  */
 static int cpufreq_resume(struct sys_device * sysdev)
 {
@@ -595,25 +597,37 @@
 	if (!cpu_policy)
 		return -EINVAL;
 
-	if (cpufreq_driver->resume)
-		ret = cpufreq_driver->resume(cpu_policy);
-	if (ret) {
-		printk(KERN_ERR "cpufreq: resume failed in ->resume step on CPU %u\n", cpu_policy->cpu);
-		goto out;
-	}
+	if (!cpufreq_driver->flags & CPUFREQ_CONST_LOOPS) {
+		unsigned int cur_freq = 0;
 
-	if (cpufreq_driver->setpolicy)
-		ret = cpufreq_driver->setpolicy(cpu_policy);
-	else
-		/* CPUFREQ_RELATION_H or CPUFREQ_RELATION_L have the same effect here, as cpu_policy->cur is known
-		 * to be a valid and exact target frequency
-		 */
-		ret = cpufreq_driver->target(cpu_policy, cpu_policy->cur, CPUFREQ_RELATION_H);
+		if (cpufreq_driver->get)
+			cur_freq = cpufreq_driver->get(cpu_policy->cpu);
 
-	if (ret)
-		printk(KERN_ERR "cpufreq: resume failed in ->setpolicy/target step on CPU %u\n", cpu_policy->cpu);
+		if (!cur_freq || !cpu_policy->cur) {
+			printk(KERN_ERR "cpufreq: resume failed to assert current frequency is what timing core thinks it is.\n");
+			goto out;
+		}
+
+		if (unlikely(cur_freq != cpu_policy->cur)) {
+			struct cpufreq_freqs freqs;
+
+			if (cpufreq_driver->flags & CPUFREQ_PANIC_RESUME_OUTOFSYNC)
+				panic("CPU Frequency is out of sync.");
+
+			printk(KERN_WARNING "Warning: CPU frequency out of sync: cpufreq and timing"
+			       "core thinks of %u, is %u kHz.\n", cpu_policy->cur, cur_freq);
+
+			freqs.cpu = cpu;
+			freqs.old = cpu_policy->cur;
+			freqs.new = cur_freq;
+
+			notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_RESUMECHANGE, &freqs);
+			adjust_jiffies(CPUFREQ_RESUMECHANGE, &freqs);
+		}
+	}
 
 out:
+	schedule_work(&cpu_policy->update);
 	cpufreq_cpu_put(cpu_policy);
 	return ret;
 }
@@ -1009,11 +1023,12 @@
 		l_p_j_ref_freq = ci->old;
 	}
 	if ((val == CPUFREQ_PRECHANGE  && ci->old < ci->new) ||
-	    (val == CPUFREQ_POSTCHANGE && ci->old > ci->new))
+	    (val == CPUFREQ_POSTCHANGE && ci->old > ci->new) ||
+	    (val == CPUFREQ_RESUMECHANGE))
 		loops_per_jiffy = cpufreq_scale(l_p_j_ref, l_p_j_ref_freq, ci->new);
 }
 #else
-#define adjust_jiffies(x...) do {} while (0)
+static inline void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci) { return; }
 #endif
 
 
@@ -1025,9 +1040,7 @@
  */
 void cpufreq_notify_transition(struct cpufreq_freqs *freqs, unsigned int state)
 {
-	if (irqs_disabled())
-		return;   /* Only valid if we're in the resume process where
-			   * everyone knows what CPU frequency we are at */
+	BUG_ON(irqs_disabled());
 
 	down_read(&cpufreq_notifier_rwsem);
 	switch (state) {
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-04-11 17:14:34.837616128 +0200
+++ linux/include/linux/cpufreq.h	2004-04-11 17:13:49.038578640 +0200
@@ -100,6 +100,7 @@
 
 #define CPUFREQ_PRECHANGE	(0)
 #define CPUFREQ_POSTCHANGE	(1)
+#define CPUFREQ_RESUMECHANGE	(8)
 
 struct cpufreq_freqs {
 	unsigned int cpu;	/* cpu nr */
@@ -210,6 +211,10 @@
 #define CPUFREQ_PANIC_OUTOFSYNC	0x04	/* panic if cpufreq's opinion of
 					 * current frequency differs from
 					 * actual frequency */
+#define CPUFREQ_PANIC_RESUME_OUTOFSYNC 0x08 /* panic if cpufreq's opinion of
+					 * current frequency differs from
+					 * actual frequency on resume
+					 * from sleep. */
 
 
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
