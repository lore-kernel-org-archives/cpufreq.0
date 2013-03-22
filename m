From: Borislav Petkov <bp@alien8.de>
Subject: More cpufreq breakage
Date: Fri, 22 Mar 2013 16:12:28 +0100
Message-ID: <20130322151228.GH30807@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <20130319074953.C200811FB80@bugzilla.kernel.org>
 <CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
 <3039053.c3U9fYsQRn@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363965154; bh=Ubvb7vTkZwilb1scqPbxHxCvW7TQV2moUQStyiV6R0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=pspPpO9dy9NdfcbSz0MNBsqkILRsnwxw/ZY7dL
	nAfStyOjC7j0HIBtGtute2md0DrO2AFOeCDhkA3I94IsFbHjPiFuTsXG7y9QWs8tVK1
	Ujapq0Jmi16TTE5HqKPn52BQKahyRU6ga5sVZDO3OEzOGrMwMw9Cdl8JfHCsy/oQr4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1363965154; bh=Ubvb7vTkZwilb1scqPbxHxCvW7TQV2moUQStyiV6R0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=pspPpO9dy9NdfcbSz0MNBsqkILRsnwxw/ZY7dL
	nAfStyOjC7j0HIBtGtute2md0DrO2AFOeCDhkA3I94IsFbHjPiFuTsXG7y9QWs8tVK1
	Ujapq0Jmi16TTE5HqKPn52BQKahyRU6ga5sVZDO3OEzOGrMwMw9Cdl8JfHCsy/oQr4=
Content-Disposition: inline
In-Reply-To: <3039053.c3U9fYsQRn@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

Btw,

while we're at it, I just discovered this in dmesg. Plain -rc3.

[34173.893305] ------------[ cut here ]------------
[34173.893321] WARNING: at kernel/mutex.c:199 mutex_lock_nested+0x39c/0x3b0()
[34173.893328] Hardware name: To be filled by O.E.M.
[34173.893333] Modules linked in: nls_iso8859_15 nls_cp437 fuse tun cpufreq_powersave cpufreq_userspace cpufreq_stats cpufreq_conservative dm_crypt dm_mod ipv6 vfat fat acpi_cpufreq mperf kvm_amd kvm crc32_pclmul aesni_intel aes_x86_64 ablk_helper cryptd xts lrw gf128mul microcode radeon amd64_edac_mod edac_core k10temp fam15h_power drm_kms_helper ttm cfbfillrect cfbimgblt r8169 cfbcopyarea
[34173.893395] Pid: 15316, comm: kworker/0:0 Not tainted 3.9.0-rc3 #1
[34173.893402] Call Trace:
[34173.893409]  [<ffffffff8103b33f>] warn_slowpath_common+0x7f/0xc0
[34173.893417]  [<ffffffff8103b39a>] warn_slowpath_null+0x1a/0x20
[34173.893424]  [<ffffffff8159654c>] mutex_lock_nested+0x39c/0x3b0
[34173.893432]  [<ffffffff8144b94d>] ? cpufreq_governor_dbs+0x3bd/0x560
[34173.893441]  [<ffffffff8106bded>] ? __blocking_notifier_call_chain+0x7d/0xd0
[34173.893449]  [<ffffffff8144b94d>] ? cpufreq_governor_dbs+0x3bd/0x560
[34173.893457]  [<ffffffff81074ce1>] ? get_parent_ip+0x11/0x50
[34173.893464]  [<ffffffff81074d99>] ? sub_preempt_count+0x79/0xd0
[34173.893472]  [<ffffffff8144b94d>] cpufreq_governor_dbs+0x3bd/0x560
[34173.893480]  [<ffffffff8144b24a>] od_cpufreq_governor_dbs+0x1a/0x20
[34173.893487]  [<ffffffff81448f13>] __cpufreq_governor+0x53/0xf0
[34173.893494]  [<ffffffff814494a5>] __cpufreq_set_policy+0x155/0x180
[34173.893502]  [<ffffffff8144a483>] cpufreq_update_policy+0xf3/0x130
[34173.893510]  [<ffffffff8144a4c0>] ? cpufreq_update_policy+0x130/0x130
[34173.893519]  [<ffffffff8144a4d1>] handle_update+0x11/0x20
[34173.893526]  [<ffffffff8105f3f7>] process_one_work+0x1f7/0x670
[34173.893533]  [<ffffffff8105f38c>] ? process_one_work+0x18c/0x670
[34173.893541]  [<ffffffff8105fbfe>] worker_thread+0x10e/0x370
[34173.893548]  [<ffffffff8105faf0>] ? rescuer_thread+0x240/0x240
[34173.893556]  [<ffffffff810654fb>] kthread+0xdb/0xe0
[34173.893563]  [<ffffffff81071ba5>] ? finish_task_switch+0x85/0x110
[34173.893572]  [<ffffffff81065420>] ? __init_kthread_worker+0x70/0x70
[34173.893579]  [<ffffffff8159a71c>] ret_from_fork+0x7c/0xb0
[34173.893587]  [<ffffffff81065420>] ? __init_kthread_worker+0x70/0x70
[34173.893594] ---[ end trace 66f5addf492b41b2 ]---

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
