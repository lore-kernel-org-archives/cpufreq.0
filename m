From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 19:42:28 +0000
Message-ID: <bug-77201-12968-t7yktQc9kc@https.bugzilla.kernel.org/>
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

--- Comment #51 from Rafael J. Wysocki <rjw@rjwysocki.net> ---
(In reply to Srivatsa S. Bhat from comment #49)
> By the way, another approach I have in mind is to remove the usage of
> work_on_cpu() from the powernow-k8 driver (since that's the only noticeably
> different thing about this driver), and check if it solves the problem.

That is a good idea.  At least we could narrow down the issue this way.

-- 
You are receiving this mail because:
You are the assignee for the bug.
