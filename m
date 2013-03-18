From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Mon, 18 Mar 2013 09:56:04 +0000 (UTC)
Message-ID: <20130318095604.8251311FB5D@bugzilla.kernel.org>
References: <bug-55411-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55411-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55411





--- Comment #4 from Duncan <1i5t5.duncan@cox.net>  2013-03-18 09:56:04 ---
Created an attachment (id=95721)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=95721)
grep . cpu?/cpufreq/* (good/pre-suspend)

Good/pre-s2ram grep . cpu?/cpufreq/*

I deliberately redirected STDERR as well to hilite a question I've always had,
as this is the best chance I suppose I'll get for a good answer:

Obviously as non-root:

grep: /sys/devices/system/cpu/cpu?/cpufreq/cpuinfo_cur_freq: Permission denied

Root is required to read cpuinfo_cur_freq.

But /sys/devices/system/cpu/cpu?/cpufreq/scaling_cur_freq:1400000

scaling_cur_freq is readable by world.

What's the difference between the two files and why is cpuinfo_cur_freq so
special as to be the only file in the dir with 0400 perms, as opposed to 0444?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
