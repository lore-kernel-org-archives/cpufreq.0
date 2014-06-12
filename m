From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 02:36:51 +0000
Message-ID: <bug-77201-12968-emvxugcAPL@https.bugzilla.kernel.org/>
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

--- Comment #53 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Srivatsa S. Bhat from comment #48)
> Meanwhile, can the bug reporter please test these commits that I mentioned
> earlier? (6f1e4efd882 is my first suspect commit after 3.13.8)
> 
> 6f1e4efd882 (cpufreq: Fix timer/workqueue corruption by protecting reading
> governor_enabled)

It was already reverted in my branch

> 1c0ca90207 (cpufreq: don't call cpufreq_update_policy() on CPU addition)

Went in 3.15

> 4e97b631f24 (cpufreq: Initialize governor for a new policy under
> policy->rwsem)

Also reverted in my branch

> I know that the issue might not be in cpufreq (especially after your test
> results from Viresh's branch). But I still I have some tiny hope that we
> might have missed something in cpufreq... Besides, bisecting within the
> cpufreq commits is a lot faster than bisecting everything between 3.13.8 and
> 3.14, in case the bug is really in cpufreq.
> 
> By the way, testing the above commits means that you need to test 1 commit
> before the commits mentioned above and see if it works, and then go to the
> mentioned commit and see if it fails.

Actually I couldn't understand how this may help? Sorry for missing what you
had in mind :(

-- 
You are receiving this mail because:
You are the assignee for the bug.
