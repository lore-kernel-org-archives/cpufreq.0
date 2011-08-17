From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 41292] New: scaling_min_freq reverts to cpuinfo_min_freq after
 wake up
Date: Wed, 17 Aug 2011 15:58:48 GMT
Message-ID: <bug-41292-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=41292

           Summary: scaling_min_freq reverts to cpuinfo_min_freq after
                    wake up
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.39
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: bill.longman@gmail.com
        Regression: No


Environment: Core i7 M620; ondemand; acpi-cpufreq; microcode/version == 0xc

Description: When I set scaling_min_freq on all cores, only cpu0 retains its
value after awaking from suspend-to-ram. All other cores revert to the minimum
frequency.

Expected behaviour: Cores would retain scaling_min_freq after waking.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
