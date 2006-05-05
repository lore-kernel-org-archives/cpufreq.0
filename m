From: "Andi Kleen" <ak@suse.de>
Subject: [PATCH] [7/7] x86_64: Move ondemand timer into own work queue
Date: Fri, 05 May 2006 20:33:14 +0200
Message-ID: <445B9A6A.mailIZ41BYSAC@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: torvalds@osdl.org
Cc: akpm@osdl.org, discuss@x86-64.org, cpufreq@lists.linux.org.uk


Taking the cpu hotplug semaphore in a normal events workqueue
is unsafe because other tasks can wait for any workqueues with
it hold. This results in a deadlock.

Move the DBS timer into its own work queue which is not 
affected by other work queue flushes to avoid this.

Cc: venkatesh.pallipadi@intel.com
Cc: cpufreq@lists.linux.org.uk

Signed-off-by: Andi Kleen <ak@suse.de>

---
 drivers/cpufreq/cpufreq_ondemand.c |   28 ++++++++++++++++++++--------
 1 files changed, 20 insertions(+), 8 deletions(-)

Index: linux/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ linux/drivers/cpufreq/cpufreq_ondemand.c
@@ -74,6 +74,8 @@ static unsigned int dbs_enable;	/* numbe
 static DEFINE_MUTEX (dbs_mutex);
 static DECLARE_WORK	(dbs_work, do_dbs_timer, NULL);
 
+static struct workqueue_struct *dbs_workq;
+
 struct dbs_tuners {
 	unsigned int sampling_rate;
 	unsigned int sampling_down_factor;
@@ -364,23 +366,29 @@ static void do_dbs_timer(void *data)
 	mutex_lock(&dbs_mutex);
 	for_each_online_cpu(i)
 		dbs_check_cpu(i);
-	schedule_delayed_work(&dbs_work,
-			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
+	queue_delayed_work(dbs_workq, &dbs_work,
+			   usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
 	mutex_unlock(&dbs_mutex);
 }
 
 static inline void dbs_timer_init(void)
 {
 	INIT_WORK(&dbs_work, do_dbs_timer, NULL);
-	schedule_delayed_work(&dbs_work,
-			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
+	if (!dbs_workq)
+		dbs_workq = create_singlethread_workqueue("ondemand");
+	if (!dbs_workq) {
+		printk(KERN_ERR "ondemand: Cannot initialize kernel thread\n");
+		return;
+	}
+	queue_delayed_work(dbs_workq, &dbs_work,
+			   usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
 	return;
 }
 
 static inline void dbs_timer_exit(void)
 {
-	cancel_delayed_work(&dbs_work);
-	return;
+	if (dbs_workq)
+		cancel_rearming_delayed_workqueue(dbs_workq, &dbs_work);
 }
 
 static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
@@ -489,8 +497,12 @@ static int __init cpufreq_gov_dbs_init(v
 
 static void __exit cpufreq_gov_dbs_exit(void)
 {
-	/* Make sure that the scheduled work is indeed not running */
-	flush_scheduled_work();
+	/* Make sure that the scheduled work is indeed not running.
+	   Assumes the timer has been cancelled first. */
+	if (dbs_workq) {
+		flush_workqueue(dbs_workq);
+		destroy_workqueue(dbs_workq);
+	}
 
 	cpufreq_unregister_governor(&cpufreq_gov_dbs);
 }
