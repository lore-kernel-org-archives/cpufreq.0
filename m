From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 18:40:26 +0000
Message-ID: <bug-77201-12968-IQKWpPCQgP@https.bugzilla.kernel.org/>
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

--- Comment #49 from Srivatsa S. Bhat <srivatsa@mit.edu> ---

By the way, another approach I have in mind is to remove the usage of
work_on_cpu() from the powernow-k8 driver (since that's the only noticeably
different thing about this driver), and check if it solves the problem. That
way, powernow-k8 would become mostly similar to all other cpufreq drivers and
this might make it easier to isolate the issue.  (Of course work_on_cpu() must
be remove with care, such that the correctness of the code is still
maintained).

Regards,
Srivatsa S. Bhat

-- 
You are receiving this mail because:
You are the assignee for the bug.
