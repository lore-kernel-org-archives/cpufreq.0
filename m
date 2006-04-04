From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH] If max_freq got reduced (e.g. by _PPC) a write to sysfs
	scaling_governor let cpufreq core stuck at low max_freq for ever
Date: Tue, 4 Apr 2006 14:53:25 +0200
Message-ID: <200604041453.25890.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: Dave Jones <davej@redhat.com>

Subject: Max freq stucks at low freq if reduced by _PPC and sysfs gov access

The problem is reproducable by(if machine is limiting freqs via BIOS):
 - Unplugging AC -> max freq gets limited
 - echo ${governor} >/sys/.../cpufreq/scaling_governor (policy->user_data.max
   gets overridden with policy->max and will never come up again.)

This patch exchanges the cpufreq_set_policy call to __cpufreq_set_policy 
in store_scaling_governor and duplicates most of it's functionality but does
not override user_data.max.

 drivers/cpufreq/cpufreq.c |   29 ++++++++++++++++++++++-------
 1 files changed, 22 insertions(+), 7 deletions(-)

Signed-off-by: Thomas Renninger <trenn@suse.de>

Index: linux-2.6.16/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.16.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.16/drivers/cpufreq/cpufreq.c
@@ -402,7 +402,7 @@ static ssize_t show_scaling_governor (st
 	return -EINVAL;
 }
 
-
+static int __cpufreq_set_policy(struct cpufreq_policy *data, struct cpufreq_policy *policy);
 /**
  * store_scaling_governor - store policy for the specified CPU
  */
@@ -413,19 +413,34 @@ static ssize_t store_scaling_governor (s
 	char	str_governor[16];
 	struct cpufreq_policy new_policy;
 
+	mutex_lock(&policy->lock);
 	ret = cpufreq_get_policy(&new_policy, policy->cpu);
 	if (ret)
-		return ret;
+		goto error;
 
 	ret = sscanf (buf, "%15s", str_governor);
-	if (ret != 1)
-		return -EINVAL;
+	if (ret != 1){
+		ret =  -EINVAL;
+		goto error;
+	}
 
-	if (cpufreq_parse_governor(str_governor, &new_policy.policy, &new_policy.governor))
-		return -EINVAL;
+	if (cpufreq_parse_governor(str_governor, &new_policy.policy, &new_policy.governor)){
+		ret =  -EINVAL;
+		goto error;
+	}
+	/* Do not use cpufreq_set_policy here or the user_policy.max
+	   will be wrongly overridden */
+	ret = __cpufreq_set_policy(policy, &new_policy);
+
+	policy->user_policy.policy = policy->policy;
+	policy->user_policy.governor = policy->governor;
+	mutex_unlock(&policy->lock);
+	cpufreq_cpu_put(policy);
 
-	ret = cpufreq_set_policy(&new_policy);
 	return ret ? ret : count;
+ error:
+	mutex_unlock(&policy->lock);
+	return ret;
 }
 
 /**
