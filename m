From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64251] Intel Pstate driver minimum percent does not change with
 turbo off
Date: Tue, 05 Nov 2013 07:31:37 +0000
Message-ID: <bug-64251-12968-GIaTVFNbUl@https.bugzilla.kernel.org/>
References: <bug-64251-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64251-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64251

--- Comment #2 from Doug Smythies <dsmythies@telus.net> ---
But the system overrides any user value that had been previously set upon mode
change. It doesn't make any sense (to me at least) in turbo off that it be set
to 42, which is basically a meaningless number under these conditions.

Example:
doug@s15:~/temp$ echo "53" | sudo tee
/sys/devices/system/cpu/intel_pstate/min_perf_pct
53
doug@s15:~/temp$ cat /sys/devices/system/cpu/intel_pstate/*
53
53
1
doug@s15:~/temp$ sudo ./set_cpu_performance
doug@s15:~/temp$ cat /sys/devices/system/cpu/intel_pstate/*
100
100
0
doug@s15:~/temp$ sudo ./set_cpu_powersave
doug@s15:~/temp$ cat /sys/devices/system/cpu/intel_pstate/*
53
42
0

-- 
You are receiving this mail because:
You are the assignee for the bug.
