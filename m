From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH] cpufreq: ondemand: handle SW coordinated CPUs
Date: Fri, 9 Mar 2012 17:40:16 +0100
Message-ID: <1331311216-31831-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org
Cc: Rickard Andersson <rickard.andersson@stericsson.com>, Linus Walleij <linus.walleij@linaro.org>

From: Rickard Andersson <rickard.andersson@stericsson.com>

This patch fixes a bug that occured when we had load on
a secondary CPU and the primary CPU was sleeping. Only
one sampling timer was spawned and it was spawned as a
deferred timer on the primary CPU, so when a secondary CPU
had a change in load this was not detected by the ondemand
governor.

This patch make sure that deferred timers are run on all
CPUs in the case of software controlled CPUs that run on
the same frequency.

Signed-off-by: Rickard Andersson <rickard.andersson@stericsson.com>
Reviewed-by: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
Reviewed-by: Jonas Aberg <jonas.aberg@stericsson.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/cpufreq/cpufreq_ondemand.c |  158 +++++++++++++++++++++++++++++++-----
 1 files changed, 136 insertions(+), 22 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index c3e0652..7231ed8 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -79,7 +79,6 @@ struct cpu_dbs_info_s {
 	cputime64_t prev_cpu_wall;
 	cputime64_t prev_cpu_nice;
 	struct cpufreq_policy *cur_policy;
-	struct delayed_work work;
 	struct cpufreq_frequency_table *freq_table;
 	unsigned int freq_lo;
 	unsigned int freq_lo_jiffies;
@@ -95,8 +94,10 @@ struct cpu_dbs_info_s {
 	struct mutex timer_mutex;
 };
 static DEFINE_PER_CPU(struct cpu_dbs_info_s, od_cpu_dbs_info);
+static DEFINE_PER_CPU(struct delayed_work, ondemand_work);
 
 static unsigned int dbs_enable;	/* number of CPUs using this policy */
+static ktime_t time_stamp;
 
 /*
  * dbs_mutex protects dbs_enable in governor start/stop.
@@ -393,6 +394,26 @@ static struct attribute_group dbs_attr_group = {
 
 /************************** sysfs end ************************/
 
+static bool dbs_sw_coordinated_cpus(void)
+{
+	struct cpu_dbs_info_s *dbs_info;
+	struct cpufreq_policy *policy;
+	int i = 0;
+	int j;
+
+	dbs_info = &per_cpu(od_cpu_dbs_info, 0);
+	policy = dbs_info->cur_policy;
+
+	for_each_cpu(j, policy->cpus) {
+		i++;
+	}
+
+	if (i > 1)
+		return true; /* Dependant CPUs */
+	else
+		return false;
+}
+
 static void dbs_freq_increase(struct cpufreq_policy *p, unsigned int freq)
 {
 	if (dbs_tuners_ins.powersave_bias)
@@ -407,7 +428,6 @@ static void dbs_freq_increase(struct cpufreq_policy *p, unsigned int freq)
 static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
 {
 	unsigned int max_load_freq;
-
 	struct cpufreq_policy *policy;
 	unsigned int j;
 
@@ -542,20 +562,42 @@ static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
 
 static void do_dbs_timer(struct work_struct *work)
 {
-	struct cpu_dbs_info_s *dbs_info =
-		container_of(work, struct cpu_dbs_info_s, work.work);
-	unsigned int cpu = dbs_info->cpu;
-	int sample_type = dbs_info->sample_type;
-
+	struct cpu_dbs_info_s *dbs_info;
+	unsigned int cpu = smp_processor_id();
+	int sample_type;
 	int delay;
+	bool sample = true;
+
+	/* If SW dependant CPUs, use CPU 0 as leader */
+	if (dbs_sw_coordinated_cpus()) {
+
+		ktime_t time_now;
+		s64 delta_us;
+
+		dbs_info = &per_cpu(od_cpu_dbs_info, 0);
+		mutex_lock(&dbs_info->timer_mutex);
+
+		time_now = ktime_get();
+		delta_us = ktime_us_delta(time_now, time_stamp);
 
-	mutex_lock(&dbs_info->timer_mutex);
+		/* Do nothing if we recently have sampled */
+		if (delta_us < (s64)(dbs_tuners_ins.sampling_rate / 2))
+			sample = false;
+		else
+			time_stamp = time_now;
+	} else {
+		dbs_info = &per_cpu(od_cpu_dbs_info, cpu);
+		mutex_lock(&dbs_info->timer_mutex);
+	}
+
+	sample_type = dbs_info->sample_type;
 
 	/* Common NORMAL_SAMPLE setup */
 	dbs_info->sample_type = DBS_NORMAL_SAMPLE;
 	if (!dbs_tuners_ins.powersave_bias ||
 	    sample_type == DBS_NORMAL_SAMPLE) {
-		dbs_check_cpu(dbs_info);
+		if (sample)
+			dbs_check_cpu(dbs_info);
 		if (dbs_info->freq_lo) {
 			/* Setup timer for SUB_SAMPLE */
 			dbs_info->sample_type = DBS_SUB_SAMPLE;
@@ -571,15 +613,17 @@ static void do_dbs_timer(struct work_struct *work)
 				delay -= jiffies % delay;
 		}
 	} else {
-		__cpufreq_driver_target(dbs_info->cur_policy,
-			dbs_info->freq_lo, CPUFREQ_RELATION_H);
+		if (sample)
+			__cpufreq_driver_target(dbs_info->cur_policy,
+						dbs_info->freq_lo,
+						CPUFREQ_RELATION_H);
 		delay = dbs_info->freq_lo_jiffies;
 	}
-	schedule_delayed_work_on(cpu, &dbs_info->work, delay);
+	schedule_delayed_work_on(cpu, &per_cpu(ondemand_work, cpu), delay);
 	mutex_unlock(&dbs_info->timer_mutex);
 }
 
-static inline void dbs_timer_init(struct cpu_dbs_info_s *dbs_info)
+static inline void dbs_timer_init(struct cpu_dbs_info_s *dbs_info, int cpu)
 {
 	/* We want all CPUs to do sampling nearly on same jiffy */
 	int delay = usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
@@ -588,13 +632,18 @@ static inline void dbs_timer_init(struct cpu_dbs_info_s *dbs_info)
 		delay -= jiffies % delay;
 
 	dbs_info->sample_type = DBS_NORMAL_SAMPLE;
-	INIT_DELAYED_WORK_DEFERRABLE(&dbs_info->work, do_dbs_timer);
-	schedule_delayed_work_on(dbs_info->cpu, &dbs_info->work, delay);
+	cancel_delayed_work_sync(&per_cpu(ondemand_work, cpu));
+	schedule_delayed_work_on(cpu, &per_cpu(ondemand_work, cpu), delay);
+}
+
+static inline void dbs_timer_exit(int cpu)
+{
+	cancel_delayed_work_sync(&per_cpu(ondemand_work, cpu));
 }
 
-static inline void dbs_timer_exit(struct cpu_dbs_info_s *dbs_info)
+static void dbs_timer_exit_per_cpu(struct work_struct *dummy)
 {
-	cancel_delayed_work_sync(&dbs_info->work);
+	dbs_timer_exit(smp_processor_id());
 }
 
 /*
@@ -620,6 +669,42 @@ static int should_io_be_busy(void)
 	return 0;
 }
 
+static int __cpuinit cpu_callback(struct notifier_block *nfb,
+				  unsigned long action, void *hcpu)
+{
+	unsigned int cpu = (unsigned long)hcpu;
+	struct sys_device *sys_dev;
+	struct cpu_dbs_info_s *dbs_info;
+
+	if (dbs_sw_coordinated_cpus())
+		dbs_info = &per_cpu(od_cpu_dbs_info, 0);
+	else
+		dbs_info = &per_cpu(od_cpu_dbs_info, cpu);
+
+	sys_dev = get_cpu_sysdev(cpu);
+	if (sys_dev) {
+		switch (action) {
+		case CPU_ONLINE:
+		case CPU_ONLINE_FROZEN:
+			dbs_timer_init(dbs_info, cpu);
+			break;
+		case CPU_DOWN_PREPARE:
+		case CPU_DOWN_PREPARE_FROZEN:
+			dbs_timer_exit(cpu);
+			break;
+		case CPU_DOWN_FAILED:
+		case CPU_DOWN_FAILED_FROZEN:
+			dbs_timer_init(dbs_info, cpu);
+			break;
+		}
+	}
+	return NOTIFY_OK;
+}
+
+static struct notifier_block __refdata ondemand_cpu_notifier = {
+	.notifier_call = cpu_callback,
+};
+
 static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 				   unsigned int event)
 {
@@ -648,9 +733,13 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 			if (dbs_tuners_ins.ignore_nice)
 				j_dbs_info->prev_cpu_nice =
 						kcpustat_cpu(j).cpustat[CPUTIME_NICE];
+			mutex_init(&j_dbs_info->timer_mutex);
+			INIT_DELAYED_WORK_DEFERRABLE(&per_cpu(ondemand_work, j),
+						     do_dbs_timer);
+
+			j_dbs_info->rate_mult = 1;
 		}
 		this_dbs_info->cpu = cpu;
-		this_dbs_info->rate_mult = 1;
 		ondemand_powersave_bias_init_cpu(cpu);
 		/*
 		 * Start the timerschedule work, when this governor
@@ -680,21 +769,46 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 		}
 		mutex_unlock(&dbs_mutex);
 
-		mutex_init(&this_dbs_info->timer_mutex);
-		dbs_timer_init(this_dbs_info);
+		/* If SW coordinated CPUs then register notifier */
+		if (dbs_sw_coordinated_cpus()) {
+			register_hotcpu_notifier(&ondemand_cpu_notifier);
+
+			for_each_cpu(j, policy->cpus) {
+				struct cpu_dbs_info_s *j_dbs_info;
+
+				j_dbs_info = &per_cpu(od_cpu_dbs_info, 0);
+				dbs_timer_init(j_dbs_info, j);
+			}
+
+			/* Initiate timer time stamp */
+			time_stamp = ktime_get();
+
+
+		} else
+			dbs_timer_init(this_dbs_info, cpu);
 		break;
 
 	case CPUFREQ_GOV_STOP:
-		dbs_timer_exit(this_dbs_info);
+
+		dbs_timer_exit(cpu);
 
 		mutex_lock(&dbs_mutex);
 		mutex_destroy(&this_dbs_info->timer_mutex);
 		dbs_enable--;
 		mutex_unlock(&dbs_mutex);
-		if (!dbs_enable)
+		if (!dbs_enable) {
 			sysfs_remove_group(cpufreq_global_kobject,
 					   &dbs_attr_group);
 
+			if (dbs_sw_coordinated_cpus()) {
+				/*
+				 * Make sure all pending timers/works are
+				 * stopped.
+				 */
+				schedule_on_each_cpu(dbs_timer_exit_per_cpu);
+				unregister_hotcpu_notifier(&ondemand_cpu_notifier);
+			}
+		}
 		break;
 
 	case CPUFREQ_GOV_LIMITS:
-- 
1.7.8

