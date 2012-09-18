From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 3.6-rc6] cpufreq/powernow-k8: workqueue user shouldn't
 migrate the kworker to another CPU
Date: Tue, 18 Sep 2012 13:12:31 -0700
Message-ID: <20120918201231.GF8474@google.com>
References: <20120917201721.GJ18677@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=TY8RssQsQ+h064Si7OiWMxc5N8omUHD5hkX6Vz6xJdY=;
        b=K5Z0aaAOv30R9MdYwyJfTsok4Gi/lZlsZyuXvywoSg+PF5eGr070S3UHUQgLtqKzbU
         lP6C+DhCKxg96CeTj0FzQd6N29dtLLZPX9ZGPQ6rXgrsB2rRt5JjR0DL03BUp7AQ5sAi
         mcon9s4O4WR6g4c2JXXJbjT5dc4b7fuSCr/8YO89vvAaBFUG5zFPKsvBbecDRz7JRa9Z
         L3hO0RxK0ySEoRTT0dpGphZfNTuVS5K8M/dq68iVDyIFcStQhZfhCPd9ltcQOK1fh1ND
         2ONpKgLYXDpOcPOWvj5RMaoOKDnFpcKFZtzxJ1S9kqyj8WUtCm5aPeuyFNU2w7iG2Jql
         t5wg==
Content-Disposition: inline
In-Reply-To: <20120917201721.GJ18677@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Duncan <1i5t5.duncan@cox.net>, Andreas Herrmann <andreas.herrmann3@amd.com>

So, with work_on_cpu() reimplementation just posted[1], we can do the
following instead.  Functionally it's about the same but less ugly.
Ugly as it may be, I think the previous open coded version is better
suited as a fix and for -stable.  Thoughts?

Thanks.

[1] https://lkml.org/lkml/2012/9/18/430

 drivers/cpufreq/powernow-k8.c |   63 ++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index c0e8164..1a40935 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -35,7 +35,6 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/cpumask.h>
-#include <linux/sched.h>	/* for current / set_cpus_allowed() */
 #include <linux/io.h>
 #include <linux/delay.h>
 
@@ -1139,16 +1138,23 @@ static int transition_frequency_pstate(struct powernow_k8_data *data,
 	return res;
 }
 
-/* Driver entry point to switch to the target frequency */
-static int powernowk8_target(struct cpufreq_policy *pol,
-		unsigned targfreq, unsigned relation)
+struct powernowk8_target_arg {
+	struct cpufreq_policy		*pol;
+	unsigned			targfreq;
+	unsigned			relation;
+};
+
+static long powernowk8_target_fn(void *arg)
 {
-	cpumask_var_t oldmask;
+	struct powernowk8_target_arg *pta = arg;
+	struct cpufreq_policy *pol = pta->pol;
+	unsigned targfreq = pta->targfreq;
+	unsigned relation = pta->relation;
 	struct powernow_k8_data *data = per_cpu(powernow_data, pol->cpu);
 	u32 checkfid;
 	u32 checkvid;
 	unsigned int newstate;
-	int ret = -EIO;
+	int ret;
 
 	if (!data)
 		return -EINVAL;
@@ -1156,29 +1162,16 @@ static int powernowk8_target(struct cpufreq_policy *pol,
 	checkfid = data->currfid;
 	checkvid = data->currvid;
 
-	/* only run on specific CPU from here on. */
-	/* This is poor form: use a workqueue or smp_call_function_single */
-	if (!alloc_cpumask_var(&oldmask, GFP_KERNEL))
-		return -ENOMEM;
-
-	cpumask_copy(oldmask, tsk_cpus_allowed(current));
-	set_cpus_allowed_ptr(current, cpumask_of(pol->cpu));
-
-	if (smp_processor_id() != pol->cpu) {
-		printk(KERN_ERR PFX "limiting to cpu %u failed\n", pol->cpu);
-		goto err_out;
-	}
-
 	if (pending_bit_stuck()) {
 		printk(KERN_ERR PFX "failing targ, change pending bit set\n");
-		goto err_out;
+		return -EIO;
 	}
 
 	pr_debug("targ: cpu %d, %d kHz, min %d, max %d, relation %d\n",
 		pol->cpu, targfreq, pol->min, pol->max, relation);
 
 	if (query_current_values_with_pending_wait(data))
-		goto err_out;
+		return -EIO;
 
 	if (cpu_family != CPU_HW_PSTATE) {
 		pr_debug("targ: curr fid 0x%x, vid 0x%x\n",
@@ -1196,7 +1189,7 @@ static int powernowk8_target(struct cpufreq_policy *pol,
 
 	if (cpufreq_frequency_table_target(pol, data->powernow_table,
 				targfreq, relation, &newstate))
-		goto err_out;
+		return -EIO;
 
 	mutex_lock(&fidvid_mutex);
 
@@ -1209,9 +1202,8 @@ static int powernowk8_target(struct cpufreq_policy *pol,
 		ret = transition_frequency_fidvid(data, newstate);
 	if (ret) {
 		printk(KERN_ERR PFX "transition frequency failed\n");
-		ret = 1;
 		mutex_unlock(&fidvid_mutex);
-		goto err_out;
+		return 1;
 	}
 	mutex_unlock(&fidvid_mutex);
 
@@ -1220,12 +1212,25 @@ static int powernowk8_target(struct cpufreq_policy *pol,
 				data->powernow_table[newstate].index);
 	else
 		pol->cur = find_khz_freq_from_fid(data->currfid);
-	ret = 0;
 
-err_out:
-	set_cpus_allowed_ptr(current, oldmask);
-	free_cpumask_var(oldmask);
-	return ret;
+	return 0;
+}
+
+/* Driver entry point to switch to the target frequency */
+static int powernowk8_target(struct cpufreq_policy *pol,
+		unsigned targfreq, unsigned relation)
+{
+	struct powernowk8_target_arg pta = { .pol = pol, .targfreq = targfreq,
+					     .relation = relation };
+
+	/*
+	 * Must run on @pol->cpu.  cpufreq core is responsible for ensuring
+	 * that we're bound to the current CPU and pol->cpu stays online.
+	 */
+	if (smp_processor_id() == pol->cpu)
+		return powernowk8_target_fn(&pta);
+	else
+		return work_on_cpu(pol->cpu, powernowk8_target_fn, &pta);
 }
 
 /* Driver entry point to verify the policy and range of frequencies */
