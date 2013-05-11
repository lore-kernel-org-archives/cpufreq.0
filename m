From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58001] New: "ondemand" CPU governor never raises frequency
 (Dell XPS 12)
Date: Sat, 11 May 2013 09:32:23 +0000 (UTC)
Message-ID: <bug-58001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58001

           Summary: "ondemand" CPU governor never raises frequency (Dell
                    XPS 12)
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.8.11-200.fc18.x86_64
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: jylefort@gmail.com
        Regression: No


On a Dell XPS 12 (Intel Core i7-3537U), I experience exactly the same symptoms
as in bug #14771, except it has nothing to do with the power supply: I'm using
the stock power supply, and the problematic behavior is observed both on
battery and on AC power.

If I keep the default settings, the CPU frequency never goes beyond the 800 MHz
minimum, regardless of the CPU load.

If I decrease /sys/devices/system/cpu/cpufreq/ondemand/up_threshold from the
default value of 95 to 75, then the processors dynamically switch back and
forth from 800 MHz to 2 GHz according to CPU load.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
