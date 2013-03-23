From: Borislav Petkov <bp@alien8.de>
Subject: Re: More cpufreq breakage
Date: Sat, 23 Mar 2013 14:45:42 +0100
Message-ID: <20130323134541.GA10811@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <20130319074953.C200811FB80@bugzilla.kernel.org>
 <CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
 <3039053.c3U9fYsQRn@vostro.rjw.lan>
 <20130322151228.GH30807@pd.tnic>
 <CAKohpokjpOepnuj3dny+j0UYurVHBZci=BdFa5OxR+e7k-512w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364046346; bh=rOexG8jnNJ12YZTFzQp3g0f6G0nBosXnxefqJH5mZmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=ORCcQLzpfvRog86k0v6bOaUV7kYgFuoCxcoNmz
	PRwr/HXJjFkMqYvOpuPTCV8st1gtlFx8SWf0RLspsvWmI8h6EofwIPx/88KCQq3LdAS
	Wegk1uTdvg/SWgVi0WWt/g3C35ybDXYjfrDYQSB9QcnD2tzfA6I+dmYCc3n/yZO5AI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364046345; bh=rOexG8jnNJ12YZTFzQp3g0f6G0nBosXnxefqJH5mZmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=bfQbzzr1m1uTSZaeRYSWhlCBcedZt8cN+mjj96
	hWwHOUC6eFimv+hWMHrR1vq1FMZwNzlpdWQrlD4XQeCTwGeIx6J6ttcXagUji7ldcce
	GDfsXs2FrVeYVByu36ge77FmkuwWLN16+Ed7wa+VUrVzeDZKsjxtVvDJIXCBqmqGuA=
Content-Disposition: inline
In-Reply-To: <CAKohpokjpOepnuj3dny+j0UYurVHBZci=BdFa5OxR+e7k-512w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

On Fri, Mar 22, 2013 at 09:52:29PM +0530, Viresh Kumar wrote:
> What does "?" mean before a functions name in trace?

http://stackoverflow.com/questions/13113384/the-meaning-of-in-linux-kernel-panic-call-trace

Here's what's in dmesg before that (basically the machine is
hibernating):

Mar 20 10:14:40 pd vmunix: [34172.600018] PM: Syncing filesystems ... done.
Mar 20 10:14:40 pd vmunix: [34172.606180] Freezing user space processes ... (elapsed 0.01 seconds) done.
Mar 20 10:14:40 pd vmunix: [34172.620559] PM: Preallocating image memory... done (allocated 573862 pages)
Mar 20 10:14:40 pd vmunix: [34173.370592] PM: Allocated 2295448 kbytes in 0.75 seconds (3060.59 MB/s)
Mar 20 10:14:40 pd vmunix: [34173.370615] Freezing remaining freezable tasks ... (elapsed 0.01 seconds) done.
Mar 20 10:14:40 pd vmunix: [34173.388082] serial 00:09: disabled
Mar 20 10:14:40 pd vmunix: [34173.388117] serial 00:09: System wakeup disabled by ACPI
Mar 20 10:14:40 pd vmunix: [34173.695941] PM: freeze of devices complete after 311.852 msecs
Mar 20 10:14:40 pd vmunix: [34173.696673] PM: late freeze of devices complete after 0.722 msecs
Mar 20 10:14:40 pd vmunix: [34173.698914] PM: noirq freeze of devices complete after 2.234 msecs
Mar 20 10:14:40 pd vmunix: [34173.698932] Disabling non-boot CPUs ...
Mar 20 10:14:40 pd vmunix: [34173.703351] smpboot: CPU 1 is now offline
Mar 20 10:14:40 pd vmunix: [34173.708298] smpboot: CPU 2 is now offline
Mar 20 10:14:40 pd vmunix: [34173.712056] smpboot: CPU 3 is now offline
Mar 20 10:14:40 pd vmunix: [34173.717512] smpboot: CPU 4 is now offline
Mar 20 10:14:40 pd vmunix: [34173.722044] smpboot: CPU 5 is now offline
Mar 20 10:14:40 pd vmunix: [34173.728418] smpboot: CPU 6 is now offline
Mar 20 10:14:40 pd vmunix: [34173.731577] smpboot: CPU 7 is now offline
Mar 20 10:14:40 pd vmunix: [34173.732828] PM: Creating hibernation image:
Mar 20 10:14:40 pd vmunix: [34174.371451] PM: Need to copy 596216 pages
Mar 20 10:14:40 pd vmunix: [34173.879106] Enabling non-boot CPUs ...
Mar 20 10:14:40 pd vmunix: [34173.879171] SMP alternatives: lockdep: fixing up alternatives
Mar 20 10:14:40 pd vmunix: [34173.879182] smpboot: Booting Node 0 Processor 1 APIC 0x11
Mar 20 10:14:40 pd vmunix: [34173.890627] LVT offset 0 assigned for vector 0x400
Mar 20 10:14:40 pd vmunix: [34173.893305] ------------[ cut here ]------------
Mar 20 10:14:40 pd vmunix: [34173.893321] WARNING: at kernel/mutex.c:199 mutex_lock_nested+0x39c/0x3b0()
Mar 20 10:14:40 pd vmunix: [34173.893328] Hardware name: To be filled by O.E.M.
Mar 20 10:14:40 pd vmunix: [34173.893333] Modules linked in: nls_iso8859_15 nls_cp437 fuse tun cpufreq_powersave cpufreq_userspace cpufreq_stats cpufreq_conservative dm_crypt dm_mod ipv6 vfat fat acpi_cpufreq mperf kvm_amd kvm crc32_pclmul aesni_intel aes_x86_64 ablk_helper cryptd xts lrw gf128mul microcode radeon amd64_edac_mod edac_core k10temp fam15h_power drm_kms_helper ttm cfbfillrect cfbimgblt r8169 cfbcopyarea
Mar 20 10:14:40 pd vmunix: [34173.893395] Pid: 15316, comm: kworker/0:0 Not tainted 3.9.0-rc3 #1
Mar 20 10:14:40 pd vmunix: [34173.893402] Call Trace:
Mar 20 10:14:40 pd vmunix: [34173.893409]  [<ffffffff8103b33f>] warn_slowpath_common+0x7f/0xc0
Mar 20 10:14:40 pd vmunix: [34173.893417]  [<ffffffff8103b39a>] warn_slowpath_null+0x1a/0x20
Mar 20 10:14:40 pd vmunix: [34173.893424]  [<ffffffff8159654c>] mutex_lock_nested+0x39c/0x3b0
Mar 20 10:14:40 pd vmunix: [34173.893432]  [<ffffffff8144b94d>] ? cpufreq_governor_dbs+0x3bd/0x560
Mar 20 10:14:40 pd vmunix: [34173.893441]  [<ffffffff8106bded>] ? __blocking_notifier_call_chain+0x7d/0xd0
Mar 20 10:14:40 pd vmunix: [34173.893449]  [<ffffffff8144b94d>] ? cpufreq_governor_dbs+0x3bd/0x560
Mar 20 10:14:40 pd vmunix: [34173.893457]  [<ffffffff81074ce1>] ? get_parent_ip+0x11/0x50
Mar 20 10:14:40 pd vmunix: [34173.893464]  [<ffffffff81074d99>] ? sub_preempt_count+0x79/0xd0
Mar 20 10:14:40 pd vmunix: [34173.893472]  [<ffffffff8144b94d>] cpufreq_governor_dbs+0x3bd/0x560
Mar 20 10:14:40 pd vmunix: [34173.893480]  [<ffffffff8144b24a>] od_cpufreq_governor_dbs+0x1a/0x20
Mar 20 10:14:40 pd vmunix: [34173.893487]  [<ffffffff81448f13>] __cpufreq_governor+0x53/0xf0
Mar 20 10:14:40 pd vmunix: [34173.893494]  [<ffffffff814494a5>] __cpufreq_set_policy+0x155/0x180
Mar 20 10:14:40 pd vmunix: [34173.893502]  [<ffffffff8144a483>] cpufreq_update_policy+0xf3/0x130
Mar 20 10:14:40 pd vmunix: [34173.893510]  [<ffffffff8144a4c0>] ? cpufreq_update_policy+0x130/0x130
Mar 20 10:14:40 pd vmunix: [34173.893519]  [<ffffffff8144a4d1>] handle_update+0x11/0x20
Mar 20 10:14:40 pd vmunix: [34173.893526]  [<ffffffff8105f3f7>] process_one_work+0x1f7/0x670
Mar 20 10:14:40 pd vmunix: [34173.893533]  [<ffffffff8105f38c>] ? process_one_work+0x18c/0x670
Mar 20 10:14:40 pd vmunix: [34173.893541]  [<ffffffff8105fbfe>] worker_thread+0x10e/0x370
Mar 20 10:14:40 pd vmunix: [34173.893548]  [<ffffffff8105faf0>] ? rescuer_thread+0x240/0x240
Mar 20 10:14:40 pd vmunix: [34173.893556]  [<ffffffff810654fb>] kthread+0xdb/0xe0
Mar 20 10:14:40 pd vmunix: [34173.893563]  [<ffffffff81071ba5>] ? finish_task_switch+0x85/0x110
Mar 20 10:14:40 pd vmunix: [34173.893572]  [<ffffffff81065420>] ? __init_kthread_worker+0x70/0x70
Mar 20 10:14:40 pd vmunix: [34173.893579]  [<ffffffff8159a71c>] ret_from_fork+0x7c/0xb0
Mar 20 10:14:40 pd vmunix: [34173.893587]  [<ffffffff81065420>] ? __init_kthread_worker+0x70/0x70
Mar 20 10:14:40 pd vmunix: [34173.893594] ---[ end trace 66f5addf492b41b2 ]---

HTH.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
