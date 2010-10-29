From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 29 Oct 2010 15:49:05 GMT
Message-ID: <201010291549.o9TFn5nc002296@demeter2.kernel.org>
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





--- Comment #32 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-10-29 15:49:01 ---
numactl --physcpubind=0 cat /dev/zero >/dev/null

produces about 95%sys and 5%us load on _ONE_ core. idle goes down to 0.0%
immediately. This behavior does not change when changing up_threshold.

# cat /sys/devices/system/clocksource/clocksource0/available_clocksource
hpet acpi_pm

# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
hpet

So my system is already using the HPET clocksource.
Changing to acpi_pm has no effect on cpu frequency scaling (with the default
up_threshold, of course).
The system did switch to acpi_pm as dmesg reveals:
Switching to clocksource acpi_pm

Concerning HPET and TSC I got the following from dmesg:
ACPI: HPET 000000007f736b66 00038 (v01 TOSHIB A0054    20070816 TASM 04010000)
ACPI: HPET id: 0x8086a201 base: 0xfed00000
hpet clockevent registered
Fast TSC calibration failed
TSC: PIT calibration matches HPET. 1 loops
HPET: 3 timers in total, 0 timers will be used for per-cpu timer
hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
hpet0: 3 comparators, 64-bit 14.318180 MHz counter
Switching to clocksource tsc
Marking TSC unstable due to TSC halts in idle
Switching to clocksource hpet
rtc0: alarms up to one year, 114 bytes nvram, hpet irqs
CE: hpet increased min_delta_ns to 7500 nsec
CE: hpet increased min_delta_ns to 11250 nsec

The "hpet increased min_delta_ns" message shows up on the system with the Core2
Quad Q9550 as well, but obviously this does not affect cpu frequency scaling
either. To me everything else looks fine.

BTW, do you still need the ACPI tables you mentioned in Comment #24? If so,
please tell which of the ones I got (see Comment #25) you would like to have.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
