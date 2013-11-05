From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64251] Intel Pstate driver minimum percent does not change with
 turbo off
Date: Tue, 05 Nov 2013 07:56:55 +0000
Message-ID: <bug-64251-12968-eGumrJMH8m@https.bugzilla.kernel.org/>
References: <bug-64251-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64251-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64251

--- Comment #3 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
I was trying to provide some useful information by setting min_perf_pct to a
value.  I guess I could leave it at 0 since any value between 0 and the percent
of the cpu represented by the lowest P state are the same. 

The reason for having the ability to disable turbo is for people that avoid the
possible jitter introduced into the system caused by thermal throttling.

If you want to limit the P state selection to something to something greater
than the minimum to further reduce jitter caused by P state transitions then
you would set the min/floor value to something significantly higher than the
minimums.

Regardless 42% is a valid floor value.

-- 
You are receiving this mail because:
You are the assignee for the bug.
