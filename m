From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 29 Oct 2010 12:14:47 GMT
Message-ID: <201010291214.o9TCEl9b019808@demeter1.kernel.org>
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





--- Comment #30 from Thomas Renninger <trenn@suse.de>  2010-10-29 12:14:38 ---
Thanks. I still think not considering core dependencies in HW_ALL case is
wrong, but this needs further/separate discussing/evaluation.

Peter, as you said with exactly same HW and kernel version/.config:
This one is broken:
Intel Core2 Duo T7300 2.0 GHz processor
and this one is not:
Intel Core2 Quad Q9550

Could you show us:
cat /sys/devices/system/clocksource/clocksource0/available_clocksource
and
cat /sys/devices/system/clocksource/clocksource0/current_clocksource
does it make a difference switching, e.g. to hpet?
echo xy >/sys/devices/system/clocksource/clocksource0/current_clocksource

Ok, I checked Heinz's and Peter's dmesg:

Heinz explicitly enables hpet via boot param (what is this for?)
clocksource=hpet acpi_skip_timer_override

And Peter has:
Marking TSC unstable due to TSC halts in idle
Switching to clocksource hpet

It's always only CPU0 not switching up, right?
Looks like something with hpet is wrong.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
