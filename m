From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Mon, 16 Jun 2014 13:15:24 +0000
Message-ID: <bug-77201-12968-l2EOJkxEyw@https.bugzilla.kernel.org/>
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

--- Comment #93 from Mauro <registosites@hotmail.com> ---
(In reply to Srivatsa S. Bhat from comment #92)

> Can we use the same "1 commit before, 1 commit after" method here?
> That is, for each commit that you want to test, try one commit before it and
> see if it passes, and one commit after it and see if it fails. That should
> give us a good indication of whether the commit in question is problematic
> or not. Of course you'll need to use the mainline tree for this, which
> doesn't include any of the reverts.

Well, the bisect log I attached when I opened the bug report was done with
mainline, the conclusion was:

# only skipped commits left to test
# possible first bad commit: [0bd3a173d711857fc9f583eb5825386cc08f3948]
sched/preempt, locking: Rework local_bh_{dis,en}able()
# possible first bad commit: [10b033d434c25a6c9e0f4f4dc2418af1b8236c63]
sched/clock, x86: Avoid a runtime condition in native_sched_clock()
# possible first bad commit: [6577e42a3e1633afe762f47da9e00061ee4b9a5e]
sched/clock: Fix up clear_sched_clock_stable()
# possible first bad commit: [35af99e646c7f7ea46dc2977601e9e71a51dadd5]
sched/clock, x86: Use a static_key for sched_clock_stable
# possible first bad commit: [ef08f0fff87630d4f67ceb09514d8b444df833f8]
sched/clock: Remove local_irq_disable() from the clocks
# possible first bad commit: [20d1c86a57762f0a33a78988e3fc8818316badd4]
sched/clock, x86: Rewrite cyc2ns() to avoid the need to disable IRQs
# possible first bad commit: [57c67da274f3fab38e08d2c9edf08b89e1d9c71d]
sched/clock, x86: Move some cyc2ns() code around
# possible first bad commit: [5dd12c2152743747ca9f50ef80281e54cc416dc0]
sched/clock, x86: Use mul_u64_u32_shr() for native_sched_clock()
# possible first bad commit: [62b94a08da1bae9d187d49dfcd6665af393750f8]
sched/preempt: Take away preempt_enable_no_resched() from modules
# possible first bad commit: [9ea4c380066fbe23fe0da7f4abfabc444f2467f4]
locking: Optimize lock_bh functions

Unless I'm seeing this wrong, the commits Viresh wanted me to try are included
there, as well as several commits before and after, the result I'm seeing now
is the same as the one I saw before, those commits fail to compile.

-- 
You are receiving this mail because:
You are the assignee for the bug.
