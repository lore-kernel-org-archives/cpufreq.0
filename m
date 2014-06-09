From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Mon, 09 Jun 2014 21:58:55 +0000
Message-ID: <bug-77201-12968-sVKfQDOrmV@https.bugzilla.kernel.org/>
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

--- Comment #12 from Srivatsa S. Bhat <srivatsa@mit.edu> ---

Hi,

I took a quick look at the CPU hotplug path in both cpufreq.c and
powernow-k8.c, but nothing really appeared to stand out.

Does reverting commit c3274763bfc (cpufreq: powernow-k8: Initialize per-cpu
data-structures properly) help? I just want to know if that is a suspect or
not, since that commit went in around 3.14 and is the only relevant commit in
powernow-k8 driver during that time. I'll attach the reverted patch with this
bugzilla for your reference.

Also, please give the output of:
cat /sys/devices/system/cpu/cpuNum/cpufreq/related_cpus
cat /sys/devices/system/cpu/cpuNum/cpufreq/affected_cpus

for both CPUs 0 and 1 (just replace cpuNum with 0 and 1).

One other thing: what is the exact version of the earliest failing kernel? Is
it vanilla 3.14 or a stable version of 3.14 (eg: 3.14.x)? (For pass/fail
testing, please use the sysfs method with powernow-k8 loaded, like you did in
comment 7. Once we get this fixed, you can try the full suspend/resume tests).

Thank you!

Regards,
Srivatsa S. Bhat

-- 
You are receiving this mail because:
You are the assignee for the bug.
