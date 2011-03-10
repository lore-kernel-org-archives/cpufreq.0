From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Thu, 10 Mar 2011 09:26:00 GMT
Message-ID: <201103100926.p2A9Q0xZ002907@demeter2.kernel.org>
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





--- Comment #17 from Thomas Renninger <trenn@suse.de>  2011-03-10 09:26:00 ---
Created an attachment (id=50542)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=50542)
Enforce using of broadcast timers through boot param processor

Enforce using of broadcast timers through boot param processor:
processor.timer_broadcast=1

Might help...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
