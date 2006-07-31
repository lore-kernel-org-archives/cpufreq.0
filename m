From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: [PATCH 1/2] ondemand: updated tune for hardware coordination
Date: Mon, 31 Jul 2006 22:25:20 +0400
Message-ID: <44CE4B10.6080506@linux.intel.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Brown, Len" <len.brown@intel.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk


 cpufreq_ondemand.c |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

Try to make dbs_check_cpu() call on all CPUs at the same jiffy.
This will help when multiple cores share P-states via Hardware Coordination.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Index: linux-2.6.15.1/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.15.1.orig/drivers/cpufreq/cpufreq_ondemand.c	2006-07-31 21:43:55.000000000 +0400
+++ linux-2.6.15.1/drivers/cpufreq/cpufreq_ondemand.c	2006-07-31 21:51:37.000000000 +0400
@@ -305,6 +305,9 @@
 {
 	unsigned int cpu = smp_processor_id();
 	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, cpu);
+	/* We want all CPUs to do sampling nearly on same jiffy */
+	int delay = usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
+	delay -= jiffies % delay;
 
 	if (!dbs_info->enable)
 		return;
@@ -312,18 +315,18 @@
 	lock_cpu_hotplug();
 	dbs_check_cpu(dbs_info);
 	unlock_cpu_hotplug();
-	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work,
-			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
+	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work, delay);
 }
 
 static inline void dbs_timer_init(unsigned int cpu)
 {
 	struct cpu_dbs_info_s *dbs_info = &per_cpu(cpu_dbs_info, cpu);
+	/* We want all CPUs to do sampling nearly on same jiffy */
+	int delay = usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
+	delay -= jiffies % delay;
 
 	INIT_WORK(&dbs_info->work, do_dbs_timer, 0);
-	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work,
-			usecs_to_jiffies(dbs_tuners_ins.sampling_rate));
-	return;
+	queue_delayed_work_on(cpu, kondemand_wq, &dbs_info->work, delay);
 }
 
 static inline void dbs_timer_exit(struct cpu_dbs_info_s *dbs_info)
