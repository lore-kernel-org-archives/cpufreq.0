From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 54221] New: ondemand cpufeq governor do not notice Node Manager
 power limit change
Date: Fri, 22 Feb 2013 12:53:41 +0000 (UTC)
Message-ID: <bug-54221-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54221

           Summary: ondemand cpufeq governor do not notice Node Manager
                    power limit change
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.0.13
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: przemyslaw.witka@intel.com
        Regression: No


When ondemand governor is active, CPU is not run at high cpu frequency.

Steps to reproduce:

1. Activate ondemand governor
2. Run 100% on CPU (check that CPU runs at the highest frequency)
3. Set Node Manager power limit (policy in CPU domain) to some quite low value
(cpu should run at low freq)
4. Remove Node Manager power limit

Expected result:
CPU should run again at the highest frequency

Actual result:
CPU runs at low frequency

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
