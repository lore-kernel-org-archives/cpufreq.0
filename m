From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56691] New: Using Intel Pstates driver causes panics during
 high loads
Date: Tue, 16 Apr 2013 17:31:07 +0000 (UTC)
Message-ID: <bug-56691-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=56691

           Summary: Using Intel Pstates driver causes panics during high
                    loads
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.9-rc
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: mike@fireburn.co.uk
                CC: rui.zhang@intel.com
        Regression: No


I've already had a conversation via email with Zhang about this

The driver has been broken throughout the 3.9 rc series

As the issue only manifests during high loads after long periods of time I've
been able to bisect the issue

I've taken screenshots of the panics

Disabling the pstates driver stops the panics

The first snapshots date back to the 7th March but the issue was noticed before
this

I update from Linus' tree nightly

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
