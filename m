From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Wed, 3 Nov 2010 20:42:50 GMT
Message-ID: <201011032042.oA3KgoFw032348@demeter1.kernel.org>
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





--- Comment #43 from Thomas Renninger <trenn@suse.de>  2010-11-03 20:42:44 ---
> CPU idle drivers mark tsc unstable if C-states are used. If C-states also
> affect aperf/mperf timers, they must not used as well in this case.
That is wrong, sorry about that:
aperf/mperf timers always stop in C-states, but the resulting average frequency
during C0 (not idle) must still be correct.
Also the fact that only one CPU is affected very much points to defect HW.
As long as this only shows up one machine it's also not worth adding extra code
to the kernel. If you want to workaround this in self-built kernels, best is
you remove the aperfmperf capabilties line from
arch/x86/kernel/include/asm/cpufeatures.h as it's also used in the scheduler.
Still waiting some days from feedback from Heinz before closing this one
"documented". As it's a totally different CPU it's probably something else.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
