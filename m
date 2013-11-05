From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Tue, 05 Nov 2013 08:12:08 +0000
Message-ID: <bug-64261-12968-ZxQeuodI9d@https.bugzilla.kernel.org/>
References: <bug-64261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64261-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64261

--- Comment #9 from Doug Smythies <dsmythies@telus.net> ---
I have done it both ways and get the same result, if the CPU is fully loaded.
All of my tests, until this morning were always done with max == min
But O.K.:

doug@s15:~/temp$ sudo ./set_cpu_turbo_off
doug@s15:~/temp$ echo "53" | sudo tee
/sys/devices/system/cpu/intel_pstate/max_perf_pct
53
doug@s15:~/temp$ echo "53" | sudo tee
/sys/devices/system/cpu/intel_pstate/min_perf_pct
53
doug@s15:~/temp$ cat /sys/devices/system/cpu/intel_pstate/*
53
53
1
doug@s15:~/temp$ cat /sys/devices/system/cpu/cpu7/cpufreq/cpuinfo_cur_freq
1700000

-- 
You are receiving this mail because:
You are the assignee for the bug.
