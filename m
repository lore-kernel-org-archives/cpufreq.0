From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59781] intel_pstate synchronizes frequencies on wake from
 suspend
Date: Mon, 17 Jun 2013 17:15:25 +0000 (UTC)
Message-ID: <20130617171525.6248211FB35@bugzilla.kernel.org>
References: <bug-59781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-59781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59781


Dirk Brandewie <dirk.brandewie@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dirk.brandewie@gmail.com




--- Comment #5 from Dirk Brandewie <dirk.brandewie@gmail.com>  2013-06-17 17:15:25 ---
Could you use turbostat to collect data on the good and bad state please.

Does this happen all the time?  There are a number of bugs open where both
intel_pstate and ondemand are doing weird things after coming out of
suspend.  I the other bugs the situation would clear sometimes after a number
of suspend/resume cycles.

If you could see if this happens without intel_pstate it would be helpful

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
