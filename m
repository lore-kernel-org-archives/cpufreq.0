From: <puneets@nvidia.com>
Subject: [PATCH] cpufreq: interface for setting governor for a cpu
Date: Fri, 11 May 2012 18:20:28 +0530
Message-ID: <1336740628-917-1-git-send-email-puneets@nvidia.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davej@redhat.com, Puneet Saxena <puneets@nvidia.com>

From: Puneet Saxena <puneets@nvidia.com>

This implementation sets governor for a cpu using existing
cpufreq interfaces.

Signed-off-by: Puneet Saxena <puneets@nvidia.com>
---

This is applicable for the usecase where user wants to change
the governor inside kernel. Earlier if driver wants to change
cpu governor, it needs to write in userspace sysfs "store"
entry, which calls "store_scaling_governor()", a kernel interface.
The implementation avoids the unwanted flow from KENREL-->
USER-->KERNEL.

 drivers/cpufreq/cpufreq.c |   50 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/cpufreq.h   |    1 +
 2 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 3acc428..5bbe8c3 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1785,6 +1785,56 @@ no_policy:
 }
 EXPORT_SYMBOL(cpufreq_update_policy);
 
+/*
+ *	cpufreq_set_gov - set governor for a cpu
+ *	@cpu: CPU whose governor needs to be changed
+ *	@target_gov: new governor to be set
+ */
+int cpufreq_set_gov(char *target_gov, unsigned int cpu)
+{
+	int ret = 0;
+	struct cpufreq_policy new_policy;
+	struct cpufreq_policy *cur_policy;
+
+	if (target_gov == NULL)
+		return -EINVAL;
+
+	/* Get current governer */
+	cur_policy = cpufreq_cpu_get(cpu);
+	if (!cur_policy)
+		return -EINVAL;
+
+	new_policy = *cur_policy;
+	if (!strncmp(cur_policy->governor->name, target_gov,
+			strlen(target_gov))) {
+		/* Target governer & current governer is same */
+		ret = -EINVAL;
+		goto err_out;
+	} else {
+		if (cpufreq_parse_governor(target_gov, &new_policy.policy,
+				&new_policy.governor)) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+
+		if (lock_policy_rwsem_write(cur_policy->cpu) < 0) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+
+		ret = __cpufreq_set_policy(cur_policy, &new_policy);
+
+		cur_policy->user_policy.policy = cur_policy->policy;
+		cur_policy->user_policy.governor = cur_policy->governor;
+
+		unlock_policy_rwsem_write(cur_policy->cpu);
+	}
+err_out:
+	cpufreq_cpu_put(cur_policy);
+	return ret;
+}
+EXPORT_SYMBOL(cpufreq_set_gov);
+
 static int __cpuinit cpufreq_cpu_callback(struct notifier_block *nfb,
 					unsigned long action, void *hcpu)
 {
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index c6126b9..09b8ea9 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -310,6 +310,7 @@ __ATTR(_name, 0644, show_##_name, store_##_name)
  *********************************************************************/
 int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu);
 int cpufreq_update_policy(unsigned int cpu);
+int cpufreq_set_gov(char *target_gov, unsigned int cpu);
 
 #ifdef CONFIG_CPU_FREQ
 /* query the current CPU frequency (in kHz). If zero, cpufreq couldn't detect it */
-- 
1.7.1

