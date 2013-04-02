From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56101] New: Intel Core2 Duo E6600 reports max-frequency of just
 900 MHz instead of 2.4 GHz
Date: Tue,  2 Apr 2013 09:41:19 +0000 (UTC)
Message-ID: <bug-56101-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=56101

           Summary: Intel Core2 Duo E6600 reports max-frequency of just
                    900 MHz instead of 2.4 GHz
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.8.5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: spam@kernelspace.de
                CC: trenn@suse.de
        Regression: No


Created an attachment (id=96971)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=96971)
Output of dmesg

I discovered that my IBM Intellistation M Pro 9229Y with its Intel
Core2 Duo E6600 is reported to clock only at a max frequency of 900.000
MHz instead of 2.4 GHz.

cpufreq-info only lists 600 and 900 MHz as hardware-supported frequencies.

The BIOS is at the latest version 1.35A, there have been no updates since 2008
(this being a rather outdated IBM workstation...)

Please see the attached output of dmesg, cpufreq-info, /proc/cpuinfo and
dmidecode for further information.

Thanks in advance

Simon

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
