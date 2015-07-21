From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Tue, 21 Jul 2015 19:28:44 +0000
Message-ID: <bug-75121-12968-gzr9u0DVez@https.bugzilla.kernel.org/>
References: <bug-75121-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-75121-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75121

Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED
                 CC|                            |lenb@kernel.org

--- Comment #22 from Len Brown <lenb@kernel.org> ---
re: comment #20

There is no longer an FP_ROUNDUP macro in intel_pstate.c
It was removed here:

commit f0fe3cd7e12d8290c82284b5c8aee723cbd0371a
Author: Dirk Brandewie <dirk.j.brandewie@intel.com>
Date:   Thu May 29 09:32:23 2014 -0700

    intel_pstate: Correct rounding in busy calculation

which shipped in Linux-3.15

Please re-open this report if the issue here was not fixed by that change.

-- 
You are receiving this mail because:
You are the assignee for the bug.
