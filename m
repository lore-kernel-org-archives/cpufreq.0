From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 49231] Single CPU bound process results in non-optimal turbo
 boost configuration
Date: Wed, 24 Oct 2012 11:44:03 +0000 (UTC)
Message-ID: <20121024114403.D4AD611FAE0@bugzilla.kernel.org>
References: <bug-49231-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-49231-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=49231


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
         Resolution|                            |INVALID




--- Comment #7 from Thomas Renninger <trenn@suse.de>  2012-10-24 11:44:03 ---
> So I thought I'd try running with the NO_HZ setting and interestingly
> the idle cores now stay in C7
Ok, tickless timer configuration is a must for this processor to enter deepest
sleep states and thus enter boosting mode.
How/when processors enter deep sleep states (even if requested by the kernel)
is very HW specific. So that the CPUs behave differently (one enters deeper
sleep states without NO_HZ, the other does not (probably not very efficiently))
may be interesting, but it looks like it works as designed.
Hm, not sure whether to close this invalid or documented -> going for invalid
as nothing seems to be wrong.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
