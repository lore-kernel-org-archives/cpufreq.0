From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Fri, 13 Jun 2014 04:20:31 +0000
Message-ID: <bug-77201-12968-dZ5YnYMM8K@https.bugzilla.kernel.org/>
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

--- Comment #71 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Mauro from comment #68)
> I have started what Viresh requested and the first try worked, but I haven't
> started moving the debug code to try to find where things go wrong.

Great, and we reach here only after work is scheduled.

So. Srivatsa lost his bet :) and its not scheduler as well..

I have updated my tree again to get to the real target, transition_fid_vid().
This is calling few routines to change freq/volt and we can check them one by
one. I am quite hopeful this will work as well and next few may break .

Give us a good news this time :)

> I'd say my initial bisect might be very close to the source of the problem,

You meant the new hack ?

> the reason I say this is because the machine goes into suspend just fine,
> but when trying to resume it hangs (that was my initial testing procedure),
> knowing what I know now I'd say a good guess is it hangs when trying to
> bring the cpu online.

All thanks to Rafael for his guess. It was perfect!!

-- 
You are receiving this mail because:
You are the assignee for the bug.
