From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 12 Oct 2010 11:19:51 GMT
Message-ID: <201010121119.o9CBJppF031173@demeter1.kernel.org>
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





--- Comment #6 from Thomas Renninger <trenn@suse.de>  2010-10-12 11:19:47 ---
The BIOS latency values look sane, I wonder why my patch helps.
Because I am blindfolded..., this is about reducing up_threshold and
it is a a duplicate of bug #17001.
Can you try to lower up_treshold to 53 or below as mentioned there and then use
cat /dev/zero >/dev/null &
multiple times to utilize CPUs.

Looks like something broke somewhen before 2.6.35.7.
Do you know about a kernel version that did not show this?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
