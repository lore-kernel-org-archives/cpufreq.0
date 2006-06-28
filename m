From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 2/4] minor optimizations to ondemand governor
Date: Wed, 28 Jun 2006 13:50:33 -0700
Message-ID: <20060628135033.C12989@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq <cpufreq@www.linux.org.uk>
Cc: alexey.y.starikovskiy@intel.com, Dave Jones <davej@redhat.com>, Len Brown <lenb@unix-os.sc.intel.com>


queue_delayed_work_on_02.patch

Add queue_delayed_work_on() interface for workqueues.

Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.17/include/linux/workqueue.h
===================================================================
--- linux-2.6.17.orig/include/linux/workqueue.h
+++ linux-2.6.17/include/linux/workqueue.h
@@ -63,12 +63,13 @@ extern void destroy_workqueue(struct wor
 
 extern int FASTCALL(queue_work(struct workqueue_struct *wq, struct work_struct *work));
 extern int FASTCALL(queue_delayed_work(struct workqueue_struct *wq, struct work_struct *work, unsigned long delay));
+extern int FASTCALL(queue_delayed_work_on(int cpu, struct workqueue_struct *wq, struct work_struct *work, unsigned long delay));
 extern void FASTCALL(flush_workqueue(struct workqueue_struct *wq));
 
 extern int FASTCALL(schedule_work(struct work_struct *work));
 extern int FASTCALL(schedule_delayed_work(struct work_struct *work, unsigned long delay));
 
-extern int schedule_delayed_work_on(int cpu, struct work_struct *work, unsigned long delay);
+extern int FASTCALL(schedule_delayed_work_on(int cpu, struct work_struct *work, unsigned long delay));
 extern int schedule_on_each_cpu(void (*func)(void *info), void *info);
 extern void flush_scheduled_work(void);
 extern int current_is_keventd(void);
Index: linux-2.6.17/kernel/workqueue.c
===================================================================
--- linux-2.6.17.orig/kernel/workqueue.c
+++ linux-2.6.17/kernel/workqueue.c
@@ -148,6 +148,27 @@ int fastcall queue_delayed_work(struct w
 	return ret;
 }
 
+int fastcall queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
+			struct work_struct *work, unsigned long delay)
+{
+	int ret = 0;
+	struct timer_list *timer = &work->timer;
+
+	if (!test_and_set_bit(0, &work->pending)) {
+		BUG_ON(timer_pending(timer));
+		BUG_ON(!list_empty(&work->entry));
+
+		/* This stores wq for the moment, for the timer_fn */
+		work->wq_data = wq;
+		timer->expires = jiffies + delay;
+		timer->data = (unsigned long)work;
+		timer->function = delayed_work_timer_fn;
+		add_timer_on(timer, cpu);
+		ret = 1;
+	}
+	return ret;
+}
+
 static void run_workqueue(struct cpu_workqueue_struct *cwq)
 {
 	unsigned long flags;
@@ -408,24 +429,10 @@ int fastcall schedule_delayed_work(struc
 	return queue_delayed_work(keventd_wq, work, delay);
 }
 
-int schedule_delayed_work_on(int cpu,
+int fastcall schedule_delayed_work_on(int cpu,
 			struct work_struct *work, unsigned long delay)
 {
-	int ret = 0;
-	struct timer_list *timer = &work->timer;
-
-	if (!test_and_set_bit(0, &work->pending)) {
-		BUG_ON(timer_pending(timer));
-		BUG_ON(!list_empty(&work->entry));
-		/* This stores keventd_wq for the moment, for the timer_fn */
-		work->wq_data = keventd_wq;
-		timer->expires = jiffies + delay;
-		timer->data = (unsigned long)work;
-		timer->function = delayed_work_timer_fn;
-		add_timer_on(timer, cpu);
-		ret = 1;
-	}
-	return ret;
+	return queue_delayed_work_on(cpu, keventd_wq, work, delay);
 }
 
 int schedule_on_each_cpu(void (*func) (void *info), void *info)
@@ -608,6 +615,7 @@ void init_workqueues(void)
 EXPORT_SYMBOL_GPL(__create_workqueue);
 EXPORT_SYMBOL_GPL(queue_work);
 EXPORT_SYMBOL_GPL(queue_delayed_work);
+EXPORT_SYMBOL_GPL(queue_delayed_work_on);
 EXPORT_SYMBOL_GPL(flush_workqueue);
 EXPORT_SYMBOL_GPL(destroy_workqueue);
