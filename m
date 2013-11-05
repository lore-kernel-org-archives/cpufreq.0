From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Tue, 05 Nov 2013 07:21:34 +0000
Message-ID: <bug-64261-12968-gcPydfVYRn@https.bugzilla.kernel.org/>
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

--- Comment #7 from Doug Smythies <dsmythies@telus.net> ---
(In reply to Dirk Brandewie from comment #6)
> The percentage
> values to get to a given frequency are SKU dependent.

Yes, of course.

> int(.53 * 34 + 0.5) = 18
> 
> How is it off by a whole P state?

Because it actually goes to 1.7 GHz not 1.8 GHz:
CPU 7 is fully loaded:

doug@s15:~/temp$ cat /sys/devices/system/cpu/intel_pstate/*
53
42
1
doug@s15:~/temp$ cat /sys/devices/system/cpu/cpu7/cpufreq/cpuinfo_cur_freq
1699867

By rounding, we stay away from finite math issues at integer boundaries.

-- 
You are receiving this mail because:
You are the assignee for the bug.
