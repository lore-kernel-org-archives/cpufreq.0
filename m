From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Thu, 10 Mar 2011 09:20:39 GMT
Message-ID: <201103100920.p2A9Kd3m028949@demeter2.kernel.org>
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





--- Comment #16 from Thomas Renninger <trenn@suse.de>  2011-03-10 09:20:39 ---
> I can find oops like these in early dmesg
Yep, something is borked if one tries to disable tsc. Same with notsc boot
param.
No time to look at it right now, though.

That your system only shows C1 is strange.
The message you showed:
> Marking TSC unstable due to TSC halts in idle
should only show up if C2 or deeper states (or C1E, but this should not exist
on older machines?) are supported.
Compare with drivers/acpi/processor_idle.c:
                if (state > ACPI_STATE_C1)
                        mark_tsc_unstable("TSC halts in idle");
Could it be that you tried with processor.max_cstate=1?

Can you double check that you did not use processor.max_cstate=1 and an
unmodified kernel. If there still is only C1 in /proc/acpi/processor/*/power
then it is something else.
Ok, local_apic_timer_c2_ok is set to 0 already by default and needs to get
enabled via boot param, this cannot be it.
Also a wiki page about this processor tells that the new "mobile" (only
AthlonXP "M") feature is to support Powernow!. So it really might have to do
with tsc+powernow!.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
