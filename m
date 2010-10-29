From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 29 Oct 2010 20:15:32 GMT
Message-ID: <201010292015.o9TKFWVQ027195@demeter2.kernel.org>
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





--- Comment #33 from Thomas Renninger <trenn@suse.de>  2010-10-29 20:15:27 ---
I wonder why Heinz has:
clocksource=hpet acpi_skip_timer_override

Peter's machine has an unstable TSC, that is strange, cpuflags show
constant_tsc.
So it seems it falls through some boot check to not increment constantly.

Hmm, you both seem to have problems with TSC..., aperf/mperf may be fed by the
same internal clock as TSC. If average frequency calced via aperf/mperf is very
low, the frequency would never get ramped up.

It's hard to believe, because you have so different CPUs, but it looks like you
both have broken TSC/aperf/mperf timers on CPU 0? At least Peter has?

Another patch to try.., please use:
acpi_cpufreq.disable_average=1
boot param and check dmesg that it got applied:
"acpi-cpufreq: average (aperf/mperf) accounting disabled by user"

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
