From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 100771] When activating ignore_nice_load with governor ondemand
 performance drops for normal processes.
Date: Thu, 17 Dec 2015 08:33:20 +0000
Message-ID: <bug-100771-12968-usYG7wsJ60@https.bugzilla.kernel.org/>
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

--- Comment #6 from calvaris@igalia.com ---
(In reply to Chen Yu from comment #5)
> Do you mean idle tasks = task_b in above context? Why task_b slows down the
> normal priority task is because that, the cpufreq decrease due to task_b's
> high nice value, and task_a is scheduled on the same cpu.

Yes, I understand that it's what's happenning and I think that is what
shouldn't happen because, IMHO, it doesn't make sense. I think it should be
exactly the opposite, as an idle task is scheduled on the same cpu as a higher
priority one, it should be run at the frequency of the higher one.

-- 
You are receiving this mail because:
You are the assignee for the bug.
