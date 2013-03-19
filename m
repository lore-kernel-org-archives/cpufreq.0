From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Tue, 19 Mar 2013 06:16:53 +0000 (UTC)
Message-ID: <20130319061653.96C4D11FB5D@bugzilla.kernel.org>
References: <bug-55411-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55411-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55411





--- Comment #8 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-19 06:16:53 ---
(In reply to comment #0)
> Abridged (perms/dates omitted) fresh-boot (good)
> ls -dl /sys/devices/system/cpu/cpu?/cpufreq :
> 
> /sys/devices/system/cpu/cpu0/cpufreq/
> /sys/devices/system/cpu/cpu1/cpufreq -> ../cpu0/cpufreq/
> /sys/devices/system/cpu/cpu2/cpufreq/
> /sys/devices/system/cpu/cpu3/cpufreq -> ../cpu2/cpufreq/
> /sys/devices/system/cpu/cpu4/cpufreq/
> /sys/devices/system/cpu/cpu5/cpufreq -> ../cpu4/cpufreq/
> 
> After a s2ram/resume cycle (now bad):
> 
> /sys/devices/system/cpu/cpu0/cpufreq/
> /sys/devices/system/cpu/cpu1/cpufreq -> ../cpu0/cpufreq/
> /sys/devices/system/cpu/cpu3/cpufreq/
> /sys/devices/system/cpu/cpu5/cpufreq/

Can you try this rather than s2r:

for i in 1 2 3 4 5; do echo 0 > /sys/devices/system/cpu/cpu$i/online ; done
for i in 1 2 3 4 5; do echo 1 > /sys/devices/system/cpu/cpu$i/online ; done

and check the status if things are still corrupted for you?

I am working on a 5 cpu system grouped as 0-1 and 2-3-4.
Above doesn't corrupt anything for me Atleast.

And my system doesn't have S2R support for now.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
