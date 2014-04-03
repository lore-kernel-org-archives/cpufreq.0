From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73421] intel/p_state Does not increase into Turbo Boost states
 and does not display all governors. i5-3201M
Date: Thu, 03 Apr 2014 01:12:22 +0000
Message-ID: <bug-73421-12968-pKJ1yeA7hJ@https.bugzilla.kernel.org/>
References: <bug-73421-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73421-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73421

Dirk Brandewie <dirk.brandewie@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dirk.brandewie@gmail.com

--- Comment #1 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
2900 MHz max turbo 4 active cores


intel_pstate has an internal governor. If you are using intel_pstate you use
its internal governor which has two modes performance which is equivalent to
the performance governor and powersave roughly equal to ondemand but is better
on power.

When a scaling driver with an internal governor is being used powersave and
performance are the only options

You have a 2.5Ghz processor and are getting 2.9Ghz in both cases which *is* in
the turbo range.

-- 
You are receiving this mail because:
You are the assignee for the bug.
