From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] New: Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Sat, 02 Nov 2013 21:52:12 +0000
Message-ID: <bug-64261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64261

            Bug ID: 64261
           Summary: Intel Pstate driver truncates to pstate instead of
                    rounding to nearest pstate
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.12rc7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: dsmythies@telus.net
        Regression: No

Created attachment 113151
  --> https://bugzilla.kernel.org/attachment.cgi?id=113151&action=edit
shows rounded pstate and current actual for frequency Vs. requested.

The Intel Pstate driver seems to truncate its calculations to the lower integer
pstate. The suggestion is that it should round to the nearest pstate. Recent
(kernel 3.12RC7) math improvements have made achieving 100% frequency better,
but rounding would make it more robust.

The attachment demonstrates.

-- 
You are receiving this mail because:
You are the assignee for the bug.
