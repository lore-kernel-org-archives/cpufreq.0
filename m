From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Mon, 18 Mar 2013 09:38:55 +0000 (UTC)
Message-ID: <20130318093855.53A1111FB5D@bugzilla.kernel.org>
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





--- Comment #3 from Duncan <1i5t5.duncan@cox.net>  2013-03-18 09:38:55 ---
Created an attachment (id=95711)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=95711)
cpufreq-info, post-resume (bad)

Bad (post-resume) cpufreq-info.  As expected given the missing symlinks, cpus 2
and 4 don't show anything.

But what happened to cpu5?  Why is it saying it runs at the same hardware
frequency as cpu3, NOT cpu4 as before, and why is it saying that, yet
never-the-less saying it's alone, software-coordination-wise?

And if cpu5 is supposed to be hardware-frequency-linked to cpu3 now, why
doesn't cpu3 list cpu5 as cpu5 lists cpu3?

Goofy values indeed!

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
