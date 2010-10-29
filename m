From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 29 Oct 2010 20:19:38 GMT
Message-ID: <201010292019.o9TKJceO001644@demeter2.kernel.org>
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





--- Comment #34 from Thomas Renninger <trenn@suse.de>  2010-10-29 20:19:32 ---
Created an attachment (id=35492)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=35492)
Patch to workaround the possible HW defect

If this really helps, please also try cpufreq-aperf tool from a latest
cpufrequtils package and check what kind of broken values aperf/mperf provide
on CPU0.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
