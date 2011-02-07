From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] CPUFREQ : calculate delay after dbs_check_cpu
Date: Mon, 7 Feb 2011 17:14:25 +0100
Message-ID: <AANLkTiknsVjXMPA6wkcXmd4g4Enkb2oXadk1iYj0o3sy@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Patch Tracking <patches@linaro.org>

calculate ondemand delay after dbs_check_cpu call because it can
modify rate_mult value

use freq_lo_jiffies value for the sub sample period of powersave_bias mode

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/cpufreq/cpufreq_ondemand.c |   20 +++++++++++++-------
 1 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_ondemand.c
b/drivers/cpufreq/cpufreq_ondemand.c
index 58aa85e..44c2dba 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -641,13 +641,7 @@ static void do_dbs_timer(struct work_struct *work)
 		container_of(work, struct cpu_dbs_info_s, work.work);
 	unsigned int cpu = dbs_info->cpu;
 	int sample_type = dbs_info->sample_type;
-
-	/* We want all CPUs to do sampling nearly on same jiffy */
-	int delay = usecs_to_jiffies(dbs_tuners_ins.sampling_rate
-		* dbs_info->rate_mult);
-
-	if (num_online_cpus() > 1)
-		delay -= jiffies % delay;
+	int delay;

 	mutex_lock(&dbs_info->timer_mutex);

@@ -660,10 +654,22 @@ static void do_dbs_timer(struct work_struct *work)
 			/* Setup timer for SUB_SAMPLE */
 			dbs_info->sample_type = DBS_SUB_SAMPLE;
 			delay = dbs_info->freq_hi_jiffies;
+		} else {
+			/* We want all CPUs to do sampling nearly on
+			 * same jiffy
+			 */
+			delay = usecs_to_jiffies(dbs_tuners_ins.sampling_rate
+				* dbs_info->rate_mult);
+
+			if (num_online_cpus() > 1)
+				delay -= jiffies % delay;
+
 		}
+
 	} else {
 		__cpufreq_driver_target(dbs_info->cur_policy,
 			dbs_info->freq_lo, CPUFREQ_RELATION_H);
+		delay = dbs_info->freq_lo_jiffies;
 	}
 	schedule_delayed_work_on(cpu, &dbs_info->work, delay);
 	mutex_unlock(&dbs_info->timer_mutex);
-- 
1.7.1
