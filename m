From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/4] cpufreq: Remove deprecated sysfs file sampling_rate_max
Date: Thu,  3 Mar 2011 21:31:25 +0100
Message-ID: <1299184287-18854-3-git-send-email-trenn@suse.de>
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
 drivers/cpufreq/cpufreq_conservative.c |   13 -------------
 drivers/cpufreq/cpufreq_ondemand.c     |   13 -------------
 2 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 526bfbf..f3a9a72 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -164,21 +164,12 @@ static struct notifier_block dbs_cpufreq_notifier_block = {
 };
 
 /************************** sysfs interface ************************/
-static ssize_t show_sampling_rate_max(struct kobject *kobj,
-				      struct attribute *attr, char *buf)
-{
-	printk_once(KERN_INFO "CPUFREQ: conservative sampling_rate_max "
-		    "sysfs file is deprecated - used by: %s\n", current->comm);
-	return sprintf(buf, "%u\n", -1U);
-}
-
 static ssize_t show_sampling_rate_min(struct kobject *kobj,
 				      struct attribute *attr, char *buf)
 {
 	return sprintf(buf, "%u\n", min_sampling_rate);
 }
 
-define_one_global_ro(sampling_rate_max);
 define_one_global_ro(sampling_rate_min);
 
 /* cpufreq_conservative Governor Tunables */
@@ -215,10 +206,8 @@ show_one_old(down_threshold);
 show_one_old(ignore_nice_load);
 show_one_old(freq_step);
 show_one_old(sampling_rate_min);
-show_one_old(sampling_rate_max);
 
 cpufreq_freq_attr_ro_old(sampling_rate_min);
-cpufreq_freq_attr_ro_old(sampling_rate_max);
 
 /*** delete after deprecation time ***/
 
@@ -364,7 +353,6 @@ define_one_global_rw(ignore_nice_load);
 define_one_global_rw(freq_step);
 
 static struct attribute *dbs_attributes[] = {
-	&sampling_rate_max.attr,
 	&sampling_rate_min.attr,
 	&sampling_rate.attr,
 	&sampling_down_factor.attr,
@@ -405,7 +393,6 @@ cpufreq_freq_attr_rw_old(ignore_nice_load);
 cpufreq_freq_attr_rw_old(freq_step);
 
 static struct attribute *dbs_attributes_old[] = {
-	&sampling_rate_max_old.attr,
 	&sampling_rate_min_old.attr,
 	&sampling_rate_old.attr,
 	&sampling_down_factor_old.attr,
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index c631f27..efb35ce 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -237,21 +237,12 @@ static void ondemand_powersave_bias_init(void)
 
 /************************** sysfs interface ************************/
 
-static ssize_t show_sampling_rate_max(struct kobject *kobj,
-				      struct attribute *attr, char *buf)
-{
-	printk_once(KERN_INFO "CPUFREQ: ondemand sampling_rate_max "
-	       "sysfs file is deprecated - used by: %s\n", current->comm);
-	return sprintf(buf, "%u\n", -1U);
-}
-
 static ssize_t show_sampling_rate_min(struct kobject *kobj,
 				      struct attribute *attr, char *buf)
 {
 	return sprintf(buf, "%u\n", min_sampling_rate);
 }
 
-define_one_global_ro(sampling_rate_max);
 define_one_global_ro(sampling_rate_min);
 
 /* cpufreq_ondemand Governor Tunables */
@@ -287,10 +278,8 @@ show_one_old(up_threshold);
 show_one_old(ignore_nice_load);
 show_one_old(powersave_bias);
 show_one_old(sampling_rate_min);
-show_one_old(sampling_rate_max);
 
 cpufreq_freq_attr_ro_old(sampling_rate_min);
-cpufreq_freq_attr_ro_old(sampling_rate_max);
 
 /*** delete after deprecation time ***/
 
@@ -435,7 +424,6 @@ define_one_global_rw(ignore_nice_load);
 define_one_global_rw(powersave_bias);
 
 static struct attribute *dbs_attributes[] = {
-	&sampling_rate_max.attr,
 	&sampling_rate_min.attr,
 	&sampling_rate.attr,
 	&up_threshold.attr,
@@ -472,7 +460,6 @@ cpufreq_freq_attr_rw_old(ignore_nice_load);
 cpufreq_freq_attr_rw_old(powersave_bias);
 
 static struct attribute *dbs_attributes_old[] = {
-       &sampling_rate_max_old.attr,
        &sampling_rate_min_old.attr,
        &sampling_rate_old.attr,
        &up_threshold_old.attr,
-- 
1.7.3.4

