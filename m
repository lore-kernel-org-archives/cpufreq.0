From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Thu, 10 Mar 2011 13:21:01 GMT
Message-ID: <201103101321.p2ADL1Sp026937@demeter2.kernel.org>
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





--- Comment #20 from Thomas Renninger <trenn@suse.de>  2011-03-10 13:21:01 ---
I expect C2 is causing the trouble. processor.max_cstate=1 is the workaround
that should help.
Patch/test from comment #17 won't help.
As this machine is a bit older it might not even have an hpet timer?
(dmesg |grep -i hpet). If apic (and pic?) and tsc do not work due to the sleep
state and the machine does not have an hpet, there aren't much timers left for
time keeping?
But I won't be able to help you further there, you'd need to debug which timer
still ticks in C2 (and whether there still is one functioning at all) and
whether timer interrupts are still fired at the right times.
nohz=off is an option you might want to try with C2 enabled.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
