From: Jane Li <jiel@marvell.com>
Subject: Re: cpufreq ondemand governor debugobjects warning
Date: Fri, 27 Dec 2013 14:18:17 +0800
Message-ID: <52BD1BA9.50804@marvell.com>
References: <52BCEA76.1020906@marvell.com>	<52BCEEA3.4090107@marvell.com> <CAKohpom8VOHeCuhK5_4u39TEhC5Yji2VbkJK6SHTecH5hHPK5g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpom8VOHeCuhK5_4u39TEhC5Yji2VbkJK6SHTecH5hHPK5g@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 12/27/2013 01:31 PM, Viresh Kumar wrote:

> On 27 December 2013 08:36, Jane Li <jiel@marvell.com> wrote:
>> When gov_queue_work(), governor_enabled may be modified.  Following patch
>> can fix it by adding cpufreq_governor_lock in gov_queue_work. But in this
>> way, cpufreq_governor_lock also protects __gov_queue_work(). Do you think
>> this is a good idea?
> gov_queue_work() is called with timer_mutex on. Can you try placing this
> lock around gov_cancel_work() and see if it resolves issues you have reported ?
>
> --
> viresh

There may be deadlock in this way.

The existing dependency chain (in reverse order) is:

-> #1 (&j_cdbs->timer_mutex){+.+.+.}:

[<c017ba0c>] lock_acquire+0x9c/0x150

[<c069d6d0>] mutex_lock_nested+0x50/0x3d8

[<c04849c0>] od_dbs_timer+0x3c/0x130

[<c0143b84>] process_one_work+0x1b8/0x518

[<c0144024>] worker_thread+0x140/0x3f0

[<c014a708>] kthread+0xa4/0xb0

[<c010e2c8>] ret_from_fork+0x14/0x2c

-> #0 ((&(&j_cdbs->work)->work)){+.+...}:

[<c017af18>] __lock_acquire+0x171c/0x1c64

[<c017ba0c>] lock_acquire+0x9c/0x150

[<c01432e8>] flush_work+0x3c/0x2a0

[<c0144b90>] __cancel_work_timer+0x90/0x138

[<c0485e90>] cpufreq_governor_dbs+0x528/0x6a4

[<c0481c40>] __cpufreq_governor+0x80/0x1b0

[<c0481dd8>] __cpufreq_remove_dev.isra.12+0x68/0x380

[<c0696eac>] cpufreq_cpu_callback+0x7c/0x90

[<c014fff8>] notifier_call_chain+0x44/0x84

[<c012b09c>] __cpu_notify+0x2c/0x48

[<c0691c98>] _cpu_down+0x80/0x258

[<c0691e98>] cpu_down+0x28/0x3c

[<c0692418>] store_online+0x30/0x74

[<c03a4400>] dev_attr_store+0x18/0x24

[<c0257498>] sysfs_write_file+0x100/0x180

[<c01ff154>] vfs_write+0xbc/0x184

[<c01ff4ec>] SyS_write+0x40/0x68

[<c010e200>] ret_fast_syscall+0x0/0x48


         CPU0                    CPU1

         ----                    ----

   lock(&j_cdbs->timer_mutex);

                                lock((&(&j_cdbs->work)->work));

                                lock(&j_cdbs->timer_mutex);

   lock((&(&j_cdbs->work)->work));


diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c

index e6be635..ff14647 100644

--- a/drivers/cpufreq/cpufreq_governor.c

+++ b/drivers/cpufreq/cpufreq_governor.c

@@ -351,7 +351,9 @@ int cpufreq_governor_dbs(struct cpufreq_policy *policy,

                 if (dbs_data->cdata->governor == GOV_CONSERVATIVE)

                         cs_dbs_info->enable = 0;

+               mutex_lock(&cpu_cdbs->timer_mutex);

                 gov_cancel_work(dbs_data, policy);

+               mutex_unlock(&cpu_cdbs->timer_mutex);

                 mutex_lock(&dbs_data->mutex);

                 mutex_destroy(&cpu_cdbs->timer_mutex);


