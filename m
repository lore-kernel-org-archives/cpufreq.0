From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 15 Oct 2010 10:07:17 GMT
Message-ID: <201010151007.o9FA7H0c008563@demeter1.kernel.org>
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


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |ASSIGNED
                 CC|                            |a.p.zijlstra@chello.nl,
                   |                            |mingo@elte.hu, rjw@sisk.pl




--- Comment #12 from Thomas Renninger <trenn@suse.de>  2010-10-15 10:07:06 ---
Thanks!
So it looks like we have a regression in 2.6.35 kernel which got fixed between 
 2.6.36-rc6-git2 and 2.6.36-rc7-git3.
It affects idle/busy/io CPU accounting in way that cpufreq ondemand governor
does not switch up frequency (only with the workaround by dramatically
decreasing up_threshold tunable).

The fix seem not to be in any cpufreq related code (According to Heinz, I
didn't double check, but haven't seen anything on the cpufreq list lately).

Rafael/Ingo/Peter: Do you have an idea which patch could have solved this
issue.
This should probably go to .35 stable...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
