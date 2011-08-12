From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 12 Aug 2011 13:20:55 GMT
Message-ID: <201108121320.p7CDKtmK030057@demeter2.kernel.org>
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





--- Comment #54 from David Tomaschik <david@systemoverlord.com>  2011-08-12 13:20:36 ---
An update on my post above.  Disabling TurboBoost in the BIOS seems to have
resolved the issue.  I wonder if TurboBoost somehow causes mis-reported aperf
statistics.

Interestingly enough, the ratios are the same as the turboboost ratio on this
CPU.  That is, 3.2GHz (Turbo)/2.5 GHz (Stock) == 800 MHz (Real minimum)/625 MHz
(reported minimum via aperf).  I don't know if it matters, just thought it was
notable.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
