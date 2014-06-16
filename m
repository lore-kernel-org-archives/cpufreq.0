From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Mon, 16 Jun 2014 09:51:07 +0000
Message-ID: <bug-77201-12968-mIxtzfgpck@https.bugzilla.kernel.org/>
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

--- Comment #89 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Mauro from comment #87)
> (In reply to Viresh Kumar from comment #86)
> > Only one of these two will work for you. Check which one, I would put my 10
> > cents on *-post1 branch :)
>  
> You should have bet more, *-post2 hangs, *-post1 works.

Thanks for your great results :)

Last round of debugging I want you to do :)

One of these commits is the culprit:

57c67da sched/clock, x86: Move some cyc2ns() code around
20d1c86 sched/clock, x86: Rewrite cyc2ns() to avoid the need to disable IRQs

Can you test these commits and the ones just before them? And we will know
which commit broke this for you..

As both are written by Peter Zijlstra, we can ping him back and lets see what
he says.

-- 
You are receiving this mail because:
You are the assignee for the bug.
