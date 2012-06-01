From: "Selen, Ali Utku" <AliUtku.Selen@sonymobile.com>
Subject: cpufreq deadlock in show
Date: Fri, 1 Jun 2012 11:36:34 +0200
Message-ID: <1459F2CBB1C32E45863B1F1BFA0FDD62CC16581907@SELDMBX04.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "'cpufreq@vger.kernel.org'" <cpufreq@vger.kernel.org>

Hi!

I'm getting a deadlock in show in cpufreq.c on a 3.0 series kernel.

The way it happens is, I do read  /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq in a loop, and at the same I send a "echo 0 > /sys/devices/system/cpu/cpu1/online". If I get lucky, my read call to scaling_cur_freq doesn't return and I get stack traces like below.

#0 [<c0701acc>] (__schedule) from [<c0701fc0>]
#1 [<c0701fc0>] (schedule_timeout) from [<c0701350>]
#2 [<c0701350>] (wait_for_common) from [<c025da14>]
#3 [<c025da14>] (sysfs_addrm_finish) from [<c025db28>]
#4 [<c025db28>] (sysfs_remove_dir) from [<c032247c>]
#5 [<c032247c>] (kobject_del) from [<c0322594>]
#6 [<c0322594>] (kobject_release) from [<c03237cc>]
#7 [<c03237cc>] (kref_put) from [<c0517f78>]
#8 [<c0517f78>] (cpufreq_cpu_put) from [<c051a638>]
#9 [<c051a638>] (show) from [<c025c444>]
#10 [<c025c444>] (sysfs_read_file) from [<c020e400>]
#11 [<c020e400>] (vfs_read) from [<c020e584>]
#12 [<c020e584>] (sys_read) from [<c0105e60>]

As far as I understand, this means we've released the kobject inside show() which tries to do a cleanup on sysfs entry itself. This cleanup requires show to return first, leading to a deadlock.

In the mean time __cpufreq_remove_dev waits cpufreq_sysfs_release to arrive forever, creating the bigger problem by holding cpu_hotplug.lock and cpu_add_remove_lock.

#0 [<c0701acc>] (__schedule) from [<c0701fc0>]
#1 [<c0701fc0>] (schedule_timeout) from [<c0701350>]
#2 [<c0701350>] (wait_for_common) from [<c051a198>]
#3 [<c051a198>] (__cpufreq_remove_dev) from [<c0700bc8>]
#4 [<c0700bc8>] (cpufreq_cpu_callback) from [<c0706c04>]
#5 [<c0706c04>] (notifier_call_chain) from [<c016eac4>]
#6 [<c016eac4>] (__cpu_notify) from [<c06e6440>]
#7 [<c06e6440>] (_cpu_down) from [<c06e65f0>]
#8 [<c06e65f0>] (cpu_down) from [<c06e6e44>]
#9 [<c06e6e44>] (store_online) from [<c03d0328>]
#10 [<c03d0328>] (sysdev_store) from [<c025c358>]
#11 [<c025c358>] (sysfs_write_file) from [<c020e1a8>]
#12 [<c020e1a8>] (vfs_write) from [<c020e32c>]
#13 [<c020e32c>] (sys_write) from [<c0105e60>]

cpu_hotplug.lock holds calls to get_online_cpus.

#0 [<c0701acc>] (__schedule) from [<c0702a54>]
#1 [<c0702a54>] (__mutex_lock_slowpath) from [<c0702be4>]
#2 [<c0702be4>] (mutex_lock) from [<c016eb34>]
#3 [<c016eb34>] (get_online_cpus) from [<c0166238>]
#4 [<c0166238>] (sched_setaffinity) from [<c01663c4>]
#5 [<c01663c4>] (sys_sched_setaffinity) from [<c0105e60>]

The way I see this happens is; __cpufreq_remove_dev() and show() are racing. __cpufreq_remove_dev() already has the semaphore (rw_semaphore) from cpufreq_cpu_callback(), show() gets the policy "cpufreq_cpu_get(policy->cpu)"  (kobject ref count 2) and waits for its turn on semaphore. __cpufreq_remove_dev() ups the semaphore, puts the kobject (kobject ref count 1) and waits for completion from cpufreq_sysfs_release(). show() reads attribute, ups the semaphore and puts kobject (kobject ref count 0). Now kobject needs to be released, ending up as first stack trace I pasted.

Now if my understanding is correct, I am wondering if access to policy object needs to be reference counted in show() (probably store as well)? Can't we access it directly via per_cpu(cpufreq_cpu_data, cpu) inside the semaphore? Afaik policy object isn't released until __cpufreq_remove_dev() passes wait_for_completion and semaphore should provide enough protection? If that's not possible, currently I'm avoiding the situation by keeping a removal flag and instead of waiting for the semaphore, I do a check on both semaphore and flag to see if it safe to continue in show(). It works fine but looks ugly.

Thanks,
Utku.
