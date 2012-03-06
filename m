From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42858] thermal throttling doesn't seem to trigger on Thinkpad
 T420s
Date: Tue, 6 Mar 2012 06:45:31 GMT
Message-ID: <201203060645.q266jV4o008032@bugzilla.kernel.org>
References: <bug-42858-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-42858-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42858





--- Comment #3 from Pierre Ossman <pierre-bugzilla@ossman.eu>  2012-03-06 06:45:30 ---
~
[drzeus@mjolnir]$ uname -a
Linux mjolnir.ossman.eu 3.2.7-1.fc16.x86_64 #1 SMP Tue Feb 21 01:40:47 UTC 2012
x86_64 x86_64 x86_64 GNU/Linux

~
[drzeus@mjolnir]$ grep . /proc/acpi/thermal*/*/
grep: /proc/acpi/thermal*/*/: No such file or directory

~
[drzeus@mjolnir]$ grep . /sys/class/thermal/*/*
/sys/class/thermal/cooling_device0/cur_state:0
/sys/class/thermal/cooling_device0/max_state:17
/sys/class/thermal/cooling_device0/type:Processor
/sys/class/thermal/cooling_device1/cur_state:0
/sys/class/thermal/cooling_device1/max_state:17
/sys/class/thermal/cooling_device1/type:Processor
/sys/class/thermal/cooling_device2/cur_state:0
/sys/class/thermal/cooling_device2/max_state:17
/sys/class/thermal/cooling_device2/type:Processor
/sys/class/thermal/cooling_device3/cur_state:0
/sys/class/thermal/cooling_device3/max_state:17
/sys/class/thermal/cooling_device3/type:Processor
/sys/class/thermal/cooling_device4/cur_state:6
/sys/class/thermal/cooling_device4/max_state:15
/sys/class/thermal/cooling_device4/type:LCD
/sys/class/thermal/thermal_zone0/mode:enabled
/sys/class/thermal/thermal_zone0/passive:0
/sys/class/thermal/thermal_zone0/temp:43000
/sys/class/thermal/thermal_zone0/trip_point_0_temp:97000
/sys/class/thermal/thermal_zone0/trip_point_0_type:critical
/sys/class/thermal/thermal_zone0/type:acpitz


I'll test without thinkpad_acpi and see what happens.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
