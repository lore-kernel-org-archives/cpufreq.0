From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56691] Using Intel Pstates driver causes panics during high
 loads
Date: Tue, 16 Apr 2013 17:45:39 +0000 (UTC)
Message-ID: <20130416174539.E03F811FA4E@bugzilla.kernel.org>
References: <bug-56691-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-56691-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=56691


Dirk Brandewie <dirk.brandewie@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dirk.brandewie@gmail.com




--- Comment #2 from Dirk Brandewie <dirk.brandewie@gmail.com>  2013-04-16 17:45:39 ---
This is the same bug as reported by Redhat 
https://bugzilla.redhat.com/show_bug.cgi?id=952244

I took a long time to reproduce and catch it in the act and get debug info :-(

The fix missed rc6 by a few hours but is in rc7. 

--Dirk
Author: Dirk Brandewie <dirk.brandewie@gmail.com>  2013-04-04 10:35:35
Committer: Rafael J. Wysocki <rafael.j.wysocki@intel.com>  2013-04-08 13:09:23
Parent: 05e99c8cf9d4e53ef6e016815db40a89a6156529 (intel-pstate: Use #defines
instead of hard-coded values.)
Branches: master, pstate, pstate.stgit, remotes/linux-pm/bleeding-edge,
remotes/linux-pm/fixes, remotes/linux-pm/linux-next, remotes/next/akpm,
remotes/next/akpm-base, remotes/next/master, remotes/next/stable,
remotes/origin/master, test_next
Follows: v3.9-rc6
Precedes: pm-3.9-rc7

    cpufreq / intel_pstate: Set timer timeout correctly

    The current calculation of the delay time is wrong and a cut and
    paste error from a previous experimental driver.  This can result in
    the timeout being set to jiffies + 1 which setup the driver to race
    with itself if the APIC timer interrupt happens at just the right
    time.

    References: https://bugzilla.redhat.com/show_bug.cgi?id=920289
    Reported-by: Adam Williamson <awilliam@redhat.com>
    Reported-and-tested-by: Parag Warudkar <parag.lkml@gmail.com>
    Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

------------------------ drivers/cpufreq/intel_pstate.c
------------------------
index ad72922..6133ef5 100644
@@ -502,7 +502,6 @@ static inline void intel_pstate_set_sample_time(struct
cpudata *cpu)

     sample_time = cpu->pstate_policy->sample_rate_ms;
     delay = msecs_to_jiffies(sample_time);
-    delay -= jiffies % delay;
     mod_timer_pinned(&cpu->timer, jiffies + delay);
 }

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
