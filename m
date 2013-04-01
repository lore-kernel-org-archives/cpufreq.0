From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56071] New: Ondemand doesn't set correct low frequency
Date: Mon,  1 Apr 2013 20:12:23 +0000 (UTC)
Message-ID: <bug-56071-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=56071

           Summary: Ondemand doesn't set correct low frequency
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.9.0
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: bosconovic@gmail.com
        Regression: No


I've a samsung NP535U3C, powered by AMD A6-4455M APU. Cpupower tells to me that
the lower frequency reachable by my CPU is 900 MHz but ondemand governor switch
only between 1.3 and 2.1 GHz and not between 900 MHz and 2.1GHz as it should
be. I've also tried to set userspace governor to work between those frequencies
but didn't work. Attached there is my cpupower frequency-info output. Thank
you.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
