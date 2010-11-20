From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 23412] New: Only the lowest CPU frequency available on laptop
 working from battery.
Date: Sat, 20 Nov 2010 19:55:46 GMT
Message-ID: <bug-23412-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23412

           Summary: Only the lowest CPU frequency available on laptop
                    working from battery.
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.30+
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: v_2e@ukr.net
        Regression: Yes


Hello!
  I use a laptop with Mobile AMD Sempron processor and I've been experiencing
the following problem since kernel version 2.6.30:

  When I work from AC power adapter, everything is fine - the whole set of
frequencies for my processor are avalable (namely, 800 MHz, 1600MHz, 1800MHz,
2000MHz and 2200MHz).
  When I unplug the AC adapter, the CPU switches to 800MHz mode and I cannot
make it use any of the higher frequencies. I know for sure that this worked
fine with kernel v.2.6.29.
  This is very inconvenient - to use the lowest available frequency every time
I work from the battery. I have reported this bug to Gentoo Bugzilla at first.
Here is the link:

  http://bugs.gentoo.org/show_bug.cgi?id=328395

  There are some details on this story on that page.

I hope the bug (if it is one) will be fixed soon.
Thanks.

Vladimir.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
