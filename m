From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60211] New: intel_pstate driver missing ids for some supported
 CPUs
Date: Fri, 28 Jun 2013 01:13:07 +0000 (UTC)
Message-ID: <bug-60211-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60211

           Summary: intel_pstate driver missing ids for some supported
                    CPUs
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.10rc7
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: chizu@spicious.com
                CC: dirk.brandewie@gmail.com
        Regression: No


Running 3.10-rc7 on an i5-4200U, with either intel_pstate or the older cpufreq
drivers the CPU was stuck at 800MHz. I added the model, 0x45, to
intel_pstate_cpu_ids and frequency scaling seems to be working as intended now.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
