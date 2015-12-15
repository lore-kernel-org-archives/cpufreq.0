From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 69821] setting CONFIG_HZ_PERIODIC locks cpu at the lowest
 frequency using ONDEMAND
Date: Tue, 15 Dec 2015 00:12:02 +0000
Message-ID: <bug-69821-12968-3QWufT2Out@https.bugzilla.kernel.org/>
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

--- Comment #4 from Chen Yu <yu.c.chen@intel.com> ---
CONFIG_NO_HZ_FULL  is using ktime_get to get the idle time in
get_cpu_idle_time_us, it is based on clock source,  while if the kernel config
is set with CONFIG_HZ_PERIODIC , the governor might get idle time by
jiffies(tick, minimum unit of 4 millisecond),
the former is more accurate than the latter, this might be one of the reason
for the problem. I can try to reproduce and take a look.

-- 
You are receiving this mail because:
You are the assignee for the bug.
