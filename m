From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Mon, 18 Mar 2013 12:14:49 +0000 (UTC)
Message-ID: <20130318121449.B594511FB81@bugzilla.kernel.org>
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





--- Comment #7 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-18 12:14:49 ---
(In reply to comment #5)
> (Documentation/cpu-freq/user-guide.txt says cpuinfo_cur_freq is what the
> hardware reports, scaling_cur_freq is what the kernel thinks it should be, but
> that doesn't explain the conditions under which they might differ, or why

If cpu frequency changes without kernel getting to know about it.

> cpuinfo_cur_freq is readable only by root, while scaling_cur_freq and all the
> other cpufreq/* files are readable by world.)

Because it is accessing the h/w directly and they don't want anybody else to do
this.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
