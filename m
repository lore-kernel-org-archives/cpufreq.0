From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] New: Problems with hibernation, with bisect
Date: Sun, 24 Nov 2013 22:38:32 +0000
Message-ID: <bug-65671-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65671

            Bug ID: 65671
           Summary: Problems with hibernation, with bisect
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.12
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: higuita@gmx.net
        Regression: No

After upgrading the kernel to 3.12, i found that hibernation stop working. Most
of the time it gives IO errors writing the swap on hibernation, and when it
manage to do that, it crash all apps after the wakeup and remount the
filesystem as read-only

As 3.11.8 hibernation worked fine, i have done a bisect and found that the
problem show up in this commit: 

commit 4a511de96d692f2dfa126c10dda4e41636c0ef27
Author: Mark Brown <broonie@linaro.org>
Date:   Tue Aug 13 14:58:24 2013 +0200

    cpufreq: cpufreq-cpu0: NULL is a valid regulator

    Since NULL could in theory be a valid regulator we ought to check for
    IS_ERR() rather than for NULL. In practice this is unlikely to be an
    issue but it's better for neatness.

    Signed-off-by: Mark Brown <broonie@linaro.org>
    Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

:040000 040000 3e8d03d2dc170492ba9f0311ef9156344452f6de
fb5d9ad67f332dec478a68cbd9387b15381584ce M      drivers

Kernel 3.12.1 still have the problem

i'm using slackware64 14.1 with gcc 4.8.2

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.
