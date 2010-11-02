From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 2 Nov 2010 09:03:40 GMT
Message-ID: <201011020903.oA293eeb015535@demeter1.kernel.org>
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





--- Comment #42 from Thomas Renninger <trenn@suse.de>  2010-11-02 09:03:25 ---
Created an attachment (id=35852)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=35852)
intel_idle: Do not load if user overrides idle function via idle= boot param

This try only makes sense if cpuidle driver got used before and the machine
supports C2 and deeper sleep states, you can check (without idle=halt override)
via:
cat /sys/devices/system/cpu/cpu*/cpuidle/state*/name
whether your machine uses deeper sleep states.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
