From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Tue, 10 Jun 2014 05:26:38 +0000
Message-ID: <bug-77201-12968-ckTbwS4XYW@https.bugzilla.kernel.org/>
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

--- Comment #16 from Srivatsa S. Bhat <srivatsa@mit.edu> ---
Hi,

Here are a few more suggestions you can try:

1. Use either performance or powersave governor:

echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor

(You can use either performance or powersave; you don't have to try both).

The ondemand governor (which is usually the default) is complex and uses
timers, workqueues etc and interacts with the cpufreq CPU hotplug code, whereas
the above 2 governors are extremely simple and don't have any complex
interactions with hotplug. So trying them would help isolate the problem and
understand whether it is a cpufreq core issue or a cpufreq governor issue.

2. Enable lockdep debugging, specifically the config options mentioned below,
so that we'll know if we have a locking issue:

CONFIG_LOCKDEP_SUPPORT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_PI_LIST=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_PROVE_LOCKING=y
CONFIG_LOCKDEP=y
CONFIG_DEBUG_ATOMIC_SLEEP=y

You can try the above 2 things along with the suggestions Viresh gave, in a
single run, and let us know how it goes.

Regards,
Srivatsa S. Bhat

-- 
You are receiving this mail because:
You are the assignee for the bug.
