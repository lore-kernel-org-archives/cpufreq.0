From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 81701] OOPS in cpufreq driver with AMD Kaveri CPU
Date: Fri, 08 Aug 2014 14:54:43 +0000
Message-ID: <bug-81701-12968-hTC6lsUYM5@https.bugzilla.kernel.org/>
References: <bug-81701-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-81701-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=81701

--- Comment #5 from Oleksandr Natalenko <oleksandr@natalenko.name> ---
Disabling cpufreq section in kernel configuration seems to work around this
issue.

Using NOHZ_IDLE instead of NOHZ_FULL doesn't fix the issue (I also suspected
RCU bugs or so).

-- 
You are receiving this mail because:
You are the assignee for the bug.
