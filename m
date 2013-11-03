From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64291] New: ignore_nice_load for Intel's P-state driver?
Date: Sun, 03 Nov 2013 09:15:34 +0000
Message-ID: <bug-64291-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64291

            Bug ID: 64291
           Summary: ignore_nice_load for Intel's P-state driver?
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.11
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: enhancement
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: kjslag@gmail.com
        Regression: No

Would it possible to implement the ondemand governor's ignore_nice_load (or
something similar) in Intel's P-state driver?

ignore_nice_load is extremely useful for me on my laptop and it would be nice
to be able to use sometime similar with Intel's P-state driver.

thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.
