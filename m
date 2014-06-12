From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 14:20:52 +0000
Message-ID: <bug-77201-12968-sUH6NY269W@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #59 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to Mauro from comment #58)
> Not much luck with this approach I'm afraid. I have compiled your updated
> branch with no reverts and changed the config to include only the userspace
> governor.
> 
> Then proceeded to test as before:
> cat /proc/kmsg &
> echo 800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> echo 0 > /sys/devices/system/cpu/cpu1/online
> echo 1 > /sys/devices/system/cpu/cpu1/online
> echo 1800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> echo 2200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> 
> When trying to change the frequency to 2.2GHz the machine becomes
> unresponsive and there is no output :(

Were you getting a lot of prints during earlier frequency transitions?
Its awkward as we were getting enough prints earlier, what happened now ?

> I have noticed something that may or may not be important, it doesn't matter
> if I do
> 800M - cpu offline/online - 1.8G - 2.2G
> or
> 800M - cpu offline/online - 2.2G - 1.8G
> 
> The machine always becomes unresponsive when trying to do the second
> frequency change after cpu offline/online.

This surely is a important observation.

> I have pictures of the process, I
> can attach them if you think they are important, but like I said when the
> machine hangs there is zero output :(

Still I want to see how bad it is now, just attach them :)

-- 
You are receiving this mail because:
You are the assignee for the bug.
