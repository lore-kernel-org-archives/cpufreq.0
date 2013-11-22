From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] New: Blind angle of 1% between up_threshold and
 down_threshold
Date: Fri, 22 Nov 2013 14:53:19 +0000
Message-ID: <bug-65501-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65501

            Bug ID: 65501
           Summary: Blind angle of 1% between up_threshold and
                    down_threshold
           Product: Power Management
           Version: 2.5
    Kernel Version: Ubuntu 3.12.0-3.9-generic 3.12.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: sworddragon2@aol.com
        Regression: No

The lowest value that /sys/devices/system/cpu/cpufreq/ondemand/up_threshold can
contain is 11 while the implicit configuration down_threshold will be
statically set to 10. But I'm thinking that it would be correct if up_threshold
could be set to 10 too as this wouldn't cause any collision. up_threshold would
scale if the cpu core reaches 10% or more of cpu usage (>=) and down_threshold
would scale if the cpu core reaches less than 10% of cpu usage (<).

-- 
You are receiving this mail because:
You are the assignee for the bug.
