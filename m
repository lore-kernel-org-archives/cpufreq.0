From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 19:35:10 +0000
Message-ID: <bug-77201-12968-CnwCs4giBm@https.bugzilla.kernel.org/>
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

--- Comment #50 from registosites@hotmail.com ---
(In reply to Srivatsa S. Bhat from comment #48)
> Meanwhile, can the bug reporter please test these commits that I mentioned
> earlier? (6f1e4efd882 is my first suspect commit after 3.13.8)
> 
> 6f1e4efd882 (cpufreq: Fix timer/workqueue corruption by protecting reading
> governor_enabled)
> 
> 1c0ca90207 (cpufreq: don't call cpufreq_update_policy() on CPU addition)
> 
> 4e97b631f24 (cpufreq: Initialize governor for a new policy under
> policy->rwsem)

I'll test the commits before these and these commits and post back when I have
the results.

Should I also test

e0b3165ba521 (cpufreq: add 'freq_table' in struct cpufreq_policy)
12478cf0c55e (cpufreq: Make sure frequency transitions are serialized)

in case the previous ones work/don't work?

-- 
You are receiving this mail because:
You are the assignee for the bug.
