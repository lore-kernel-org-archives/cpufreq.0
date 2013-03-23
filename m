From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: More cpufreq breakage
Date: Sat, 23 Mar 2013 15:27:13 +0100
Message-ID: <5152799.d8sLDQMJWT@vostro.rjw.lan>
References: <bug-55411-70601@https.bugzilla.kernel.org/> <CAKohpokjpOepnuj3dny+j0UYurVHBZci=BdFa5OxR+e7k-512w@mail.gmail.com> <20130323134541.GA10811@pd.tnic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130323134541.GA10811@pd.tnic>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Borislav Petkov <bp@alien8.de>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

On Saturday, March 23, 2013 02:45:42 PM Borislav Petkov wrote:
> On Fri, Mar 22, 2013 at 09:52:29PM +0530, Viresh Kumar wrote:
> > What does "?" mean before a functions name in trace?
> 
> http://stackoverflow.com/questions/13113384/the-meaning-of-in-linux-kernel-panic-call-trace
> 
> Here's what's in dmesg before that (basically the machine is
> hibernating):
> 
> Mar 20 10:14:40 pd vmunix: [34172.600018] PM: Syncing filesystems ... done.
> Mar 20 10:14:40 pd vmunix: [34172.606180] Freezing user space processes ... (elapsed 0.01 seconds) done.
> Mar 20 10:14:40 pd vmunix: [34172.620559] PM: Preallocating image memory... done (allocated 573862 pages)
> Mar 20 10:14:40 pd vmunix: [34173.370592] PM: Allocated 2295448 kbytes in 0.75 seconds (3060.59 MB/s)
> Mar 20 10:14:40 pd vmunix: [34173.370615] Freezing remaining freezable tasks ... (elapsed 0.01 seconds) done.
> Mar 20 10:14:40 pd vmunix: [34173.388082] serial 00:09: disabled
> Mar 20 10:14:40 pd vmunix: [34173.388117] serial 00:09: System wakeup disabled by ACPI
> Mar 20 10:14:40 pd vmunix: [34173.695941] PM: freeze of devices complete after 311.852 msecs
> Mar 20 10:14:40 pd vmunix: [34173.696673] PM: late freeze of devices complete after 0.722 msecs
> Mar 20 10:14:40 pd vmunix: [34173.698914] PM: noirq freeze of devices complete after 2.234 msecs
> Mar 20 10:14:40 pd vmunix: [34173.698932] Disabling non-boot CPUs ...
> Mar 20 10:14:40 pd vmunix: [34173.703351] smpboot: CPU 1 is now offline
> Mar 20 10:14:40 pd vmunix: [34173.708298] smpboot: CPU 2 is now offline
> Mar 20 10:14:40 pd vmunix: [34173.712056] smpboot: CPU 3 is now offline
> Mar 20 10:14:40 pd vmunix: [34173.717512] smpboot: CPU 4 is now offline
> Mar 20 10:14:40 pd vmunix: [34173.722044] smpboot: CPU 5 is now offline
> Mar 20 10:14:40 pd vmunix: [34173.728418] smpboot: CPU 6 is now offline
> Mar 20 10:14:40 pd vmunix: [34173.731577] smpboot: CPU 7 is now offline
> Mar 20 10:14:40 pd vmunix: [34173.732828] PM: Creating hibernation image:
> Mar 20 10:14:40 pd vmunix: [34174.371451] PM: Need to copy 596216 pages
> Mar 20 10:14:40 pd vmunix: [34173.879106] Enabling non-boot CPUs ...
> Mar 20 10:14:40 pd vmunix: [34173.879171] SMP alternatives: lockdep: fixing up alternatives
> Mar 20 10:14:40 pd vmunix: [34173.879182] smpboot: Booting Node 0 Processor 1 APIC 0x11
> Mar 20 10:14:40 pd vmunix: [34173.890627] LVT offset 0 assigned for vector 0x400
> Mar 20 10:14:40 pd vmunix: [34173.893305] ------------[ cut here ]------------
> Mar 20 10:14:40 pd vmunix: [34173.893321] WARNING: at kernel/mutex.c:199 mutex_lock_nested+0x39c/0x3b0()
> Mar 20 10:14:40 pd vmunix: [34173.893328] Hardware name: To be filled by O.E.M.
> Mar 20 10:14:40 pd vmunix: [34173.893333] Modules linked in: nls_iso8859_15 nls_cp437 fuse tun cpufreq_powersave cpufreq_userspace cpufreq_stats cpufreq_conservative dm_crypt dm_mod ipv6 vfat fat acpi_cpufreq mperf kvm_amd kvm crc32_pclmul aesni_intel aes_x86_64 ablk_helper cryptd xts lrw gf128mul microcode radeon amd64_edac_mod edac_core k10temp fam15h_power drm_kms_helper ttm cfbfillrect cfbimgblt r8169 cfbcopyarea
> Mar 20 10:14:40 pd vmunix: [34173.893395] Pid: 15316, comm: kworker/0:0 Not tainted 3.9.0-rc3 #1
> Mar 20 10:14:40 pd vmunix: [34173.893402] Call Trace:
> Mar 20 10:14:40 pd vmunix: [34173.893409]  [<ffffffff8103b33f>] warn_slowpath_common+0x7f/0xc0
> Mar 20 10:14:40 pd vmunix: [34173.893417]  [<ffffffff8103b39a>] warn_slowpath_null+0x1a/0x20
> Mar 20 10:14:40 pd vmunix: [34173.893424]  [<ffffffff8159654c>] mutex_lock_nested+0x39c/0x3b0
> Mar 20 10:14:40 pd vmunix: [34173.893432]  [<ffffffff8144b94d>] ? cpufreq_governor_dbs+0x3bd/0x560
> Mar 20 10:14:40 pd vmunix: [34173.893441]  [<ffffffff8106bded>] ? __blocking_notifier_call_chain+0x7d/0xd0
> Mar 20 10:14:40 pd vmunix: [34173.893449]  [<ffffffff8144b94d>] ? cpufreq_governor_dbs+0x3bd/0x560
> Mar 20 10:14:40 pd vmunix: [34173.893457]  [<ffffffff81074ce1>] ? get_parent_ip+0x11/0x50
> Mar 20 10:14:40 pd vmunix: [34173.893464]  [<ffffffff81074d99>] ? sub_preempt_count+0x79/0xd0
> Mar 20 10:14:40 pd vmunix: [34173.893472]  [<ffffffff8144b94d>] cpufreq_governor_dbs+0x3bd/0x560
> Mar 20 10:14:40 pd vmunix: [34173.893480]  [<ffffffff8144b24a>] od_cpufreq_governor_dbs+0x1a/0x20
> Mar 20 10:14:40 pd vmunix: [34173.893487]  [<ffffffff81448f13>] __cpufreq_governor+0x53/0xf0
> Mar 20 10:14:40 pd vmunix: [34173.893494]  [<ffffffff814494a5>] __cpufreq_set_policy+0x155/0x180
> Mar 20 10:14:40 pd vmunix: [34173.893502]  [<ffffffff8144a483>] cpufreq_update_policy+0xf3/0x130
> Mar 20 10:14:40 pd vmunix: [34173.893510]  [<ffffffff8144a4c0>] ? cpufreq_update_policy+0x130/0x130
> Mar 20 10:14:40 pd vmunix: [34173.893519]  [<ffffffff8144a4d1>] handle_update+0x11/0x20
> Mar 20 10:14:40 pd vmunix: [34173.893526]  [<ffffffff8105f3f7>] process_one_work+0x1f7/0x670
> Mar 20 10:14:40 pd vmunix: [34173.893533]  [<ffffffff8105f38c>] ? process_one_work+0x18c/0x670
> Mar 20 10:14:40 pd vmunix: [34173.893541]  [<ffffffff8105fbfe>] worker_thread+0x10e/0x370
> Mar 20 10:14:40 pd vmunix: [34173.893548]  [<ffffffff8105faf0>] ? rescuer_thread+0x240/0x240
> Mar 20 10:14:40 pd vmunix: [34173.893556]  [<ffffffff810654fb>] kthread+0xdb/0xe0
> Mar 20 10:14:40 pd vmunix: [34173.893563]  [<ffffffff81071ba5>] ? finish_task_switch+0x85/0x110
> Mar 20 10:14:40 pd vmunix: [34173.893572]  [<ffffffff81065420>] ? __init_kthread_worker+0x70/0x70
> Mar 20 10:14:40 pd vmunix: [34173.893579]  [<ffffffff8159a71c>] ret_from_fork+0x7c/0xb0
> Mar 20 10:14:40 pd vmunix: [34173.893587]  [<ffffffff81065420>] ? __init_kthread_worker+0x70/0x70
> Mar 20 10:14:40 pd vmunix: [34173.893594] ---[ end trace 66f5addf492b41b2 ]---

This looks like the CPU offline path to me (i.e. the CPU hotplug notifier
does something fishy).

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
