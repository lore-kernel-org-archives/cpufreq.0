From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Mon, 1 Nov 2010 17:43:32 GMT
Message-ID: <201011011743.oA1HhWAb026347@demeter2.kernel.org>
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





--- Comment #37 from Thomas Renninger <trenn@suse.de>  2010-11-01 17:43:25 ---
vyncere: Your problem is different. Could it be that 
cat /sys/devices/system/cpu/cpu0/cpufreq/bios_limit does not show max freq?
Then it is related to:
https://bugzilla.kernel.org/show_bug.cgi?id=14771
But in contrast to Peter's problem it's BIOS related (and the root cause may be
different and related to ACPI).
If above (bios_limit) is true, best update your BIOS, check related BIOS
options, if processor.ignore_ppc=1 workarounds and BIOS fiddling doesn't help,
please open a new bug and assign it to the ACPI component.

Peter: Your CPU (counters: tsc, aperf, mperf) is/are broken.
Heinz may have a similar problem and if this is more common, a getavg check
could be added whether the values are far away from min/max and getavg is not
considered anymore then. As this is a hotpath, this could be implemented in a
similar check as TSC is checked at boot up, e.g. test 3 times over 100ms
whether getavg is inside ~min/~max limits, if not don't use it.
If this normally never happens it might not be worth it and just the module
param could be added -> Waiting for a test from Heinz, either the boot param
and/or a runtime timer check should be added.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
