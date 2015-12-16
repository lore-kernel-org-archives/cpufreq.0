From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 69821] setting CONFIG_HZ_PERIODIC locks cpu at the lowest
 frequency using ONDEMAND
Date: Wed, 16 Dec 2015 02:09:55 +0000
Message-ID: <bug-69821-12968-K7RHX470fZ@https.bugzilla.kernel.org/>
References: <bug-69821-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-69821-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=69821

--- Comment #5 from Chen Yu <yu.c.chen@intel.com> ---
There is a problem in cpufreq_governor.c on how to calculate the load
for each policy:

it uses get_cpu_idle_time to get the total idle time for current cpu, if it
is config with CONFIG_NO_HZ_FULL , it is OK, because as mentioned in #Comment
4, the time is return by ktime_get, which is always increasing. However,
it is config with CONFIG_HZ_PERIODIC , the situation would be changed,
now it uses tick count to calculate the idle time by get_cpu_idle_time_jiffy,
consider the following scenario:

At T1: 
idle_tick_1 = total_tick_1 - user_tick_1

At T2: ( T2 = T1 + 80ms):
idle_tick_2 = total_tick_2 - user_tick_2


Since current algorithm to get the idle time for the past sampling, is by
caculcating (idle_tick_2 - idle_tick_1), but since you CAN NOT guarantee that
idle_tick_2 is bigger than idle_tick_1, we might get a negative value for idle
time during the past sample, which might cause the system thinks its idle time 
is very big, and the busy time is near zero, which cause the governor to always
choose the lowest cpufreq state, which cause this problem.





There are two solutions for this problem:
1. Since the root cause for this problem is that, we should not rely on idle
tick in every sample time, but should rely on the busy time directly in each
sample, as the latter is how 'top' command implement its feature.

2. Or we can also work around it by making sure the idle_time is strictly
increasing in each sample. This solution needs minimum modification and the RFC
patch is attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.
