From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 02:48:11 +0000
Message-ID: <bug-77201-12968-IVMz9wnaWB@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #54 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Srivatsa S. Bhat from comment #49)
> By the way, another approach I have in mind is to remove the usage of
> work_on_cpu() from the powernow-k8 driver (since that's the only noticeably
> different thing about this driver), and check if it solves the problem.

I wouldn't bet my 10 cents on that :). Also I am not sure if people added a
work there just for fun, there must be some constraints and we might see
crashes or hangs..

But yeah, maybe we can try that as well..

I was thinking about this earlier but never shared as I thought it might not be
worth.

Logs shared by $reporter of this problem clears that cpufreq and governors did
all good, more or less. And it was the target_index() which never came back.. I
will try having a closer look again though. $reporter also reported that
offline/online works fine with performance gov but switching back to ondemand
again crashes it. Which makes me believe that cpufreq core is doing everything
correctly and there is some problem while switching freq after offline/online.

@Reporter (sorry we don't know your name :( ), Can you please try this?

Keep the prints as you shared in last hang pic. Set governor to userspace, 
set any cpu to min freq, offline/online cpu1, change freq to any freq (and
later max freq if earlier one works) and see how things behave.. I am quite
sure it wouldn't last.

If you still see a hang you might want to do this:
- Add many debug prints in your target_index() path (as gov is userspace you
wouldn't see them again and again).
- And see where exactly you hang .. 
- I am quite sure work will get scheduled and so try adding as many debug
prints as possible on the first go only.

HTH :)

-- 
You are receiving this mail because:
You are the assignee for the bug.
