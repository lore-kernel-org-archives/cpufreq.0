From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Tue, 10 Jun 2014 12:44:19 +0000
Message-ID: <bug-77201-12968-YJMZzYPCO5@https.bugzilla.kernel.org/>
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

--- Comment #17 from registosites@hotmail.com ---
I have done as asked and added the ccflags-y to the top of
drivers/cpufreq/Makefile and enabled the specified config options.

I have separated the logs in 3 files: boot log, governor change
(ondemand->performance) log and cpu offline/online log.

When using the performance governor, cpu offline/online works fine, but if
afterterwards I try to change the governor back to ondemand the machine hangs,
it doesn't matter for which cpu I try to change the governor first.

I'm also attaching the config I used, just in case anyone wants to check which
config options were used.

-- 
You are receiving this mail because:
You are the assignee for the bug.
