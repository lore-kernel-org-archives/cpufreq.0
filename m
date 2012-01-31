From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42671] cpufreq userspace governor doesn't work on Intel Core 2
 Gen 2 CPUs
Date: Tue, 31 Jan 2012 06:57:41 GMT
Message-ID: <201201310657.q0V6vf92026906@bugzilla.kernel.org>
References: <bug-42671-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-42671-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42671





--- Comment #2 from Artem S. Tashkinov <t.artem@mailcity.com>  2012-01-31 06:57:41 ---
(In reply to comment #1)
> are you sure that you are using the userspace governor?
> few people do, as it is generally obsolted by ondemand.
> 
> When ondemand is running, scaling_setspeed does nothing,
> and you can "manually" control what ondemand does by
> setting its maximum and minimum frequencies.
> 
> Please show the output from
> grep .  /sys/devices/system/cpu/cpu0/cpufreq/*

/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus:0
/sys/devices/system/cpu/cpu0/cpufreq/bios_limit:3301000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:3301000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq:3301000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq:1600000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_transition_latency:10000
/sys/devices/system/cpu/cpu0/cpufreq/related_cpus:0 1 2 3
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:3301000
3300000 3200000 3100000 3000000 2900000 2800000 2700000 2600000 2500000 2400000
2300000 2200000 2100000 2000000 1600000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors:ondemand
powersave userspace conservative performance
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:2000000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver:acpi-cpufreq
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor:userspace
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq:3301000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq:1600000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed:2000000

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
