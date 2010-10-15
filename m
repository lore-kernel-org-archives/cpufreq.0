From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 15 Oct 2010 19:25:18 GMT
Message-ID: <201010151925.o9FJPIRY002586@demeter1.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #16 from Thomas Renninger <trenn@suse.de>  2010-10-15 19:24:59 ---
Could have been related to cpuidle and the new intel_idle driver, but I also
see no recent fixes there as well.
If this is true:
fixed between 2.6.36-rc6-git2 and 2.6.36-rc7-git3
it shouldn't be that hard to bisect on those rather stable versions.
Be aware that you have to exchange git "good" and "bad" if you search for a fix
and not for a regression/bug.

That would be:
git start <bad>           <good>
git start 2.6.36-rc7-git3 2.6.36-rc6-git2
If a version works well go for git bad
if it shows the bug go for git good

gitX is not tagged in git though, no idea how one can find out the git id of
these subcommits/merges?

Heinz: How sure are you that it got fixed in 2.6.36-rc7-git3?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
