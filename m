From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: More cpufreq breakage
Date: Fri, 22 Mar 2013 21:52:29 +0530
Message-ID: <CAKohpokjpOepnuj3dny+j0UYurVHBZci=BdFa5OxR+e7k-512w@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<20130319074953.C200811FB80@bugzilla.kernel.org>
	<CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
	<3039053.c3U9fYsQRn@vostro.rjw.lan>
	<20130322151228.GH30807@pd.tnic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130322151228.GH30807@pd.tnic>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Borislav Petkov <bp@alien8.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

On 22 March 2013 20:42, Borislav Petkov <bp@alien8.de> wrote:
> Btw,
>
> while we're at it, I just discovered this in dmesg. Plain -rc3.

I am looking at it since some time, but need a bit of help.

> [34173.893305] ------------[ cut here ]------------
> [34173.893321] WARNING: at kernel/mutex.c:199 mutex_lock_nested+0x39c/0x3b0()
> [34173.893328] Hardware name: To be filled by O.E.M.
> [34173.893333] Modules linked in: nls_iso8859_15 nls_cp437 fuse tun cpufreq_powersave cpufreq_userspace cpufreq_stats cpufreq_conservative dm_crypt dm_mod ipv6 vfat fat acpi_cpufreq mperf kvm_amd kvm crc32_pclmul aesni_intel aes_x86_64 ablk_helper cryptd xts lrw gf128mul microcode radeon amd64_edac_mod edac_core k10temp fam15h_power drm_kms_helper ttm cfbfillrect cfbimgblt r8169 cfbcopyarea
> [34173.893395] Pid: 15316, comm: kworker/0:0 Not tainted 3.9.0-rc3 #1
> [34173.893402] Call Trace:
> [34173.893409]  [<ffffffff8103b33f>] warn_slowpath_common+0x7f/0xc0
> [34173.893417]  [<ffffffff8103b39a>] warn_slowpath_null+0x1a/0x20
> [34173.893424]  [<ffffffff8159654c>] mutex_lock_nested+0x39c/0x3b0
> [34173.893432]  [<ffffffff8144b94d>] ? cpufreq_governor_dbs+0x3bd/0x560
> [34173.893441]  [<ffffffff8106bded>] ? __blocking_notifier_call_chain+0x7d/0xd0
> [34173.893449]  [<ffffffff8144b94d>] ? cpufreq_governor_dbs+0x3bd/0x560
> [34173.893457]  [<ffffffff81074ce1>] ? get_parent_ip+0x11/0x50
> [34173.893464]  [<ffffffff81074d99>] ? sub_preempt_count+0x79/0xd0

What does "?" mean before a functions name in trace? I am not able to
figure out the exact sequence as i don't see why sub_preempt_count() and
get_parent_ip() got called. And then this notifier call.
