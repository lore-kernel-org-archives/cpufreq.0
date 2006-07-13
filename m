From: Len Brown <len.brown@intel.com>
Subject: [PATCH 1/2 vs 2.6.18rc1] ondemand: tune for hardware coordination
Date: Thu, 13 Jul 2006 16:22:34 -0400
Message-ID: <200607131622.34806.len.brown@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: davej@codemonkey.org.uk
Cc: alexey.y.starikovskiy@intel.com, cpufreq@lists.linux.org.uk

From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

 cpufreq_ondemand.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

Try to make dbs_check_cpu() call on all CPUs at the same jiffy.
This will help when multiple cores share P-states via Hardware Coordination.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
Signed-off-by: Len Brown <len.brown@intel.com>

Index: linux-2.6.15.1/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.15.1.orig/drivers/cpufreq/cpufreq_ondemand.c	2006-07-10 15:34:53.000000000 +0400
+++ linux-2.6.15.1/drivers/cpufreq/cpufreq_ondemand.c	2006-07-12 12:36:18.000000000 +0400
@@ -74,6 +74,7 @@
 
 struct dbs_tuners {
 	unsigned int sampling_rate;
+	unsigned int sampling_rate_jiffies;
 	unsigned int up_threshold;
 	unsigned int ignore_nice;
 };
@@ -139,6 +140,7 @@
 	}
 
 	dbs_tuners_ins.sampling_rate = input;
+	dbs_tuners_ins.sampling_rate_jiffies = usecs_to_jiffies(input);
 	mutex_unlock(&dbs_mutex);
 
 	return count;
@@ -303,26 +305,28 @@
 {
 	unsigned int cpu = smp_processor_id();
 	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, cpu);
+	int delay = dbs_tuners_ins.sampling_rate_jiffies -
+		(jiffies % dbs_tuners_ins.sampling_rate_jiffies);
 
 	dbs_check_cpu(dbs_info);
-	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work,
-			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
+	/* We want all CPUs to do sampling nearly on same jiffy */
+	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work, delay);
 }
 
 static inline void dbs_timer_init(unsigned int cpu)
 {
 	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, cpu);
+	int delay = dbs_tuners_ins.sampling_rate_jiffies -
+		(jiffies % dbs_tuners_ins.sampling_rate_jiffies);
 
 	INIT_WORK(&dbs_info->work, do_dbs_timer, 0);
-	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work,
-			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
-	return;
+	/* We want all CPUs to do sampling nearly on same jiffy */
+	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work, delay);
 }
 
 static inline void dbs_timer_exit(unsigned int cpu)
 {
 	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, cpu);
-
 	cancel_rearming_delayed_workqueue(kondemand_wq, &dbs_info->work);
 }
