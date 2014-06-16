From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Mon, 16 Jun 2014 15:41:06 +0000
Message-ID: <bug-77201-12968-6Ilf8lFFhw@https.bugzilla.kernel.org/>
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

--- Comment #96 from Srivatsa S. Bhat <srivatsa@mit.edu> ---
(In reply to Viresh Kumar from comment #95)
> (In reply to Srivatsa S. Bhat from comment #94)
> > Hmm, right. Ok, then I guess we'll just have to try and fix the build errors
> > in these commits and try your tests on them. Viresh might already be working
> > on doing that, but if not, I'll try to fix them for you.
> 
> I haven't done anything yet and don't know how to get these fixed.. I have
> gone through the series which played with this stuff and looks there were
> way too many issues reported by multiple people.
> 
> https://lkml.org/lkml/2014/1/21/512
> 
> Anyway Mauro has already verified that reverting these two commits fixes our
> issues over 3.14..
> 
> > 20d1c86 sched/clock, x86: Rewrite cyc2ns() to avoid the need to disable IRQs
> > 57c67da sched/clock, x86: Move some cyc2ns() code around
> 
> So, can we get peter in the discussion here now ? We can tell him that
> things aren't bisectable and so don't know which of these has broken things..
> 

Sure, that sounds better. No point trying to debug this further when he can
probably tell us precisely what is going wrong, and fix it immediately.

Regards,
Srivatsa S. Bhat

-- 
You are receiving this mail because:
You are the assignee for the bug.
