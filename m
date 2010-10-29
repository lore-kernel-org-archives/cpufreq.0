From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 29 Oct 2010 11:06:30 GMT
Message-ID: <201010291106.o9TB6UMO013011@demeter1.kernel.org>
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





--- Comment #29 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-10-29 11:06:22 ---
I applied the patch "CPUFREQ: Fix HW_ALL core dependencies" to a vanilla 2.6.36
(without any of the previously posted patches) and it did NOT fix the problem
for me. I'm still stuck at the lowest freq until I lower up_threshold.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
