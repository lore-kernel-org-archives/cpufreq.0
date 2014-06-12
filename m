From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 16:48:35 +0000
Message-ID: <bug-77201-12968-nX0K4d5znN@https.bugzilla.kernel.org/>
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

--- Comment #66 from Srivatsa S. Bhat <srivatsa@mit.edu> ---
Hi Mauro,

You can continue debugging with Viresh suggestions, since that's one of the
ways to debug this issue. When time permits, can you please try this commit:

commit 5bdfff96c69a4d5ab9c49e60abf9e070ecd2acbb
Author: Lai Jiangshan <laijs@cn.fujitsu.com>
Date:   Sat Feb 15 22:02:28 2014 +0800

    workqueue: ensure @task is valid across kthread_stop()

Of course, try one commit before it and see if it works, and then try the above
mentioned commit and see if it fails.

The reason I chose this commit is because there are only 2 commits in the
workqueue code between 3.13.8 and 3.14.1, and the other commit is not relevant
to your case because it is active only if CONFIG_DEBUG_OBJECTS_WORK is set (and
this option is not set in your .config).

Thank you!

Regards,
Srivatsa S. Bhat

-- 
You are receiving this mail because:
You are the assignee for the bug.
