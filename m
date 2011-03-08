From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 30712] Slow transitioning AMD ondemand CPU because of wrong
 sampling_rate
Date: Tue, 8 Mar 2011 09:17:42 GMT
Message-ID: <201103080917.p289Hgbn013411@demeter2.kernel.org>
References: <bug-30712-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-30712-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=30712


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |trenn@suse.de




--- Comment #1 from Thomas Renninger <trenn@suse.de>  2011-03-08 09:17:41 ---
dd if=/dev/zero of=/dev/null bs=300k count=1000
should fully utilize a core, but the duration of the process is a bit short:
307200000 bytes (307 MB) copied, 0.052651 seconds, 5.8 GB/s
real    0m0.056s
user    0m0.000s
sys     0m0.056s

If frequency is checked every 100ms, but the process only taks 50ms, it can
happen that it's not switched up at all.
I remember the polling interval with old userspace governors was much higher.

This is a very specific micro benchmark not telling much about reality
workloads.
Users won't recon whether the process ends in 50 or 70 ms, if there are more of
them in parallel and the core gets utilized for longer time, the frequency will
get switched up permanently. And you want to save power, therefore it makes
sense to not switch frequency up on this tiny peak.
On latest machines there are deep sleep states, there you want to finish up
processes as quickly as possible.

> In contrast, I have an Intel(R) Core(TM)2 Duo CPU T7250 @ 2.00GHz
The main difference is MSR based vs IO based frequency switching.
The latter takes longer -> longer latency and this is calculated into the
sampling_rate value. New AMDs also use MSR based switching, export lower
latency values (some even 0) and you get the same (min) sampling_rate.

You may want to try to find a "real-world" workload which takes a minute or so
and prove a performance loss of >%2, that should be hard. Especially with
latest improvements (count IO as load).
For theoretical worst case performance losses for your HW you can also use
cpufreq-bench from the cpufrequtils package.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
