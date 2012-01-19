From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16274] VIA EPIA PX5000EG - Longhaul is currently broken in this
 configuration
Date: Thu, 19 Jan 2012 21:50:43 GMT
Message-ID: <201201192150.q0JLohYd010975@bugzilla.kernel.org>
References: <bug-16274-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16274-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16274





--- Comment #3 from Rafa&#322; Bilski <rafalbilski@interia.pl>  2012-01-19 21:50:41 ---
Created an attachment (id=72135)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=72135)
Proposed patch

Sorry my bad. Sanity checks before "CPU is VIA C3" check.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
