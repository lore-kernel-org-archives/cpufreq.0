From: akpm@osdl.org
Subject: + x86_64-move-ondemand-timer-into-own-work-queue.patch added to -mm
	tree
Date: Wed, 10 May 2006 21:18:17 -0700
Message-ID: <200605110421.k4B4L3Yl003150@shell0.pdx.osdl.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ak@suse.de, cpufreq@lists.linux.org.uk, davej@redhat.com, venkatesh.pallipadi@intel.com, mm-commits@vger.kernel.org


The patch titled

     x86_64: Move ondemand timer into own work queue

has been added to the -mm tree.  Its filename is

     x86_64-move-ondemand-timer-into-own-work-queue.patch

See http://www.zip.com.au/~akpm/linux/patches/stuff/added-to-mm.txt to find
out what to do about this


From: Andi Kleen <ak@suse.de>

Taking the cpu hotplug semaphore in a normal events workqueue is unsafe
because other tasks can wait for any workqueues with it hold.  This results in
a deadlock.

Move the DBS timer into its own work queue which is not affected by other work
queue flushes to avoid this.

Cc: <venkatesh.pallipadi@intel.com>
Cc: <cpufreq@lists.linux.org.uk>
Signed-off-by: Andi Kleen <ak@suse.de>
Acked-by: Dave Jones <davej@redhat.com>
Signed-off-by: Andrew Morton <akpm@osdl.org>
---

 drivers/cpufreq/cpufreq_ondemand.c |   28 +++++++++++++++++++--------
 1 files changed, 20 insertions(+), 8 deletions(-)

diff -puN drivers/cpufreq/cpufreq_ondemand.c~x86_64-move-ondemand-timer-into-own-work-queue drivers/cpufreq/cpufreq_ondemand.c
--- devel/drivers/cpufreq/cpufreq_ondemand.c~x86_64-move-ondemand-timer-into-own-work-queue	2006-05-10 21:18:15.000000000 -0700
+++ devel-akpm/drivers/cpufreq/cpufreq_ondemand.c	2006-05-10 21:18:15.000000000 -0700
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
_

Patches currently in -mm which might be from ak@suse.de are

origin.patch
x86_64-disable-aperture-pci-region-check-in-amd64.patch
x86_64-avoid-irq0-ioapic-pin-collision.patch
x86_64-check-for-too-many-northbridges-in-iommu.patch
x86_64-fix-die_lock-nesting.patch
x86_64-add-nmi_exit-to-die_nmi.patch
x86_64-avoid-ebda-area-in-early-boot-allocator.patch
x86_64-move-ondemand-timer-into-own-work-queue.patch
git-acpi.patch
git-agpgart.patch
x86_64-mm-serialize-assign_irq_vector-use-of-static-variables-fix.patch
