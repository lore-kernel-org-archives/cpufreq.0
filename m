From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19262] New: CPU0 locked at slower speed, regardless of governor
Date: Tue, 28 Sep 2010 19:08:46 GMT
Message-ID: <bug-19262-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19262

           Summary: CPU0 locked at slower speed, regardless of governor
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.36-rc5-00226-g050026f
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: aexoden@gmail.com
        Regression: Yes


Created an attachment (id=31732)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=31732)
output of `cat /proc/cpuinfo`

Hardware: Intel Q6600 2.4Ghz (clocked at 2.8Ghz)
Software: Gentoo Linux ~amd64, running Linus's HEAD.

Problem description:
The first core appears to be locked at a slower speed. The CPU has two
potential speeds: the maximum speed and and the maximum speed divided by 1.5.
CPU2, 3, and 4 all operate correctly at 2.8Ghz, while CPU0 remains stuck at
1.87Ghz. The problem is observed at stock speeds. I don't remember when it
first appeared, but I believe it was 2.6.34.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
