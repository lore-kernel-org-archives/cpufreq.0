From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 17:50:57 +0000
Message-ID: <bug-77201-12968-N91YYlQEzL@https.bugzilla.kernel.org/>
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

--- Comment #48 from Srivatsa S. Bhat <srivatsa@mit.edu> ---

Hmm, this just became even more hard :-(

Viresh, sure, I'll check the diff tomorrow to see if there is any obvious
breakage.

Meanwhile, can the bug reporter please test these commits that I mentioned
earlier? (6f1e4efd882 is my first suspect commit after 3.13.8)

6f1e4efd882 (cpufreq: Fix timer/workqueue corruption by protecting reading
governor_enabled)

1c0ca90207 (cpufreq: don't call cpufreq_update_policy() on CPU addition)

4e97b631f24 (cpufreq: Initialize governor for a new policy under policy->rwsem)

I know that the issue might not be in cpufreq (especially after your test
results from Viresh's branch). But I still I have some tiny hope that we might
have missed something in cpufreq... Besides, bisecting within the cpufreq
commits is a lot faster than bisecting everything between 3.13.8 and 3.14, in
case the bug is really in cpufreq.

By the way, testing the above commits means that you need to test 1 commit
before the commits mentioned above and see if it works, and then go to the
mentioned commit and see if it fails.

Regards,
Srivatsa S. Bhat

-- 
You are receiving this mail because:
You are the assignee for the bug.
