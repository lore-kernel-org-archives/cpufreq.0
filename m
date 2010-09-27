From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19132] New: Changing the default cpufreq govenor freezes
 suspend
Date: Mon, 27 Sep 2010 07:16:57 GMT
Message-ID: <bug-19132-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19132

           Summary: Changing the default cpufreq govenor freezes suspend
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.35
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: lukasgraesslin@gmx.de
                CC: preining@logic.at
        Regression: No


Since 2.6.35 my Thinkpad X200 with Intel Chipset freezes (the screen is getting
black with just a cursor and hangs forever there) on suspend when the default
cpufreq govenor is changed. This happens beacuse pm-utils changes the default
govenor when going on suspend(-to-ram, but to-disk also I think).

When I disable that changing of the govenor suspend will work again.

This may have to do something with the Intel Graphic as well, because the
problem only occurs when beeing on X. Without X the suspend works fine.

With 2.6.34 everything worked well.

See also:

http://lkml.org/lkml/2010/7/22/595
https://bugs.archlinux.org/task/20806
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=586674#51

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
