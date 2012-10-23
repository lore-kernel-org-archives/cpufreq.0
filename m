From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 49231] Single CPU bound process results in non-optimal turbo
 boost configuration
Date: Tue, 23 Oct 2012 10:20:27 +0000 (UTC)
Message-ID: <20121023102027.8A50311FA36@bugzilla.kernel.org>
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





--- Comment #5 from Thomas Renninger <trenn@suse.de>  2012-10-23 10:20:27 ---
> so I used the simplest test I could think of which was a never-ending-
> do-nothing-for-loop written in C
JFI, I use:
cat /dev/zero >/dev/null &
to utilized one core with 100% CPU load.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
