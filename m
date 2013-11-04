From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Mon, 04 Nov 2013 18:39:41 +0000
Message-ID: <bug-64261-12968-Q00B9fqyCz@https.bugzilla.kernel.org/>
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

--- Comment #4 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
So you are trying to emulate the userspace governor here, not really to goal of
intel_pstate but OK :-)

The ability to select a single P state was the intended usage of
{min,max}_pct_perf but allow users to select a floor and ceiling for the range
of available P states.  The absolute meaning percent available performance
changes based on the SKU of the part (p states available).

The driver can only select integer values 16->38 in your turbo-on test case.

The p states are 2.6315789 percent wide in terms of turbo frequency and
2.9411765 percent wide in terms of the non-turbo max on your CPU

.42 * 38 = 15.96
.43 * 38 = 16.34
.44 * 38 = 16.72
.45 * 38 = 17.1

45% is where your test goes from 16->17.

For the 3 percent shelves in the turbo-off case. 
.50 * 34 = 17
.51 * 34 = 17.34
.52 * 34 = 17.68
.53 * 34 = 18.03 (so we are off by 3 percent of a pstate due to truncation)

-- 
You are receiving this mail because:
You are the assignee for the bug.
