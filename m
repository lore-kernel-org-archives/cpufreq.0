From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Mon, 7 Mar 2011 17:23:31 GMT
Message-ID: <201103071723.p27HNV7a018723@demeter1.kernel.org>
References: <bug-12114-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12114-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12114





--- Comment #10 from Dominique Larchey-Wendling <larchey@loria.fr>  2011-03-07 17:23:30 ---
Another remark. It seems that the PR_GET_TSC and PR_SET_TSC operations of prctl
where implemented in the kernel starting with 2.6.26. Maybe a userland process
is involved here. 

ntp was also messed up with the unstable TSC. It got unsynchronized very
quickly and of course, before networking went down.

Maybe the same issue as the netdev_watchdog timeout ...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
