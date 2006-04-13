From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] If max_freq got reduced (e.g. by _PPC) a write to sysfs
	scaling_governor let cpufreq core stuck at low max_freq for ever
Date: Thu, 13 Apr 2006 15:14:04 +0200
Message-ID: <200604131514.04630.trenn@suse.de>
References: <200604041453.25890.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200604041453.25890.trenn@suse.de>
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
To: cpufreq@lists.linux.org.uk
Cc: Dave Jones <davej@redhat.com>

The previous patch had bugs (locking and refcount).

This one could also be related to the latest DELL reports.
But they only slip into this if a user prog (e.g. powersave daemon does when
AC got (un) plugged due to a scheme change) echos something to 
/sys/../cpufreq/scaling_governor
while the frequencies got limited by BIOS.

This one works:

Subject: Max freq stucks at low freq if reduced by _PPC and sysfs gov access

The problem is reproducable by(if machine is limiting freqs via BIOS):
 - Unplugging AC -> max freq gets limited
 - echo ${governor} >/sys/.../cpufreq/scaling_governor (policy->user_data.max
   gets overridden with policy->max and will never come up again.)

This patch exchanged the cpufreq_set_policy call to __cpufreq_set_policy and
duplicated it's functionality but did not override user_data.max.
The same happens with overridding min/max values. If freqs are limited and
you override the min freq value, the max freq global value will also get
stuck to the limited freq, even if BIOS allows all freqs again.
Last scenario does only happen if BIOS does not reduce the frequency
to the lowest value (should never happen, just for correctness...)

 drivers/cpufreq/cpufreq.c |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

Signed-off-by: Thomas Renninger <trenn@suse.de>

Index: linux-2.6.16/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.16.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.16/drivers/cpufreq/cpufreq.c
@@ -350,6 +350,8 @@ show_one(scaling_min_freq, min);
 show_one(scaling_max_freq, max);
 show_one(scaling_cur_freq, cur);
 
+static int __cpufreq_set_policy(struct cpufreq_policy *data, struct cpufreq_policy *policy);
+
 /**
  * cpufreq_per_cpu_attr_write() / store_##file_name() - sysfs write access
  */
@@ -368,7 +370,10 @@ static ssize_t store_##file_name					\
 	if (ret != 1)							\
 		return -EINVAL;						\
 									\
-	ret = cpufreq_set_policy(&new_policy);				\
+	mutex_lock(&policy->lock);					\
+	ret = __cpufreq_set_policy(policy, &new_policy);		\
+	policy->user_policy.object = policy->object;			\
+	mutex_unlock(&policy->lock);					\
 									\
 	return ret ? ret : count;					\
 }
@@ -424,7 +429,15 @@ static ssize_t store_scaling_governor (s
 	if (cpufreq_parse_governor(str_governor, &new_policy.policy, &new_policy.governor))
 		return -EINVAL;
 
-	ret = cpufreq_set_policy(&new_policy);
+	/* Do not use cpufreq_set_policy here or the user_policy.max
+	   will be wrongly overridden */
+	mutex_lock(&policy->lock);
+	ret = __cpufreq_set_policy(policy, &new_policy);
+
+	policy->user_policy.policy = policy->policy;
+	policy->user_policy.governor = policy->governor;
+	mutex_unlock(&policy->lock);
+
 	return ret ? ret : count;
 }
