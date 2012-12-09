From: Ilya Zykov <ilya@ilyx.ru>
Subject: Re: [BUG -next] cpufreq: cpufreq_governor.
Date: Sun, 09 Dec 2012 21:17:04 +0400
Message-ID: <50C4C790.4080206@ilyx.ru>
References: <50BF9480.20400@ilyx.ru> <50BF9824.7070903@ilyx.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50BF9824.7070903@ilyx.ru>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

On 05.12.2012 22:53, Ilya Zykov wrote:
> What do I do wrong?
> 
> After: modprobe cpufreq_ondemand
> I have:
> 
> WARNING: Error inserting freq_table (/lib/modules/3.7.0-rc8-next-20121205-ttybuf.1+/kernel/drivers/cpufreq/freq_table.ko): Unknown symbol in module, or unknown parameter (see dmesg)
> FATAL: Error inserting cpufreq_ondemand (/lib/modules/3.7.0-rc8-next-20121205-ttybuf.1+/kernel/drivers/cpufreq/cpufreq_ondemand.ko): Unknown symbol in module, or unknown parameter (see dmesg)
> 
> dmesg:
> Dec  5 22:26:11 bm kernel: cpufreq_governor: Unknown symbol __cpufreq_driver_getavg (err 0)
> Dec  5 22:26:11 bm kernel: cpufreq_governor: Unknown symbol sysfs_create_group (err 0)
> Dec  5 22:26:11 bm kernel: cpufreq_governor: Unknown symbol sysfs_remove_group (err 0)
> Dec  5 22:26:11 bm kernel: cpufreq_governor: Unknown symbol __cpufreq_driver_target (err 0)
> Dec  5 22:26:11 bm kernel: cpufreq_governor: Unknown symbol get_cpu_idle_time_us (err 0)
> Dec  5 22:26:11 bm kernel: cpufreq_governor: Unknown symbol delayed_work_timer_fn (err 0)
> Dec  5 22:26:11 bm kernel: cpufreq_governor: Unknown symbol get_cpu_iowait_time_us (err 0)
> 
> cat /proc/kallsyms |grep freq_dr
> ffffffff814976e0 T __cpufreq_driver_target
> ffffffff814987e0 T __cpufreq_driver_getavg
> ffffffff81498850 T cpufreq_driver_target
> ffffffff81881650 r __ksymtab___cpufreq_driver_getavg
> ffffffff81881660 r __ksymtab___cpufreq_driver_target
> ffffffff81883b40 r __ksymtab_cpufreq_driver_target
> ffffffff81894290 r __kcrctab___cpufreq_driver_getavg
> ffffffff81894298 r __kcrctab___cpufreq_driver_target
> ffffffff81895508 r __kcrctab_cpufreq_driver_target
> ffffffff818b3080 r __kstrtab___cpufreq_driver_getavg
> ffffffff818b3098 r __kstrtab_cpufreq_driver_target
> ffffffff818b30ae r __kstrtab___cpufreq_driver_target
> ffffffff81e240c8 b cpufreq_driver_lock
> ffffffff81e240d0 b cpufreq_driver
> ffffffffa0c42000 d acpi_cpufreq_driver	[acpi_cpufreq]

I managed to fix:

git checkout 16642a2e7be23bb -- drivers/cpufreq
git checkout 250f6715a4112d668 -- include/linux/cpufreq.h

