From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Tue,  8 Jan 2013 03:01:37 +0000 (UTC)
Message-ID: <20130108030138.0DAC311FE9A@bugzilla.kernel.org>
References: <bug-50721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-50721-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50721





--- Comment #10 from Len Brown <lenb@kernel.org>  2013-01-08 03:01:37 ---
turbostat -v will tell you the max turbo for this processor.
Yes, it is normal to run above the TSC frequency --
indeed, that is exactly what turbo-mode is for...

can you force the processors to go slower by writing to sysfs?

eg. as root
cd /sys/devices/system/cpu/cpu0/cpufreq

cat scaling_max_freq
cat scaling_min_freq > scaling_max_freq
cat scaling_max_freq

and see if you can get that cpu to slow down, as shown by turbostat.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
