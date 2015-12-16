From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 100771] When activating ignore_nice_load with governor ondemand
 performance drops for normal processes.
Date: Wed, 16 Dec 2015 16:26:43 +0000
Message-ID: <bug-100771-12968-2PumHHMtqV@https.bugzilla.kernel.org/>
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

--- Comment #4 from calvaris@igalia.com ---
(In reply to Chen Yu from comment #3)
> 2.When you enable ignore_nice_load, the task_b with nice = 1 will be
> considered to be idle, which means that, the total time task_b is running,
> will be added to current cpu's idle time, which will cause the cpufreq
> governor to treat the cpu load lower than when ignore_nice_load disabled.

I understand the rationale you explain if we apply it only to idle tasks. What
I don't agree with is that tasks with idle priority can slow down tasks with
normal priority.

-- 
You are receiving this mail because:
You are the assignee for the bug.
