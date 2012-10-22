From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 49231] Single CPU bound process results in non-optimal turbo
 boost configuration
Date: Mon, 22 Oct 2012 13:57:09 +0000 (UTC)
Message-ID: <20121022135709.53FAF11FAE0@bugzilla.kernel.org>
References: <bug-49231-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-49231-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=49231





--- Comment #2 from Thomas Renninger <trenn@suse.de>  2012-10-22 13:57:09 ---
Another idea:
There is an Intel specific CPU configuration register (perf-bias) which can be
set to values between 0-15.
It tells the CPU to behave more energy or performance efficient (not much more
documentation exist afaik).
You can read or set this register via:
cpupower set -b X
cpupower info -b
Maybe this changes C-state entering behavior?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
