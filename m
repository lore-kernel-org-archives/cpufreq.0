From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 2 Nov 2010 08:59:45 GMT
Message-ID: <201011020859.oA28xjl9015038@demeter1.kernel.org>
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





--- Comment #41 from Thomas Renninger <trenn@suse.de>  2010-11-02 08:59:37 ---
> So, do you need anything else from me?
Eh, yes, I found something else:
You have constant_tsc feature, but not non-stop tsc feature.
CPU idle drivers mark tsc unstable if C-states are used. If C-states also
affect aperf/mperf timers, they must not used as well in this case.
Can you try: idle=halt boot param
Argh, intel idle driver does not recognize idle= overrides.
Please try idle=halt with another patch I'll provide.
Or try both params (then the patch should not be needed):
intel_idle.max_cstate=0 idle=halt
Does cpufreq-aperf then give you sane average frequency values in the range of
min/max freq and cpufreq subsystem works as expected?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
