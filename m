From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 83151] New: Intel Turbo can't be disabled/enabled under certain
 condictions
Date: Sun, 24 Aug 2014 19:26:46 +0000
Message-ID: <bug-83151-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=83151

            Bug ID: 83151
           Summary: Intel Turbo can't be disabled/enabled under certain
                    condictions
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.16
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: gabriele.mzt@gmail.com
        Regression: No

On my laptop (Dell XPS 13 9333) MSR_IA32_MISC_ENABLE_TURBO_DISABLE is 0 when AC
is present, 1 otherwise.
Because of this, setting turbo_disabled on init leads to some issues:
* If I turn on the laptop while the AC is present, the sysfs interface always
allows me to change the state of no_turbo. However, the changes are only
effective when the AC is present.
* If I turn on the laptop while on battery, the sysfs interface doesn't allow
me to change the state of no_turbo. That means I'm not able to disable it when
it's automatically enabled when I plug the AC.

Note that I don't have the possibility to disable Intel Turbo from the BIOS
settings.

-- 
You are receiving this mail because:
You are the assignee for the bug.
