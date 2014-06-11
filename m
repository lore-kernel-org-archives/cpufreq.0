From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 11:01:37 +0000
Message-ID: <bug-77201-12968-6xehhLs8zy@https.bugzilla.kernel.org/>
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

--- Comment #33 from Srivatsa S. Bhat <srivatsa@mit.edu> ---
(In reply to Viresh Kumar from comment #31)

> Also some queries about your current logs:
> - I hope this was the last message you saw on screen and it just became
> unresponsive?
> 
> freq_table: target index is 0, freq is:2200000 kHz
> 
> and the expected ones after this are:
> 
> powernow_k8: targ: cpu 0, 2200000 kHz, min 800000, max 2200000
> powernow_k8: targ: curr fid 0x8, vid 0x15
> powernow_k8: cpu 0 transition to index 0
> powernow_k8: table matched fid 0xe, giving vid 0x12
> powernow_k8: cpu 0, changing to fid 0xe, vid 0x12
> 
> So, it looks like the CPU did came back and something happened while changing
> freq to max.
> 
> Somehow this problem is related to something special being done in your
> driver. We don't see this problem otherwise for other platforms.
>

Right.. I spent all night yesterday trying to figure out what could be the bug,
but I didn't find any leads :-(

> One thing i could figure out is scheduling a *work* for changing frequencies
> but I am not sure if the problem is related to that..
>

Yeah, that looked odd to me too!

> I tried to have a look at what changed between 3.13.8 and 3.14, and couldn't
> figure out anything special that might end up in this issue :(
> 

Not sure if any workqueue changes between those versions have any effect on the
CPU hotplug path for powernow-k8 cpufreq driver.

> 
> If you couldn't get anything conclusive with above tests then there might be
> some chances that it *isn't* related to cpufreq and some other changes in
> kernel are responsible. The best we can try is: get only cpufreq back to the
> old state, i.e. 3.13.8, by reverting commits and try again..
> 

I agree. I was about to suggest something similar.

> few reverts were required for this and to simplify your work I have created
> a branch with all reverts required.
> 
> git://git.linaro.org/people/viresh.kumar/mylinux.git powernow-k8-debugging
>

Since Viresh has already set this up, you can try this. If that doesn't help,
I'll give you a list of possible suspect commits in cpufreq between the 2
versions to try out. The ones at the top of my list would be: 


12478cf0c55e (cpufreq: Make sure frequency transitions are serialized)

e0b3165ba521 (cpufreq: add 'freq_table' in struct cpufreq_policy)

4e97b631f24 (cpufreq: Initialize governor for a new policy under policy->rwsem)

1c0ca90207 (cpufreq: don't call cpufreq_update_policy() on CPU addition)

6f1e4efd882 (cpufreq: Fix timer/workqueue corruption by protecting reading
governor_enabled)

Regards,
Srivatsa S. Bhat

-- 
You are receiving this mail because:
You are the assignee for the bug.
