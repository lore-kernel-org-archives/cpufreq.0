From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC] cpufreq: Fix issues with hot-[un]plugging of cpus
Date: Mon, 10 Dec 2012 13:12:13 +0530
Message-ID: <a9eb1507f44fb6ff81019cf6ed183ad01f00c107.1355122749.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: rjw-KKrjLPT3xs0@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Rafael and other cpufreq masters,

I am really not sure if this patch is a HACK or a valid solution :)
Please have a look.

Setup:
-----
- ARM big LITTLE Platform with 5 cpus. cpus 2, 3 & 4 share clock and hence are
  part of policy->cpus. cpus 0 & 1 share clock but they aren't discussed here.
- Interactive governor: I know its not mainlined and will never be. Problem
  should be same with all the governors we have. So, problem is not really
  governor dependent. I have added few prints at start/stop cases of governor,
  to see what policy->cpus is set to.

Problem Statement:
-----------------
There are many issues :(

1) I couldn't understand what we really want the value of policy->cpus be? Only
   the online cpus sharing clock? or all the possible cpus sharing clock?

   When we offline a cpu, we remove it from cpus field: cpumask_clear_cpu(cpu, data->cpus);
   
   Which shows that it is mask of online cpus only. But there are many places
   checking if a cpu is online or not (cpu in policy->cpus) in cpufreq.c. Which
   shows something else.

2) Kernel crashes when hot-unplugging cpus

   When we do: for i in 2 3 4; do echo 0 > /sys/devices/system/cpu/cpu$i/online; done
   We get:

   cpufreq_governor_interactive: CPUFREQ_GOV_STOP cpu 2 policy->cpus 2-4
   cpufreq_vexpress: CPUFreq for CPU 3 initialized
   cpufreq_governor_interactive: CPUFREQ_GOV_START cpu 3 policy->cpus 2-4
   CPU2: shutdown
   cpufreq_governor_interactive: CPUFREQ_GOV_STOP cpu 3 policy->cpus 3-4
   cpufreq_vexpress: CPUFreq for CPU 4 initialized
   cpufreq_governor_interactive: CPUFREQ_GOV_START cpu 4 policy->cpus 2-4

   And then crash from interactive governor.

   Note the following lines:
   ------------------------
   cpufreq_governor_interactive: CPUFREQ_GOV_STOP cpu 2 policy->cpus 2-4
   cpufreq_governor_interactive: CPUFREQ_GOV_START cpu 3 policy->cpus 2-4
   cpufreq_governor_interactive: CPUFREQ_GOV_STOP cpu 3 policy->cpus 3-4
   cpufreq_governor_interactive: CPUFREQ_GOV_START cpu 4 policy->cpus 2-4
   
   So the governor is always started for CPUs 2 through 4 despite the fact
   that CPU 2 is removed. This makes the governor unstable due to wrong info
   passed.

   FIX: keep only online cpus in policy->cpus
   ---

3) With above issue solved, i tried to run the same stuff again and look what i
   got:

   cpufreq_governor_interactive: CPUFREQ_GOV_STOP cpu 2 policy->cpus 2-4
   cpufreq_vexpress: CPUFreq for CPU 3 initialized
   cpufreq_governor_interactive: CPUFREQ_GOV_START cpu 3 policy->cpus 2-4
   CPU2: shutdown

a) Because cpu 2 is still not completely hot unplugged and is still present in
   cpu_online_mask.
b) If we try to remove cpu 3, governor wouldn't be notified of it, because cpu 3
   wasn't policy->cpu.

   FIX: Stop/Start governor on every non policy->cpu removal
   ---

4) Hot unplug is fine now, but not hotplug :(
   for i in 2 3 4; do echo 1 > /sys/devices/system/cpu/cpu$i/online; done

   CPU2: Booted secondary processor
   cpufreq_vexpress: CPUFreq for CPU 2 initialized
   cpufreq_governor_interactive: CPUFREQ_GOV_START cpu 2 policy->cpus 2
   CPU3: Booted secondary processor
   cpufreq_vexpress: CPUFreq for CPU 3 initialized
   CPU4: Booted secondary processor
   cpufreq_vexpress: CPUFreq for CPU 4 initialized

   Hmmm, Governor is not informed about 3 and 4. :(

   FIX: Stop/Start governor on every managed_policy cpu, i.e. cpu for which
   ---  policy struct exists


Please share your comments, i know there would be many :)

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/cpufreq/cpufreq.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0c3e29a..69bd739 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -749,11 +749,16 @@ static int cpufreq_add_dev_policy(unsigned int cpu,
 				return -EBUSY;
 			}
 
+			__cpufreq_governor(managed_policy, CPUFREQ_GOV_STOP);
+
 			spin_lock_irqsave(&cpufreq_driver_lock, flags);
 			cpumask_copy(managed_policy->cpus, policy->cpus);
 			per_cpu(cpufreq_cpu_data, cpu) = managed_policy;
 			spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
+			__cpufreq_governor(managed_policy, CPUFREQ_GOV_START);
+			__cpufreq_governor(managed_policy, CPUFREQ_GOV_LIMITS);
+
 			pr_debug("CPU already managed, adding link\n");
 			ret = sysfs_create_link(&dev->kobj,
 						&managed_policy->kobj,
@@ -968,6 +973,13 @@ static int cpufreq_add_dev(struct device *dev, struct subsys_interface *sif)
 		pr_debug("initialization failed\n");
 		goto err_unlock_policy;
 	}
+
+	/*
+	 * affected cpus must always be the one, which are online. We aren't
+	 * managing offline cpus here.
+	 */
+	cpumask_and(policy->cpus, policy->cpus, cpu_online_mask);
+
 	policy->user_policy.min = policy->min;
 	policy->user_policy.max = policy->max;
 
@@ -1057,8 +1069,13 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
 	 */
 	if (unlikely(cpu != data->cpu)) {
 		pr_debug("removing link\n");
+		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
 		cpumask_clear_cpu(cpu, data->cpus);
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+
+		__cpufreq_governor(data, CPUFREQ_GOV_START);
+		__cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
+
 		kobj = &dev->kobj;
 		cpufreq_cpu_put(data);
 		unlock_policy_rwsem_write(cpu);
-- 
1.7.12.rc2.18.g61b472e
