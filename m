From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 19 Oct 2010 22:47:20 GMT
Message-ID: <201010192247.o9JMlKa8020420@demeter1.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #26 from vyncere <vyncere@gmail.com>  2010-10-19 22:47:14 ---
Hi all,

So with my Core i5 520 M (2 physical cores, 4 logical cores):

* 2.6.32.15 (ubuntu), 2.6.35.7 (kernel.org), 2.6.35.7 (kernel.org + 2 patchs) :

- Values of /sys/devices/system/cpu/cpu*/cpufreq/affected_cpus are : "0", "1",
"2" and "3" respectively for cpu0, cpu1, cpu2 and cpu3.

- Output of /sys/devices/system/cpu/cpu*/cpufreq/related_cpus is always : "0 1
2 3"

No problem.

* 2.6.35.7 (kernel.org + 2 patchs) with and without boot parameter
"processor.disable_hw_coord=1" :

- Output of /sys/devices/system/cpu/cpu*/cpufreq/shared_type is always :
1

Always default value 1 (CPUFREQ_SHARED_TYPE_HW) : so, Thomas, according to what
you said, there is something wrong here...

- cpufreq-info returns the same result as before (lowest freq).
- /sys/devices/system/cpu/cpufreq/ondemand/up_threshold is 95 by default.
- Lower the up_threshold has no effect for me.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
