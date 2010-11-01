From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Mon, 1 Nov 2010 18:16:52 GMT
Message-ID: <201011011816.oA1IGqGH017618@demeter2.kernel.org>
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





--- Comment #39 from vyncere <vyncere@gmail.com>  2010-11-01 18:16:46 ---
Thomas :

* 2.6.32.15 (Kernel Reference with functionnal cpufreq)
- Boot params : None

--> No /sys/devices/system/cpu/cpu0/cpufreq/bios_limit

* 2.6.36 (+ 4 Patches HW_COORD, SHARED_TYPE, HW_ALL, HW_STATISTICS)
- Boot params for patch 4 : acpi_cpufreq.disable_average=1
- Boot params : clocksource=hpet

# cat /sys/devices/system/cpu/cpu0/cpufreq/bios_limit
1199000

So, 1.20GHz.

Thank you. I will investigate on the BIOS/ACPI track.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
