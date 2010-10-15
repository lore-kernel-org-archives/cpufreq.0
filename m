From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 15 Oct 2010 10:15:12 GMT
Message-ID: <201010151015.o9FAFCHq012611@demeter1.kernel.org>
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





--- Comment #14 from Thomas Renninger <trenn@suse.de>  2010-10-15 10:15:06 ---
In bug #17001 it's stated:
> As far as I can tell, the problem exists at least since kernel version 2.6.30
But this would be something machine specific then, someone should have reported
that already meanwhile.
Could also be that above statement is wrong and something went wrong when
testing 2.6.30 and this is as mentioned a regression introduced in 2.6.35 and
fixed somewhere between 2.6.36-rc6-git2 and 2.6.36-rc7-git3...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
