From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Mon, 04 Nov 2013 22:19:52 +0000
Message-ID: <bug-64261-12968-hCjbfm6uaM@https.bugzilla.kernel.org/>
References: <bug-64261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64261-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64261

--- Comment #5 from Doug Smythies <dsmythies@telus.net> ---
Hi Dirk,

There are cases, i.e. when investigating error in load averages where one wants
to lock the CPU at whatever frequency. I realize it was not the goal of
intel_pstate, but still needs to be allowed for. Regardless, I am merely using
this as a way to easily demonstrate the issue.

".53 * 34 = 18.03 (so we are off by 3 percent of a pstate due to truncation)"
No, I am arguing that it is off by 103 percent of a pstate due to truncation.

I am also arguing that if rounding is used there will never be more than a half
of a pstate discrepancy between desired and actual instead of 1 pstate. I am
also arguing that it will help at the 100% end, where right now it might
struggle to get to 100% on some processors.

For your examples, I am saying it should be:

Turbo:
int(.42 * 38 + 0.5) = 16
int(.43 * 38 + 0.5) = 16
int(.44 * 38 + 0.5) = 17
int(.45 * 38 + 0.5) = 17

Turbo off:
int(.50 * 34 + 0.5) = 17
int(.51 * 34 + 0.5) = 17
int(.52 * 34 + 0.5) = 18
int(.53 * 34 + 0.5) = 18

-- 
You are receiving this mail because:
You are the assignee for the bug.
