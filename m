From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19672] New: ondemand is slow
Date: Sun, 3 Oct 2010 21:08:43 GMT
Message-ID: <bug-19672-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19672

           Summary: ondemand is slow
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.35
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: danielhollocher@gmail.com
        Regression: No


I find ondemand is allot slower than conservative for cpu bound tasks.  My
understanding is that performance wise, ondemand should be on par or slightly
faster than conservative.

My chip is an intel core 2 duo, I think 4300.  I am using 2.6.35 from Ubuntu.

On the kraken benchmark, ondemand completes in   34216.6ms +/- 2.3%   where as
conservative completes in   25699.3ms +/- 5.6%


Again, it is my understanding that ondemand should not have this much of a
slowdown.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
