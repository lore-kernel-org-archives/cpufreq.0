From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Mon, 18 Mar 2013 10:40:03 +0000 (UTC)
Message-ID: <20130318104003.E599511FB83@bugzilla.kernel.org>
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





--- Comment #5 from Duncan <1i5t5.duncan@cox.net>  2013-03-18 10:40:03 ---
Created an attachment (id=95731)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=95731)
grep . cpu?/cpufreq/* (bad/post-resume)

As with cpufreq-info (bad), the grep (bad) shows cpu3 reporting only itself in
related_cpus, while cpu5 reports 3 and 5, yet pre-suspend, 2 and 3 were paired
as were 4 and 5.  But affected_cpus reports only the single one for both. And
of course there's no cpu2 or 4 shown as those dirs/symlinks are gone!

Additional comment on the cpuinfo_cur_freq question.  Feel free to point me to
"TFM" for me to "R".  I just haven't seen it. 
(Documentation/cpu-freq/user-guide.txt says cpuinfo_cur_freq is what the
hardware reports, scaling_cur_freq is what the kernel thinks it should be, but
that doesn't explain the conditions under which they might differ, or why
cpuinfo_cur_freq is readable only by root, while scaling_cur_freq and all the
other cpufreq/* files are readable by world.)

This is the last file I can think to attach ATM.  Let me know if there's
anything else.

FWIW, I've standardized on reiserfs here, as at least since the introduction of
data=ordered in 2.6.16 or so, it has been quite good to me, I think in part
because the kernel folks don't screw with it as much as they do ext2/3/4.  And
all my filesystems are well under a half TB anyway.  So if necessary, I believe
I could bisect without running into the mid-window ext4 issue, but I'm hoping
the specific triggers here, that it happens only after a s2ram/resume cycle,
narrow it down enough so that isn't necessary, once someone familiar with the
subsystem and its 3.8 -> 3.9-rc* changes takes a look.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
