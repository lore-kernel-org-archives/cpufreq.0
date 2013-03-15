From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55261] New: down_threshold is missing
Date: Fri, 15 Mar 2013 06:14:57 +0000 (UTC)
Message-ID: <bug-55261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55261

           Summary: down_threshold is missing
           Product: Power Management
           Version: 2.5
    Kernel Version: Ubuntu 3.8.0-12.21-generic 3.8.2
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: sworddragon2@aol.com
        Regression: No


On my system the file /sys/devices/system/cpu/cpufreq/ondemand/down_threshold
doesn't exist while the file up_threshold does exist in the same directory. The
problem is without this file the value of down_threshold seems to be
automatically set to 10 so I'm not able to set up_threshold to a value lower
than 11.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
