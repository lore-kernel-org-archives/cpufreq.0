From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55091] cpufreq governors woks crazy
Date: Tue, 12 Mar 2013 11:15:49 +0000 (UTC)
Message-ID: <20130312111549.B0EB811F877@bugzilla.kernel.org>
References: <bug-55091-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55091-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55091


Viresh Kumar <viresh.kumar@linaro.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |viresh.kumar@linaro.org




--- Comment #1 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-12 11:15:49 ---
Hi,

I was the guy behind most of the cpufreq core updates in this kernel release. I
haven't tried to reproduce the problem you got (was very busy with some other
activity), but i am trying to analyse what may cause it. Following are the
important updates that i can make out from: 'git diff v3.8..v3.9-rc2'

- Locking Fixes
- policy->cpus and policy->related_cpus fixups
- simplification of cpu hotplug path in cpufreq core
- removing redundant code between governors

I don't really think any of the above can cause this problem, unless there is a
bug somewhere.

- per cpu timer for both ondemand and conservative:

commit 2abfa876f1117b0ab45f191fb1f82c41b1cbc8fe
Author: Rickard Andersson <rickard.andersson@stericsson.com>
Date:   Thu Dec 27 14:55:38 2012 +0000

    cpufreq: handle SW coordinated CPUs

    This patch fixes a bug that occurred when we had load on a secondary CPU
    and the primary CPU was sleeping. Only one sampling timer was spawned
    and it was spawned as a deferred timer on the primary CPU, so when a
    secondary CPU had a change in load this was not detected by the cpufreq
    governor (both ondemand and conservative).

    This patch make sure that deferred timers are run on all CPUs in the
    case of software controlled CPUs that run on the same frequency.



This can be behind all the problem you are facing. Can you try reverting all
patches including and after this patch?

If any of the cpu is loaded enough, then you will see some freq used (based on
the load). Whereas, earlier if cpu0 goes down, then we were just not
re-evaluating load at all.

--
viresh

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
