From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58541] New: [pandaboard] cpu frequency limitation
Date: Mon, 20 May 2013 14:31:25 +0000 (UTC)
Message-ID: <bug-58541-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58541

           Summary: [pandaboard] cpu frequency limitation
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.9.3
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: liquid.acid@gmx.net
        Regression: No


Created an attachment (id=102051)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=102051)
dmesg output after boot

Hello,

the ARMv7 in the Pandaboard ES (OMAP4460) should support a maximum frequency of
around 1.2GHz.

However it looks like that it's currently limited to 920MHz.

cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:
350000 700000 920000

Even worse:

cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq 
699977

Greets,
Tobias

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
