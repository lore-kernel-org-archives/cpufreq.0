From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75661] acpi-cpufreq cannot use lowest reported P-state
 (A8-4500M)
Date: Tue, 03 Jun 2014 15:18:04 +0000
Message-ID: <bug-75661-12968-QfxNUvyQ6C@https.bugzilla.kernel.org/>
References: <bug-75661-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-75661-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75661

--- Comment #2 from Justin M <runningskittle@gmail.com> ---
# grep . /sys/devices/system/cpu/cpu0/cpufreq/*
/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus:0
/sys/devices/system/cpu/cpu0/cpufreq/bios_limit:1900000
/sys/devices/system/cpu/cpu0/cpufreq/cpb:1
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1900000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq:1900000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq:1400000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_transition_latency:4000
/sys/devices/system/cpu/cpu0/cpufreq/freqdomain_cpus:0 1
/sys/devices/system/cpu/cpu0/cpufreq/related_cpus:0
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:1900000
1800000 1700000 1600000 1400000 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors:ondemand
performance 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1900000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver:acpi-cpufreq
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor:performance
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq:1900000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq:1400000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed:<unsupported>
****
Unfortunately I have been unable to find actual documentation that says whether
the CPU actually supports 900MHz p-state

-- 
You are receiving this mail because:
You are the assignee for the bug.
