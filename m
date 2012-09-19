From: Tejun Heo <tj@kernel.org>
Subject: [GIT PULL] workqueue / powernow-k8 fix for v3.6-rc6
Date: Wed, 19 Sep 2012 10:57:53 -0700
Message-ID: <20120919175753.GL8474@google.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=DQd1OsSOKIFk/aV1FWPpDhLGmGipFuiN4C1LWspeTX4=;
        b=DzDCQmX2ea//nWuloBwsK4spBZ3r99+DLjFGOde5BvAFLC4kIiIIofBdtGb2yyqgEH
         c24gxeLIDQJbDv4R1um0q89JCqNn6JqJcnoiyMu3grl1lRaif4KBcPHZDhy2HeURSS2L
         L9qxXwCmbkQ5LRMIXRIGUySu/kjM7W+BR3KIsdgG2s08vtiGgym6T8ItxBh8izOcPE8W
         YM1dzkJ7hY6AcfpY//sifbupJR85ZkWSxGARSz8fmg5GUaDx72wkK8wgyjlRRS0E6Dgb
         l/GSVHB6H3WjmGZnxB38o52uipvN6JExM2j+KeFwIly2lFLOLDAS/2uVzc2hMp2ds4Lw
         Za6w==
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Duncan <1i5t5.duncan@cox.net>, Andreas Herrmann <andreas.herrmann3@amd.com>, Jiri Kosina <trivial@kernel.org>

Hello, Linus.

This is the fix for the bug where cpufreq/powernow-k8 was tripping
BUG_ON() in try_to_wake_up_local() by migrating workqueue worker to a
different CPU.

  https://bugzilla.kernel.org/show_bug.cgi?id=47301

As discussed, the fix is now two parts - one to reimplement
work_on_cpu() so that it doesn't create a new kthread each time and
the actual fix which makes powernow-k8 use work_on_cpu() instead of
performing manual migration.

While pretty late in the merge cycle, both changes are on the safer
side.  Jiri and I verified two existing users of work_on_cpu() and
Duncan confirmed that the powernow-k8 fix survived about 18 hours of
testing.

Please consider pulling from the following branch to receive the fix.

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-3.6-fixes

Thanks.

Tejun Heo (2):
      workqueue: reimplement work_on_cpu() using system_wq
      cpufreq/powernow-k8: workqueue user shouldn't migrate the kworker to another CPU

 drivers/cpufreq/powernow-k8.c |   63 ++++++++++++++++++++++-------------------
 kernel/workqueue.c            |   25 +++++-----------
 2 files changed, 42 insertions(+), 46 deletions(-)

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
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index b80065a..3c5a79e 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -3576,18 +3576,17 @@ static int __devinit workqueue_cpu_down_callback(struct notifier_block *nfb,
 #ifdef CONFIG_SMP
 
 struct work_for_cpu {
-	struct completion completion;
+	struct work_struct work;
 	long (*fn)(void *);
 	void *arg;
 	long ret;
 };
 
-static int do_work_for_cpu(void *_wfc)
+static void work_for_cpu_fn(struct work_struct *work)
 {
-	struct work_for_cpu *wfc = _wfc;
+	struct work_for_cpu *wfc = container_of(work, struct work_for_cpu, work);
+
 	wfc->ret = wfc->fn(wfc->arg);
-	complete(&wfc->completion);
-	return 0;
 }
 
 /**
@@ -3602,19 +3601,11 @@ static int do_work_for_cpu(void *_wfc)
  */
 long work_on_cpu(unsigned int cpu, long (*fn)(void *), void *arg)
 {
-	struct task_struct *sub_thread;
-	struct work_for_cpu wfc = {
-		.completion = COMPLETION_INITIALIZER_ONSTACK(wfc.completion),
-		.fn = fn,
-		.arg = arg,
-	};
+	struct work_for_cpu wfc = { .fn = fn, .arg = arg };
 
-	sub_thread = kthread_create(do_work_for_cpu, &wfc, "work_for_cpu");
-	if (IS_ERR(sub_thread))
-		return PTR_ERR(sub_thread);
-	kthread_bind(sub_thread, cpu);
-	wake_up_process(sub_thread);
-	wait_for_completion(&wfc.completion);
+	INIT_WORK_ONSTACK(&wfc.work, work_for_cpu_fn);
+	schedule_work_on(cpu, &wfc.work);
+	flush_work(&wfc.work);
 	return wfc.ret;
 }
 EXPORT_SYMBOL_GPL(work_on_cpu);
