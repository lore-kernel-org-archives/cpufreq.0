From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Mon, 7 Mar 2011 22:02:22 GMT
Message-ID: <201103072202.p27M2Mo2016183@demeter2.kernel.org>
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


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |trenn@suse.de




--- Comment #11 from Thomas Renninger <trenn@suse.de>  2011-03-07 22:02:21 ---
Does notsc param help?
Not sure it works anymore as expected. I very recently saw an oops early in
calibrate_native_tsc, even with notsc param. As this was in an early -rcX
kernel and getting more recent sources fixed the issue, I didn't look at it
anymore.
Better check dmesg and clocksource sysfs file that tsc isn't used:
/sys/devices/system/clocksource/clocksource0/current_clocksource

Hm, it looks like skge does not like the latencies or whatever is introduced by
the deep sleep state. There are not much older AMD machines supporting deeper
sleep states through ACPI processor. I know single core Turion did. AthlonXP-M
(Mobile?) sounds like it supports C2 and the message:
"Marking TSC unstable due to TSC halts in idle"
tells us it does (2.6.37):
                /* TSC could halt in idle, so notify users */
                if (state > ACPI_STATE_C1)
                        mark_tsc_unstable("TSC halts in idle");

Summary: Sleep state(s) makes your machine unstable, disabling it looks like
the way to go (processor.max_cstate=1).

You may want to try to set:
local_apic_timer_c2_ok = 0
I can't see the use of this variable, it always seem to be one.
You could just try to hardcode it in
drivers/acpi/processor_idle.c:lapic_timer_check_state():
-        u8 type = local_apic_timer_c2_ok ? ACPI_STATE_C3 : ACPI_STATE_C2;
+        u8 type;
+        local_apic_timer_c2_ok = 0;
+        local_apic_timer_c2_ok ? ACPI_STATE_C3 : ACPI_STATE_C2;
Be careful, this is not a real patch.

This only makes sense if you have a C-state of type C2, which is a bit ugly to
find out.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
