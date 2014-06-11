From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 15:59:03 +0000
Message-ID: <bug-77201-12968-fJlMB5nsDg@https.bugzilla.kernel.org/>
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

--- Comment #47 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to registosites from comment #46)
> No luck with these also, machine still hangs after bringing the cpu online :(

I expected this as as I couldn't find anything significant in cpufreq side.

@Srivatsa: Please have a look at diff between v3.13.8..my-branch --
drivers/cpufreq to see if I have missed something that could break stuff here.

Now what? I don't think something can be wrong with workqueues and it might be
some ACPI problem. Not very sure though.

Can you try bisecting between 3.13 and 3.14 again? And try fixing/skipping
commits with compile failures ?? Its very difficult to narrow it down
otherwise.

@Rafael: any guesses?

-- 
You are receiving this mail because:
You are the assignee for the bug.
