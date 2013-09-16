From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 1/2] cpufreq: unlock correct rwsem while updating policy->cpu
Date: Mon, 16 Sep 2013 20:40:16 +0530
Message-ID: <075032be4fd288074b8f699d4f4ba0179518df6f.1379344038.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, tixy@linaro.org
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, srivatsa.bhat@linux.vnet.ibm.com, Viresh Kumar <viresh.kumar@linaro.org>

Current code looks like this:

        WARN_ON(lock_policy_rwsem_write(cpu));
        update_policy_cpu(policy, new_cpu);
        unlock_policy_rwsem_write(cpu);

{lock|unlock}_policy_rwsem_write(cpu) takes/releases policy->cpu's rwsem.
Because cpu is changing with the call to update_policy_cpu(), the
unlock_policy_rwsem_write() will release the incorrect lock.

The right solution would be to take rwsem lock/unlock for both old and new cpu.
This patch fixes this bug by taking both locks directly instead of calling
lock_policy_rwsem_write().

Reported-by: Jon Medhurst<tixy@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Hi Rafael,

Probably we can get this patch in for 3.12? The second one can go in 3.13.

These are compile tested only at my end. Tixy reported these and probably can
give his tested-by once he is done testing them.

 drivers/cpufreq/cpufreq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 43c24aa..c18bf7b 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -952,9 +952,16 @@ static void update_policy_cpu(struct cpufreq_policy *policy, unsigned int cpu)
 	if (cpu == policy->cpu)
 		return;
 
+	/* take direct locks as lock_policy_rwsem_write wouldn't work here */
+	down_write(&per_cpu(cpu_policy_rwsem, policy->cpu));
+	down_write(&per_cpu(cpu_policy_rwsem, cpu));
+
 	policy->last_cpu = policy->cpu;
 	policy->cpu = cpu;
 
+	up_write(&per_cpu(cpu_policy_rwsem, cpu));
+	up_write(&per_cpu(cpu_policy_rwsem, policy->cpu));
+
 #ifdef CONFIG_CPU_FREQ_TABLE
 	cpufreq_frequency_table_update_policy_cpu(policy);
 #endif
@@ -1203,9 +1210,7 @@ static int __cpufreq_remove_dev_prepare(struct device *dev,
 
 		new_cpu = cpufreq_nominate_new_policy_cpu(policy, cpu, frozen);
 		if (new_cpu >= 0) {
-			WARN_ON(lock_policy_rwsem_write(cpu));
 			update_policy_cpu(policy, new_cpu);
-			unlock_policy_rwsem_write(cpu);
 
 			if (!frozen) {
 				pr_debug("%s: policy Kobject moved to cpu: %d "
-- 
1.7.12.rc2.18.g61b472e

