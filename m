From: Jane Li <jiel@marvell.com>
Subject: cpufreq ondemand governor debugobjects warning
Date: Fri, 27 Dec 2013 11:06:11 +0800
Message-ID: <52BCEEA3.4090107@marvell.com>
References: <52BCEA76.1020906@marvell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <52BCEA76.1020906@marvell.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: rjw@rjwysocki.net, viresh.kumar@linaro.org
Cc: cpufreq@vger.kernel.org

Hi All,

When a CPU is hot removed we'll cancel all the delayed work items via gov_cancel_work(). Sometimes the delayed work function determines that it should adjust the delay for all other CPUs that the policy is managing. If this scenario occurs, the canceling CPU will cancel its
own work but queue up the other CPUs works to run.

Commit a11a35(cpufreq: Fix timer/workqueue corruption due to double queueing) has tried to fix this, but reading governor_enabled is not protected by cpufreq_governor_lock. Even though od_dbs_timer() checks governor_enabled before gov_queue_work(), this scenario may occur. For example

   CPU0                                        CPU1
   ----                                        ----
   cpu_down()
    ...                                        <work runs>
    __cpufreq_remove_dev()                     od_dbs_timer()
     __cpufreq_governor()                       policy->governor_enabled
      policy->governor_enabled = false;
      cpufreq_governor_dbs()
       case CPUFREQ_GOV_STOP:
        gov_cancel_work(dbs_data, policy);
         cpu0 work is canceled
          timer is canceled
          cpu1 work is canceled
          <waits for cpu1>
                                                gov_queue_work(*, *, true);
                                                 cpu0 work queued
                                                 cpu1 work queued
                                                 cpu2 work queued
                                                 ...
          cpu1 work is canceled
          cpu2 work is canceled
          ...


If this occurs, debugobjects will split out a warning:

WARNING: at lib/debugobjects.c:260 debug_print_object+0x94/0xbc()
ODEBUG: init active (active state 0) object type: timer_list hint: delayed_work_timer_fn+0x0/0x14
Modules linked in: galcore
CPU: 1 PID: 1205 Comm: sh Tainted: G        W    3.10.0 #200
[<c01144f0>] (unwind_backtrace+0x0/0xf8) from [<c0111d98>] (show_stack+0x10/0x14)
[<c0111d98>] (show_stack+0x10/0x14) from [<c01272cc>] (warn_slowpath_common+0x4c/0x68)
[<c01272cc>] (warn_slowpath_common+0x4c/0x68) from [<c012737c>] (warn_slowpath_fmt+0x30/0x40)
[<c012737c>] (warn_slowpath_fmt+0x30/0x40) from [<c034c640>] (debug_print_object+0x94/0xbc)
[<c034c640>] (debug_print_object+0x94/0xbc) from [<c034c7f8>] (__debug_object_init+0xc8/0x3c0)
[<c034c7f8>] (__debug_object_init+0xc8/0x3c0) from [<c01360e0>] (init_timer_key+0x20/0x104)
[<c01360e0>] (init_timer_key+0x20/0x104) from [<c04872ac>] (cpufreq_governor_dbs+0x1dc/0x68c)
[<c04872ac>] (cpufreq_governor_dbs+0x1dc/0x68c) from [<c04833a8>] (__cpufreq_governor+0x80/0x1b0)
[<c04833a8>] (__cpufreq_governor+0x80/0x1b0) from [<c0483704>] (__cpufreq_remove_dev.isra.12+0x22c/0x380)
[<c0483704>] (__cpufreq_remove_dev.isra.12+0x22c/0x380) from [<c0692f38>] (cpufreq_cpu_callback+0x48/0x5c)
[<c0692f38>] (cpufreq_cpu_callback+0x48/0x5c) from [<c014fb40>] (notifier_call_chain+0x44/0x84)
[<c014fb40>] (notifier_call_chain+0x44/0x84) from [<c012ae44>] (__cpu_notify+0x2c/0x48)
[<c012ae44>] (__cpu_notify+0x2c/0x48) from [<c068dd40>] (_cpu_down+0x80/0x258)
[<c068dd40>] (_cpu_down+0x80/0x258) from [<c068df40>] (cpu_down+0x28/0x3c)
[<c068df40>] (cpu_down+0x28/0x3c) from [<c068e4c0>] (store_online+0x30/0x74)
[<c068e4c0>] (store_online+0x30/0x74) from [<c03a7308>] (dev_attr_store+0x18/0x24)
[<c03a7308>] (dev_attr_store+0x18/0x24) from [<c0256fe0>] (sysfs_write_file+0x100/0x180)
[<c0256fe0>] (sysfs_write_file+0x100/0x180) from [<c01fec9c>] (vfs_write+0xbc/0x184)
[<c01fec9c>] (vfs_write+0xbc/0x184) from [<c01ff034>] (SyS_write+0x40/0x68)
[<c01ff034>] (SyS_write+0x40/0x68) from [<c010e200>] (ret_fast_syscall+0x0/0x48)


When gov_queue_work(), governor_enabled may be modified.  Following patch can fix it by adding cpufreq_governor_lock in gov_queue_work. But in this way, cpufreq_governor_lock also protects __gov_queue_work(). Do you think this is a good idea?

diff --git a/drivers/cpufreq/cpufreq_governor.c
b/drivers/cpufreq/cpufreq_governor.c
index e6be635..a27246c 100644
--- a/drivers/cpufreq/cpufreq_governor.c
+++ b/drivers/cpufreq/cpufreq_governor.c
@@ -118,9 +118,11 @@ void gov_queue_work(struct dbs_data *dbs_data,
struct cpufreq_policy *policy,
                   unsigned int delay, bool all_cpus)
    {
           int i;
-
-       if (!policy->governor_enabled)
+       mutex_lock(&cpufreq_governor_lock);
+       if (!policy->governor_enabled) {
+               mutex_unlock(&cpufreq_governor_lock);
                   return;
+       }

           if (!all_cpus) {
                   /*
@@ -135,6 +137,7 @@ void gov_queue_work(struct dbs_data *dbs_data,
struct cpufreq_policy *policy,
                   for_each_cpu(i, policy->cpus)
                           __gov_queue_work(i, dbs_data, delay);
           }
+       mutex_unlock(&cpufreq_governor_lock);
    }
    EXPORT_SYMBOL_GPL(gov_queue_work);









