From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 81021] New: AMD CPUs w/ Integrated Graphics (APUs) And Turbo
 Core Only Boost If "fglrx" Module Is Loaded
Date: Thu, 24 Jul 2014 12:31:38 +0000
Message-ID: <bug-81021-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=81021

            Bug ID: 81021
           Summary: AMD CPUs w/ Integrated Graphics (APUs) And Turbo Core
                    Only Boost If "fglrx" Module Is Loaded
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.13.11.4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: andre.d@gmx.net
        Regression: No

Several reports out there, on distribution forums as well as on kernel.org
Bugzilla, gravitate around the point that Turbo Core is not deployed by Linux.

While in many cases, people seem to be unaware that /proc/ and
/sys/dev/system/cpu/ information will not reflect boosts, doubts remained for
me.

Using Ubuntu 14.04 Server and an AMD A10-6700, I analysed the phenomenon and
came to an interesting observation.

The system I set up was a bare server with no X / graphics installed /
configured.

First, I made sure that "cpupower frequency-info" listed the avalable boost
states correctly. 4300 MHz (Pb0), 4200 MHz (Pb1) and 3900 MHz (Pb2) were shown
in addition to the regular 3700, 3400, 2700, 2300 and 1800 MHz.

Then, I used "stress --cpu 2" and "cpupower monitor". No boost. I also backed
this observation by tests with "time dd if=/dev/tero of=/dev/null
count=10000000".

I installed the "radeon" driver and made sure it was loaded in the kernel. No
difference.

Finally, I downloaded, compiled and installed the latest AMD Radeon driver.
From the results, I only took the "fglrx" module and made sure that it got
loaded.

And alas, "cpupower monitor" showed boosts as expected. Additionally, the
execution time of the "dd" command mentioned above was reduced to 85% as
compared to before.

My suspicion is that the chips will not make their autonomous boost decision
unless the graphics unit is initialised in a certain way, such that all the
power dissipation information is available for the decision.

The question is, could there be any way how the kernel could initialise these
APUs such that they can make boost decisions right away, without having to load
the proprietary AMD/ATI driver.

Credits go to user M132 over at askubuntu.com who, in a brief comment on May 5,
provided an indication that such a correlation may possibly exist.

-- 
You are receiving this mail because:
You are the assignee for the bug.
