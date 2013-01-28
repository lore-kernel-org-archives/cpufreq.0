From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 49231] Single CPU bound process results in non-optimal turbo
 boost configuration
Date: Mon, 28 Jan 2013 23:57:30 +0000 (UTC)
Message-ID: <20130128235730.B232E11FF1B@bugzilla.kernel.org>
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





--- Comment #8 from Len Brown <lenb@kernel.org>  2013-01-28 23:57:30 ---
> nothing seems to be wrong.

Agreed.
Turbo depends on idle,
and idle depends on tickless.

If you tick 1000/sec on each thread, your system will simultaneously
have poor power and poor performance.  There have been several proposals
to remove the tickful option from the kernel, and sightings like this are why.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
