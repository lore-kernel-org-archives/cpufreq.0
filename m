From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 100771] When activating ignore_nice_load with governor ondemand
 performance drops for normal processes.
Date: Wed, 16 Dec 2015 15:11:33 +0000
Message-ID: <bug-100771-12968-Kb0rsx8GLH@https.bugzilla.kernel.org/>
References: <bug-100771-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-100771-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=100771

--- Comment #3 from Chen Yu <yu.c.chen@intel.com> ---
This is a normal behavior IMO. 

1. task_b with nice = 1 does not mean task_a will always occupy the time slice,
it is CFS scheduler, which means even task with nice = 19 will get chance to
run.
2.When you enable ignore_nice_load, the task_b with nice = 1 will be considered
to be idle, which means that, the total time task_b is running, will be added
to current cpu's idle time, which will cause the cpufreq governor to treat the
cpu load lower than when ignore_nice_load disabled.

Yu

-- 
You are receiving this mail because:
You are the assignee for the bug.
