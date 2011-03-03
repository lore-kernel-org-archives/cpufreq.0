From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 4/4] cpufreq: Remove unneeded locks
Date: Thu,  3 Mar 2011 21:31:27 +0100
Message-ID: <1299184287-18854-5-git-send-email-trenn@suse.de>
References: <1299184287-18854-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1299184287-18854-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

There cannot be any concurrent access to these through
different cpu sysfs files anymore, because these tunables
are now all global (not per cpu).

I still have some doubts whether some of these locks
were needed at all. Anyway, let's get rid of them.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: davej@codemonkey.org.uk
CC: cpufreq@vger.kernel.org
---
 drivers/cpufreq/cpufreq_conservative.c |   34 ++++---------------------------
 drivers/cpufreq/cpufreq_ondemand.c     |   25 +----------------------
 2 files changed, 6 insertions(+), 53 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 77cadf4..6bc972b 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -76,8 +76,7 @@ static DEFINE_PER_CPU(struct cpu_dbs_info_s, cs_cpu_dbs_info);
 static unsigned int dbs_enable;	/* number of CPUs using this policy */
 
 /*
- * dbs_mutex protects data in dbs_tuners_ins from concurrent changes on
- * different CPUs. It protects dbs_enable in governor start/stop.
+ * dbs_mutex protects dbs_enable in governor start/stop.
  */
 static DEFINE_MUTEX(dbs_mutex);
 
@@ -197,10 +196,7 @@ static ssize_t store_sampling_down_factor(struct kobject *a,
 	if (ret != 1 || input > MAX_SAMPLING_DOWN_FACTOR || input < 1)
 		return -EINVAL;
 
-	mutex_lock(&dbs_mutex);
 	dbs_tuners_ins.sampling_down_factor = input;
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
@@ -214,10 +210,7 @@ static ssize_t store_sampling_rate(struct kobject *a, struct attribute *b,
 	if (ret != 1)
 		return -EINVAL;
 
-	mutex_lock(&dbs_mutex);
 	dbs_tuners_ins.sampling_rate = max(input, min_sampling_rate);
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
@@ -228,16 +221,11 @@ static ssize_t store_up_threshold(struct kobject *a, struct attribute *b,
 	int ret;
 	ret = sscanf(buf, "%u", &input);
 
-	mutex_lock(&dbs_mutex);
 	if (ret != 1 || input > 100 ||
-			input <= dbs_tuners_ins.down_threshold) {
-		mutex_unlock(&dbs_mutex);
+			input <= dbs_tuners_ins.down_threshold)
 		return -EINVAL;
-	}
 
 	dbs_tuners_ins.up_threshold = input;
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
@@ -248,17 +236,12 @@ static ssize_t store_down_threshold(struct kobject *a, struct attribute *b,
 	int ret;
 	ret = sscanf(buf, "%u", &input);
 
-	mutex_lock(&dbs_mutex);
 	/* cannot be lower than 11 otherwise freq will not fall */
 	if (ret != 1 || input < 11 || input > 100 ||
-			input >= dbs_tuners_ins.up_threshold) {
-		mutex_unlock(&dbs_mutex);
+			input >= dbs_tuners_ins.up_threshold)
 		return -EINVAL;
-	}
 
 	dbs_tuners_ins.down_threshold = input;
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
@@ -277,11 +260,9 @@ static ssize_t store_ignore_nice_load(struct kobject *a, struct attribute *b,
 	if (input > 1)
 		input = 1;
 
-	mutex_lock(&dbs_mutex);
-	if (input == dbs_tuners_ins.ignore_nice) { /* nothing to do */
-		mutex_unlock(&dbs_mutex);
+	if (input == dbs_tuners_ins.ignore_nice) /* nothing to do */
 		return count;
-	}
+
 	dbs_tuners_ins.ignore_nice = input;
 
 	/* we need to re-evaluate prev_cpu_idle */
@@ -293,8 +274,6 @@ static ssize_t store_ignore_nice_load(struct kobject *a, struct attribute *b,
 		if (dbs_tuners_ins.ignore_nice)
 			dbs_info->prev_cpu_nice = kstat_cpu(j).cpustat.nice;
 	}
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
@@ -313,10 +292,7 @@ static ssize_t store_freq_step(struct kobject *a, struct attribute *b,
 
 	/* no need to test here if freq_step is zero as the user might actually
 	 * want this, they would be crazy though :) */
-	mutex_lock(&dbs_mutex);
 	dbs_tuners_ins.freq_step = input;
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index eef3a38..0acae54 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -99,8 +99,7 @@ static DEFINE_PER_CPU(struct cpu_dbs_info_s, od_cpu_dbs_info);
 static unsigned int dbs_enable;	/* number of CPUs using this policy */
 
 /*
- * dbs_mutex protects data in dbs_tuners_ins from concurrent changes on
- * different CPUs. It protects dbs_enable in governor start/stop.
+ * dbs_mutex protects dbs_enable in governor start/stop.
  */
 static DEFINE_MUTEX(dbs_mutex);
 
@@ -267,11 +266,7 @@ static ssize_t store_sampling_rate(struct kobject *a, struct attribute *b,
 	ret = sscanf(buf, "%u", &input);
 	if (ret != 1)
 		return -EINVAL;
-
-	mutex_lock(&dbs_mutex);
 	dbs_tuners_ins.sampling_rate = max(input, min_sampling_rate);
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
@@ -284,11 +279,7 @@ static ssize_t store_io_is_busy(struct kobject *a, struct attribute *b,
 	ret = sscanf(buf, "%u", &input);
 	if (ret != 1)
 		return -EINVAL;
-
-	mutex_lock(&dbs_mutex);
 	dbs_tuners_ins.io_is_busy = !!input;
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
@@ -303,11 +294,7 @@ static ssize_t store_up_threshold(struct kobject *a, struct attribute *b,
 			input < MIN_FREQUENCY_UP_THRESHOLD) {
 		return -EINVAL;
 	}
-
-	mutex_lock(&dbs_mutex);
 	dbs_tuners_ins.up_threshold = input;
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
@@ -320,7 +307,6 @@ static ssize_t store_sampling_down_factor(struct kobject *a,
 
 	if (ret != 1 || input > MAX_SAMPLING_DOWN_FACTOR || input < 1)
 		return -EINVAL;
-	mutex_lock(&dbs_mutex);
 	dbs_tuners_ins.sampling_down_factor = input;
 
 	/* Reset down sampling multiplier in case it was active */
@@ -329,8 +315,6 @@ static ssize_t store_sampling_down_factor(struct kobject *a,
 		dbs_info = &per_cpu(od_cpu_dbs_info, j);
 		dbs_info->rate_mult = 1;
 	}
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
@@ -349,9 +333,7 @@ static ssize_t store_ignore_nice_load(struct kobject *a, struct attribute *b,
 	if (input > 1)
 		input = 1;
 
-	mutex_lock(&dbs_mutex);
 	if (input == dbs_tuners_ins.ignore_nice) { /* nothing to do */
-		mutex_unlock(&dbs_mutex);
 		return count;
 	}
 	dbs_tuners_ins.ignore_nice = input;
@@ -366,8 +348,6 @@ static ssize_t store_ignore_nice_load(struct kobject *a, struct attribute *b,
 			dbs_info->prev_cpu_nice = kstat_cpu(j).cpustat.nice;
 
 	}
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
@@ -384,11 +364,8 @@ static ssize_t store_powersave_bias(struct kobject *a, struct attribute *b,
 	if (input > 1000)
 		input = 1000;
 
-	mutex_lock(&dbs_mutex);
 	dbs_tuners_ins.powersave_bias = input;
 	ondemand_powersave_bias_init();
-	mutex_unlock(&dbs_mutex);
-
 	return count;
 }
 
-- 
1.7.3.4

