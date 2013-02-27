From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 54541] New: Cpu frequency don't work in conky with kernel
 3.9.0.0.rc0.git8
Date: Wed, 27 Feb 2013 07:32:47 +0000 (UTC)
Message-ID: <bug-54541-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54541

           Summary: Cpu frequency don't work in conky with kernel
                    3.9.0.0.rc0.git8
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.9.0.0.rc0.git8
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: chepioq@gmail.com
        Regression: No


I use fedora, and test fedora 19 rawhide.
I use conky, and see with him cpu frequencies.

With kernel 3.8, that work fine, I can see my cpu frequencies, 800Mhz to 2300
Mhz, but with kernel 3.9.0.0, that don't work, I just can see 782 Mhz, with no
change.
I don't if it's a kernel bug or a fedora bug.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
