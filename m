From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 49231] Single CPU bound process results in non-optimal turbo
 boost configuration
Date: Mon, 22 Oct 2012 23:02:24 +0000 (UTC)
Message-ID: <20121022230224.B889911FAE1@bugzilla.kernel.org>
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





--- Comment #3 from Roger Scott <ras243-korg@yahoo.com>  2012-10-22 23:02:24 ---
Hi Thomas,

Thanks for the ideas.  I'll do some more testing when I get home this evening
(Timezone=UTC+10).  The problem was showing up with jobs which were possibly
hammering the interrupts so I used the simplest test I could think of which was
a never-ending-do-nothing-for-loop written in C.  Unfortunately (or fortunately
depending on your perspective) this resulted in the same behaviour.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
