From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Mon, 16 Jun 2014 12:51:21 +0000
Message-ID: <bug-77201-12968-R9qlOi9dFe@https.bugzilla.kernel.org/>
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

--- Comment #92 from Srivatsa S. Bhat <srivatsa@mit.edu> ---
(In reply to Mauro from comment #90)
> I've tried (from your tree, but I suppose that doesn't matter):
> 20d1c86 sched/clock, x86: Rewrite cyc2ns() to avoid the need to disable IRQs
> 57c67da sched/clock, x86: Move some cyc2ns() code around
> 5dd12c21 sched/clock, x86: Use mul_u64_u32_shr() for native_sched_clock()
> 62b94a0 sched/preempt: Take away preempt_enable_no_resched() from modules
> 
> and all of them fail to compile. Looking at the bisect log I attached when
> submitting the bug report, I see that all of them are the same I had to skip
> because they would not compile.
> 

Can we use the same "1 commit before, 1 commit after" method here?
That is, for each commit that you want to test, try one commit before it and
see if it passes, and one commit after it and see if it fails. That should give
us a good indication of whether the commit in question is problematic or not.
Of course you'll need to use the mainline tree for this, which doesn't include
any of the reverts.

Regards,
Srivatsa S. Bhat

-- 
You are receiving this mail because:
You are the assignee for the bug.
