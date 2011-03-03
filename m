From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 3/4] cpufreq: Remove old, deprecated per cpu ondemand/conservative sysfs files
Date: Thu,  3 Mar 2011 21:31:26 +0100
Message-ID: <1299184287-18854-4-git-send-email-trenn@suse.de>
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

Marked deprecated for quite a whilte now...

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: davej@codemonkey.org.uk
CC: cpufreq@vger.kernel.org
---
 drivers/cpufreq/cpufreq_conservative.c |   74 --------------------------------
 drivers/cpufreq/cpufreq_ondemand.c     |   67 -----------------------------
 include/linux/cpufreq.h                |    9 ----
 3 files changed, 0 insertions(+), 150 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index f3a9a72..77cadf4 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -186,31 +186,6 @@ show_one(down_threshold, down_threshold);
 show_one(ignore_nice_load, ignore_nice);
 show_one(freq_step, freq_step);
 
-/*** delete after deprecation time ***/
-#define DEPRECATION_MSG(file_name)					\
-	printk_once(KERN_INFO "CPUFREQ: Per core conservative sysfs "	\
-		"interface is deprecated - " #file_name "\n");
-
-#define show_one_old(file_name)						\
-static ssize_t show_##file_name##_old					\
-(struct cpufreq_policy *unused, char *buf)				\
-{									\
-	printk_once(KERN_INFO "CPUFREQ: Per core conservative sysfs "	\
-		"interface is deprecated - " #file_name "\n");		\
-	return show_##file_name(NULL, NULL, buf);			\
-}
-show_one_old(sampling_rate);
-show_one_old(sampling_down_factor);
-show_one_old(up_threshold);
-show_one_old(down_threshold);
-show_one_old(ignore_nice_load);
-show_one_old(freq_step);
-show_one_old(sampling_rate_min);
-
-cpufreq_freq_attr_ro_old(sampling_rate_min);
-
-/*** delete after deprecation time ***/
-
 static ssize_t store_sampling_down_factor(struct kobject *a,
 					  struct attribute *b,
 					  const char *buf, size_t count)
@@ -368,48 +343,6 @@ static struct attribute_group dbs_attr_group = {
 	.name = "conservative",
 };
 
-/*** delete after deprecation time ***/
-
-#define write_one_old(file_name)					\
-static ssize_t store_##file_name##_old					\
-(struct cpufreq_policy *unused, const char *buf, size_t count)		\
-{									\
-	printk_once(KERN_INFO "CPUFREQ: Per core conservative sysfs "	\
-		"interface is deprecated - " #file_name "\n");	\
-	return store_##file_name(NULL, NULL, buf, count);		\
-}
-write_one_old(sampling_rate);
-write_one_old(sampling_down_factor);
-write_one_old(up_threshold);
-write_one_old(down_threshold);
-write_one_old(ignore_nice_load);
-write_one_old(freq_step);
-
-cpufreq_freq_attr_rw_old(sampling_rate);
-cpufreq_freq_attr_rw_old(sampling_down_factor);
-cpufreq_freq_attr_rw_old(up_threshold);
-cpufreq_freq_attr_rw_old(down_threshold);
-cpufreq_freq_attr_rw_old(ignore_nice_load);
-cpufreq_freq_attr_rw_old(freq_step);
-
-static struct attribute *dbs_attributes_old[] = {
-	&sampling_rate_min_old.attr,
-	&sampling_rate_old.attr,
-	&sampling_down_factor_old.attr,
-	&up_threshold_old.attr,
-	&down_threshold_old.attr,
-	&ignore_nice_load_old.attr,
-	&freq_step_old.attr,
-	NULL
-};
-
-static struct attribute_group dbs_attr_group_old = {
-	.attrs = dbs_attributes_old,
-	.name = "conservative",
-};
-
-/*** delete after deprecation time ***/
-
 /************************** sysfs end ************************/
 
 static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
@@ -586,12 +519,6 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 
 		mutex_lock(&dbs_mutex);
 
-		rc = sysfs_create_group(&policy->kobj, &dbs_attr_group_old);
-		if (rc) {
-			mutex_unlock(&dbs_mutex);
-			return rc;
-		}
-
 		for_each_cpu(j, policy->cpus) {
 			struct cpu_dbs_info_s *j_dbs_info;
 			j_dbs_info = &per_cpu(cs_cpu_dbs_info, j);
@@ -654,7 +581,6 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 		dbs_timer_exit(this_dbs_info);
 
 		mutex_lock(&dbs_mutex);
-		sysfs_remove_group(&policy->kobj, &dbs_attr_group_old);
 		dbs_enable--;
 		mutex_destroy(&this_dbs_info->timer_mutex);
 
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index efb35ce..eef3a38 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -259,30 +259,6 @@ show_one(sampling_down_factor, sampling_down_factor);
 show_one(ignore_nice_load, ignore_nice);
 show_one(powersave_bias, powersave_bias);
 
-/*** delete after deprecation time ***/
-
-#define DEPRECATION_MSG(file_name)					\
-	printk_once(KERN_INFO "CPUFREQ: Per core ondemand sysfs "	\
-		    "interface is deprecated - " #file_name "\n");
-
-#define show_one_old(file_name)						\
-static ssize_t show_##file_name##_old					\
-(struct cpufreq_policy *unused, char *buf)				\
-{									\
-	printk_once(KERN_INFO "CPUFREQ: Per core ondemand sysfs "	\
-		    "interface is deprecated - " #file_name "\n");	\
-	return show_##file_name(NULL, NULL, buf);			\
-}
-show_one_old(sampling_rate);
-show_one_old(up_threshold);
-show_one_old(ignore_nice_load);
-show_one_old(powersave_bias);
-show_one_old(sampling_rate_min);
-
-cpufreq_freq_attr_ro_old(sampling_rate_min);
-
-/*** delete after deprecation time ***/
-
 static ssize_t store_sampling_rate(struct kobject *a, struct attribute *b,
 				   const char *buf, size_t count)
 {
@@ -439,42 +415,6 @@ static struct attribute_group dbs_attr_group = {
 	.name = "ondemand",
 };
 
-/*** delete after deprecation time ***/
-
-#define write_one_old(file_name)					\
-static ssize_t store_##file_name##_old					\
-(struct cpufreq_policy *unused, const char *buf, size_t count)		\
-{									\
-       printk_once(KERN_INFO "CPUFREQ: Per core ondemand sysfs "	\
-		   "interface is deprecated - " #file_name "\n");	\
-       return store_##file_name(NULL, NULL, buf, count);		\
-}
-write_one_old(sampling_rate);
-write_one_old(up_threshold);
-write_one_old(ignore_nice_load);
-write_one_old(powersave_bias);
-
-cpufreq_freq_attr_rw_old(sampling_rate);
-cpufreq_freq_attr_rw_old(up_threshold);
-cpufreq_freq_attr_rw_old(ignore_nice_load);
-cpufreq_freq_attr_rw_old(powersave_bias);
-
-static struct attribute *dbs_attributes_old[] = {
-       &sampling_rate_min_old.attr,
-       &sampling_rate_old.attr,
-       &up_threshold_old.attr,
-       &ignore_nice_load_old.attr,
-       &powersave_bias_old.attr,
-       NULL
-};
-
-static struct attribute_group dbs_attr_group_old = {
-       .attrs = dbs_attributes_old,
-       .name = "ondemand",
-};
-
-/*** delete after deprecation time ***/
-
 /************************** sysfs end ************************/
 
 static void dbs_freq_increase(struct cpufreq_policy *p, unsigned int freq)
@@ -717,12 +657,6 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 
 		mutex_lock(&dbs_mutex);
 
-		rc = sysfs_create_group(&policy->kobj, &dbs_attr_group_old);
-		if (rc) {
-			mutex_unlock(&dbs_mutex);
-			return rc;
-		}
-
 		dbs_enable++;
 		for_each_cpu(j, policy->cpus) {
 			struct cpu_dbs_info_s *j_dbs_info;
@@ -775,7 +709,6 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 		dbs_timer_exit(this_dbs_info);
 
 		mutex_lock(&dbs_mutex);
-		sysfs_remove_group(&policy->kobj, &dbs_attr_group_old);
 		mutex_destroy(&this_dbs_info->timer_mutex);
 		dbs_enable--;
 		mutex_unlock(&dbs_mutex);
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index c3e9de8..f2fe598 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -281,19 +281,10 @@ __ATTR(_name, 0444, show_##_name, NULL)
 static struct freq_attr _name =			\
 __ATTR(_name, _perm, show_##_name, NULL)
 
-#define cpufreq_freq_attr_ro_old(_name)		\
-static struct freq_attr _name##_old =		\
-__ATTR(_name, 0444, show_##_name##_old, NULL)
-
 #define cpufreq_freq_attr_rw(_name)		\
 static struct freq_attr _name =			\
 __ATTR(_name, 0644, show_##_name, store_##_name)
 
-#define cpufreq_freq_attr_rw_old(_name)		\
-static struct freq_attr _name##_old =		\
-__ATTR(_name, 0644, show_##_name##_old, store_##_name##_old)
-
-
 struct global_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct kobject *kobj,
-- 
1.7.3.4

