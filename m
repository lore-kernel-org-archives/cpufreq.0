From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65611] New: wrong file mode of
 /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
Date: Sun, 24 Nov 2013 16:05:25 +0000
Message-ID: <bug-65611-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65611

            Bug ID: 65611
           Summary: wrong file mode of
                    /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.12.1-1
          Hardware: i386
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: hg197@gmx.de
        Regression: No

/sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq has file mode 400, while
other cpu related files are 444. Non-sudoers cannot read current frequency
scaling.

-- 
You are receiving this mail because:
You are the assignee for the bug.
