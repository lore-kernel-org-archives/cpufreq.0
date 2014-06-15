From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Sun, 15 Jun 2014 23:13:05 +0000
Message-ID: <bug-77201-12968-ArNlqsLkjg@https.bugzilla.kernel.org/>
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

--- Comment #85 from Rafael J. Wysocki <rjw@rjwysocki.net> ---
It looks like one of the notifiers crashes in srcu_notifier_call_chain() called
from __cpufreq_notify_transition().

We need to figure out which one.

-- 
You are receiving this mail because:
You are the assignee for the bug.
